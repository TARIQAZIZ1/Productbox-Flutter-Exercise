import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:productbox_flutter_exercise/Model/Models/users_model.dart';
import 'package:productbox_flutter_exercise/Model/Repositories/users_repo.dart';
part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  fetchUsersList({required String userName, required String email}) async {
    emit(LogInLoading());

    try {
      final apiStatusCode =
          await LogInRepo.fetchSingleEmployeeDetails(userName: userName, email: email);

      if (apiStatusCode == 200) {
        emit(LogInLoaded());
      } else {
        emit(LogInError());
      }
    } on Exception catch (e) {
      debugPrint('Employee List Cubit exception: $e');
      emit(LogInError());
    }
  }
}
