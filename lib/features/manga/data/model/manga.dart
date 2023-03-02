import 'package:co_flutter_core/core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:louhie/core/models/cover_image.dart';
import 'package:louhie/core/models/description.dart';
import 'package:louhie/core/models/title.dart';

part 'manga.g.dart';

@JsonSerializable()
class Manga extends Model {
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final CoverImage? coverImage;
  final Title? title;
  final Description? description;
  const Manga(
      {this.createdAt,
      this.updatedAt,
      this.coverImage,
      this.description,
      this.title})
      : super(id: -1);

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MangaToJson(this);
}
