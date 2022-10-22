import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inthekloud_shop_app/core/global_variables.dart';
import 'package:inthekloud_shop_app/core/resources/app_assets.dart';
import 'package:inthekloud_shop_app/features/fetch_events/presentation/bloc/fetch_events_bloc.dart';
import 'package:inthekloud_shop_app/features/login/presentation/pages/login_page.dart';
import 'package:inthekloud_shop_app/features/main_layout/presentation/pages/main_layout.dart';
import 'package:inthekloud_shop_app/injection_container.dart';
import 'package:lottie/lottie.dart';

class FetchEventsPage extends StatelessWidget {
  const FetchEventsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return BlocProvider(
        create: (context) => sl<FetchEventsBloc>(),
        child: BlocConsumer<FetchEventsBloc, FetchEventsState>(
          listener: (context, state) {
            _navigateTOHomePage(
              context: context,
              duration: const Duration(seconds: 2),
            );
          },
          builder: (context, state) {
            if (state is FetchEventsInitial) {
              BlocProvider.of<FetchEventsBloc>(context).add(GetDataFromLocal());
            }

            return Scaffold(
              body: Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: mediaQuery.size.width,
                      height: mediaQuery.size.height,
                      color: Colors.white,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: mediaQuery.size.width * 0.4,
                        child: Lottie.asset(
                          AppAssets.appLogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

_navigateTOHomePage(
    {required BuildContext context, required Duration duration}) {
  Timer(duration, () {
    if (Global.isLoggedIn) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const MainLayout(),
            settings: const RouteSettings(name: 'UserHomeScreen'),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen(),
            settings: const RouteSettings(name: 'LoginScreen'),
          ));
    }
  });
}
