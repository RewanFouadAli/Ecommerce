import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/auth/representation/view/signin.dart';
import 'package:ecommerce_app/auth/representation/view/signup.dart';
import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signin_cubit/signin_cubit.dart';
import 'package:ecommerce_app/auth/representation/viewmodel/cubit/signup_cubit/signup_cubit.dart';
import 'package:ecommerce_app/home/representation/view/home.dart';
import 'package:ecommerce_app/home/representation/view/widgets/bottomnav.dart';
import 'package:ecommerce_app/home/representation/view/widgets/carousal_slider.dart';
import 'package:ecommerce_app/home/representation/viewmodel/cubit/home_cubit.dart'; // Ensure this is the correct import
import 'package:ecommerce_app/profile/presentation/viewmodel/cubit/image_cubit.dart';
import 'package:ecommerce_app/splash_screen/splash_screen.dart';
import 'package:ecommerce_app/store/presentation/view/strore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

const messageLimit = 30;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  runApp(MyApp(analytics: analytics, observer: observer));
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  MyApp({required this.analytics, required this.observer});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SignUpCubit>(
            create: (context) => SignUpCubit(),
          ),
          BlocProvider<HomeCubit>(
            // تأكد من تواجد HomeCubit هنا
            // create: (context) => HomeCubit(),
            create: (context) => HomeCubit()..datamodel(),
          ),
          BlocProvider<SignInCubit>(
            create: (context) => SignInCubit(),
          ),
          BlocProvider<ImageCubit>(
            create: (context) => ImageCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          navigatorObservers: [observer],
        ));
  }
}
