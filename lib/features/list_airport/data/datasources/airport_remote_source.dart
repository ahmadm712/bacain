// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bacain/features/list_airport/data/models/airport_model.dart';
import 'package:bacain/features/list_airport/data/models/airport_response_model.dart';
import 'package:bacain/utils/constants.dart';
import 'package:bacain/utils/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class AirportRemoteDataSource {
  Future<List<AirportModel>> getListAirport({String page, String size});
}

class AirportRemoteDataSourceImpl implements AirportRemoteDataSource {
  final http.Client client;
  AirportRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<List<AirportModel>> getListAirport(
      {String page = '0', String size = '10'}) async {
    final response = await client
        .get(Uri.parse('${baseUrl}passenger?page=$page&size=$size'));

    if (response.statusCode == 200) {
      return AirportResponse.fromJson(json.decode(response.body)).data!;
    } else {
      throw ServerException();
    }
  }
}
