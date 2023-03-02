import 'package:json_annotation/json_annotation.dart';

part 'description.g.dart';

@JsonSerializable()
class Description {
  final String? english;
  final String? vietnamese;

  const Description({this.english, this.vietnamese});

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}
