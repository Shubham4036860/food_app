import 'package:get/get.dart';

class AppResponseModel {
  int? id;
  String? name;
  String? description;
  String? image;
  List<String>? steps;
  List<String>? tags;
  List<String>? ingredients;
  RxBool? isFavorite = false.obs; // Add this variable

  AppResponseModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.steps,
    this.tags,
    this.ingredients,
  });

  AppResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    steps = json['steps'].cast<String>();
    tags = json['tags'].cast<String>();
    ingredients = json['ingredients'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['steps'] = steps;
    data['tags'] = tags;
    data['ingredients'] = ingredients;
    data['isFavorite'] = isFavorite;
    return data;
  }
}
