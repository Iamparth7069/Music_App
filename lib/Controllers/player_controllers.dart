  import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController{
  final audioQuary = OnAudioQuery();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkPermision();
  }

   checkPermision() async {
    var perm = await Permission.storage.request();
    if(perm.isGranted){
    }else{
      checkPermision();
    }
  }
}