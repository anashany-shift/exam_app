import 'package:exam_app/feature/exam/data/models/answers_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call toEntity in answer dto with null value', () {
    AnswersDto answersDto=AnswersDto(
      answer: null,
      key: null
    );
    var result=answersDto.toEntity();
    expect(result.answer, isNull);
    expect(result.key, isNull);
  });
  test('when call toEntity in answer dto with non null value', () {
    AnswersDto answersDto=AnswersDto(
      answer: "padding",
      key: "A1"
    );
    var result=answersDto.toEntity();
    expect(result.answer, equals(result.answer));
    expect(result.key, equals(result.key));
  });
}