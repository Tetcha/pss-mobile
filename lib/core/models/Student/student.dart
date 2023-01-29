import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pss_mobile/core/constants/enum.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  const factory Student({
    required String id,
    required String createAt,
    required String updateAt,
    required String birthday,
    required String studentCode,
    required String phone,
    required Gender gender,
    required double balance,
    required bool status,
    required String name,
    required String email,
    @Default("") String googleId,
    @Default("") String facebookId,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
