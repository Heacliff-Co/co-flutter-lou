import 'package:json_annotation/json_annotation.dart';

part 'title.g.dart';

@JsonSerializable()
class Title {
  final String? native;
  final String? romaji;
  final String? english;
  final String? vietnamese;
  final String? userPreferred;
  const Title(
      {this.native,
      this.romaji,
      this.english,
      this.vietnamese,
      this.userPreferred});

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);
}
