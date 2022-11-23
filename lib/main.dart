import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/Controller/LogInCubit/log_in_cubit.dart';
import 'package:productbox_flutter_exercise/Controller/WebSocketsCubit/web_sockets_cubit.dart';
import 'package:productbox_flutter_exercise/Controller/showpassword_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Model/Controllers/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/View/LogIn/login_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ///Screen Util package for Responsiveness
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){


        ///Multi boc provider
        return MultiBlocProvider(
          providers: [
            BlocProvider<ShowPasswordCubit>(
                create: (context) => ShowPasswordCubit(show: true)),
            BlocProvider<LogInCubit>(
                create: (context) => LogInCubit()),
            BlocProvider<WebSocketsCubit>(
                create: (context) => WebSocketsCubit()),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ProductBox Flutter Exercise',
            theme: MyThemeData.themeData,
            home: child,
          ),
        );
      },
      child: const LogInScreen(),
    );
  }
}
