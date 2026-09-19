# 🔗 Guía de Integración: Medit ↔ Cursos-App

Esta guía explica cómo el contenido de este repositorio se integra con la aplicación React **Método Bienestar Integral**.

---

## Arquitectura General

```
┌─────────────────────────────────────────────┐
│      MEDIT (Repositorio de Contenido)       │
│                                             │
│  • Meditaciones (audios)                   │
│  • Cursos (estructura JSON)                │
│  • Metadatos                               │
│                                             │
│  └─ Cloudflare R2 (audios/videos)          │
└────────────┬────────────────────────────────┘
             │
             │ Export courses.json
             ↓
┌─────────────────────────────────────────────┐
│    CURSOS-APP (Aplicación React)            │
│                                             │
│  • Login freemium                          │
│  • Mostrar cursos                          │
│  • Reproducir lecciones                    │
│  • Tracking de progreso                    │
│                                             │
│  └─ Supabase (usuarios, progreso)          │
└────────────┬────────────────────────────────┘
             │
             │ Pago (Lemon Squeezy)
             ↓
┌─────────────────────────────────────────────┐
│      USUARIO EN NAVEGADOR                   │
│                                             │
│  https://cursos.tudominio.com              │
└─────────────────────────────────────────────┘
```

---

## Flujo de Ingesta de Contenido

### Paso 1: Crear Meditación Localmente

```bash
# En este repositorio (medit)
mkdir -p content/meditaciones/iniciacion/leccion-01-respiracion
```

Estructura:
```
content/meditaciones/iniciacion/leccion-01-respiracion/
├── metadata.json          # Metadatos
├── descripcion.md         # Descripción para la app
└── transcripcion.txt      # Guión (opcional)
```

### Paso 2: Generar Audio con ElevenLabs

```bash
npm run generate-meditations
# Lee metadata.json y genera audio con ElevenLabs
# Resultado: meditacion.mp3 en la carpeta
```

### Paso 3: Subir a Cloudflare R2

```bash
npm run upload-r2
# Sube meditacion.mp3 a https://r2.tudominio.com/...
# Actualiza metadata.json con URL pública
```

### Paso 4: Actualizar Curso

Editar `content/cursos/meditacion-iniciacion.json`:

```json
{
  "lecciones": [
    {
      "id": 1,
      "titulo": "Meditación de Respiración - 5 minutos",
      "tipo": "audio",
      "audioUrl": "https://r2.tudominio.com/meditaciones/leccion-01.mp3",
      "duracion": 5
    }
  ]
}
```

### Paso 5: Exportar para la App

```bash
npm run export-courses
# Genera: export/courses.json
```

Este archivo es lo que la app React consume.

### Paso 6: Sincronizar con Cursos-App

```bash
# En cursos-app repositorio
cp ../medit/export/courses.json ./src/data/courses.json
git add src/data/courses.json
git commit -m "Update courses from medit repo"
git push
```

O configurar sincronización automática (GitHub Actions).

---

## Formato de Datos

### Curso (courses.json)

```json
{
  "id": 1,
  "titulo": "Iniciación a la Meditación",
  "descripcion": "Aprende los fundamentos de la práctica meditativa",
  "premium": false,
  "portada": "https://r2.tudominio.com/imagenes/meditacion-portada.jpg",
  "duracion": "2 semanas",
  "nivel": "principiante",
  "lecciones": [
    {
      "id": 1,
      "titulo": "¿Qué es la meditación?",
      "tipo": "introduccion",
      "duracion": 5,
      "contenido": "La meditación es una práctica milenaria..."
    },
    {
      "id": 2,
      "titulo": "Respiración Básica - 5 minutos",
      "tipo": "audio",
      "duracion": 5,
      "audioUrl": "https://r2.tudominio.com/audios/respiracion-5min.mp3",
      "descripcion": "Aprende la técnica de respiración diafragmática"
    }
  ]
}
```

### Estructura de Carpetas = Estructura de Cursos

La carpeta `content/meditaciones/` define la estructura:

```
content/meditaciones/
├── iniciacion/          ← Categoría de cursos
│   ├── leccion-01/      ← Lección 1
│   │   └── metadata.json
│   └── leccion-02/      ← Lección 2
│       └── metadata.json
└── mindfulness/         ← Categoría 2 (futuro)
```

Script de exportación lee esto y genera:

```json
{
  "cursos": [
    {
      "id": 1,
      "titulo": "Iniciación a la Meditación",
      "lecciones": [
        { "id": 1, "titulo": "..." },
        { "id": 2, "titulo": "..." }
      ]
    }
  ]
}
```

---

## Ciclo de Desarrollo Local

### Opción 1: Síncrono (Manual)

```bash
# 1. En medit: crear contenido
cd medit
mkdir -p content/meditaciones/iniciacion/mi-meditacion
# ... llenar metadata.json ...
npm run generate-meditations
npm run upload-r2
npm run export-courses

# 2. En cursos-app: importar datos
cd ../cursos-app
cp ../medit/export/courses.json src/data/courses.json
npm start  # Ver cambios localmente
```

### Opción 2: Asíncrono (GitHub Actions - Futuro)

`.github/workflows/sync-content.yml` en medit:

```yaml
name: Sync to Cursos-App
on:
  push:
    branches: [main]
    paths:
      - 'content/**'
      - 'export/**'

jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - run: npm run export-courses
      - uses: actions/checkout@v3
        with:
          repository: NicolasYacono/cursos-app
          token: ${{ secrets.PAT }}
          path: cursos-app
      - run: cp export/courses.json cursos-app/src/data/courses.json
      - working-directory: cursos-app
        run: |
          git config user.email "bot@medit.dev"
          git config user.name "Medit Bot"
          git add src/data/courses.json
          git commit -m "Auto-sync: update courses from medit"
          git push
```

---

## Variables de Entorno

### medit/.env

```
# ElevenLabs
ELEVENLABS_API_KEY=sk_...
ELEVENLABS_VOICE_ID=...

# Cloudflare R2
R2_ACCOUNT_ID=...
R2_ACCESS_KEY=...
R2_SECRET_KEY=...
R2_BUCKET_NAME=medit-content
R2_PUBLIC_URL=https://r2.tudominio.com

# Exportación
EXPORT_PATH=./export
EXPORT_FORMAT=json
```

### cursos-app/.env

```
# Datos de cursos (puede ser local o URL remota)
REACT_APP_COURSES_SOURCE=./src/data/courses.json

# Supabase
REACT_APP_SUPABASE_URL=...
REACT_APP_SUPABASE_ANON_KEY=...

# Lemon Squeezy
REACT_APP_LEMON_SQUEEZY_STORE_ID=...
```

---

## Validación

El script `npm run validate` verifica:

✅ Estructura de carpetas correcta
✅ metadata.json presente en cada lección
✅ URLs de audio/video accesibles
✅ JSON válido en export
✅ Sin duplicados de IDs
✅ Todas las lecciones tienen descripción

```bash
npm run validate
```

Salida:
```
✓ Validating structure...
✓ 3 courses found
✓ 15 lessons found
✓ All audio URLs accessible
✓ JSON export valid
✓ No duplicate IDs
→ Ready to sync with cursos-app
```

---

## Troubleshooting

### ❌ "Curso no aparece en la app"

1. Verificar que `export/courses.json` tenga la estructura correcta
   ```bash
   npm run validate
   ```

2. Verificar que `cursos-app` esté importando desde el archivo correcto
   ```javascript
   // En cursos-app.jsx
   import courses from './data/courses.json'  // ← Debe existir
   ```

3. Reiniciar servidor de desarrollo
   ```bash
   npm start
   ```

### ❌ "Audio no se reproduce"

1. Verificar que `audioUrl` es accesible
   ```bash
   curl -I https://r2.tudominio.com/audios/meditacion.mp3
   # Debe retornar 200 OK
   ```

2. Verificar CORS en Cloudflare R2 (debe permitir origen de cursos-app)

### ❌ "ElevenLabs no genera audio"

1. Verificar API key
   ```bash
   curl -H "xi-api-key: $ELEVENLABS_API_KEY" \
        https://api.elevenlabs.io/v1/models
   ```

2. Verificar créditos disponibles en cuenta ElevenLabs

---

## Próximos Pasos

1. ✅ Crear meditación de prueba
2. ✅ Subir a R2 y obtener URL pública
3. ✅ Actualizar courses.json
4. ✅ Exportar y sincronizar con cursos-app
5. ✅ Verificar que aparezca en app
6. 🔲 Configurar GitHub Actions para sincronización automática
7. 🔲 Crear dashboard de admin para gestionar cursos sin código

---

## Contacto

Preguntas sobre integración: nmyacono@gmail.com
