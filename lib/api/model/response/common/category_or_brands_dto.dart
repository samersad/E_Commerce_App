import 'package:json_annotation/json_annotation.dart';
part 'category_or_brands_dto.g.dart';

@JsonSerializable()
class CategoryOrBrandsDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  CategoryOrBrandsDto ({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryOrBrandsDto.fromJson(Map<String, dynamic> json) {
    return _$CategoryOrBrandsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryOrBrandsDtoToJson(this);
  }
}