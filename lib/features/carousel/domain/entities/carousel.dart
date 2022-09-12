import 'package:equatable/equatable.dart';

class Carousel extends Equatable {
  Carousel({
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

  @override
  List<Object?> get props => [
        createdAt,
        name,
        image,
        desc,
        id,
      ];
}
