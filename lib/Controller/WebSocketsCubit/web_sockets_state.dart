part of 'web_sockets_cubit.dart';

abstract class WebSocketsState extends Equatable {
  const WebSocketsState();
}

class WebSocketsInitial extends WebSocketsState {
  @override
  List<Object> get props => [];
}
class WebSocketsLoading extends WebSocketsState {
  @override
  List<Object> get props => [];
}
class WebSocketsLoaded extends WebSocketsState {
  String list;
  WebSocketsLoaded({required this.list});
  @override
  List<Object> get props => [];
}
class WebSocketsError extends WebSocketsState {
  @override
  List<Object> get props => [];
}
