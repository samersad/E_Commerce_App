import 'package:e_commerce_app/api/model/response/common/category_or_brands_dto.dart';
import 'package:e_commerce_app/api/model/response/common/metadata_dto.dart';
import 'package:e_commerce_app/domain/entities/response/common/category_or_brands.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brands_response_dto.g.dart';

@JsonSerializable()
class BrandsResponseDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "data")
  final List<CategoryOrBrandsDto>? data;

  BrandsResponseDto ({
    this.results,
    this.metadata,
    this.data,
  });

  factory BrandsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$BrandsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrandsResponseDtoToJson(this);
  }
}




