import 'package:flutter/material.dart';
import 'package:learning_sings/src/screens/screen.dart';

class AppRoutes {
  static const initialRoute = 'first_page';

  static Map<String, Widget Function(BuildContext)> routes = {
    'first_page': (BuildContext context) => const FistPageScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'register': (BuildContext context) => const RegisterScreen(),
    'welcome': (BuildContext context) => const WelcomeScreen(),
    'whoweare': (BuildContext context) => const WhoWeAreScreen(),
    'whatlearn': (BuildContext context) => const WhatLearnScreen(),
    'introduction_1': (BuildContext context) =>
        const IntroductionModuleOneScreen(),
    'presentation_i': (BuildContext context) => const PersonalPresentationScreen(),
    'alphabet': (BuildContext context) => const AlphabetScreen(),
    'home': (BuildContext context) => const HomeScreen(),
    'number': (BuildContext context) => const NumbersScreen(),
    'month': (BuildContext context) => const MonthsScreen(),
    'day': (BuildContext context) => const DaysScreen(),
    'item': (context) => ItemSelected(
          item: ModalRoute.of(context)!.settings.arguments as String,
        ),
  };
}
