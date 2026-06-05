import 'package:crafty_bay/app/core/services/network_caller.dart';
import 'package:crafty_bay/app/set_up_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/home/data/models/slider_model.dart';
import 'package:flutter/material.dart';

class HomeSliderProvider extends ChangeNotifier {
  bool _getHomeSlidersInProgress = false;
  bool get getHomeSlidersInProgress => _getHomeSlidersInProgress;

  List<SliderModel> _homeSliders = [];
  List<SliderModel> get homeSliders => _homeSliders;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getHomeSliders() async {
    bool isSuccess = false;
    _getHomeSlidersInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      url: Urls.homeSlidersUrl(),
    );

    if (response.isSuccess) {
      List<SliderModel> sliders = [];
      for (Map<String, dynamic> slider in response.responseData['data']['results']) {
        sliders.add(SliderModel.fromJson(slider));
      }
      _homeSliders = sliders;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? 'An error occurred while fetching home sliders';
      isSuccess = false;
    }

    _getHomeSlidersInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}