import 'package:bacain/utils/constants.dart';

class ShoesDummyModel {
  int id;
  String shoesName;
  double shoesPrice;
  String shoesimage;
  ShoesDummyModel({
    required this.id,
    required this.shoesName,
    required this.shoesPrice,
    required this.shoesimage,
  });
}

List<ShoesDummyModel> listShoesDummy = [
  ShoesDummyModel(
    id: 1,
    shoesName: 'Nike Air Jordan',
    shoesPrice: 120000,
    shoesimage: '${imageAsset}nike_shoes.png',
  ),
  ShoesDummyModel(
    id: 2,
    shoesName: 'Nike Air Jordan 2',
    shoesPrice: 120030,
    shoesimage: '${imageAsset}nike_shoes.png',
  ),
  ShoesDummyModel(
    id: 3,
    shoesName: 'Nike Air Jordan 2',
    shoesPrice: 120030,
    shoesimage: '${imageAsset}nike_shoes.png',
  ),
  ShoesDummyModel(
    id: 4,
    shoesName: 'Nike Air Jordan 2',
    shoesPrice: 120030,
    shoesimage: '${imageAsset}nike_shoes.png',
  ),
  ShoesDummyModel(
    id: 5,
    shoesName: 'Nike Air Jordan 2',
    shoesPrice: 120030,
    shoesimage: '${imageAsset}nike_shoes.png',
  ),
  ShoesDummyModel(
    id: 6,
    shoesName: 'Nike Air Jordan 2',
    shoesPrice: 120030,
    shoesimage: '${imageAsset}nike_shoes.png',
  ),
  ShoesDummyModel(
    id: 7,
    shoesName: 'Nike Air Jordan 2',
    shoesPrice: 120030,
    shoesimage: '${imageAsset}nike_shoes.png',
  ),
];
