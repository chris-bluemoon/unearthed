// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unearthed/screens/help_centre/faqs.dart';
import 'package:unearthed/screens/help_centre/how_it_works.dart';
import 'package:unearthed/screens/help_centre/sizing_guide.dart';
import 'package:unearthed/screens/help_centre/what_is.dart';
import 'package:unearthed/screens/home_page.dart';
import 'package:unearthed/services/class_store.dart';
import 'package:unearthed/theme.dart';

import 'firebase_options.dart';

void main() async {
  // Firebase initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
    create: (context) => ItemStore(),
    child: GetMaterialApp(
      theme: primaryTheme,
      // home: const HomePage(),
      // home: const HomeTest(),

      // getPages: [
      //   GetPage(
      //     name: "/",
      //     page: ()=>const HomeTest(),
      //     binding: BindingsBuilder(() {
      //       Get.put(ItemController());
      //     })
      //   )
      // ],
      // home: EmailComposer(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/faqs': (context) => const FAQs(),
        '/howItWorks': (context) => const HowItWorks(),
        '/whatIs': (context) => const WhatIs(),
        '/sizingGuide': (context) => const SizingGuide(),
        // '/dateAddedItems': (context) => const DateAddedItems(),
      },
    ),
  ));
}
