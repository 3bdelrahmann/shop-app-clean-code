import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';
import 'package:inthekloud_shop_app/core/widgets/custom_text_field.dart';
import 'package:inthekloud_shop_app/core/widgets/error_message_alert.dart';
import 'package:inthekloud_shop_app/core/widgets/loading_overlay.dart';
import 'package:inthekloud_shop_app/features/login/domain/usecases/user_login_usecase.dart';
import 'package:inthekloud_shop_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:inthekloud_shop_app/features/login/presentation/widgets/continue_with_google_button.dart';
import 'package:inthekloud_shop_app/features/login/presentation/widgets/login_button.dart';
import 'package:inthekloud_shop_app/features/main_layout/presentation/pages/main_layout.dart';
import 'package:inthekloud_shop_app/injection_container.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();
  FocusNode userNameFocusNode = FocusNode();
  TextEditingController userPasswordController = TextEditingController();
  FocusNode userPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserLoginBloc>(),
      child: BlocConsumer<UserLoginBloc, UserLoginState>(
        listener: (context, state) {
          if (state is UserLoginSuccess) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const MainLayout(),
                  settings: const RouteSettings(name: 'MainLayout'),
                ),
                ModalRoute.withName('/'));
          }
          if (state is UserLoginFailed) {
            messageAlert(context, state.failureObject.message.toString());
          }
        },
        builder: (context, state) {
          UserLoginBloc bloc = BlocProvider.of<UserLoginBloc>(context);
          return Stack(
            children: [
              Scaffold(
                backgroundColor: AppColors.green,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 35.0,
                            horizontal: 25.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sign in',
                                style: AppTextStyles().getBoldStyle(
                                    color: AppColors.white,
                                    fontSize: AppFontSize.s32),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  'Enjoyable way to sign in'
                                  'visitors and staff, and book'
                                  'desks & meeting rooms',
                                  style: AppTextStyles().getBoldStyle(
                                      color: AppColors.white,
                                      fontSize: AppFontSize.s24),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20.0),
                          height: MediaQuery.of(context).size.height / 1.3,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.darkGrey, //color of shadow
                                spreadRadius: 5, //spread radius
                                blurRadius: 10, // blur radius
                              ),
                              //you can set more BoxShadow() here]
                            ],
                          ),
                          child: Column(
                            children: [
                              CustomTextField(
                                onChanged: (_) {},
                                prefixIcon: Icons.person,
                                controller: userNameController,
                                focusNode: userNameFocusNode,
                                title: 'Username',
                                onFieldSubmitted: (value) {
                                  userPasswordFocusNode.requestFocus();
                                },
                              ),
                              CustomTextField(
                                onChanged: (_) {},
                                prefixIcon: Icons.lock,
                                controller: userPasswordController,
                                focusNode: userPasswordFocusNode,
                                obscureText: true,
                                title: 'Password',
                                onFieldSubmitted: (value) {},
                              ),
                              LoginButton(onTap: () {
                                bloc.add(UserLogin(
                                    params: UserLoginParams(
                                        userName: userNameController.text,
                                        userPassword:
                                            userPasswordController.text)));
                              }),
                              const SizedBox(
                                height: 60.0,
                              ),
                              const ContinueWithGoogleButton()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state is UserLoginLoading) const LoadingOverLay(),
            ],
          );
        },
      ),
    );
  }
}
