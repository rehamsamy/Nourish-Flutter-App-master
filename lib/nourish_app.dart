import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'app/core/values/localization/messages.dart';

import 'app/views/network_error.dart';
import 'app_theme.dart';
import 'routes/app_pages.dart';

class NourishApp extends StatefulWidget {
  const NourishApp({Key? key}) : super(key: key);

  @override
  _NourishAppState createState() => _NourishAppState();
}

class _NourishAppState extends State<NourishApp> {
  bool _backViewOn = true;
  final botToastBuilder = BotToastInit();

  @override
  void initState() {
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (!await InternetConnectionChecker().hasConnection) {
        if (!_backViewOn) {
          setState(() {
            _backViewOn = true;
          });
          Get.to(
            () => const NetworkError(),
          );
        }
      } else {
        if (_backViewOn) {
          setState(() {
            _backViewOn = false;
          });
          Get.back();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.log('page 1   ===>');
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (child) {
        return GetMaterialApp(
          title: 'Nourish.SA',
          debugShowCheckedModeBanner: false,
          navigatorObservers: [BotToastNavigatorObserver()],
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          // home:  ChangeEmailView(),
          locale: Get.locale,
          translations: Messages(),
          fallbackLocale: Messages.fallbackLocale,
          supportedLocales: Messages.supportedLocales,
          builder: (context, child) {
            child = MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: botToastBuilder(context, child),
            );
            return child;
          },
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            scaffoldBackgroundColor: whiteColor,
            primarySwatch: Colors.orange,
            primaryColor: primaryColor,
            fontFamily: "Roboto",
            textTheme: appTextTheme,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: appTextTheme.bodyText1,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.zero,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                ),
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: darkGreyColor,
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  Theme.of(context).textTheme.button!.copyWith(
                        color: primaryColor,
                      ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xffFFFFFF),
                ),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  Theme.of(context).textTheme.bodyText1,
                ),
                backgroundColor: MaterialStateProperty.all(
                  Colors.transparent,
                ),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.r,
                    ),
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  Theme.of(context).textTheme.button,
                ),
                backgroundColor: MaterialStateProperty.all(
                  primaryColor,
                ),
              ),
            ),
            sliderTheme: SliderThemeData(
              activeTrackColor: primaryColor,
              inactiveTrackColor: primaryColor.withOpacity(0.27),
              activeTickMarkColor: primaryColor,
              showValueIndicator: ShowValueIndicator.always,
              thumbColor: primaryColor,
              valueIndicatorTextStyle:
                  appTextTheme.subtitle1!.copyWith(color: whiteColor),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: Theme.of(context).textTheme.caption,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                borderSide: const BorderSide(
                  color: lightGreyColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                borderSide: const BorderSide(
                  color: lightGreyColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                borderSide: const BorderSide(
                  color: lightGreyColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
