import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k_mandi/controller/settings_controller.dart';
import 'package:k_mandi/core/constant/color.dart';
import 'package:k_mandi/core/constant/imageassets.dart';
import 'package:k_mandi/core/constant/routes.dart';

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
                ListTile(
                  // onTap: () {},
                  trailing: 
                  // switch to open or close notification
                  Switch(onChanged: (val) {}, value: true),
                  title: Text("Disable Notificatios"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.addressview);
                  },
                  trailing: Icon(Icons.location_on_outlined),
                  title: Text("Address"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.help_outline_rounded),
                  title: Text("About us"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.phone_callback_outlined),
                  title: Text("Contact us"),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("Logout"),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
