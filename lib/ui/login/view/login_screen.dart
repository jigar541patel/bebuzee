import 'package:bebuzee/ui/dashboard/dashboard_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../bloc/login/login_bloc.dart';
import '../../../cubit/internet_cubit.dart';
import '../../../utils/colors_utils.dart';
import '../../../utils/custom_snack_bar.dart';
import '../../../utils/images_utils.dart';
import '../../../utils/my_form_field.dart';
import '../../../utils/route_names.dart';
import '../../../utils/size_config.dart';
import '../../../utils/standard_regular_text.dart';
import '../../../utils/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late LoginBloc loginBloc;

  bool passwordVisible = true;

  void initController() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget imageAppLogo() => Image.asset(
          appLogo,
          height: 40,
          width: 180,
        );
    // initController();
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(loginBg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .23,
            ),
            height: MediaQuery.of(context).size.height * .75,
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(0.0)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const StandardCustomText(
                          label: login,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontSize: 30.0,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const StandardCustomText(
                          label: loginSubtitle,
                          color: descriptionTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50.0),
                          child: CustomFormField(
                            controller: _userNameController,
                            labelText: email,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length == 0) {
                                return phoneEmailError;
                              } else if (EmailValidator.validate(value) ==
                                  false) {
                                return phoneEmailError;
                              }

                              return null;
                            },
                            icon: usernameIcon,
                            isRequire: true,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomFormField(
                          // onChanged: (val) {
                          //   BlocProvider.of<LoginBloc>(context).add(
                          //       LoginTextChangedEvent(_userNameController.text,
                          //           _passwordController.text));
                          // },
                          controller: _passwordController,
                          isSuffixIconDisplay: true,
                          suffixIconWidget: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                if (passwordVisible) {
                                  passwordVisible = false;
                                } else {
                                  passwordVisible = true;
                                }
                              });
                            },
                          ),
                          isObscureText: passwordVisible,
                          labelText: password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return passwordError;
                            }
                            return null;
                          },
                          icon: passwordIcon,
                          // suffixIcon: eye,
                          isRequire: true,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {},
                            child: const StandardCustomText(
                              label: forgotPasswordQ,
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w900,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 24.0),
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is AddingDataValidCompletedState) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  Navigator.pushReplacementNamed(
                                      context, routeDashboard);
                                });
                              }
                              return MaterialButton(
                                  onPressed: () async {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    if (_formKey.currentState!.validate()) {
                                      var connectivityResult =
                                          await (Connectivity()
                                              .checkConnectivity());
                                      if (connectivityResult ==
                                              ConnectivityResult.mobile ||
                                          connectivityResult ==
                                              ConnectivityResult.wifi) {
                                        onLoginButtonClicked();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(createMessageSnackBar(
                                                errorNoInternet));
                                      }
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 15.0, 0.0, 15.0),
                                  color: primaryColor,
                                  splashColor: Theme.of(context).primaryColor,
                                  disabledColor:
                                      Theme.of(context).disabledColor,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: SizeConfig.blockSizeVertical! * 2.7,
                                    child: Center(
                                      child: (state
                                              is AddingDataInProgressState)
                                          ? SizedBox(
                                              width: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  5.5,
                                              child: const CircularProgressIndicator(
                                                color: whiteColor,
                                              ),
                                            )
                                          : const Text(
                                              login,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: whiteColor,
                                              ),
                                            ),
                                    ),
                                  ));
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const StandardCustomText(
                                  label: 'Don\'t have an account? '),
                              GestureDetector(
                                  onTap: () {},
                                  child: const StandardCustomText(
                                    label: ' Sign up',
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ],
      )),
    );
  }

  void onLoginButtonClicked() {
    loginBloc.add(LoginSubmittedEvent(
        _userNameController.text.toLowerCase(), _passwordController.text));
  }
}
