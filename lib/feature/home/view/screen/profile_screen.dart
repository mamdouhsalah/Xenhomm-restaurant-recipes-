import 'package:Xenhomm_restaurant_Recipes/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.wallpaper.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.white.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 6,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.manage_accounts,
                    color: Color.fromARGB(255, 12, 177, 122),
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  "Mamdouh Salah",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Software Engineer",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 12, 177, 122),
                  ),
                  title: const Text("Email"),
                  subtitle: const Text("mamdouhsalah631@gmail.com"),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 12, 177, 122),
                    ),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 12, 177, 122),
                  ),
                  title: const Text("Phone"),
                  subtitle: const Text("+20 01017430238"),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.location_on,
                    color: Color.fromARGB(255, 12, 177, 122),
                  ),
                  title: const Text("Address"),
                  subtitle: const Text("Cairo, Egypt"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
