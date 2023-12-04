import 'package:bloc/bloc.dart';
import 'package:cbt_tpa_app/data/datasources/content/content_remote_datasource.dart';
import 'package:cbt_tpa_app/data/models/responses/content/content_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_event.dart';
part 'content_state.dart';
part 'content_bloc.freezed.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc() : super(const _Initial()) {
    on<_LoadAboutUs>((event, emit) async {
      emit(const _Loading());
      final result = await ContentRemoteDatasource().loadAboutUs();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
    on<_LoadTips>((event, emit) async {
      emit(const _Loading());
      final result = await ContentRemoteDatasource().loadTips();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
