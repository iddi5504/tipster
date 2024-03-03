// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      phoneNumber: json['phoneNumber'] as String?,
      userName: json['userName'] as String,
      rank: json['rank'] as int? ?? 0,
      email: json['email'] as String,
      bio: json['bio'] as String?,
      displayName: json['displayName'] as String?,
      profileComplete: json['profileComplete'] as bool? ?? false,
      profileImageURL: json['profileImageURL'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{
    'userName': instance.userName,
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bio', instance.bio);
  writeNotNull('displayName', instance.displayName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('profileImageURL', instance.profileImageURL);
  writeNotNull('rank', instance.rank);
  val['profileComplete'] = instance.profileComplete;
  return val;
}
