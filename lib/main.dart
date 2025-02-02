import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zencode_payme_test/feature/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:zencode_payme_test/feature/dashboard/presentation/view/bottom_navigation_view.dart';

import 'app/constants/colors.dart';
import 'feature/dashboard/presentation/view/dashboard_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DashboardCubit()),

      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 858),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: lightWhiteColor,

            textTheme: GoogleFonts.poppinsTextTheme()
          ),
          home: const BottomNavigationView(),
        ),
      ),
    );
  }
}
