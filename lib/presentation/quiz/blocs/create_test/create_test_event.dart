part of 'create_test_bloc.dart';

@freezed
class CreateTestEvent with _$CreateTestEvent {
  const factory CreateTestEvent.started() = _Started;
  const factory CreateTestEvent.createTest() = _CreateTest;
}
