# Dog Breeds App

A SwiftUI iOS application that displays dog breeds with favorites functionality, built using Clean Architecture principles.

## Setup Instructions

### Prerequisites
- Xcode 16.3 or later
- iOS 18.4 or later
- Internet connection for API access

### Installation
1. Clone the repository
2. Open `DogBreedsApp.xcodeproj` in Xcode
3. Build and run the project (⌘+R)

### Configuration
- No additional configuration required
- The app uses Dog CEO API (https://dog.ceo/api/) - no API key needed
- Favorites are stored locally using UserDefaults

## For lack of time I didn't complete the project 100%

### What I would have done in next steps:
- Add an empty state screen
- Implement error handling for all features (only List Breeds has a simple error handler)
- Implement caching for the images
- Write unit tests. But to see some unit tests written by me you can see this [repo over here](https://github.com/cesarlima/tv-shows-ios-app/blob/main/Modules/Core/Networking/NetworkingTests/URLSessionHttpClientTests.swift)

## Bonus Features Implemented
- The app supports Dynamic Type
- Transition animations for image changes in Breed Detail feature

## Architecture

### Clean Architecture with 3 Layers

**Domain Layer (BreedsDomain)**
- Pure business logic without external dependencies
- Contains entities (`Breed`, `FavoriteBreed`), use cases, and protocols
- Defines contracts for data access and business operations

**Data Layer (BreedsData)**
- Handles external data sources and networking
- Implements repository pattern for data access
- Integrates with Dog CEO API and UserDefaults for persistence

**Presentation Layer (BreedsFeature)**
- SwiftUI views and ViewModels following MVVM pattern
- Contains UI components and presentation logic
- Depends on Domain layer contracts

### Key Patterns

- **Use Cases**: Encapsulate business logic (`LoadBreedsUsecase`, `AddRemoveFavoriteUseCase`)
- **Repository Pattern**: Abstract data access (`FavoriteBreedRepositoryProtocol`)
- **Dependency Injection**: Composition root pattern via `AppComposer` and `BreedsComposer`
- **Protocol-Oriented Programming**: Interfaces for testability and loose coupling

## Features

- **Breeds List**: Grid view of all dog breeds from Dog CEO API
- **Breed Details**: Random breed images with favorite functionality
- **Favorites**: Persistent storage of favorite breeds with images
- **Navigation**: Tab-based interface with SwiftUI navigation

## Assumptions and Trade-offs

### Assumptions
- **Internet Connectivity**: App requires network access for breed data and images
- **Dog CEO API Availability**: Depends on external API uptime and stability
- **iOS Platform**: Built exclusively for iOS using SwiftUI

### Trade-offs

**Framework Modularity vs Complexity**
- **Chosen**: Separate frameworks for each layer
- **Benefit**: Clear separation of concerns, testability, reusability
- **Cost**: Additional build complexity and framework overhead

**UserDefaults vs Core Data**
- **Chosen**: UserDefaults for favorites persistence
- **Benefit**: Simple implementation, no setup required
- **Cost**: Not suitable for large datasets, limited querying capabilities

**Ephemeral URL Session**
- **Chosen**: No caching of network requests
- **Benefit**: Always fresh data, no cache management
- **Cost**: Repeated network calls, slower user experience

**Basic Error Handling**
- **Chosen**: Simple error enum with limited cases
- **Benefit**: Minimal complexity
- **Cost**: Less detailed error information for debugging

**No Offline Support**
- **Chosen**: No local data caching or offline functionality
- **Benefit**: Simplified architecture
- **Cost**: App unusable without internet connection

## API Dependencies

- **Dog CEO API**: Free public API for dog breed data and images
- **Base URL**: `https://dog.ceo/api/breeds/list/all`
- **Image URL**: `https://dog.ceo/api/breed/{breed}/images/random`