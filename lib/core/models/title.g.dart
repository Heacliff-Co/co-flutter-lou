// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Title _$TitleFromJson(Map<String, dynamic> json) => Title(
      native: json['native'] as String?,
      romaji: json['romaji'] as String?,
      english: json['english'] as String?,
      vietnamese: json['vietnamese'] as String?,
      userPreferred: json['userPreferred'] as String?,
    );

Map<String, dynamic> _$TitleToJson(Title instance) => <String, dynamic>{
      'native': instance.native,
      'romaji': instance.romaji,
      'english': instance.english,
      'vietnamese': instance.vietnamese,
      'userPreferred': instance.userPreferred,
    };
