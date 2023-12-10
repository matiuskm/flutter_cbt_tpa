// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cbt_tpa_app/data/datasources/content/content_remote_datasource.dart';
import 'package:cbt_tpa_app/data/models/responses/content/content_response_model.dart';

part 'content_bloc.freezed.dart';
part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentRemoteDatasource contentRemoteDatasource;
  ContentBloc(
    this.contentRemoteDatasource,
  ) : super(const _Initial()) {
    on<_LoadAboutUs>((event, emit) async {
      emit(const _Loading());
      final result = await contentRemoteDatasource.loadAboutUs();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
    on<_LoadTips>((event, emit) async {
      emit(const _Loading());
      final result = await contentRemoteDatasource.loadTips();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
