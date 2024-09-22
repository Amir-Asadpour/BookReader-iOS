# iOS Book Management App

## Architecture Overview
The app follows Clean Architecture principles but in a more pragmatic approach compared to the Android version. The focus remains on maintainability and scalability, but certain components and layers are omitted to fit the project requirements. The architecture includes three essential layers:

- **Data Layer:** Handles data persistence using Core Data. The data layer was designed with flexibility in mind, allowing for easy replacement of Core Data with any other technology. Initially, the project was built with an in-memory mock local data source, and Core Data was introduced later in the project. By simply adding the Core Data implementation and providing it through the DI container, the rest of the app remained unchanged. The mock local data source is still available in the Data folder, and the commit history shows that only two files were changed to swap out the mock source for Core Data. This demonstrates the flexibility provided by a well-structured architecture.
- **Domain Layer:** Contains the core business logic. It remains independent of other layers to ensure flexibility and scalability.
- **Presentation Layer:** Manages the user interface and interactions, implemented using SwiftUI.

For the presentation layer, a MVVM architecture is used, similar to the Android version.

### Use Cases
Unlike the Android version, this project does not implement use cases in the domain layer. This decision was made to simplify the codebase, reflecting a more practical approach given the scope of the project.

### Models
In contrast to the Android version, the same models are used across both the domain and presentation layers in this project for simplicity and pragmatism.

## UI Implementation
The UI is implemented using SwiftUI. The app supports both light and dark modes, with the UI following iOS Human Interface Guidelines.

## Setup Instructions
Setting up the project is straightforward. Simply clone the repository and open the project in Xcode. The project uses standard Swift and Core Data configuration, and no additional setup steps are required.

## Possible Improvements
- **CI/CD Setup:** Continuous integration and deployment (CI/CD) were not set up to keep the project within the time limits. However, this could be easily added using tools like Xcode Cloud, which offers a simplified CI/CD process for iOS projects.
- **Modularization:** The current architecture could benefit from modularizing the layers to further improve scalability and maintainability.
- **Tests:** Although writing unit tests is crucial, they are not present in this project due to time constraints. However, the decoupled layers and the use of a Dependency Injection (DI) framework greatly enhance the testability of the codebase. The best place to start writing tests would be from the ViewModels to ensure they behave as expected.

## Screenshots
![iOS - 1](https://github.com/user-attachments/assets/f6d9765f-23b3-4351-bba3-9fd0ed1545cd)
![iOS - 2](https://github.com/user-attachments/assets/ca311064-44b2-4a7f-b3ee-603c41e8a04d)
![iOS - 3](https://github.com/user-attachments/assets/cb7f9d64-62be-4b77-a8be-037e44fa071a)


