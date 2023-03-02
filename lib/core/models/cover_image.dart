import 'package:json_annotation/json_annotation.dart';

part 'cover_image.g.dart';

@JsonSerializable()
class CoverImage {
  final String? color;
  final String? large;
  final String? medium;
  final String? extraLarge;

  const CoverImage({this.color, this.large, this.medium, this.extraLarge});

  factory CoverImage.fromJson(Map<String, dynamic> json) =>
      _$CoverImageFromJson(json);

  Map<String, dynamic> toJson() => _$CoverImageToJson(this);
}
