import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_sings/src/theme/app_theme.dart';

import '../../componets/componets.dart';

class ViewProfileScreen extends StatefulWidget {
  const ViewProfileScreen({super.key});

  @override
  State<ViewProfileScreen> createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String fullName = '';
  String phoneNumber = '';
  String email = '';
  String age = '';
  String birthDate = '';
  String? _photoUrl;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          fullName = userDoc['full_name'] ?? '';
          phoneNumber = userDoc['phonenumber'] ?? '';
          email = userDoc['email'] ?? '';
          age = userDoc['age'] ?? '';
          birthDate = userDoc['born_day'] ?? '';
          _photoUrl = userDoc['photo'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarHome(
        titleApp: 'Perfil',
      ),
      drawer: const SideMenu(),
      body: Stack(
        children: [
          const BackgroundImage(),
          Center(
            child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
                    color: ColorsApp.white,
                    shadowColor: ColorsApp.textColor,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SizedBox(
                        height: 425,
                        child: Align(
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 45.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10.0),
                                  GestureDetector(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundImage: _photoUrl != null &&
                                              _photoUrl!.isNotEmpty
                                          ? NetworkImage(_photoUrl!)
                                          : null,
                                      child: _photoUrl == null ||
                                              _photoUrl!.isEmpty
                                          ? const Icon(Icons.camera_alt,
                                              size: 60)
                                          : null,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20.0,
                                        child: Text(
                                          fullName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: ColorsApp.secondary),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      SizedBox(
                                        height: 20.0,
                                        child: Text(
                                          phoneNumber,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: ColorsApp.secondary),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      SizedBox(
                                        height: 20.0,
                                        child: Text(
                                          email,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: ColorsApp.secondary),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      SizedBox(
                                        height: 20.0,
                                        child: Text(
                                          age,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: ColorsApp.secondary),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      SizedBox(
                                        height: 20.0,
                                        child: Text(
                                          birthDate,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: ColorsApp.secondary),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      ButtonPrimary(
                                        screenSize: screenSize,
                                        title: 'Modificar',
                                        colorFondo: ColorsApp.secondary,
                                        colorLetra: ColorsApp.white,
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, 'update_profile');
                                        },
                                        colorBorde: ColorsApp.secondary,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))),
          ),
        ],
      ),
    );
  }
}
