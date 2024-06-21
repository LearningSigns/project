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
    'whowearedescription': (BuildContext context) =>
        const WhoWeAreLearnDescriptionScreen(),
    'whatlearn': (BuildContext context) => const WhatLearnScreen(),
    'whatlearndescription': (BuildContext context) =>
        const WhatLearnDescriptionScreen(),
    'introduction_1': (BuildContext context) =>
        const IntroductionModuleOneScreen(),
    'presentation_i': (BuildContext context) =>
        const PersonalPresentationScreen(),
    'alphabet': (BuildContext context) => const AlphabetScreen(),
    'greetings': (BuildContext context) => const GreetingsScreen(),
    'family': (BuildContext context) => const FamilyScreen(),
    'home': (BuildContext context) => const HomeScreen(),
    'introduction_2': (BuildContext context) =>
        const IntroductionModuleTwoScreen(),
    'number': (BuildContext context) => const NumbersScreen(),
    'month': (BuildContext context) => const MonthsScreen(),
    'day': (BuildContext context) => const DaysScreen(),
    'year': (BuildContext context) => const YearsScreen(),
    'presentation_ii': (BuildContext context) =>
        const PresentationPersonalIIScreen(),
    'congratulations': (BuildContext context) => const CongratulationsScreen(),
    'evaluate_your_knowledge': (BuildContext context) =>
        const EvaluateYourKnowledgeScreen(),
    'update_profile': (BuildContext context) => const ProfileScreen(),
    'profile': (BuildContext context) => const ViewProfileScreen(),
    'contact_us': (BuildContext context) => const ContactUsScreen(),
    'item': (context) => ItemSelected(
          item: (ModalRoute.of(context)!.settings.arguments
              as Map<String, String>)['item']!,
          returnItem: (ModalRoute.of(context)!.settings.arguments
              as Map<String, String>)['returnItem']!,
        ),
  };
}
