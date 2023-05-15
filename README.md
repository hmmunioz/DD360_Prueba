# dd360 Test

This is a test application for the company DD360, which consists of loading a list of apis that have Marvel information such as Superheroes, Comics, Events, Series and Stories

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
git@github.com:hmmunioz/DD360_Prueba.git
```

**Step 2:**
Add the .env to the root of the project before to run (I send the .env file to the e-mail diana.rubio@dacodes.com)

Go to project root and execute the following command in console to get the required dependencies:

```
flutter clean
flutter pub upgade
flutter pub get


Run:
flutter run
```

## -----IMPORTANT-----

THE TESTS MUST BE RUN ONE BY ONE AND NOT IN GROUP

## dd360 Features:

- Superhero

### Libraries & Tools Used

- [flutter version v2.10.5]
- [equatable](https://pub.dev/packages/equatable)
- [shimmer](https://pub.dev/packages/shimmer)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [http](https://pub.dev/packages/http)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)

### Folder Structure

Here is the core folder structure which flutter provides.

```
DD360_TEST/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- app/
  |- _childrens/
     |- superheros/
       |- bloc
       |- enums
       |- widgets
  |- common_widgets/
  |- constants/
  |- enums/
  |- models/
  |- router/
  |- utils/
|- main.dart
|- .env
```

![alt text](https://i.postimg.cc/G4YQdLJq/Captura-de-pantalla-2023-05-15-a-la-s-02-14-48.png)

![alt text](https://i.postimg.cc/gwWK0Cgd/Captura-de-pantalla-2023-05-15-a-la-s-02-15-11.png)
![alt text](https://i.postimg.cc/bsZgVHGX/Captura-de-pantalla-2023-05-15-a-la-s-02-15-21.png)
