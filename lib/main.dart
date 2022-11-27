import 'package:rick_and_morty/src/features/presentation/app.dart';
import 'package:rick_and_morty/src/injection_container.dart' as di;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(App());
  });
}
