# 🧘 Medit - Plataforma de Meditaciones

**Medit** es un repositorio centralizado de meditaciones y cursos diseñado para crear una plataforma educativa completa. Nuestro objetivo es desarrollar una biblioteca de meditaciones guiadas, cursos estructurados y contenido progresivo para ayudar a los alumnos a iniciarse y profundizar en la práctica de la meditación y el bienestar mental.

## 🎯 Roadmap del Proyecto

### Fase 1: Creación de Contenido (Actual)
- 📹 Grabar meditaciones guiadas de iniciación
- 📚 Estructurar un curso de iniciación a la meditación
- 🏷️ Organizar y catalogar el contenido

### Fase 2: Integración a App
- 🚀 Desarrollar aplicación web para alumnos
- 📱 Adaptación para dispositivos móviles
- 👤 Gestión de perfiles y seguimiento de progreso

### Fase 3: Expansión
- 📖 Nuevos cursos temáticos (mindfulness, compasión, etc.)
- 🎬 Más contenido de video
- 📊 Análisis de progreso y recomendaciones personalizadas

## ✨ Características Planeadas

- **Meditaciones Guiadas**: Biblioteca de meditaciones organizadas por dificultad y duración
- **Cursos Estructurados**: Programas de iniciación y avanzados
- **Seguimiento de Progreso**: Registro de práctica diaria de alumnos
- **Múltiples Formatos**: Video, audio y texto
- **Gestión de Contenido**: Sistema estructurado para organizar y versionar meditaciones

## 🚀 Inicio Rápido

### Requisitos Previos

- Node.js v18 o superior
- npm o yarn

### Instalación

```bash
# Clonar el repositorio
git clone https://github.com/nicolasyacono/medit.git
cd medit

# Instalar dependencias
npm install

# Iniciar el servidor de desarrollo
npm start
```

## 📖 Cómo Contribuir Contenido

### Crear una Nueva Meditación

1. **Organiza el contenido** en la carpeta correspondiente bajo `/content/meditaciones/`
2. **Prepara los archivos**:
   - Video o audio de la meditación
   - Descripción en formato `.md`
   - Imagen de portada (opcional)
3. **Documentación**: Incluye metadatos con título, duración, nivel, beneficios
4. **Prueba**: Verifica que todos los archivos estén correctamente linkados

### Estructura de una Meditación

```
content/meditaciones/iniciacion/respiracion-basica/
├── meditacion.mp4          # Video o audio principal
├── README.md               # Descripción y metadatos
├── transcripcion.txt       # Guión de la meditación
└── portada.jpg            # Imagen de portada
```

## 📁 Estructura del Proyecto

```
medit/
├── content/
│   ├── meditaciones/          # Meditaciones individuales
│   │   ├── iniciacion/        # Curso de iniciación
│   │   ├── mindfulness/       # Meditaciones de mindfulness
│   │   └── avanzado/          # Contenido avanzado
│   │
│   ├── cursos/                # Estructuras de cursos
│   │   └── iniciacion.json    # Curso de iniciación con módulos
│   │
│   └── assets/                # Videos, audios y recursos
│       ├── videos/
│       ├── audios/
│       └── imagenes/
│
├── src/                       # Código fuente de la app (futuro)
├── docs/                      # Documentación
├── scripts/                   # Scripts de utilidad
└── README.md                  # Este archivo
```

## 🛠️ Desarrollo

### Organización del Contenido

Cada meditación debe incluir:
- **Título**: Nombre descriptivo
- **Categoría**: Tipo de meditación (iniciación, mindfulness, etc.)
- **Duración**: Tiempo de la sesión
- **Descripción**: Propósito y beneficios
- **Nivel**: Principiante, intermedio, avanzado
- **Recursos**: Videos, audios, transcripciones

### Scripts Disponibles

- `npm start` - Inicia el servidor de desarrollo
- `npm test` - Ejecuta las pruebas
- `npm run build` - Construye para producción
- `npm run lint` - Ejecuta el linter

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Para contribuir:

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

Por favor, asegúrate de que tus cambios pasen todas las pruebas y sigan los estándares de código del proyecto.

## 📝 Licencia

Este proyecto está licenciado bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## 💬 Contacto

- **Autor**: [Nicolas Yacono](https://github.com/nicolasyacono)
- **Email**: nmyacono@gmail.com

---

**Mantén la calma, respira profundo, y practica la atención plena cada día.** 🧘‍♂️
