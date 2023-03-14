import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_24/screen/Home_Sc/Data_Page/data_page.dart';
import 'package:news_app_24/screen/Home_Sc/Home_Page/home_page.dart';
import 'package:news_app_24/screen/Logo_Sc/Logo_Page/logo_page.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        initialRoute: 'logosc',
        routes: {
          'logosc':(context) => const Logo_Page(),
          'home':(context) => const Home_Page(),
          'data':(p0) => const Data_Page(),
        },
      );
    },)
  );
}
