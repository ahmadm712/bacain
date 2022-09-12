// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bacain/utils/constants.dart';
import 'package:bacain/utils/exceptions.dart';
import 'package:http/http.dart' as http;

import 'package:bacain/features/carousel/data/models/carousel_model.dart';

abstract class CarouselRemoteDataSource {
  Future<List<CarouselModel>> getCarousel();
}

class CarouselRemoteDataImpl implements CarouselRemoteDataSource {
  final http.Client client;
  CarouselRemoteDataImpl({
    required this.client,
  });
  @override
  Future<List<CarouselModel>> getCarousel() async {
    final response = await client.get(Uri.parse('${baseUrlMock}carousel'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((e) => CarouselModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }
}
