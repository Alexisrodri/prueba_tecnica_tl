import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../screens/provider/providers.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo-tl.png"),
          ),
          Expanded(
            child: ListView(
              children: [
                DrawerListTile(
                  title: "Profile",
                  icon: Icons.person,
                  press: () {
                    context.push('/profile');
                  },
                ),
                DrawerListTile(
                  title: "Theme",
                  icon: Icons.palette_outlined,
                  press: () {
                    context.push('/theme');
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(isDarkmode ? Icons.nightlight_round : Icons.wb_sunny),
            title: Text(isDarkmode ? 'Modo Oscuro' : 'Modo Claro'),
            trailing: Switch(
              value: isDarkmode,
              onChanged: (value) {
                ref.read(themeNotifierProvider.notifier).toggleDarkmode();
              },
            ),
            onTap: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            },
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
        size: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
      ),
    );
  }
}
