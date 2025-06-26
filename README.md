# KognoFluo - Sistema de Gestión de Mantenimiento

KognoFluo es un sistema integral de gestión de mantenimiento diseñado para instalaciones industriales.
Permite gestionar activos, planes de mantenimiento, técnicos y horarios a través de jerarquías organizacionales
complejas (plantas → áreas → líneas de producción → activos).

## Características Principales

- **Gestión de Activos**: Seguimiento completo de equipos industriales con ubicación jerárquica
- **Planificación de Mantenimiento**: Mantenimiento preventivo, correctivo y predictivo
- **Gestión de Técnicos**: Asignación y seguimiento de personal especializado
- **Programación Inteligente**: Sistema de horarios flexible para diferentes tipos de mantenimiento
- **Gestión Documental**: Almacenamiento seguro de manuales, certificados y documentación técnica
- **Soporte Multiidioma**: Inglés y Español (México) con localización completa
- **Arquitectura Modular**: Organización por dominios para fácil mantenimiento

## Stack Tecnológico

- **Ruby 3.4.4** y **Rails 8.0.2**
- **Hotwire** (Turbo Rails + Stimulus) para interactividad
- **Tailwind CSS** para diseño moderno y responsive
- **Devise** con Argon2 para autenticación segura
- **SQLite** (desarrollo) / **PostgreSQL** (producción recomendada)
- **Action Text** para contenido enriquecido
- **Active Storage** para gestión de archivos
- **Kamal** para despliegue containerizado

## Requisitos del Sistema

- Ruby 3.4.4+
- SQLite3 (desarrollo)
- Git

## Configuración de Desarrollo

### 1. Clonar el repositorio
```bash
git clone <repository-url>
cd KognoFluo
```

### 2. Instalar dependencias
```bash
# Instalar gems de Ruby
bundle install
```

### 3. Configurar la base de datos
```bash
# Crear y configurar la base de datos
bin/rails db:setup

# Ejecutar migraciones
bin/rails db:migrate

# Cargar datos de ejemplo
bin/rails db:seed
```

### 4. Iniciar el servidor de desarrollo
```bash
# Iniciar servidor con recarga automática de CSS
bin/dev

# O iniciar solo el servidor Rails
bin/rails server
```

La aplicación estará disponible en http://localhost:3000

## Comandos de Desarrollo

### Pruebas
```bash
# Ejecutar todas las pruebas
bin/rails test

# Ejecutar pruebas del sistema
bin/rails test:system

# Ejecutar archivo de prueba específico
bin/rails test test/models/user_test.rb
```

### Calidad de Código
```bash
# Ejecutar RuboCop (linting)
bin/rubocop

# Auto-corregir problemas de RuboCop
bin/rubocop -a

# Ejecutar análisis de seguridad
bin/brakeman
```

### Base de Datos
```bash
# Ejecutar migraciones
bin/rails db:migrate

# Revertir última migración
bin/rails db:rollback

# Reiniciar base de datos (¡cuidado en producción!)
bin/rails db:reset

# Cargar datos semilla
bin/rails db:seed
```

### Assets y CSS
```bash
# Compilar Tailwind CSS
bin/rails tailwindcss:build

# Observar cambios en CSS (modo desarrollo)
bin/rails tailwindcss:watch
```

## Arquitectura del Sistema

### Organización por Dominios

La aplicación está organizada en cuatro módulos principales:

1. **Common** (`app/models/common/`)
   - Datos de referencia compartidos (países, monedas, idiomas, zonas horarias)
   - Unidades de medida y tipos

2. **Organization** (`app/models/organization/`)
   - Estructura de la empresa (plantas → áreas → líneas de producción)
   - Soporte para operaciones multi-instalación

3. **Maintenance** (`app/models/maintenance/`)
   - Gestión central de mantenimiento
   - Activos, planes, horarios, técnicos
   - Herramientas y recursos

4. **Gestión de Usuarios**
   - Autenticación y perfiles de usuario
   - Roles y permisos

### Patrones Utilizados

- **Namespacing de Base de Datos**: Cada dominio usa prefijos de tabla (`common_*`, `organization_*`, `maintenance_*`)
- **Gestión de Estados con Enum**: Estados consistentes con codificación por colores
- **Organización Jerárquica**: Soporte para entornos industriales complejos
- **Internacionalización Completa**: Soporte nativo para múltiples idiomas

## Datos de Prueba

El sistema incluye datos semilla completos en `db/seeds/`:
- Datos de referencia (países, monedas, idiomas, zonas horarias)
- Datos de ejemplo de mantenimiento
- Cuentas de usuario para desarrollo

Ejecutar `bin/rails db:seed` para cargar los datos de prueba.

## Despliegue

La aplicación está configurada para despliegue con **Kamal**:

```bash
# Configurar credenciales de producción
bin/rails credentials:edit

# Desplegar a producción
kamal deploy
```

### Consideraciones de Producción

- **Base de Datos**: Se recomienda PostgreSQL para producción
- **Caché**: Configurar Redis para caché y sesiones
- **Almacenamiento**: Configurar Active Storage con un proveedor cloud
- **Seguridad**: Habilitar HTTPS y Content Security Policy
- **Monitoreo**: Implementar health checks y logging

## Estructura de Pruebas

```
test/
├── controllers/     # Pruebas de controladores
├── models/         # Pruebas de modelos
├── system/         # Pruebas de sistema (Capybara)
├── factories/      # Definiciones de Factory Bot
└── fixtures/       # Datos de prueba estáticos
```

## Internacionalización

- **Idioma base**: Español (México) - `es-MX`
- **Idiomas soportados**: Inglés (`en`), Español México (`es-MX`)
- **Archivos de traducción**: `config/locales/`
- **Detección automática**: Basada en encabezados del navegador

## Contribuir

1. Fork el proyecto
2. Crear rama para la característica (`git checkout -b feature/AmazingFeature`)
3. Commit los cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

### Estándares de Código

- Seguir las convenciones de Rails Omakase
- Ejecutar `bin/rubocop` antes de commit
- Mantener cobertura de pruebas alta
- Documentar cambios en el API

## Soporte

Para reportar problemas o solicitar características:
- Crear un issue en el repositorio
- Incluir información del entorno y pasos para reproducir
- Para problemas de seguridad, contactar directamente

## Licencia

[Especificar licencia del proyecto]

---

**KognoFluo** - Optimizando el mantenimiento industrial con tecnología moderna
