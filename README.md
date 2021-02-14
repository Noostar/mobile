# mobile
A flutter app for Noostar.

# Example app
Layers of the app.
Application - contains blocs (flutter_bloc)
Presentation - contains all files, which related to the view.
Infrastructure - contains all data providers, repositories, etc.
Domain - business logic, converting DTO to internal classes, error handling and converting to custom classes.

You can read more about this architecture in simple words at the link:
https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/

Code generation 
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner witch --delete-conflicting-outputs 