import 'package:flutter/material.dart';
import '../constants/general.dart' as constants;

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.redAccent,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 48),
            buildMenuItem(
                text: constants.settings,
                icon: Icons.edit,
                onClicked: () => selectedItem(context, 0)),
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem(
    {required String text, required IconData icon, VoidCallback? onClicked}) {
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
      Navigator.pushNamed(context, '/settings');
      break;
  }
}
