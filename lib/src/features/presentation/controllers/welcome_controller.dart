
import 'package:get/get.dart';
import 'package:rick_and_morty/src/features/presentation/views/characters.view.dart';

class WelcomenController extends GetxController {
  
  goToCharacterView(){
    Get.to(() => CharactersView(), transition: Transition.fadeIn);
  }
}