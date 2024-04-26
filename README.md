## Mercado Libre Mobile Candidate

El objetivo de esta etapa de la entrevista es desarrollar una app utilizando las APIs de Mercado Libre, que le permita a un usuario ver los detalles de un producto.

Para lograr esto, Mercado Libre posee APIs abiertas a la comunidad para que cualquier desarrollador las consuma y pueda tener búsquedas y compras en su aplicación.

La app debería contar con tres pantallas:

1. Campo de búsqueda.
2. Visualización de resultados de la búsqueda.
3. Detalle de un producto.

Puedes entregar un listado y detalle de productos que sea puro texto, o un buscador con imágenes, iconos y texto, y un detalle completo del producto, como el que se muestra en la web.

### Requerimientos

- Cada pantalla deberíamos poder rotarla y debería mantenerse el estado de la vista.
- **Entrega del proyecto:**
  Repositorio de código (GitHub público o similar).
- **Manejo de casos de error desde el punto de vista del developer:**
  Cómo se gestionan los casos de error inesperados, la consistencia a lo largo de toda la app, uso de logs, etc.
- **Manejo de casos de error desde el punto de vista del usuario:**
  Priorizar una experiencia fluida dando feedback al usuario adecuadamente.

### ¿Qué vamos a evaluar?

Vamos a ser los usuarios de tu producto y vamos a usar la app que desarrolles. Además vamos a hacer una revisión del proyecto a nivel código donde vamos a enfocarnos en tu experiencia en la plataforma. Estos son algunos puntos que vamos a mirar:

- Elección de patrones de diseño.
- Guidelines oficiales de la plataforma.
- Cómo aseguramos la calidad del proyecto (ej: tests unitarios).
- Diseño óptimo de layouts.
- Uso de la memoria (ej: memory leaks).
- Legibilidad del código y documentación.
- Experiencia del usuario.
- Permisos del sistema operativo pedidos al usuario.

Los endpoints necesarios los encontrarás en: [developers.mercadolibre.com.ar/es_ar/items-y-busquedas](developers.mercadolibre.com.ar/es_ar/items-y-busquedas) (Si bien hay endpoints que necesitan un TOKEN, no son necesarios para realizar este ejercicio)


## Implemented Architectural and Design Patterns

1. **Layered Architecture:** The project structure is organized into well-defined layers, such as the Presentation layer, the Domain layer, and the Data layer. Each layer has its own purpose and responsibilities, facilitating code modularity and maintenance.

2. **Dependency Injection:** In the `CompositionRoot` folder, the dependency injection container (DIContainer) configuration is found. This pattern is used to handle dependencies between different components of the system in a flexible and decoupled manner.

3. **Factory Design Pattern:** In the `CompositionRoot` folder, there are factories responsible for creating instances of different components, such as coordinators, controllers, etc. This pattern encapsulates object creation logic and facilitates consistent instantiation of components throughout the application.

4. **Singleton Design Pattern:** In the case of the `AppLogger` class implementation in the `Logging` folder, the singleton pattern is used to ensure that only one instance of the logger class exists throughout the application. This allows sharing the same logger across different parts of the application and facilitates log management.

5. **Model-View-Controller (MVC) Design Pattern:** In the `ScreenModules` folder, you can find the different screens of the application, each with its own controller that acts as the view component and controls the presentation logic and event handling. This is a commonly used pattern in iOS app development.

6. **Repository Pattern:** In the Data layer (`Data`), repositories are responsible for interacting with data sources such as web services or local databases. This pattern abstracts data access logic and facilitates the substitution of data sources without affecting the Domain layer.
