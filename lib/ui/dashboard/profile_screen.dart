import 'dart:convert';

import 'package:bebuzee/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/strings.dart';
import '../../storage/shared_pref_const.dart';
import '../../utils/colors_utils.dart';
import '../../utils/images_utils.dart';
import '../../utils/route_names.dart';
import '../../utils/size_config.dart';
import '../../utils/standard_regular_text.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  // CartListBloc cartListBloc = CartListBloc();
  // CartListModel cartListModel = CartListModel();
  var storage = const FlutterSecureStorage();
  LoginModel? loginModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      await storage.read(key: keyUserData).then((value) {
        setState(() {
          loginModel = LoginModel.fromJson(json.decode(value!));
        });

      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return
        // BlocProvider(
        // create: (context) => cartListBloc,
        Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: Container(
              padding:
                  const EdgeInsets.only(top: 10.0, bottom: 50.0, left: 16.0),
              decoration: const BoxDecoration(color: primaryColor),
              child: const Column(
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: StandardCustomText(
                      label: myProfile,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .15,
            ),
            height: MediaQuery.of(context).size.height * .85,
            decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(0.0)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child:
                  loginModel!=null?
                  Column(
                    children: [
                      Align(
                          alignment: AlignmentDirectional.center,
                          child: loginModel!.data!.image != null
                              ? Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  elevation: 4,
                                  color: whiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 30,
                                      height:
                                          SizeConfig.blockSizeVertical! * 15,
                                      image: NetworkImage(
                                          loginModel!.data!.image!),
                                      fit: BoxFit.contain,
                                    ),
                                  ))
                              : Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  elevation: 4,
                                  color: whiteColor,
                                  child: (Image(
                                    image: const AssetImage(noImage),
                                    width:
                                        MediaQuery.of(context).size.width - 10,
                                    height: SizeConfig.blockSizeVertical! * 30,
                                  )),
                                )),
                      const StandardCustomText(label: "Profile Photo",fontSize: 14,),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 2,
                      ),
                      cardRow(
                          'Name',
                          loginModel != null
                              ? loginModel!.data!.name!.capitalize()
                              : ""),
                      cardRow(
                          'Email',
                          loginModel != null
                              ? loginModel!.data!.email.toString()
                              : ""),
                      cardRow(
                          'Gender',
                          loginModel != null
                              ? loginModel!.data!.gender!.capitalize()
                              : ""),
                      cardRow(
                          'Followers',
                          loginModel != null
                              ? "${loginModel!.data!.followerCount}"
                              : ""),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: InkWell(
                            onTap: () async {
                              FlutterSecureStorage storage =
                              const FlutterSecureStorage();
                              await storage.deleteAll();
                              Navigator.pushNamedAndRemoveUntil(context,
                                  routeLogin, ModalRoute.withName('/'));
                            },
                            child: cardLogoutRow( 'LOGOUT')),
                      ),
                    ],
                  ):const SizedBox(),
                ),
              ),
            ),
          )
        ],
      )),
    );
    // );
  }

  Widget cardRow(String title, String subTitle) {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 4,
        color: whiteColor,
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          margin: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                  child: StandardCustomText(
                label: "$title : ",
                fontWeight: FontWeight.w700,
                align: TextAlign.start,
              )),
              Expanded(
                flex: 3,
                child: StandardCustomText(
                  label: subTitle,
                  fontWeight: FontWeight.w700,
                  align: TextAlign.start,
                  color: primaryColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ));
  }
  Widget cardLogoutRow(String title) {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 4,
        color: whiteColor,
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: StandardCustomText(
                label: "$title ",
                fontWeight: FontWeight.w900,
                align: TextAlign.center,
                    fontSize: 16,
                    color: primaryColor,
              )),

            ],
          ),
        ));
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
