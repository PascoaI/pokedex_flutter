import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/features/pokemon_list/data/model/pokemon_model.dart';

main() {
  var response;

  PokemonModel? pokemonModel;

  setUpAll(() {
    response = {
      'name': 'A',
      'url': 'B',
      'id': '1',
    };

    pokemonModel = PokemonModel.fromJson(response);
  });

  group('Restaurant json parse', () {
    test('RestaurantModel should be instance of RestaurantModel', () {
      expect(pokemonModel, isA<PokemonModel>());
    });

    test('name should be A', () {
      expect(pokemonModel!.name, 'A');
    });

    test('logo should be B', () {
      expect(pokemonModel!.url, 'B');
    });

    test('score should be C', () {
      expect(pokemonModel!.id, 'C');
    });

  });
}
