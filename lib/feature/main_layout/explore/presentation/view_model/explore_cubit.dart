import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:exam_app/core/service/network_service.dart';
import 'package:exam_app/feature/main_layout/explore/domain/entities/subjects_entity.dart';
import 'package:exam_app/feature/main_layout/explore/domain/useCases/get_subjects_useCase.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/config/api_result.dart';

part 'explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  final GetSubjectUseCase getSubjectUseCase;
  final NetworkService networkService;

  ExploreCubit(this.getSubjectUseCase, this.networkService)
    : super(SubjectExploreInitial()) {
    networkService.listenConnection((isOnline) => getSubjects());
  }

  Future<void> getSubjects() async {
    emit(SubjectExploreLoading());
    try {
      var result = await getSubjectUseCase.call();
      switch (result) {
        case ApiSuccessResult<List<SubjectEntity>>():
          emit(SubjectExploreSuccess(subjects: result.data));
        case ApiErrorResult<List<SubjectEntity>>():
          emit(SubjectExploreError(errorMessage: result.errorMessage));
      }
    } on Exception catch (e) {
      emit(SubjectExploreError(errorMessage: e.toString()));
    }
  }


}
