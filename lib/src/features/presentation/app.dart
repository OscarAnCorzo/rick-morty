// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:rick_and_morty/src/core/settings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rick_and_morty/src/features/presentation/views/welcome_view.dart';


class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 780),
        builder: () {
          return GetMaterialApp(
            initialRoute: WelcomePage.routeName,
            // home: WelcomePage(),
            theme: ThemeData(
              fontFamily: 'Rubik',
              scaffoldBackgroundColor: AppColors.pBackground,
              primaryColor: AppColors.primary,
              appBarTheme: AppBarTheme(
                color: AppColors.pBackground,
                elevation: 1,
                iconTheme: IconThemeData(
                  color: AppColors.pText
                )
              )
            ),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: const [Locale('es', 'ES'), Locale('en', 'EN')],
            navigatorKey: Get.key,
            // routingCallback: (Routing? route) {
            //   var _controller = Get.find<RoutingPageController>();
            //   _controller.currentRoute.value = route!.current;
            //   log(route.current, name: "routingCallback");
            // },
            getPages: [
              GetPage(name: WelcomePage.routeName, page: () => WelcomePage())
            ],
            // builder: (BuildContext context, Widget? page) {
            //   return GetBuilder<RoutingPageController>(builder: (_) {
            //     return Obx(() {
            //       if (_.activeRouteLayoutMenu.value) {
            //         return Overlay(
            //           initialEntries: [
            //             OverlayEntry(
            //               builder: (context) =>
            //                   MenuBottomBarLayout(child: page),
            //             ),
            //           ],
            //         );
            //       }
            //       return page!;
            //     });
            //   });
            // },
          );
        });
  }
}
