
import 'package:banking/pages/profile.dart';
import 'package:banking/pages/home.dart';
import 'package:banking/pages/payments.dart';
import 'package:banking/pages/sendmoney.dart';
import 'package:banking/utils/theme.dart';
import 'package:flutter/material.dart';

import 'package:banking/pages/loading.dart';
import 'package:banking/pages/dashboard.dart';
import 'package:provider/provider.dart';

import 'package:banking/utils/theme.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _){
      final themeProvider = Provider.of<ThemeProvider>(context);
      return MaterialApp(
        themeMode: themeProvider.themeMode,
        theme: Themes.light,
        darkTheme: Themes.dark,
        initialRoute: "/",
        routes: {
          "/": (context) => const Loading(),
          "/home": (context) => const Home(),
          "/dashboard": (context) => const Dashboard(),
          "/payments": (context) => const Payments(),
          "/sendmoney": (context) => const SendMoney(),
          "/profile": (context) => const Profile(),
        },
      );
    }

));