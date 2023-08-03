import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/app_icons.dart';
import 'package:fooddeliveryapp/model/app_string.dart';
import 'package:fooddeliveryapp/ui/auth/signup_screen.dart';
import 'package:fooddeliveryapp/widgets/round_button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Image.asset(AppIcons.bg, fit: BoxFit.cover),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Text(
              AppString.welcomeNote,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 25),
            const Text(AppString.welcomedesc,
                style: TextStyle(fontSize: 25, color: Colors.black38)),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RoundButtonWidget(
                    title: 'Get Started',
                    onpres: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    }),
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    ]));
  }
}
