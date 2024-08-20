import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/settings_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/core/constant/imageassets.dart';
import 'package:k_mandi/core/constant/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());

    return Container(
      child: ListView(
        children: [
          Stack(
            // l clip bch me tetna7ach k npositioniha
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(height: Get.width / 3, color: AppColor.primaryColor),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: const AssetImage(AppImageAsset.avatar),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                // ListTile(
                //   // onTap: () {},
                //   trailing: 
                //   // switch to open or close notification
                //   Switch(onChanged: (val) {}, value: true),
                //   title: const Text("Disable Notificatios"),
                // ),
                //  const Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.orderspending);
                  },
                  title: const Text("Oders"), 
                  trailing: const Icon(Icons.card_travel),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.ordersarchive);
                  },
                  trailing: const Icon(Icons.archive_outlined),
                  title: const Text("Archive Orders"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.addressview);
                  },
                  trailing: const Icon(Icons.location_on_outlined),
                  title: const Text("Address"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.help_outline_rounded),
                  title: const Text("About us"),
                ),
                const Divider(),
                ListTile(
                  onTap: () async {
                    
                    // lorsque je clique sur contact us il mouvre lappelle 
                    await  launchUrl(Uri.parse("tel:+21654504040"));
                  },
                  trailing: const Icon(Icons.phone_callback_outlined),
                  title: const Text("Contact us"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
