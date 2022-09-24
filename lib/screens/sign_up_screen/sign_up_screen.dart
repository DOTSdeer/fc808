import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fc3/constants.dart';
import 'package:fc3/global_widgets/custom_btn.dart';
import 'package:fc3/global_widgets/custom_suffix.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    // what is a init state? is flutter from brittish descent?
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

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
                'Create Account',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              kSizedBox1,
              Text(
                'Give me your details!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              kSizedBox2,
              kSizedBox2,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    kSizedBox2,
                    buildUserField(),
                    kSizedBox2,
                    buildFirstField(),
                    kSizedBox2,
                    buildLastField(),
                    kSizedBox2,
                    buildEmailField(),
                    kSizedBox2,
                    buildPasswordField(),
                    kSizedBox2,
                    kSizedBox2,
                    CustomBtn(
                      onPress: () {
                        //sign in
                        if (_formKey.currentState!.validate()) {
                          //go to home screen

                        }
                      },
                      title: 'Sign Up',
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
        return null;
      },
    );
  }

  TextFormField buildFirstField() {
    return TextFormField(
      focusNode: _focusNodes[0],
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: inputTextHintStyle,
      decoration: InputDecoration(
        labelText: 'First Name',
        suffixIcon: CustomSuffixIcon(
          iconSrc: 'assets/icons/person.svg',
          iconColor:
              _focusNodes[0].hasFocus ? kTextPrimaryColor : kTextSecondaryColor,
        ),
      ),
      validator: (value) {
        if (value!.length < 3) {
          return 'Must be more than 3 characters';
        }
        return null;
      },
    );
  }

  TextFormField buildLastField() {
    return TextFormField(
      focusNode: _focusNodes[0],
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: inputTextHintStyle,
      decoration: InputDecoration(
        labelText: 'Last Name',
        suffixIcon: CustomSuffixIcon(
          iconSrc: 'assets/icons/person.svg',
          iconColor:
              _focusNodes[0].hasFocus ? kTextPrimaryColor : kTextSecondaryColor,
        ),
      ),
      validator: (value) {
        if (value!.length < 2) {
          return 'Must be more than 2 characters';
        }
        return null;
      },
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      focusNode: _focusNodes[1],
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: inputTextHintStyle,
      decoration: InputDecoration(
        labelText: 'Email',
        suffixIcon: CustomSuffixIcon(
          iconSrc: 'assets/icons/email.svg',
          iconColor:
              _focusNodes[1].hasFocus ? kTextPrimaryColor : kTextSecondaryColor,
        ),
      ),
      validator: (value) {
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      focusNode: _focusNodes[2],
      obscureText: true,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: inputTextHintStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: CustomSuffixIcon(
          iconSrc: 'assets/icons/lock.svg',
          iconColor:
              _focusNodes[2].hasFocus ? kTextPrimaryColor : kTextSecondaryColor,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Must be more than 5 characters';
        }
        return null;
      },
    );
  }
}
