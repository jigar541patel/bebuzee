import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

import '../../../services/repo/common_repo.dart';
import '../../../utils/strings.dart';
import '../../model/login_model.dart';
import '../../storage/shared_pref_const.dart';
import '../../utils/common_utils.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    // on<LoginEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<LoginTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.strEmail) == false) {
        emit(LoginErrorState(emailError));
      } else if (event.strPassword == "") {
        emit(LoginErrorState(passwordError));
      } else {
        emit(LoginValidState());
      }
    });
    on<LoginSubmittedEvent>((event, emit) async {
      emit.call(AddingDataInProgressState());

      var requestBody = {
        "email": event.strEmail,
        "password": event.strPassword,
      };
      var header = {
        "Content-Type": "multipart/form-data",
        "Content-Length": requestBody.length.toString(),
      };

      var responseData = await ApiController().userLogin(requestBody, header);
      if (responseData.status != "0") {
        LoginModel loginModel = responseData;
        CommonUtils.utils.showToast(successLogin);
        emit.call(AddingDataValidCompletedState());
        var storage = FlutterSecureStorage();

        await storage.write(key: keyUserToken, value: loginModel.accessToken);
        await storage.write(
            key: keyUserID, value: loginModel.data!.userId!.toString());
        await storage.write(key: keyUserData, value: json.encode(loginModel));
      } else {
        emit.call(AddingDataInValidCompletedState());
        CommonUtils.utils.showToast(
            // responseData.status as int+
            responseData.message as String);
      }
    });
  }
}
