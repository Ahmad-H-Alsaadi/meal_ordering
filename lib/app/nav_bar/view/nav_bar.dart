import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_ordering/app/nav_bar/view/contact_view.dart';
import 'package:meal_ordering/app/nav_bar/view/history_view.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              '',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://img.freepik.com/premium-vector/person-avatar-design_24877-38137.jpg?w=2000",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/004/275/702/original/fast-food-seamless-background-illustration-simple-restaurant-menu-background-vector.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.manage_accounts_outlined),
            title: const Text("Manage Account"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favorite"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("My order history"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HistoryView(),
              ));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.textsms_outlined),
            title: const Text("Contact Us"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ContactView(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_rounded),
            title: const Text("Log out"),
            onTap: signUserOut,
          ),
        ],
      ),
    );
  }
}
