import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Model/Controllers/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/View/WebSockets/websockets_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // shrinkWrap: true,
        // padding: EdgeInsets.symmetric(vertical: 20.sp),
        // physics: NeverScrollableScrollPhysics(),
        children: [
          ///Horizontal Listview
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 80.sp,
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(top: 50.sp),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebSocketsScreen()));
                    },
                    child: Container(
                      width: 70.0.sp,
                      height: 70.0.sp,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 12.sp),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: MyThemeData.themeData.primaryColor, width: 2.sp),
                        color: MyThemeData.themeData.primaryColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://picsum.photos/id/$index/200/300',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ///Vertical Listview
          Expanded(
            flex: 9,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 5.sp),
                  height: 310.sp,
                  child: Column(
                    children: [

                      ///Image and user name
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 35.0.sp,
                                    height: 35.0.sp,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(left: 15.sp),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://picsum.photos/id/$index/200/300',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'John Dow',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(
                                flex: 4,
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///Post Image
                      Expanded(
                          flex: 4,
                          child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://picsum.photos/id/$index/200/300',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
