import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class CustomDocField extends StatelessWidget {
  const CustomDocField({
    Key? key,
    required this.ext, required this.text, required this.file,
  }) : super(key: key);

  final String? ext;
  final String? text;
  final String? file;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Text(text!,
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
                child: file==null || file!.isEmpty?
                SizedBox():
                InkWell(
                  onTap: (){
                    OpenFile.open('$file');},
                  child: ext=='pdf'?Image.asset('assets/thumbnail.png'):
                  Image.file(
                    File("$file"),
                    height: 40.sp,
                    width: 40.sp,
                    fit: BoxFit.fill,
                  ),
                  // FullScreenWidget(
                  //   child: Hero(
                  //     tag: 'Image',
                  //     child: PhotoView(
                  //       imageProvider: AssetImage(
                  //         '/data/user/0/com.example.productbox_flutter_exercise/cache/file_picker/IMG-20221122-WA0005.jpg',
                  //       ),
                  //       loadingBuilder: (context, url) =>  Center(
                  //         child: CircularProgressIndicator(),
                  //       ),
                  //       errorBuilder: (context, url, error) {
                  //         debugPrint('Error getting: $error}');
                  //         return  Text("No image found");
                  //       },
                  //       filterQuality: FilterQuality.high,
                  //       basePosition: Alignment.center,
                  //       tightMode: true,
                  //       minScale: PhotoViewComputedScale.contained * 0.8,
                  //       maxScale: PhotoViewComputedScale.contained * 3,
                  //       wantKeepAlive: true,
                  //     ),
                  //   ),
                ),
              ),),
          ],
        )
    );
  }
}