import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex_flutter/base/Endpoint.dart';
import 'package:pokedex_flutter/base/data_source.dart';
import 'package:pokedex_flutter/features/pokemon_list/data/model/pokemon_model.dart';

import 'exceptions/get_pokemon_datasource_exception.dart';

class GetPokemonDataSource implements DataSource {
  // final String _queryParam = "pokemon?limit=25&offset=0";
  final Dio _dio;
  GetPokemonDataSource(this._dio);

  @override
  Future call(FromJson? fromJson) async {
    String url = '${EndPoint.URL}';

    try {
      var response = await _dio.get<String>(url);
      Map _json = json.decode(response.data!);

      var list = List<PokemonModel>.from(
          (_json['pokemon'] as List).map((i) => fromJson!(i)).toList());

      return list;
    } on DioError catch (e) {
      throw GetPokemonDataSourceException('', e.message);
    }
  }
}
