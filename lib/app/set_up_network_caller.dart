import 'package:crafty_bay/app/core/services/network_caller.dart';
import 'package:crafty_bay/features/auth/presentation/providers/auth_controller.dart';

NetworkCaller getNetworkCaller(){
  NetworkCaller networkCaller = NetworkCaller(
    headers: {
      'content-type': 'application/json',
      'token': AuthController.accessToken ?? '',
    },
    onUnauthorize:(){

    },
  );
  return networkCaller;
}
