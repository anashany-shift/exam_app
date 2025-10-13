import 'package:bloc/bloc.dart';
import 'package:exam_app/feature/exam/data/models/completed_exam.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/useCases/get_completed_exams_usecase.dart';

part 'result_history_state.dart';
@injectable
class ResultHistoryCubit extends Cubit<ResultHistoryState> {
  final GetCompletedExamsUseCase getCompletedExamsUseCase;

  ResultHistoryCubit(this.getCompletedExamsUseCase) : super(ResultHistoryInitial());
  Future<void> loadCompletedExams() async {
    emit(ResultHistoryLoading());
    try {
      final exams = await getCompletedExamsUseCase.call();
      emit(ResultHistorySuccess(completedExam: exams));
    } on Exception catch (e) {
     emit(ResultHistoryError(e.toString()));
    }
  }
}
