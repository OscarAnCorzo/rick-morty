import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/core/settings/app_assets.dart';
import 'package:rick_and_morty/src/features/presentation/controllers/welcome_controller.dart';
import 'package:rick_and_morty/src/features/presentation/widgets/button_widget.dart';
import 'package:rick_and_morty/src/injection_container.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome';
  
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WelcomenController _ctrl = sl<WelcomenController>();

    return GetBuilder<WelcomenController>(
      init: _ctrl,
      builder: (_) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.fondo),
                fit: BoxFit.fill,
                // opacity: 0.1,
                // colorFilter: ColorFilter.
              ),
              // color: Colors.black
            ),
            child: Container(
              color: Colors.black.withOpacity(0.65),
              // decoration: 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),

                  Image.asset(
                    AppAssets.logo,
                    width: 271,
                    height: 152.44,
                    fit: BoxFit.cover
                  ),

                  SizedBox(height: 50.0),

                  Text(
                    'Bienvenido a Rick and Morty',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20.0),

                  Text(
                    'En esta prueba, evaluaremos su capacidad para construit la aplicación mediante el análisis de código y la reproducción del siquiente diseño.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 150.0),

                  Button(text: 'Continuar', onPressed: () => _ctrl.goToCharacterView()),

                  Spacer()
                ]
              )
            )
          )
        );
      }
    );
  } 
}