import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:productbox_flutter_exercise/Model/Controllers/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/View/Dashboard/dashboard_screen.dart';
import 'package:productbox_flutter_exercise/View/Utils/custom_field.dart';

class UploadDocScreen extends StatefulWidget {
  const UploadDocScreen({Key? key}) : super(key: key);

  @override
  State<UploadDocScreen> createState() => _UploadDocScreenState();
}

class _UploadDocScreenState extends State<UploadDocScreen> {
  String? drivingExt;
  String? certificateExt;
  String? passportExt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.themeData.backgroundColor,
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 17.sp),
        children: [
          SizedBox(
            height: 50.sp,
          ),

          ///Upload doc text
          Center(
            child: Text(
              'Upload Documents',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.sp,
                letterSpacing: 1.5.sp,
              ),
            ),
          ),
          SizedBox(height: 30.sp),

          ///Documents Progress Tacking Horizontal Lines
          Row(
            children: [
              Expanded(child:  Container(
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                height: 5.sp,
                decoration: BoxDecoration(
                  color: AppControllers.profileImage==null?Colors.white:Colors.blue,
                  borderRadius: BorderRadius.circular(2.sp),
                ),
              ),),
              Expanded(child:  Container(
                height: 5.sp,
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                decoration: BoxDecoration(
                  color: AppControllers.drivingLicense==null?Colors.white:Colors.blue,
                  borderRadius: BorderRadius.circular(2.sp),
                ),
              ),),
              Expanded(child:  Container(
                height: 5.sp,
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                decoration: BoxDecoration(
                  color: AppControllers.certificate==null?Colors.white:Colors.blue,
                  borderRadius: BorderRadius.circular(2.sp),
                ),
              ),),
              Expanded(child:  Container(
                height: 5.sp,
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                decoration: BoxDecoration(
                  color: AppControllers.passport==null?Colors.white:Colors.blue,
                  borderRadius: BorderRadius.circular(2.sp),
                ),
              ),),
            ],
          ),

          SizedBox(height: 30.sp),
          ///Upload profile widget
          InkWell(
            onTap: () async {

              ///Picking image from device and storing it's path in a static variable
              final result =
                  await ImagePicker().pickImage(source: ImageSource.gallery);

              if (result != null) {
                setState(() {
                  AppControllers.profileImage = File(result.path);
                });

                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    duration: const Duration(seconds: 3),
                    content: Text('Your profile is selected.'),
                    backgroundColor: MyThemeData.themeData.primaryColor,
                    behavior: SnackBarBehavior.floating,
                  ));
              }
            },
            child: Container(
                height: 50.sp,
                width: 1.sw,
                padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.sp),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Profile Picture',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: AppControllers.profileImage == null
                            ? SizedBox()
                            : SizedBox(
                                height: 40.sp,
                                width: 40.sp,
                                child: FullScreenWidget(
                                  child: Hero(
                                    tag: 'Profile_Image',
                                    child: PhotoView(
                                      imageProvider: FileImage(
                                        AppControllers.profileImage!,
                                      ),
                                      loadingBuilder: (context, url) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorBuilder: (context, url, error) {
                                        debugPrint('Error getting: $error');
                                        return Text("No image found");
                                      },
                                      filterQuality: FilterQuality.high,
                                      basePosition: Alignment.center,
                                      tightMode: true,
                                      minScale:
                                          PhotoViewComputedScale.contained *
                                              0.8,
                                      maxScale:
                                          PhotoViewComputedScale.contained * 3,
                                      wantKeepAlive: true,
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 20.sp,
          ),

          ///Upload license widget
          InkWell(
            onTap: () async {
              ///picking pdf or image and storing in a static variable
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'pdf', 'png'],
              );
              if (result != null) {
                setState(() {
                  AppControllers.drivingLicense = result.files.first.path;
                  print(
                      'the path of the file is => ${AppControllers.drivingLicense}');
                  drivingExt = result.files.first.extension;
                });
              }
            },
            child: CustomDocField(
              ext: drivingExt,
              text: 'Driving License',
              file: AppControllers.drivingLicense,
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),

          ///Upload certificate widget
          InkWell(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'pdf', 'png'],
              );
              if (result != null) {
                setState(() {
                  AppControllers.certificate = result.files.first.path;
                  certificateExt = result.files.first.extension;
                });
              }
            },
            child: CustomDocField(
              ext: certificateExt,
              text: 'Certificate',
              file: AppControllers.certificate,
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),

          ///Upload passport widget
          InkWell(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'pdf', 'png'],
              );
              if (result != null) {
                setState(() {
                  AppControllers.passport = result.files.first.path;
                  passportExt = result.files.first.extension;
                });
              }
            },
            child: CustomDocField(
                ext: passportExt,
                text: 'Passport',
                file: AppControllers.passport),
          ),
          SizedBox(
            height: 60.sp,
          ),

          ///Button widget
          GestureDetector(
            onTap: () {
              if(AppControllers.profileImage==null ||
                  AppControllers.drivingLicense==null||
                  AppControllers.certificate==null||
                  AppControllers.passport==null){
                print('Files are missing');
              }else {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 30.sp),
              height: 50.sp,
              width: 1.sw,
              decoration: BoxDecoration(
                color:  AppControllers.profileImage==null ||
              AppControllers.drivingLicense==null||
              AppControllers.certificate==null||
              AppControllers.passport==null?
              Colors.grey:Colors.blue,
                borderRadius: BorderRadius.circular(30.sp),
              ),
              child: Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
