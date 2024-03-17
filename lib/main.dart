import 'package:flutter/material.dart';
import 'package:https/configs/routes.dart';
import 'package:https/presentation/mainScreen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: _routes,
    );
  }

  Map<String, WidgetBuilder> get _routes {
    return {
      Routes.mainScreen: (context) => const MainScreen(),
    };
  }
}
