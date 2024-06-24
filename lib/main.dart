import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/bindings/initialbindings.dart';
import 'package:k_mandi/core/localization/changelocal.dart';
import 'package:k_mandi/core/localization/translation.dart';
import 'package:k_mandi/core/services/services.dart';
import 'package:k_mandi/routes.dart';

import 'package:k_mandi/view/screen/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      // pour assurer linjection de crud 
      initialBinding: InitialBindings(),

      //pour tester les widget a utiliser
      // home: const Test(),

      //home: const Language(),
      // medem nesta3mel fl middleWare
      // nemchi f routes.dart nzid l middle ware lel page par default l nhebo yabde biha

      //routes: routes,
      // medem ne5dem bel getx bch nesta3mrl route ta3 l getx
      getPages: routes,
    );
  }
}
