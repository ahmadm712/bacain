// To parse this JSON data, do
//
//     final carouselModel = carouselModelFromJson(jsonString);

import 'package:bacain/features/carousel/domain/entities/carousel.dart';
import 'package:equatable/equatable.dart';

class CarouselModel extends Equatable {
  CarouselModel({
    this.createdAt,
    this.name,
    this.image,
    this.desc,
    this.id,
  });

  String? createdAt;
  String? name;
  String? image;
  String? desc;
  String? id;

  factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
        createdAt: json["createdAt"],
        name: json["name"],
        image: json["image"],
        desc: json["desc"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "name": name,
        "image": image,
        "desc": desc,
        "id": id,
      };

  Carousel toEntity() {
    return Carousel(
      createdAt: createdAt,
      name: name,
      image: image,
      desc: desc,
      id: id,
    );
  }

  @override
  List<Object?> get props => [
        createdAt,
        name,
        image,
        desc,
        id,
      ];
}
