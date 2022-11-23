import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Controller/WebSocketsCubit/web_sockets_cubit.dart';
import 'package:productbox_flutter_exercise/Model/Controllers/constants/theme_data.dart';
import 'package:productbox_flutter_exercise/Model/Models/websocketsmodel.dart';

class WebSocketsScreen extends StatefulWidget {
  const WebSocketsScreen({Key? key}) : super(key: key);

  @override
  State<WebSocketsScreen> createState() => _WebSocketsScreenState();
}

class _WebSocketsScreenState extends State<WebSocketsScreen> {
  final TextEditingController _controller = TextEditingController();
  // Future<Album>? _futureAlbum;
  //
  // @override
  // void initState() {
  //    context.read<WebSocketsCubit>().fetchWebsocketsApis();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = WebSocketsCubit();
        cubit.fetchWebsocketsApis();
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('WebSockets Screen'),
          backgroundColor: MyThemeData.themeData.primaryColor,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<WebSocketsCubit,WebSocketsState>(
          //  future: _futureAlbum,
            builder: (context, state) {
              if(state is WebSocketsLoaded) {
                String data = state.list;
                if (data.isNotEmpty) {
                  return ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 50.sp),
                    children: <Widget>[
                      Center(
                        child: Text('New Data Returned is:  $data',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.sp,),
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Enter New Data',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.sp),
                            borderSide: BorderSide(color: MyThemeData.themeData.primaryColor, width: 2.sp),
                          )
                        ),
                      ),
                      BlocBuilder<WebSocketsCubit, WebSocketsState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              if(_controller.text.isNotEmpty){
                                context
                                    .read<WebSocketsCubit>()
                                    .fetchUpdateWebsocketsApis(
                                        text: _controller.text);
                                _controller.clear();
                              }
                            },
                            child: Container(
                              height: 40.sp,
                              width: 100.sp,
                              margin: EdgeInsets.only(top: 30.sp),
                              decoration: BoxDecoration(
                                color: MyThemeData.themeData.primaryColor,
                                borderRadius: BorderRadius.circular(30.sp),
                              ),
                              child: state is WebSocketsLoading?CircularProgressIndicator():
                              Center(child: Text('Send Data',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              )),),
                          );
                        },
                      ),
                    ],
                  );
                }
                else if (state is WebSocketsError) {
                  return Center(child: Text("Something went wrong"));
                }
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
