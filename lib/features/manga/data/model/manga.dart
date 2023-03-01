import 'package:co_flutter_core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manga.g.dart';

@JsonSerializable()
class Manga extends Model {
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const Manga({this.createdAt, this.updatedAt}) : super(id: -1);

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MangaToJson(this);
}
