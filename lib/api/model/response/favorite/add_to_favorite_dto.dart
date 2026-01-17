import 'package:json_annotation/json_annotation.dart';

part 'add_to_favorite_dto.g.dart';

@JsonSerializable()
class AddToFavoriteDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<String>? data;

  AddToFavoriteDto ({
    this.status,
    this.message,
    this.data,
  });

  factory AddToFavoriteDto.fromJson(Map<String, dynamic> json) {
    return _$AddToFavoriteDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddToFavoriteDtoToJson(this);
  }
}


