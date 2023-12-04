import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:cbt_tpa_app/core/constants/constants.dart';
import 'package:cbt_tpa_app/data/datasources/auth/auth_local_datasources.dart';
import 'package:cbt_tpa_app/data/datasources/onboarding/onboarding_local_datasource.dart';
import 'package:cbt_tpa_app/presentation/auth/blocs/login/login_bloc.dart';
import 'package:cbt_tpa_app/presentation/auth/blocs/register/register_bloc.dart';
import 'package:cbt_tpa_app/presentation/auth/pages/login_screen.dart';
import 'package:cbt_tpa_app/presentation/home/blocs/content/content_bloc.dart';
import 'package:cbt_tpa_app/presentation/home/pages/dashboard_page.dart';
import 'package:cbt_tpa_app/presentation/onboarding/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => ContentBloc()),
      ],
      child: MaterialApp(
        title: 'CBT TPA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: primaryColor,
              foregroundColor: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide.none,
              ),
              // elevation: 0,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color(0xFFFBFBFB),
            filled: true,
            border: defaultOutlineInputBorder,
            enabledBorder: defaultOutlineInputBorder,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Color(0xFFF2994A)),
            ),
          ),
        ),
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data!) {
              return const DashboardPage();
            } else {
              return FutureBuilder<bool>(
                  future: OnboardingLocalDatasource().getAlreadyPassed(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null && snapshot.data!) {
                      return const OnBoardingScreen();
                    } else {
                      return const LoginScreen();
                    }
                  });
            }
          },
        ),
      ),
    );
  }
}
