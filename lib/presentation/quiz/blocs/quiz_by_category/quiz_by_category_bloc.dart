import 'package:bloc/bloc.dart';
import 'package:cbt_tpa_app/data/datasources/quiz/quiz_remote_datasource.dart';
import 'package:cbt_tpa_app/data/models/responses/quiz/quiz_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_by_category_event.dart';
part 'quiz_by_category_state.dart';
part 'quiz_by_category_bloc.freezed.dart';

class QuizByCategoryBloc
    extends Bloc<QuizByCategoryEvent, QuizByCategoryState> {
  final QuizRemoteDatasource quizRemoteDatasource;
  QuizByCategoryBloc(
    this.quizRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetQuizByCategory>((event, emit) async {
      emit(const _Loading());
      final result = await quizRemoteDatasource.getQuizByCategory(event.cat);
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          if (r.test == null) {
            emit(const _NotFound());
          } else {
            emit(_Loaded(r));
          }
        },
      );
    });
  }
}
