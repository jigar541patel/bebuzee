import 'dart:async';

import 'package:bebuzee/model/home_feed_list_model.dart';
import 'package:bebuzee/services/repo/common_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../storage/shared_pref_const.dart';
import '../../utils/common_utils.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetHomeFeedListEvent>((event, emit) async {
      emit(HomeFeedLoadingState());
      var storage = const FlutterSecureStorage();

      String? token = await storage.read(key: keyUserToken);
      String? userID = await storage.read(key: keyUserID);

      //Lazy loading not implemented as data are only 5 rows

      var requestBody = {
        "user_id": userID,
        "page": '1',
      };

      HomeFeedListModel responseData =
          await ApiController().getHomeFeedList(token!, requestBody);

      if (responseData.status != 200) {
        emit(OnHomeFeedListLoaded(responseData));
      } else {
        CommonUtils.utils.showToast(responseData.msg as String);
        emit(ErrorHomeFeedLoading());
      }
    });
  }
}
