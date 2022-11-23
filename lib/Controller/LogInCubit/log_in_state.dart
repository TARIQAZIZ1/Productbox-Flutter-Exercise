part of 'log_in_cubit.dart';

abstract class LogInState extends Equatable {
  const LogInState();
}

class LogInInitial extends LogInState {
  @override
  List<Object> get props => [];
}
class LogInLoading extends LogInState {
  @override
  List<Object> get props => [];
}
class LogInLoaded extends LogInState {
  @override
  List<Object> get props => [];
}
class LogInError extends LogInState {
  @override
  List<Object> get props => [];
}
