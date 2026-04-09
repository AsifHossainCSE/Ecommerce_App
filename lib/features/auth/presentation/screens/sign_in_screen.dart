import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                Text('Sign In', style: textTheme.headlineMedium?.copyWith(fontWeight: .bold),),
                Text('Login to your account with email and password', style: textTheme.bodyLarge,),
                const SizedBox(height: 16,), 
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
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your password';
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: _onTapForgotPasswordButton, child: Text('Forgot Password?'))
                  ],
                ),
               
                FilledButton(
                 
                  onPressed: _onTapSignInButton, child: Text('Sign In')),

                const SizedBox(height: 8,),  

                RichText(text: TextSpan(
                  text: 'Need an account? ',
                  style: textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: .bold,
                      ),
                      text: 'Sign Up',
                      recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton,
                      
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
  void _onTapForgotPasswordButton(){
    
  }

  void _onTapSignUpButton(){
      Navigator.pop(context);
  }
  void _onTapSignInButton(){
     
}
}