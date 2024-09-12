import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../screens/provider/providers.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;

    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              // decoration: BoxDecoration(
              //   color: Colors.blue,
              // ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isDarkmode ? Colors.white : Colors.transparent,
                ),
                child: const Image(
                  image: AssetImage('assets/images/logo-tl.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Perfil'),
                  onTap: () {
                    context.push('/profile');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.color_lens),
                  title: const Text('Temas'),
                  onTap: () {
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
          ),
        ],
      ),
    );
  }
}
