import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_ecommerce/slider_page.dart';
import 'Authentication BLoC/auth_bloc.dart';
import 'Authentication BLoC/auth_event.dart';
import 'Profile/AccountScreen.dart';
import 'Profile/ProfileScreen.dart';
import 'Profile/StoresScreen.dart';
import 'Profile/WishlistScreen.dart';
import 'SplashScreen.dart';
import 'UserRequirements/Login.dart';
import 'UserRequirements/SignUp.dart';
import 'package:flutter/services.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Make status bar transparent (or set a color)
    statusBarIconBrightness: Brightness.dark, // Use dark icons on the status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AppStarted()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/slider': (context) => SliderPage(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignupPage(),
          '/profile': (context) => ProfileScreen(),
          '/wishlist': (context) => WishlistScreen(), // Define WishlistScreen
          '/stores': (context) => StoresScreen(), // Define StoresScreen
          '/account': (context) => AccountScreen(), // Define AccountScreen
        },
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black, // Transparent status bar
              statusBarIconBrightness: Brightness.light, // Dark icons
            ),
          ),
        ),
      ),
    );
  }
}
