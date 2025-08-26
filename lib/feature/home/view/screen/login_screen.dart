import 'package:Xenhomm_restaurant_Recipes/core/manger/style/colorStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/core/manger/style/textStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/screen/home_screen.dart';
import 'package:Xenhomm_restaurant_Recipes/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.wallpaper.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: ColorStyle.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                child: SizedBox(
                  height: 250,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.images.login.image(height: 120, width: 120),
                      const Text(
                        'Welcome to Xenhomm restaurant Recipes App',
                        textAlign: TextAlign.center,
                        style: Textstyle.text16BalckBolod,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Smart Recipe, Just for you',
                        style: Textstyle.text14grey,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyle.whiteColor,
                      elevation: 3,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text('Login', style: Textstyle.text16Balck),
                  ),
                  const SizedBox(width: 19),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyle.whiteColor,
                      elevation: 3,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text('Sign Up', style: Textstyle.text16Balck),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
