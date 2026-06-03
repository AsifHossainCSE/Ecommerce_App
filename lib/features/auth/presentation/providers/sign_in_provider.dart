import 'package:crafty_bay/app/core/services/network_caller.dart';
import 'package:crafty_bay/app/set_up_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/auth/data/models/sign_in_params.dart';
import 'package:crafty_bay/features/auth/data/models/user_model.dart';
import 'package:crafty_bay/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  bool _isSignInInProgress = false;

  bool get isSignInInProgress => _isSignInInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signIn(SignInParams params) async{
    bool isSuccess = false;
    _isSignInInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      url: Urls.signInUrl,
      body: params.toJson(),
    );
    if(response.isSuccess){
      isSuccess = true;
      UserModel model = UserModel.fromJson(response.responseData['data']['user']);
      String accessToken = response.responseData['data']['token'];
      await AuthController.saveUserData(accessToken, model);
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage ?? 'An error occurred during sign-in';
       
    }
    _isSignInInProgress = false;
    notifyListeners();

    return isSuccess;
  }
   
}