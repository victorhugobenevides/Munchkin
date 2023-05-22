import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localizations_delegate.dart';
import 'munchkin_home_page.dart';


void main() {
  runApp(const MunchkinApp());
}

class MunchkinApp extends StatelessWidget {
  const MunchkinApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Munchkin Level Power Tracker',
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.amber,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          subtitle1: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
        cardColor: Colors.white,
        cardTheme: CardTheme(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        accentColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: const AppBarTheme(
          color: Colors.amber,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          subtitle1: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        cardColor: Colors.grey[800],
        cardTheme: CardTheme(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MunchkinHomePage(title: 'Munchkin'),
    );
  }
}
