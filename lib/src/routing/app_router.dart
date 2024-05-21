import 'package:flutter/material.dart';
import 'package:learning_sings/src/screens/screen.dart';

class AppRoutes {
  static const initialRoute = 'first_page';

  static Map<String, Widget Function(BuildContext)> routes = {
    'first_page': (BuildContext context) => const FistPageScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'register': (BuildContext context) => const RegisterScreen(),
    // 'welcome': (BuildContext context) => const WelcomeScreen(),
  };
}