import 'package:crafty_bay/app/core/services/network_caller.dart';

NetworkCaller getNetworkCaller(){
  NetworkCaller networkCaller = NetworkCaller(
    headers: {
      'content-type': 'application/json',
     // 'token': 'token',
    },
    onUnauthorize:(){

    },
  );
  return networkCaller;
}
