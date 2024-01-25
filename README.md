# Flutter Weather Test App

A simple client app made with Flutter.

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/jvtN6OrxMPQ/0.jpg)](https://www.youtube.com/watch?v=jvtN6OrxMPQ)

## Table of Contents:
* [General Info](#general-info)
* [Features](#features)
* [How to install](#how-to-install)
* [Languages](#languages)
* [Technologies Used](#technologies-used)

## General info
This project is a test app made with [Flutter](https://flutter.dev) and OpenWeather API.
The purpose of this this project is to show my skills as a Flutter developer by using suggested tech stack.
In this project I managed to implement:
1. Searching for different locations while typing
2. Displaying weather data in a simple table

What could have been done but wasn't:
1. Proper routing
2. API & BLoC tests
3. Themes

## Features
#### Search for locations
Search for locations where you want to check weather right as you type!
#### Check the weather
After finding a location look at the data presented, such as: temperature, humidtity, pressure, wind, sunrise, etc...

## How to install
#### Step 1:

Fork this project

```
'git clone https://github.com/RusAntr/weather_test_app.git'
```
#### Step 2:

Open the project folder with VS Code and execute the following command to install the dependency package:
```
flutter pub get
```
#### Step 3:

Open the main.dart file in the lib folder, F5 or Ctrl + F5 to run the project.
## Supported languages
* Russian (Русский)

## Tech stack
* [Flutter](https://flutter.dev)
* [Dart](https://dart.dev)

#### Third-party packages
* [get_it](https://pub.dev/packages/get_it) - DI, Service locator
* [flutter_bloc](https://pub.dev/packages/flutter_bloc) - State managment
* [bloc](https://pub.dev/packages/bloc) - State managment
* [equatable](https://pub.dev/packages/equatable) - Comparing dart objects
* [dio](https://pub.dev/packages/dio) - HTTP networking
* [retrofit](https://pub.dev/packages/retrofit) - Type conversion dio client generator
* [json_annotation](https://pub.dev/packages/json_annotation) - Defines the annotations to create code for JSON serialization and deserialization
* [intl](https://pub.dev/packages/intl) - Internationalized/localized messages, date/number formatting and more
* [flutter_typeahead](https://pub.dev/packages/flutter_typeahead) - A TypeAhead (autocomplete) widget, where you can show suggestions to users as they type
