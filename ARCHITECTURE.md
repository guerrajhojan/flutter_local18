# Arquitectura del Proyecto: Clean Architecture

Este proyecto utiliza **Clean Architecture** (Arquitectura Limpia) para garantizar que la aplicación sea escalable, testeable y fácil de mantener. El objetivo principal es la **separación de responsabilidades** y la independencia de marcos de trabajo (frameworks), bases de datos y herramientas externas.

## Capas de la Aplicación

### 1. Capa de Dominio (Domain)
Es el corazón de la aplicación. No depende de ninguna otra capa ni de Flutter.
- **Entities**: Objetos de negocio (ej. `CounterEntity`).
- **Repositories (Interfaces)**: Definen los contratos de qué datos necesitamos, pero no cómo se obtienen.
- **Usecases**: Lógica de negocio específica (ej. `GetUserData`).

### 2. Capa de Datos (Data)
Implementa la lógica definida por la capa de dominio.
- **Repositories (Implementations)**: Implementan las interfaces de la capa de dominio.
- **Models**: Extensiones de las entidades que añaden lógica de serialización (JSON).
- **Datasources**: Fuentes de datos reales (API REST, Local Storage, SQLite).

### 3. Capa de Presentación (Presentation)
Donde vive Flutter y la lógica de la interfaz de usuario.
- **Manager**: Gestión de estado (Bloc, Cubit, Provider).
- **Pages**: Pantallas de la aplicación.
- **Widgets**: Componentes visuales pequeños y reutilizables.

### 4. Núcleo (Core)
Contiene código compartido y utilidades que no pertenecen a una funcionalidad específica.
- **Errors/Failures**: Manejo uniforme de errores.
- **Usecases base**: Clases abstractas para estandarizar los casos de uso.
- **Widgets**: Componentes visuales globales y altamente reutilizables (ej. botones, inputs personalizados).
- **Utils**: Validadores, constantes globales, etc.

---

## Estructura de Carpetas
```text
lib/
 ├── core/              # Utilidades, errores y WIDGETS GLOBALES
 │    ├── widgets/      # Todos los componentes reutilizables de la app
 │    └── ...
 └── features/          # Funcionalidades del negocio
      └── feature_name/
           ├── data/
           ├── domain/
           └── presentation/
                ├── manager/
                └── pages/
```

## Vistas Realizadas (Screenshots)

A continuación se muestran las pantallas implementadas siguiendo el diseño:

| Welcome Page | Login Page | Register Page |
| :---: | :---: | :---: |
| ![Welcome](doc_assets/welcome.png) | ![Login](doc_assets/login.png) | ![Register](doc_assets/register.png) |

---

## Dependencias Clave
- **dartz**: Proporciona programación funcional (uso de `Either` para manejar errores/éxitos).
- **equatable**: Facilita la comparación de objetos sin necesidad de sobrescribir `==` y `hashCode` manualmente.

## Regla de Oro
**Las dependencias solo apuntan hacia adentro.** El dominio no sabe nada de los datos ni de la presentación. Los datos y la presentación dependen del dominio.
