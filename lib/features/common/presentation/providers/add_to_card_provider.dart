import 'package:crafty_bay/app/core/services/network_caller.dart';
import 'package:crafty_bay/app/set_up_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:flutter/material.dart';

class AddToCardProvider extends ChangeNotifier{
    bool _addToCardInProgress = false;

    bool get addToCardInProgress => _addToCardInProgress;
    String? _errorMessage;
    String? get errorMessage => _errorMessage;
    Future<bool> addToCard(String productId) async{
        bool isSuccess = false;

        _addToCardInProgress = true;
        notifyListeners();
        Map<String, dynamic> requestBody = {
            'product': productId,
        };
        final NetworkResponse response = await getNetworkCaller().postRequest(
            url: Urls.addToCardUrl,
            body: requestBody,
        );

        if (response.isSuccess) {
            isSuccess = true;
        } else {
            _errorMessage = response.errorMessage ?? 'Failed to add product to cart.';
        }
        _addToCardInProgress = false;
        notifyListeners();
        return isSuccess;
    }
}