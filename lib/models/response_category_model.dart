import 'package:json_annotation/json_annotation.dart';

part 'response_category_model.g.dart';

@JsonSerializable()
class ResponseCategoryModel {
  @JsonKey(defaultValue: "")
  final String categoryName;
  @JsonKey(defaultValue: "")
  final String image;

  ResponseCategoryModel({
    required this.categoryName,
    required this.image,
  });

  factory ResponseCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseCategoryModelToJson(this);
}
