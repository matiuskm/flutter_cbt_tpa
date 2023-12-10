part of 'quiz_by_category_bloc.dart';

@freezed
class QuizByCategoryEvent with _$QuizByCategoryEvent {
  const factory QuizByCategoryEvent.started() = _Started;
  const factory QuizByCategoryEvent.getQuizByCategory(String cat) =
      _GetQuizByCategory;
}
