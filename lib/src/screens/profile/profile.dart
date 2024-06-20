import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_sings/src/theme/app_theme.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toasty_box.dart';

import '../../componets/componets.dart';

Future<String?> uploadFinal(BuildContext context) async {
  final int? resultAsk = await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      buttonPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            32.0,
          ),
        ),
      ),
      content: SizedBox(
        height: 120,
        width: 350,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Seleccione el tipo de\narchivo que desea subir.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 19,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, 1);
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.photo_camera),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Camara')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, 2);
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.photo_album_outlined),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Galeria')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 80, bottom: 0),
          child: TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.pop(context, null);
            },
          ),
        )
      ],
    ),
  );

  if (resultAsk != null) {
    final ImagePicker picker = ImagePicker();
    switch (resultAsk) {
      case 1:
        try {
          final XFile? pickedFile =
              await picker.pickImage(source: ImageSource.camera);
          if (pickedFile != null) {
            return pickedFile.path;
          }
        } catch (e) {
          print("Error al cargar desde cámara: $e");
        }
        break;
      case 2:
        try {
          final XFile? pickedFile =
              await picker.pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            return pickedFile.path;
          }
        } catch (e) {
          print("Error al cargar desde galería: $e");
        }
        break;
    }
  }
  return null;
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  File? _image;
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
          nameController.text = userDoc['full_name'] ?? '';
          phoneController.text = userDoc['phonenumber'] ?? '';
          emailController.text = userDoc['email'] ?? '';
          ageController.text = userDoc['age'] ?? '';
          birthDateController.text = userDoc['born_day'] ?? '';
          _photoUrl = userDoc['photo'] ?? '';
        });
      }
    }
  }

  Future<void> _pickImage() async {
    final String? filePath = await uploadFinal(context);
    if (filePath != null) {
      setState(() {
        _image = File(filePath);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    try {
      String fileName = 'profile_pictures/${_auth.currentUser!.uid}.jpg';
      Reference storageRef = _storage.ref().child(fileName);
      UploadTask uploadTask = storageRef.putFile(_image!);

      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();

      setState(() {
        _photoUrl = downloadURL;
      });

      print('File uploaded: $downloadURL');
    } catch (e) {
      print('Failed to upload image: $e');
    }
  }

  void _updateUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'full_name': nameController.text,
        'phonenumber': phoneController.text,
        'email': emailController.text,
        'age': ageController.text,
        'born_day': birthDateController.text,
        'photo': _photoUrl,
      });

      // Mostrar un mensaje de éxito
      ToastService.showSuccessToast(
        context,
        length: ToastLength.medium,
        expandedHeight: 100,
        message: "Se ha guardado correctamente.",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarHome(
        titleApp: 'Modificar perfil',
      ),
      drawer: const SideMenu(),
      body: Stack(
        children: [
          const BackgroundImage(),
          TextButton.icon(
              onPressed: () {
                print('onPressed');
                Navigator.pushNamed(context, 'profile');
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Volver"),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(ColorsApp.secondary),
              )),
          Align(
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
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            _photoUrl != null && _photoUrl!.isNotEmpty
                                ? NetworkImage(_photoUrl!)
                                : null,
                        child: _photoUrl == null || _photoUrl!.isEmpty
                            ? const Icon(Icons.camera_alt, size: 60)
                            : null,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ButtonPrimary(
                      screenSize: screenSize,
                      title: 'Subir Imagen',
                      colorFondo: ColorsApp.secondary,
                      colorLetra: ColorsApp.white,
                      onTap: _uploadImage,
                      colorBorde: ColorsApp.secondary,
                    ),
                    const SizedBox(height: 10.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          icon: Icons.person,
                          iconColor: ColorsApp.textColor,
                          hintText: 'Ingresa tu nombre completo',
                          labelText: 'Nombre completo',
                          controller: nameController,
                          onChanged: (value) {},
                          disabledField: true,
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextFormField(
                          icon: Icons.phone_android,
                          iconColor: ColorsApp.textColor,
                          hintText: 'Ingresa tu celular',
                          labelText: 'Celular',
                          controller: phoneController,
                          onChanged: (value) {},
                          disabledField: true,
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextFormField(
                          icon: Icons.person,
                          iconColor: ColorsApp.textColor,
                          hintText: 'Ingresa tu correo electrónico',
                          labelText: 'Correo electrónico',
                          controller: emailController,
                          onChanged: (value) {},
                          disabledField: false,
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextFormField(
                          icon: Icons.person,
                          iconColor: ColorsApp.textColor,
                          hintText: 'Ingresa tu edad',
                          labelText: 'Edad',
                          controller: ageController,
                          onChanged: (value) {},
                          disabledField: true,
                        ),
                        const SizedBox(height: 10.0),
                        CustomTextFormField(
                          icon: Icons.person,
                          iconColor: ColorsApp.textColor,
                          hintText: 'Ingresa tu fecha de nacimiento',
                          labelText: 'Fecha de nacimiento',
                          controller: birthDateController,
                          onChanged: (value) {},
                          disabledField: true,
                        ),
                        const SizedBox(height: 10.0),
                        ButtonPrimary(
                          screenSize: screenSize,
                          title: 'Guardar',
                          colorFondo: ColorsApp.secondary,
                          colorLetra: ColorsApp.white,
                          onTap: _updateUserData,
                          colorBorde: ColorsApp.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
