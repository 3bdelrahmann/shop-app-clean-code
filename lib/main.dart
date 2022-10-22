import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inthekloud_shop_app/core/bloc_observer.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_themes.dart';
import 'package:inthekloud_shop_app/features/fetch_events/presentation/pages/fetch_events_page.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await di.init();

  if (kDebugMode) {
    ErrorWidget.builder = (FlutterErrorDetails details) => Material(
          color: AppColors.green,
          child: Center(
              child: Text(
            details.exception.toString(),
            style: const TextStyle(
                color: AppColors.white,
                fontSize: AppFontSize.s20,
                fontWeight: FontWeightManager.bold),
            textAlign: TextAlign.center,
          )),
        );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes().lightTheme,
      home: const FetchEventsPage(),
    );
  }
}
