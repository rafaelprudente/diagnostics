import 'package:diagnostics/constants/appearance_constants.dart' as appearance_constants;
import 'package:diagnostics/constants/label_constants.dart' as label_constants;
import 'package:diagnostics/routes/routes.dart' as routes;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 100.0,
            child: DrawerHeader(
              decoration: BoxDecoration(color: appearance_constants.primarySwatch),
              child: Center(child: Text(label_constants.labelMenu, style: TextStyle(color: Colors.white))),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(label_constants.labelMenuHome),
            onTap: () {
              Get.back();
              Get.toNamed(routes.medicalExamListPage);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(label_constants.labelMenuPreferences),
            onTap: () {
              Get.back();
              Get.toNamed(routes.preferencesListPage);
            },
          ),
        ],
      ),
    );
  }
}

Widget buildMenuItem({required String text, required IconData icon, VoidCallback? onClicked}) {
  const Color foregroundColor = Colors.white;
  const Color hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(icon, color: foregroundColor),
    title: Text(text, style: const TextStyle(color: foregroundColor)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int itemIndex) {
  Navigator.of(context).pop();

  switch (itemIndex) {
    case 0:
      Get.toNamed(routes.preferencesListPage);
      break;
  }
}
