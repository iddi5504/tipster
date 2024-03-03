import 'package:json_annotation/json_annotation.dart';
part 'user_models.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class UserModel {
  String userName, email;
  String? bio;
  String? displayName;
  String? phoneNumber;
  String? profileImageURL;
  int? rank;
  bool profileComplete;

  UserModel(
      {this.phoneNumber,
      required this.userName,
      this.rank = 0,
      required this.email,
      this.bio,
      this.displayName,
      this.profileComplete = false,
      this.profileImageURL});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
