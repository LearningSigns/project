import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsApp.colorCard,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Te damos bienvenida al Login'),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment :  CrossAxisAlignment.start,
              children: [
                const Text( 'Usuario',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  // obscureText: !showPassword,
                  onChanged: (value) => {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoracion(
                    hintText: '********',
                  ),
                  validator: (value) {
                    return (value != null && value.length >= 4)
                        ? null
                        : 'La contraseña debe de ser mayor a 4 caracteres';
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Contraseña',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  // obscureText: !showPassword,
                  onChanged: (value) => {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoracion(
                    hintText: 'test@gmail.p',
                  ),
                  validator: (value) {
                    return (value != null && value.length >= 4)
                        ? null
                        : 'La contraseña debe de ser mayor a 4 caracteres';
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ButtonPrimary(
                  screenSize: screenSize,
                  title: 'INICIAR SESIÓN',
                  colorFondo: ColorsApp.secondary,
                  colorLetra: ColorsApp.white,
                  onTap: () async {     
                     Navigator.pushNamed(context, 'second');
                  },
                  colorBorde: ColorsApp.secondary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
