import 'package:json_annotation/json_annotation.dart';

part 'productid_request_dto.g.dart';

@JsonSerializable()
class ProductIdRequestDto {
  @JsonKey(name: "productId")
  final String? productId;

  ProductIdRequestDto ({
    this.productId,
  });

  factory ProductIdRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ProductIdRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductIdRequestDtoToJson(this);
  }
}


