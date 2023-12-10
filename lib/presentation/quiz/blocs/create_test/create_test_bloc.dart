// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cbt_tpa_app/data/datasources/quiz/quiz_remote_datasource.dart';

part 'create_test_bloc.freezed.dart';
part 'create_test_event.dart';
part 'create_test_state.dart';

class CreateTestBloc extends Bloc<CreateTestEvent, CreateTestState> {
  final QuizRemoteDatasource quizRemoteDatasource;
  CreateTestBloc(
    this.quizRemoteDatasource,
  ) : super(const _Initial()) {
    on<_CreateTest>((event, emit) async {
      emit(const _Loading());
      final result = await quizRemoteDatasource.createQuiz();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Success()),
      );
    });
  }
}
