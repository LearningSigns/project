import 'package:flutter/material.dart';
import 'package:learning_sings/src/screens/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) =>  const LoginScreen(),
    // 'welcome': (BuildContext context) => const WelcomeScreen(),
  };
}