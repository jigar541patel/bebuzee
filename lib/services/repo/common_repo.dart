import 'dart:async';

import 'package:bebuzee/model/home_feed_list_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../model/login_model.dart';
import '../api/api_end_point.dart';
import '../api/api_hitter.dart';
import '../base/base_repository.dart';

class ApiController extends BaseRepository {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint('Couldn\'t check connectivity status${e.message}');
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) {
    //   return Future.value(null);
    // }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    // setState(() {
    _connectionStatus = result;
    // });
  }



  Future<dynamic> userLogin(var loginFormData,var header) async {
    initConnectivity();

    debugPrint("oonzoo the internet is ${_connectionStatus.name}");
    ApiResponse apiResponse = await apiHitter
        .getPostApiResponse(ApiEndpoint.userLogin, postFormData: loginFormData,isFormData: true,headers: header);
    {
      try {
        if (apiResponse.success) {
          debugPrint("oonzoo the try first is${apiResponse.response!.data}");

          if (apiResponse.response!.data != null) {
            final passEntity = LoginModel.fromJson(apiResponse.response!.data);
            return passEntity;
          } else {
            return apiResponse;
            // return LoginModel(
            //     token: apiResponse.response!.data,
            //     success: apiResponse.success);
          }
        } else {
          return apiResponse;
        }
      } catch (error) {
        debugPrint("oonzoo the error is $apiResponse");
        // return LoginModel(
        //     token: apiResponse.toString(), success: false);
      }
    }
  }

  Future<HomeFeedListModel> getHomeFeedList(String userToken,
      var loginFormData) async {
    var auth = {"Authorization": 'Bearer $userToken'};

    ApiResponse apiResponse = await apiHitter.getPostApiResponse(
        "${ApiEndpoint.homeFeedList}",
        headers: auth,
        token: 'Bearer $userToken',
        postFormData: loginFormData,isFormData: true,);

    debugPrint("jigar the data is getHomeFeedList "+apiResponse.responseCode.toString());
    try {
      if (apiResponse.responseCode == 302) {
        return HomeFeedListModel(

            status: apiResponse.responseCode, msg: apiResponse.message, data: null);
      }
      if (apiResponse.success) {
        if (apiResponse.response != null) {
          if (apiResponse.response!.data != null) {
            final passEntity =
            HomeFeedListModel.fromJson(apiResponse.response!.data);
            return passEntity;
          } else {
            if (apiResponse.responseCode == 403) {
              return HomeFeedListModel(
                  status: apiResponse.responseCode, msg: apiResponse.message, data: null);
            } else {
              return HomeFeedListModel(
                  status: apiResponse.responseCode, msg: apiResponse.message, data: null);
            }
          }
        } else {
          if (apiResponse.responseCode == 403) {
            return HomeFeedListModel(
                status: apiResponse.responseCode, msg: apiResponse.message, data: null);
          } else {
            return HomeFeedListModel(
                status: apiResponse.responseCode, msg: apiResponse.message, data: null);
          }
        }
      } else {
        if (apiResponse.responseCode == 403) {
          return HomeFeedListModel(
              status: apiResponse.responseCode, msg: apiResponse.message, data: null);
        } else {
          return HomeFeedListModel(
              status: apiResponse.responseCode, msg: apiResponse.message, data: null);
        }
      }
    } catch (error) {
      return HomeFeedListModel(
          status: apiResponse.responseCode, msg: apiResponse.message, data: null);
    }
  }




}
