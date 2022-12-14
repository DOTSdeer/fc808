import 'package:flutter/material.dart';
import 'package:fc3/constants.dart';
import 'package:fc3/global_widgets/custom_btn.dart';
import 'package:fc3/global_widgets/custom_suffix.dart';
import 'package:fc3/screens/sign_up_screen/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String routeName = 'SignInScreen';
//constants of page
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

//focus is the button animations
class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    //
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

//this just builds the page
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: screensDefaultPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              kSizedBox1,
              Text(
                'Please enter your account here',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              kSizedBox2,
              kSizedBox2,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildUserField(),
                    kSizedBox2,
                    buildPasswordField(),
                    kSizedBox2,
                    InkWell(
                      onTap: () {
                        //somebody has fogotten thier password, this directs to the forgot password area
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Forgot Password',
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ),
                    kSizedBox2,
                    kSizedBox2,
                    CustomBtn(
                      onPress: () {
                        //sign in but you actually cant, because.
                        if (_formKey.currentState!.validate()) {
                          //back to home screen.

                        }
                      },
                      title: 'Sign In',
                    ),
                    kSizedBox2,
                    kSizedBox2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Don't have any account?",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        InkWell(
                          onTap: () {
                            //sign up. more data for mining purposes :)
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          },
                          child: Text(
                            "Sign Up Here",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildUserField() {
    return TextFormField(
      focusNode: _focusNodes[0],
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: inputTextHintStyle,
      decoration: InputDecoration(
        labelText: 'Username',
        suffixIcon: CustomSuffixIcon(
          iconSrc: 'assets/icons/person.svg',
          iconColor:
              _focusNodes[0].hasFocus ? kTextPrimaryColor : kTextSecondaryColor,
        ),
      ),
      validator: (value) {
        if (value!.length < 4) {
          return 'Must be more than 4 characters';
        }
        //validations of input
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      focusNode: _focusNodes[1],
      obscureText: true,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: inputTextHintStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: CustomSuffixIcon(
          iconSrc: 'assets/icons/lock.svg',
          iconColor:
              _focusNodes[1].hasFocus ? kTextPrimaryColor : kTextSecondaryColor,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Must be more than 5 characters';
        }
        //validations for password
        return null;
      },
    );
  }
}
