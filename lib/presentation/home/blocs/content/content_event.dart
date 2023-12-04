part of 'content_bloc.dart';

@freezed
class ContentEvent with _$ContentEvent {
  const factory ContentEvent.started() = _Started;
  const factory ContentEvent.loadAboutUs() = _LoadAboutUs;
  const factory ContentEvent.loadTips() = _LoadTips;
}
