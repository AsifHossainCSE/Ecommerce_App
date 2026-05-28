import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_params.dart';
import 'package:crafty_bay/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpProvider _signUpProvider = SignUpProvider();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ChangeNotifierProvider(
      create: (_) => _signUpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  AppLogo(width: 90),
                  Text('Sign Up', style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),),
                  Text('Get started with yours details', style: textTheme.bodyLarge,),
                  const SizedBox(height: 16,),
                  Form(
                    key: _formKey,

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _firstNameTEController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(hintText: 'First Name'),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your first name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _lastNameTEController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(hintText: 'Last Name'),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your last name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _emailTEController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(hintText: 'Email'),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your valid email';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _passwordTEController,
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          decoration: const InputDecoration(hintText: 'Password'),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your password';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _phoneTEController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(hintText: 'Phone Number'),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your phone number';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _cityTEController,
                          decoration: const InputDecoration(hintText: 'City'),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your city';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        Consumer<SignUpProvider>(
                          builder: (context, signUpProvider, child) {
                            return Visibility(
                              visible: signUpProvider.isSignUpInProgress == false,
                              replacement: const Center(
                                child: CircularProgressIndicator(),
                              ),
                              child: FilledButton(
                                onPressed: _onTapSignUpButton,
                                child: const Text('Sign Up'),
                              ),
                            );
                          }
                        ),
                        const SizedBox(height: 8,),  
                        RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  color: AppColors.themeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                text: 'Sign In',
                                recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
                              )
                            ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton(){
    if (_formKey.currentState!.validate()){
      _signUp();
      
    }
  }

  Future<void> _signUp() async {
    final bool isSuccess = await _signUpProvider.signUp(
      SignUpParams(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text.trim(),
        phone: _phoneTEController.text.trim(),
        city: _cityTEController.text.trim(),
      )
    );
    if (isSuccess){
      Navigator.pushNamed(context, VerifyOtpScreen.name);
    } else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_signUpProvider.errorMessage!)),
      );
    }
  }
  void _onTapSignInButton(){
    Navigator.pushNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _phoneTEController.dispose();
    _cityTEController.dispose();
    super.dispose();
  }
}