import 'package:Xenhomm_restaurant_Recipes/core/manger/style/colorStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/core/manger/style/textStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.whiteColor,

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
            color: ColorStyle.whiteColor.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 6,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  backgroundColor: ColorStyle.whiteColor,
                  radius: 60,
                  child: Icon(
                    Icons.manage_accounts,
                    color: ColorStyle.greenColor,
                  ),
                ),

                const SizedBox(height: 16),
                const Text(
                  "Mamdouh Salah",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text("Software Engineer", style: Textstyle.text14grey),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(
                    Icons.email,
                    color: ColorStyle.greenColor,
                  ),
                  title: const Text("Email", style: Textstyle.text16Balck),
                  subtitle: const Text(
                    "mamdouhsalah631@gmail.com",
                    style: Textstyle.text14grey,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit, color: ColorStyle.greenColor),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.phone,
                    color: ColorStyle.greenColor,
                  ),
                  title: const Text("Phone", style: Textstyle.text16Balck),
                  subtitle: const Text(
                    "+20 01017430238",
                    style: Textstyle.text14grey,
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.location_on,
                    color: ColorStyle.greenColor,
                  ),
                  title: const Text("Address", style: Textstyle.text16Balck),
                  subtitle: const Text(
                    "Cairo, Egypt",
                    style: Textstyle.text14grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
