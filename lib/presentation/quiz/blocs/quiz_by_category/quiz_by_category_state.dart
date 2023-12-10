part of 'quiz_by_category_bloc.dart';

@freezed
class QuizByCategoryState with _$QuizByCategoryState {
  const factory QuizByCategoryState.initial() = _Initial;
  const factory QuizByCategoryState.loading() = _Loading;
  const factory QuizByCategoryState.loaded(QuizResponseModel ujian) = _Loaded;
  const factory QuizByCategoryState.error(String message) = _Error;
  const factory QuizByCategoryState.notfound() = _NotFound;
}
