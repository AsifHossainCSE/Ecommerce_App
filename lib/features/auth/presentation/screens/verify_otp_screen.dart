import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/data/models/verify_otp_params.dart';
import 'package:crafty_bay/features/auth/presentation/providers/verify_otp_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/common/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ChangeNotifierProvider(
      create: (_) => _verifyOtpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppLogo(width: 90),
                    Text(
                      'Verify OTP',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      'Enter the OTP sent to your email',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _otpTEController,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        counterText: '',
                        hintText: 'Enter 4-digit OTP',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().length != 4) {
                          return 'Enter a valid 4-digit code';
                        }
                        return null;
                      },
                    ),

                    Consumer<VerifyOtpProvider>(
                      builder: (context, _, _) {
                        if (_verifyOtpProvider.isVerifyOtpInProgress) {
                          return CenterCircularProgress();
                        }
                        return FilledButton(
                          onPressed: _onTapVerifyButton,
                          child: Text('Verify OTP'),
                        );
                      },
                    ),

                    const SizedBox(height: 8),

                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: .bold,
                            ),
                            text: 'Sign In',
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
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
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  void _onTapVerifyButton() {
    if (_formKey.currentState!.validate()) {
      _verifyOtp();
      // Call verify OTP API
    }
  }

  Future<void> _verifyOtp() async {
    VerifyOtpParams params = VerifyOtpParams(
      email: widget.email,
      otp: _otpTEController.text,
    );
    final bool isSuccess = await _verifyOtpProvider.verifyOtp(params);
    if(isSuccess){
      Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate) => false);
    } else{
       showSnackBarMessage(context, _verifyOtpProvider.errorMessage!);
    }
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
