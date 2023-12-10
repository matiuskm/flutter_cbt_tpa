part of 'create_test_bloc.dart';

@freezed
class CreateTestState with _$CreateTestState {
  const factory CreateTestState.initial() = _Initial;
  const factory CreateTestState.loading() = _Loading;
  const factory CreateTestState.success() = _Success;
  const factory CreateTestState.error(String message) = _Error;
}
