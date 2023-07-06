import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../storage/shared_pref_const.dart';
import '../../../utils/images_utils.dart';
import '../../../utils/route_names.dart';
import '../../login/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    startTime();
  }

  startTime() async {
    String? token = await storage.read(key: keyUserToken);
    if (token == null) {
      var duration = const Duration(seconds: 5);
      Timer(duration, getNavigationPage);
    } else {
      // splashBloc.add(GetProfileEvent());
      var duration = const Duration(seconds: 5);
      // Timer(duration, getNavigationPage);
      // if (!mounted) return;
      Future.delayed(const Duration(milliseconds: 5500), () {
        Navigator.pushReplacementNamed(context, routeDashboard);
      });
    }
  }

  getNavigationPage() async {
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, routeLogin);
  }

  PageTransitionType? pageTransitionType = PageTransitionType.leftToRight;

  @override
  Widget build(BuildContext context) {
    //Widget imageAppLogo() => Image.asset(appLogo,);

    return Scaffold(
        body: MaterialApp(
            title: 'Bebuzee',
            home: AnimatedSplashScreen(
                duration: 3000,
                splash: appLogo,
                nextScreen: BlocProvider(
                    create: (context) => LoginBloc(),
                    child: const LoginScreen()),
                // )LoginScreen(),
                animationDuration: Duration(seconds: 3),
                splashTransition: SplashTransition.fadeTransition,
                pageTransitionType: pageTransitionType,
                backgroundColor: Colors.white))
        );
  }
}
