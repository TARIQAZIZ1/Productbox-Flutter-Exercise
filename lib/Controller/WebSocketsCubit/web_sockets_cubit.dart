import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:productbox_flutter_exercise/Model/Models/websocketsmodel.dart';
import 'package:productbox_flutter_exercise/Model/Repositories/websockets_repo.dart';

part 'web_sockets_state.dart';

class WebSocketsCubit extends Cubit<WebSocketsState> {
  WebSocketsCubit() : super(WebSocketsInitial());
  fetchWebsocketsApis() async {
    emit(WebSocketsLoading());

    try {
      final apiStatusCode =
      await WebSocektsRepo.fetchAlbum();

      if (apiStatusCode.title!='') {
        emit(WebSocketsLoaded(list: apiStatusCode.title));
      } else {
        emit(WebSocketsError());
      }
    } on Exception catch (e) {
      debugPrint('Employee List Cubit exception: $e');
      emit(WebSocketsError());
    }
  }
  fetchUpdateWebsocketsApis({required String text}) async {
    emit(WebSocketsLoading());

    try {
      final apiStatusCode =
      await WebSocektsRepo.updateAlbum(text);

      if (apiStatusCode.title!='') {
        emit(WebSocketsLoaded(list: apiStatusCode.title));
      } else {
        emit(WebSocketsError());
      }
    } on Exception catch (e) {
      debugPrint('Employee List Cubit exception: $e');
      emit(WebSocketsError());
    }
  }
}
