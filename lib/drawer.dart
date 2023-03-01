import 'package:flutter/material.dart';
import 'main.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Antonio Fernando Macaringue'),
          accountEmail: Text('antoniomacaringue27@gmail.com'),
          currentAccountPicture: CircleAvatar(),
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: const Text('Tarefas'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MyApp(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('Ajuda'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MyApp(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('Sobre'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MyApp(),
              ),
            );
          },
        ),
      ]),
    );
  }
}
