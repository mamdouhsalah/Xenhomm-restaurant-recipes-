import 'package:Xenhomm_restaurant_Recipes/core/manger/style/colorStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/core/manger/style/textStyle.dart';
import 'package:flutter/material.dart';

class Customdriwer extends StatelessWidget {
  const Customdriwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: ColorStyle.greenColor,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: ColorStyle.greenColor),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: ColorStyle.whiteColor,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: ColorStyle.greenColor,
                ),
              ),
              accountName: Text(
                "Hello, mamdouh",
                style: Textstyle.text16Balck.copyWith(
                  color: ColorStyle.whiteColor,
                  fontFamily: 'Pacifico',
                ),
              ),
              accountEmail: const Text(
                "mamdouhsalah631@gmail.com",
                style: Textstyle.text14grey,
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home, color: ColorStyle.whiteColor),
              title: Text(
                "Home",
                style: Textstyle.text16Balck.copyWith(
                  color: ColorStyle.whiteColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.favorite, color: ColorStyle.whiteColor),
              title: Text(
                "Favorites",
                style: Textstyle.text16Balck.copyWith(
                  color: ColorStyle.whiteColor,
                ),
              ),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.settings, color: ColorStyle.whiteColor),
              title: Text(
                "Settings",
                style: Textstyle.text16Balck.copyWith(
                  color: ColorStyle.whiteColor,
                ),
              ),
              onTap: () {},
            ),

            const Spacer(),

            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: ColorStyle.whiteColor,
              ),
              title: Text(
                "Logout",
                style: Textstyle.text16Balck.copyWith(
                  color: ColorStyle.whiteColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
