# 🧘 Medit - Repositorio de Contenido

**Medit** es el repositorio centralizado de contenido para la plataforma **Método Bienestar Integral**. Aquí se crean, organizan y versionan todas las meditaciones, cursos, videos y recursos educativos que se sirven en la aplicación web.

🔗 **App asociada:** [Método Bienestar Integral](https://github.com/NicolasYacono/cursos-app) - Aplicación React que consume el contenido de este repositorio.

---

## 🎯 Visión del Proyecto

### Roadmap de 3 Fases

**Fase 1: Meditación (HOY - 2 semanas)**
- 📹 Crear ~30 meditaciones guiadas (ElevenLabs)
- 📚 Estructurar curso "Iniciación a la Meditación"
- 🎯 Modelo: **GRATIS** (lead magnet)

**Fase 2: Yoga (mes 3-4)**
- 🎬 Videos propios + clases grabadas
- 📚 Curso "Yoga Integral"
- 💰 Modelo: **PREMIUM** ($29/mes)

**Fase 3: Bundle (mes 5+)**
- 📦 Meditación + Yoga + Nutrición + Coaching
- 📚 Curso "Bienestar Integral"
- 💰 Modelo: **PREMIUM** ($49/mes)

---

## 📁 Estructura del Proyecto

```
medit/
├── content/
│   ├── cursos/                          # Definiciones de cursos
│   │   ├── meditacion-iniciacion.json   # Curso "Iniciación a la Meditación"
│   │   ├── yoga-integral.json           # Curso "Yoga Integral" (futuro)
│   │   └── bienestar-integral.json      # Bundle (futuro)
│   │
│   ├── meditaciones/                    # Contenido de meditaciones
│   │   ├── iniciacion/                  # Módulo de iniciación
│   │   │   ├── leccion-01-intro/
│   │   │   ├── leccion-02-respiracion/
│   │   │   └── leccion-03-relajacion/
│   │   ├── mindfulness/                 # Módulo de mindfulness
│   │   └── avanzado/                    # Módulo avanzado
│   │
│   ├── yoga/                            # Contenido de yoga (futuro)
│   ├── videos/                          # Videos (YouTube links)
│   ├── audios/                          # Audios (Cloudflare R2 URLs)
│   └── imagenes/                        # Portadas y recursos visuales
│
├── scripts/                             # Herramientas de automatización
│   ├── generate-meditations.js          # Generar meditaciones ElevenLabs
│   ├── upload-to-r2.js                  # Subir audios a Cloudflare R2
│   └── export-to-app.js                 # Exportar cursos para la app
│
├── docs/                                # Documentación
│   ├── INTEGRATION.md                   # Guía de integración con cursos-app
│   └── CONTENT-GUIDELINES.md            # Estándares de contenido
│
└── README.md                            # Este archivo
```

---

## 🔄 Integración con Cursos-App

Este repositorio es la **fuente de verdad** para todo el contenido. La aplicación React (`cursos-app`) consume los datos JSON de este repositorio.

### Flujo de Datos

```
1. Crear meditación (ElevenLabs) → Subir a Cloudflare R2
   ↓
2. Documentar en content/meditaciones/ con metadatos
   ↓
3. Actualizar content/cursos/meditacion-iniciacion.json
   ↓
4. Exportar con script → Generar JSON compatible con app
   ↓
5. Copiar JSON a cursos-app → App lo consume automáticamente
   ↓
6. Usuario accede en https://cursos.ejemplo.com
```

### Formato de Curso (JSON)

```json
{
  "id": 1,
  "titulo": "Iniciación a la Meditación",
  "descripcion": "Aprende los fundamentos de la meditación",
  "premium": false,
  "duracion": "2 semanas",
  "lecciones": [
    {
      "id": 1,
      "titulo": "¿Qué es la meditación?",
      "tipo": "introduccion",
      "contenido": "Texto explicativo...",
      "duracion": 5
    },
    {
      "id": 2,
      "titulo": "Meditación de respiración (5 min)",
      "tipo": "audio",
      "audioUrl": "https://r2.ejemplo.com/meditacion-01.mp3",
      "duracion": 5
    },
    {
      "id": 3,
      "titulo": "Meditación de relajación (10 min)",
      "tipo": "audio",
      "audioUrl": "https://r2.ejemplo.com/meditacion-02.mp3",
      "duracion": 10
    }
  ]
}
```

---

## 🛠️ Cómo Crear Contenido

### 1. Crear una Meditación

**Ubicación:** `content/meditaciones/iniciacion/leccion-XX-tema/`

**Archivos necesarios:**
- `metadata.json` - Metadatos (título, duración, beneficios, etc.)
- `meditacion.mp3` - Audio de la meditación (subido a Cloudflare R2)
- `descripcion.md` - Descripción y guía
- `transcripcion.txt` - Guión completo (opcional)

**Ejemplo `metadata.json`:**
```json
{
  "id": "respiracion-basica",
  "titulo": "Meditación de Respiración - 5 minutos",
  "categoria": "iniciacion",
  "duracion": 5,
  "nivel": "principiante",
  "beneficios": ["Reducir estrés", "Mejorar enfoque"],
  "audioUrl": "https://r2.ejemplo.com/meditacion-respiracion-5min.mp3",
  "portada": "respiracion-basica.jpg",
  "createdAt": "2026-09-19"
}
```

### 2. Agregar Lección al Curso

Actualizar `content/cursos/meditacion-iniciacion.json` y agregar la lección:

```json
{
  "id": 2,
  "titulo": "Meditación de Respiración",
  "tipo": "audio",
  "audioUrl": "https://r2.ejemplo.com/meditacion-respiracion-5min.mp3",
  "duracion": 5
}
```

### 3. Exportar para la App

```bash
npm run export-courses
# Genera: export/courses.json compatible con cursos-app
```

---

## 🚀 Inicio Rápido

### Requisitos
- Node.js v18+
- npm o yarn
- Credenciales de Cloudflare R2 (para uploads)
- API key de ElevenLabs (para generar audios)

### Instalación

```bash
# Clonar el repositorio
git clone https://github.com/NicolasYacono/medit.git
cd medit

# Instalar dependencias
npm install

# Configurar variables de entorno
cp .env.example .env
# Editar .env con credenciales de R2 y ElevenLabs
```

### Scripts Disponibles

```bash
# Generar meditaciones con ElevenLabs
npm run generate-meditations

# Subir audios a Cloudflare R2
npm run upload-r2

# Exportar cursos para la app
npm run export-courses

# Validar estructura de contenido
npm run validate

# Ver cambios que se exportarán
npm run preview-export
```

---

## 📊 Tipos de Lecciones

| Tipo | Formato | Ubicación | Ejemplo |
|---|---|---|---|
| **introduccion** | Texto/Markdown | `content/meditaciones/` | Teoría y conceptos |
| **audio** | MP3 (Cloudflare R2) | `content/audios/` | Meditaciones guiadas |
| **video** | YouTube embed | `content/videos/` | Clases de yoga |
| **resumen** | Texto + certificado | Sistema | Al completar curso |

---

## 📝 Documentación

- **[INTEGRATION.md](docs/INTEGRATION.md)** - Cómo integrar nuevas meditaciones con la app
- **[CONTENT-GUIDELINES.md](docs/CONTENT-GUIDELINES.md)** - Estándares de calidad para contenido
- **[PRODUCTION.md](docs/PRODUCTION.md)** - Procesos para fase de producción (ElevenLabs, R2, etc.)

---

## 🤝 Contribuciones

Este repositorio es principalmente para contenido interno, pero si deseas contribuir:

1. Fork el repositorio
2. Crea una rama (`git checkout -b feature/nueva-meditacion`)
3. Agrega tu contenido siguiendo las guías
4. Commit con descripción clara
5. Push y abre Pull Request

---

## 💰 Modelo de Negocio

```
Meditación (Gratis) ─→ Lead magnet
     ↓
Yoga ($29/mes) ─→ Ingreso principal
     ↓
Bienestar Integral ($49/mes) ─→ Premium
     ↓
Coaching 1-a-1 ─→ High-ticket
```

**Estimado:** 100 suscriptores/mes × $29 = $2,900 (- 5% Lemon Squeezy) = **$2,755 netos**

---

## 🔗 Enlaces Importantes

- **App React:** https://github.com/NicolasYacono/cursos-app
- **Landing Page:** [Carrd](https://tu-landing.carrd.co)
- **Cloudflare R2:** Bucket para audios/videos
- **ElevenLabs:** Para generar meditaciones guiadas

---

## 📞 Contacto

- **Autor:** [Nicolas Yacono](https://github.com/nicolasyacono)
- **Email:** nmyacono@gmail.com
- **Proyecto:** Método Bienestar Integral

---

**Mantén la calma, respira profundo, y práctica la atención plena cada día.** 🧘‍♂️
