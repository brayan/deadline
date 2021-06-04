import 'package:flutter/material.dart';

import 'core/presentation/dracula_theme.dart';
import 'features/deadline/presentation/deadlines.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _getThemeData(),
      home: DeadlinesWidget(),
    );
  }

  ThemeData _getThemeData() {
    return ThemeData(
      primaryColor: DraculaTheme.background,
      accentColor: DraculaTheme.pink,
      buttonTheme: ButtonThemeData(
        buttonColor: DraculaTheme.currentLine,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

}