// ignore: file_names
import 'package:flutter/material.dart';
import 'package:learning_sings/src/componets/componets.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

class PersonalPresentationScreen extends StatelessWidget {
  const PersonalPresentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listadoPresentacionPersonal = [
      "Presentación personal I",
      "Mi nombre",
      "Pon a prueba tus conocimientos",
    ];

    List<String> listadoLinks = [
      "https://firebasestorage.googleapis.com/v0/b/learning-signs-2fd82.appspot.com/o/personal%20presentation%2FPresentaci%C3%B3n%20personal%20I.gif?alt=media&token=f3c1609a-8a8b-47e8-b94b-2380926130ca",
      "https://firebasestorage.googleapis.com/v0/b/learning-signs-2fd82.appspot.com/o/personal%20presentation%2FMi%20nombre.gif?alt=media&token=2dbcf163-1299-418d-bba3-cf4763b998d5",
      "https://firebasestorage.googleapis.com/v0/b/learning-signs-2fd82.appspot.com/o/personal%20presentation%2FPon%20a%20prueba%20tus%20conocimientos.gif?alt=media&token=95451998-898f-427f-b62e-03d21843db8e",
    ];

    return Scaffold(
        appBar: const AppBarHome(
          titleApp: 'Abecedario',
        ),
        drawer: const SideMenu(),
        body: Stack(
          children: [
            const BackgroundImage(),
            Positioned.fill(
              child: ListView.builder(
                itemCount: listadoPresentacionPersonal.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'item-link',
                          arguments: {
                            'item': listadoPresentacionPersonal[index],
                            'linkItem': listadoLinks[index],
                            'returnItem': 'presentation_i'
                          },
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorsApp.secondary)),
                      child: Text(
                        listadoPresentacionPersonal[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: ColorsApp.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
