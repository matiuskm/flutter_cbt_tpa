// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cbt_tpa_app/data/datasources/material/materi_remote_datasource.dart';
import 'package:cbt_tpa_app/data/models/responses/material/materi_response_modal.dart';

part 'materi_bloc.freezed.dart';
part 'materi_event.dart';
part 'materi_state.dart';

class MateriBloc extends Bloc<MateriEvent, MateriState> {
  final MateriRemoteDatasource materiRemoteDatasource;
  MateriBloc(
    this.materiRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetAllMateri>((event, emit) async {
      emit(const _Loading());
      final response = await materiRemoteDatasource.getAllMaterials();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
