import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 8,
              children: [
                AppLogo(width: 90),
                Text('Sign Up', style: textTheme.headlineMedium?.copyWith(fontWeight: .bold),),
                Text('Get started with yours details', style: textTheme.bodyLarge,),
                const SizedBox(height: 16,),
                TextFormField(
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: 'First Name'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: 'Last Name'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your last name';
                    }
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  keyboardType: .emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your valid email';
                    }
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your password';
                    }
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  keyboardType: .phone,
                  decoration: InputDecoration(hintText: 'Phone Number'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your phone number';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'City'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your city';
                    }
                  },
                ),
                FilledButton(
                 
                  onPressed: _onTapSignUpButton, child: Text('Sign Up')),

                const SizedBox(height: 8,),  

                RichText(text: TextSpan(
                  text: 'Already have an account? ',
                  style: textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: .bold,
                      ),
                      text: 'Sign In',
                      recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
                      
                    )
                  ]
                ))  
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton(){

  }
  void _onTapSignInButton(){
    Navigator.pushNamed(context, SignInScreen.name);
}
}