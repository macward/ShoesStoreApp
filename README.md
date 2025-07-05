# SwiftUI - Shoe Store App

This project is a small Nike inspired store built with SwiftUI. It is still a work in progress but already showcases several architectural patterns that I use in my personal projects.

---
## Basic Features
- Display a list of products
- Mark products as favourites
- Add items to a shopping cart
- Simulate a purchase flow
- Handle different error states

## Preview
![alt text](https://firebasestorage.googleapis.com/v0/b/switchat-1d16f.appspot.com/o/nike_store-demo.gif?alt=media&token=02a67d23-0d45-463b-a417-e59bd40d71c0&_gl=1*1f2jpak*_ga*MTIwOTU4MjU2OC4xNjgxMTgwMDk2*_ga_CW55HF8NVT*MTY5NjU3NTAwMy4zNi4xLjE2OTY1NzUxMTkuMTAuMC4w "Demo image")

![alt text](https://firebasestorage.googleapis.com/v0/b/switchat-1d16f.appspot.com/o/nike_store_favs.gif?alt=media&token=d099fe66-cab9-4490-90dd-4fd381ddceec&_gl=1*1jhk21h*_ga*MTIwOTU4MjU2OC4xNjgxMTgwMDk2*_ga_CW55HF8NVT*MTY5ODk3NjczNy41Ni4xLjE2OTg5Nzc0MTUuNDMuMC4w "Demo image")

## Architecture
The code is organised following **Clean Architecture** principles and is split into multiple Swift Package modules:

- **Domain** – business entities, protocols and use cases
- **Data** – concrete implementations for networking and persistence
- **Presentations** – SwiftUI features implemented with the MVVM pattern and a simple coordinator
- **Injector** – a lightweight dependency injection container

Dependencies are resolved using the `@Injector` property wrapper which pulls instances from the `DependencyInjector` container. This makes the modules easily replaceable and keeps the views clean.

## Technologies Used
- SwiftUI
- Core Data / SwiftData for local storage
- `network-wrapper` and `supabase-swift` for REST API calls
- Swift Package Manager for module separation

## Getting Started
Clone the repository and open `Shoe Store.xcodeproj` with Xcode. All dependencies are handled via Swift Package Manager, so you can run the project right away and experiment with the code.

### Reminder
This is still a work in progress.
