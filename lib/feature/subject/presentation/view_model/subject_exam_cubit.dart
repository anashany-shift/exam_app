import 'package:bloc/bloc.dart';
import 'package:exam_app/feature/subject/domain/entities/subject_exam_entity.dart';
import 'package:exam_app/feature/subject/domain/useCases/subject_exam_useCase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/config/api_result.dart';

part 'subject_exam_state.dart';
@injectable
class SubjectExamCubit extends Cubit<SubjectExamState> {
  final SubjectExamUseCase subjectExamUseCase;
  SubjectExamCubit(this.subjectExamUseCase) : super(SubjectExamLoading());

  Future<void>getSubjectExam(String subjectId)async{
    emit(SubjectExamLoading());
    try {
      var result = await subjectExamUseCase.call(subjectId: subjectId);
      switch (result) {
        case ApiSuccessResult<List<SubjectExamEntity>>():
          emit(SubjectExamSuccess(subjectExam: result.data));
          if(result.data.isEmpty){
            emit(SubjectExamEmpty());
          }
        case ApiErrorResult<List<SubjectExamEntity>>():
          emit(SubjectExamError(errorMessage: result.errorMessage));

      }
    } on Exception catch (e) {
      emit(SubjectExamError(errorMessage: e.toString()));
    }


  }
}
