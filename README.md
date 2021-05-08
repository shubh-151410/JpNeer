# Multi Restaurants App UI Kit
flutter build appbundle --target-platform android-arm,android-arm64,android-x64 --build-number 2 --build-name 1.8.0

Multi Restaurants App UI Kit complete project using Flutter, it contains more than 20 
screens ready to integrate with your backend (Firebase, PHP, Java, ASP...) projects, 
you can reuse more than 60 widget to customize your application.

The same code used for both iOS and Android

## Installation
### Setup Flutter environment
Follow base on the operating system on which you are installing Flutter:

Mac OS: https://flutter.dev/docs/get-started/install/macos

Window: https://flutter.dev/docs/get-started/install/windows

Linux: https://flutter.dev/docs/get-started/install/linux

Setup an editor: https://flutter.dev/docs/get-started/editor

### Test drive
This section describes how to create a new Flutter app, run it, and experience “hot reload” after you make changes to the Fluxstore app.

Select your development tool of choice for writing, building, and running Flutter apps.

[Android Studio / IntelliJ](https://flutter.dev/docs/get-started/test-drive#androidstudio)

[Visual Studio Code](https://flutter.dev/docs/get-started/test-drive#androidstudio)

[Terminal & editor](https://flutter.dev/docs/get-started/test-drive#androidstudio)

#### Create the app
1. Open the IDE and select **Start a new Flutter project**.
2. Select **Flutter Application** as the project type. Then click **Next**.
3. Verify the **Flutter SDK** path specifies the SDK’s location (select **Install SDK**… if the text field is blank).
4. Enter a project name (for example, `myapp`). Then click Next.
5. Click **Finish**.
6. Wait for Android Studio to install the SDK and create the project.

**Tip**: The code for your app is in `lib/main.dart`. For a high-level description of what each code block does, see the comments at the top of that file.

#### Run the app
1. Locate the main Android Studio toolbar: Main IntelliJ toolbar
![toolbar](img/main-toolbar.png)
2. In the target selector, select an Android device for running the app. If none are listed as available, select **Tools> Android > AVD Manager** and create one there. For details, see Managing AVDs.
3. Click the run icon in the toolbar, or invoke the menu item **Run > Run**. 

After the app build completes, you’ll see the starter app on your device.

![starter-app](img/starter-app.png)

#### Try hot reload
Flutter offers a fast development cycle with Stateful Hot Reload, the ability to reload the code of a live running app without restarting or losing app state. Make a change to app source, tell your IDE or command-line tool that you want to hot reload, and see the change in your simulator, emulator, or device.

1. Open **lib/main.dart**.
2. Change the string
```
'You have pushed the button this many times'
```
to
```
'You have clicked the button this many times'
```
_**Important**_: Do not stop your app. Let your app run.

Save your changes: invoke **Save All**, or click **Hot Reload** offline_bolt.

You’ll see the updated string in the running app almost immediately.

## Getting Started with UI Kit
- After download and unzip the package, use preferred IDE (**Android Studio / Visual Code / IntelliJ**)  to open the project `multi_restaurant_flutter_ui_by_smartervision` folder.

- Click the Get dependencies or Packages get to install the libraries from `pubspecs.yaml` file.

- Open the simulator to run iOS or Android (as the step above)

- Then press the run button to start project (you can still open multi simulator at the same time)

## How to UI Kit?
In the `<Your Poject>/lib` folder you should find 3 subdirectories:
### Configuration
- `<Your Poject>/lib/config` folder contains all configuration variables **Colors, Theming, Text Styles**... for **Dark** and **Bright** theme
```dart
//...
  Color _mainColor = Color(0xFFea5c44);
  Color _mainDarkColor = Color(0xFFea5c44);
  Color _secondColor = Color(0xFF344968);
  Color _secondDarkColor = Color(0xFFccccdd);
  Color _accentColor = Color(0xFF8C98A8);
  Color _accentDarkColor = Color(0xFF9999aa);
 //...
```
### Models
In this folder `<Your Poject>/lib/src/models` you should find all models and Entities used in the App just you can link them with your backend (**Firebase, PHP, JAVA, or other Api**) and you can you collection and list in your **App**

![Pages](img/modeles.PNG)

**Example:**
```dart
//...
class Food {
  String id;
  String name;
  String restaurantName;
  double price;
  String image;
  String description;
  String ingredients;
  String weight;
  //...
```

```dart
//...
class FoodsList {
  List<Food> _foodsList;
  List<Food> _favoritesList;
  List<Food> _featuredList;

  List<Food> get foodsList => _foodsList;
  List<Food> get favoritesList => _favoritesList;
  List<Food> get featuredList => _featuredList;
  //...
```
`<Your Poject>/lib/src` inside this folder you should find: 
### Components and Elements
In this folder `<Your Poject>/lib/src/elements` there are **+60 Widgets** ready to use in your **App**:

![Elements](img/elements.PNG)

Just you can call the widget class and customize it with you parameters and you can get the stylish widget integrated in your app

**Example:**
```dart
//...
    new BlockButtonWidget(
      onPressed: () {
        Navigator.of(context).pushNamed('/Pages', arguments: 2);
      },
      color: Theme.of(context).accentColor,
      text: Text('Verify'.toUpperCase(),
          style: Theme.of(context).textTheme.title.merge(TextStyle(color: Theme.of(context).primaryColor))),
    ),
//...
```
### Ready Pages
In this folder `<Your Poject>/lib/src/pages` there are **+20 Pages/Screens** pre-made:

![Pages](img/pages.PNG)

Just you can edit or link your backend with this page to get awesome customized page
### Main File `main.dart`
The main file contains global configuration (**Title / Themes / Font Family / Colors...**) of the App
```dart
//...
    return MaterialApp(
      title: 'Restaurant Flutter UI',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        fontFamily: 'ProductSans', 
        //...
```
### Routing `route_generator.dart`
The navigation mode in Multi Restaurants App UI Kit is route aspect it's easy and flexible approach
```dart
//...
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Walkthrough());
      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginWidget());
        //...
```
### i18n (internationalisation)
- `<Your Poject>/lib/generated` folder contains internationalisation variable.

## Build and Install App
 - After you making all you changes and customizations save the project.
 - Open Console, navigate to you project folder
 - Run `flutter build apk --release` you should get the apk file in the `/output` folder
 - Run `flutter install` to install you application on your connected devises
 

