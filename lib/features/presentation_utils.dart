import 'package:ecommerce_app/domain/exceptions/exceptions.dart';
import 'package:flutter/material.dart';

extension ContextErrorMessageExtractor on BuildContext{

  // if u want to use localization
  // to get translated message
  String getErrorMessage(Exception e){
    if(e is ServerError){// smart cast
      return e.message ?? 'Something went wrong';
    }else if(e is NoInternetException){
      return "No Internet Connection";
    }
    return "Something went wrong";

  }
}