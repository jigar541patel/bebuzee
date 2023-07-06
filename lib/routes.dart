import 'package:bebuzee/ui/dashboard/dashboard_screen.dart';
import 'package:bebuzee/ui/login/view/login_screen.dart';
import 'package:bebuzee/ui/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'utils/route_names.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(
          builder: (context) =>
              // BlocProvider(
              //   create: (context) => LoginBloc(),
              //   child:
              const SplashScreen(),
          // )
        );

      case routeLogin:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => LoginBloc(),
              child: const LoginScreen(),
            )
                // )
    );
    //   case routeSignup:
    //     return MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //               create: (context) => SignupBloc(),
    //               child: const SignupScreen(),
    //             ));
    //
      case routeDashboard:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => LoginBloc(),
                  child:
                  const DashBoard(),
                )
        );

    }
  }
}
