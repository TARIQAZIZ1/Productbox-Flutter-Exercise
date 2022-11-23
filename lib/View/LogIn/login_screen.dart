import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Controller/LogInCubit/log_in_cubit.dart';
import 'package:productbox_flutter_exercise/Controller/showpassword_cubit.dart';
import 'package:productbox_flutter_exercise/Model/Controllers/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/Model/Controllers/users_controller.dart';
import 'package:productbox_flutter_exercise/View/UploadDocs/upload_documents_screen.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.themeData.backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:
        SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Stack(
            children: [
              ///shape for topleft corner
              Positioned(
                top: -50.sp,
                left: -50.sp,
                right: -20.sp,
                bottom: 350.sp,
                child: CustomPaint(
                  size: Size(50.sp, 50.sp),
                  painter: RPSCustomPainterSecond(),
              ),),
              /// shape for topleft corner
              Positioned(
                top: -50.sp,
                left: -140.sp,
                child: CustomPaint(
                  size: Size(1000.sp, 600.sp),
                  painter: RPSCustomPainter(),
                ),),
              ///shape for bottom left corner
              Positioned(
                bottom: -70.sp,
                left: -80.sp,
                top: 310.sp,
                right: -150.sp,
                child: CustomPaint(
                size: Size(300.sp, 300.sp),
                painter: RPSCustomPainterBottom(),
              ),),

              ///shape for bottom right corner
              Positioned(
                bottom: -40.sp,
                right: 0.sp,
                left: -300.sp,
                child: CustomPaint(
                  size: Size(400.sp, 400.sp),
                  painter: RPSCustomPainterBottomRight(),
                ),),

              ///fields and text buttons widget in listview
              Positioned(
                top: 250.sp,
                right: 0.sp,
                child: Container(
                  height: 1.sh/2,
                  width: 1.sw,
                  color: Color(0xFF293462),

                  ///form for email and password
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 17.sp, vertical: 17.sp),
                      children: [
                        SizedBox(height: 0.sp,),

                        ///email field widget
                        TextFormField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9a-zA-Z@.]")),
                          ],
                          obscureText: false,
                          controller: AppControllers.emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.sp),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.sp),
                              borderSide:
                              BorderSide(color: Colors.black12, width: 1.sp),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.sp),
                              borderSide:
                              BorderSide(color: Colors.red, width: 1.sp),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.sp),
                                borderSide:
                                BorderSide(color: Colors.red, width: 1.sp)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.sp),
                              borderSide: BorderSide(
                                  color: Colors.black12, width: 1.1.sp),
                            ),
                            contentPadding: EdgeInsets.only(left: 20.sp),
                          ),
                          validator: (validator) {
                            if (validator!.isEmpty) {
                              return 'Empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.sp,),

                        ///Bloc builder for hide and show password and textfield widget
                        BlocBuilder<ShowPasswordCubit, bool?>(
                          builder: (context, state) {
                            return TextFormField(
                              //key: form,
                              // inputFormatters: <TextInputFormatter>[
                              //   FilteringTextInputFormatter.allow(
                              //       RegExp("[0-9a-zA-Z]")),
                              // ],
                                obscureText: state!,
                                controller: AppControllers.passController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                  ),
                                  contentPadding:
                                  EdgeInsets.only(left: 20.sp),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      if (state == true) {
                                        context
                                            .read<ShowPasswordCubit>()
                                            .showPassword(show: false);
                                      } else {
                                        context
                                            .read<ShowPasswordCubit>()
                                            .showPassword(show: true);
                                      }
                                    },
                                    child: Icon(
                                      state == true
                                          ? Icons.visibility_off
                                          : Icons.remove_red_eye,
                                      color: MyThemeData.themeData.primaryColor,
                                      size: 21.sp,
                                    ),
                                  ),
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(color: const Color(0xffB2B2B2), width: 1.sp),
                                  // ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.sp),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.sp),
                                    borderSide:
                                    BorderSide(
                                        color: Colors.black12, width: 1.sp),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.sp),
                                    borderSide:
                                    BorderSide(color: Colors.red, width: 1.sp),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.sp),
                                      borderSide:
                                      BorderSide(color: Colors.red, width: 1.sp)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.sp),
                                    borderSide: BorderSide(
                                        color: Colors.black12, width: 1.1.sp),
                                  ),
                                ),

                                ///Form validation
                                validator: (validator) {
                                  if (validator!.isEmpty) {
                                    return 'Empty';
                                  } else {
                                    if (validator.length < 8) {
                                      return 'password must not be less than 8 characters';
                                    }
                                  }
                                  return null;
                                });
                          },
                        ),

                        ///BlocConsumer to listen to the login cubit state
                        BlocConsumer<LogInCubit, LogInState>(
                          listener: (context, state) {
                            // TODO: implement listener

                            ///If state is loaded but no users is found in the list
                            if (state is LogInLoaded && UsersController.data.isEmpty) {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(content: Text('Sign in unsuccessful')));
                            }

                            ///Data fetched successfully and users is found
                            if (state is LogInLoaded && UsersController.data.isNotEmpty) {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(content: Text('Singed In Successfully')));
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadDocScreen()));
                            }


                            ///Error state
                            if (state is LogInError) {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(content: Text('Something went wrong')));
                            }
                          },
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                ///Form Validation
                                if(_formKey.currentState!.validate()){

                                  ///calling cubit to fetch users data from the api
                                  context.read<LogInCubit>().fetchUsersList(
                                        userName:
                                            AppControllers.emailController.text,
                                        email:
                                            AppControllers.passController.text,
                                      );
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 30.sp),
                                height: 50.sp,
                                width: 1.sw,
                                decoration: BoxDecoration(
                                  color: MyThemeData.themeData.primaryColor,
                                  borderRadius: BorderRadius.circular(30.sp),
                                ),
                                child: state is LogInLoading?
                                Center(child: CircularProgressIndicator()):
                                Center(
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        ///Forget password text button
                        TextButton(onPressed: () {}, child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        )),

                        ///Register text button
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Register Here',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// These four classes are ShapeMaker codes for making shapes on corners
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = MyThemeData.themeData.primaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.1250000,size.height*0.2966867);
    path0.cubicTo(size.width*0.3095417,size.height*0.3557229,size.width*0.1548750,size.height*0.1400602,size.width*0.1975000,size.height*0.0713855);
    path0.quadraticBezierTo(size.width*0.1761250,size.height*0.0707078,size.width*0.1220000,size.height*0.0771084);
    path0.lineTo(size.width*0.1236667,size.height*0.2948795);
    path0.quadraticBezierTo(size.width*0.1233333,size.height*0.2977410,size.width*0.1250000,size.height*0.2966867);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class RPSCustomPainterSecond extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.1216667,size.height*0.5993976);
    path0.quadraticBezierTo(size.width*0.3136667,size.height*0.5367470,size.width*0.2683333,size.height*0.4307229);
    path0.cubicTo(size.width*0.2270833,size.height*0.2752259,size.width*0.2772500,size.height*0.1979669,size.width*0.3566667,size.height*0.2183735);
    path0.quadraticBezierTo(size.width*0.4487917,size.height*0.2551958,size.width*0.4158333,size.height*0.0813253);
    path0.lineTo(size.width*0.1200000,size.height*0.0843373);
    path0.lineTo(size.width*0.1216667,size.height*0.5993976);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class RPSCustomPainterBottom extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = MyThemeData.themeData.primaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.1225000,size.height*0.6475904);
    path0.cubicTo(size.width*0.1651667,size.height*0.5602410,size.width*0.1565000,size.height*0.7650602,size.width*0.2025000,size.height*0.7078313);
    path0.cubicTo(size.width*0.2204583,size.height*0.6862199,size.width*0.3057083,size.height*0.7309488,size.width*0.2583333,size.height*0.7852410);
    path0.cubicTo(size.width*0.2333333,size.height*0.8358434,size.width*0.3160000,size.height*0.8551205,size.width*0.2903333,size.height*0.9009036);
    path0.quadraticBezierTo(size.width*0.2507500,size.height*0.9016566,size.width*0.1200000,size.height*0.8990964);
    path0.quadraticBezierTo(size.width*0.1206250,size.height*0.8362199,size.width*0.1225000,size.height*0.6475904);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class RPSCustomPainterBottomRight extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.8691667,size.height*0.9051205);
    path0.quadraticBezierTo(size.width*0.8561250,size.height*0.5391566,size.width*0.9966667,size.height*0.6822289);
    path0.lineTo(size.width*0.9950000,size.height*0.9021084);
    path0.quadraticBezierTo(size.width*0.9635417,size.height*0.9028614,size.width*0.8691667,size.height*0.9051205);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


