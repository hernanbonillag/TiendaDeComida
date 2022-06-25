import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:tienda_app/widgets/text_widget.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Hola, ",
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Nombre',
                            style: TextStyle(
                              color: color,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Presionó el nombre');
                              }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextWidgets(
                      text: 'correo@correo.com', color: color, textSize: 18),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  _listiles(
                    title: 'Dirección',
                    subtitle: 'Subtitulo',
                    icon: IconlyLight.profile,
                    onPressed: () {},
                    color: color,
                  ),
                  _listiles(
                    title: 'Pedidos',
                    icon: IconlyLight.bag2,
                    onPressed: () {},
                    color: color,
                  ),
                  _listiles(
                    title: 'Wishlist',
                    icon: IconlyLight.paper,
                    onPressed: () {},
                    color: color,
                  ),
                  _listiles(
                    title: 'Vistos',
                    icon: IconlyLight.show,
                    onPressed: () {},
                    color: color,
                  ),
                  _listiles(
                    title: 'Olvide mi contraseña',
                    icon: IconlyLight.unlock,
                    onPressed: () {},
                    color: color,
                  ),
                  _listiles(
                    title: 'Cerrar Sesión',
                    icon: IconlyLight.logout,
                    onPressed: () {},
                    color: color,
                  ),
                  SwitchListTile(
                    title: TextWidgets(
                      text: themeState.getDarkTheme
                          ? 'Modo oscuro'
                          : 'Modo normal',
                      color: color,
                      textSize: 20,
                      isTitle: true,
                    ),
                    secondary: Icon(themeState.getDarkTheme
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined),
                    onChanged: (bool value) {
                      setState(() {
                        themeState.setDarkTheme = value;
                      });
                    },
                    value: themeState.getDarkTheme,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _listiles({
  required String title,
  String? subtitle,
  required IconData icon,
  required Function onPressed,
  required Color color,
}) {
  return ListTile(
    title: TextWidgets(
      text: title,
      color: color,
      textSize: 20,
      isTitle: true,
    ),
    subtitle: TextWidgets(text: subtitle ?? "", color: color, textSize: 18),
    leading: Icon(icon),
    trailing: const Icon(IconlyLight.arrowRight2),
    onTap: () {
      onPressed();
    },
  );
}
