import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/orders/pending_controller.dart';


// Demande l persmession
requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  print("hai =======================================================");
  // tab9a en exécution tant que lapplication est ouverte
  // l msg hhowa l wselni f notfication        
  FirebaseMessaging.onMessage.listen((message) {
    print("================== Notification =================");
    print(message.notification!.title);
    print(message.notification!.body);

    // son wa9et todhhor e snackbar 
    FlutterRingtonePlayer.playNotification();
    // snackbar tgoli rw weslet notification ( title w contenu ) k tabde l app ma7loula
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  /* lehna k ena nabde c'est deja fl page pending order w touselni notification (order approuved) ya3mel refresh 
   lel page bch tetbdale l ui status te3ha men ... l approuved */
  print("============================= page id ");
  print(data['pageid']);
  print("============================= page name ");
  print(data['pagename']);

  // Get.currentRoute => tgouli ena f emehy page tw 
  print("================== Current Route");
  print(Get.currentRoute);

  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderpending") {
    OrdersPendingController controller = Get.find();
    controller.refrehOrder();
  }
}
