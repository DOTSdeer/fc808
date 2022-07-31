import 'package:flutter/material.dart';
import 'package:fc3/constants.dart';
import 'package:fc3/screens/sign_in_screen/sign_in_screen.dart';
import 'components/intro_components.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static String routeName = 'IntroScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomStack(),
          kSizedBox1,
          Text(
            'FreeTest',
            style: Theme.of(context).textTheme.headline5,
          ),
          kSizedBox2,
          Text(
            "Download graphic design freeware now!",
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
          kSizedBox2,
          kSizedBox2,
          kSizedBox2,
          IntroBtn(
            onPress: () {
              //go to next screen
              Navigator.pushNamedAndRemoveUntil(
                  context, SignInScreen.routeName, (route) => false);
            },
          ),
          kSizedBox2,
          kSizedBox2,
        ],
      ),
    );
  }
}
