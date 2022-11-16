import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_flutter/base/data_source.dart';
import 'package:pokedex_flutter/features/pokemon_list/data/repositories/get_pokemon_repository_impl.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/repositories/get_pokemon_repository.dart';

class DataSourceMock extends Mock implements DataSource {}

main() {
  GetPokemonRepository? getPokemonRepository;
  DataSource? dataSourceMock;
  setUp(() {
    dataSourceMock = DataSourceMock();
    getPokemonRepository = GetPokemonRepositoryImpl(dataSourceMock!);
  });

  group('Get pokemon Repository', () {
    test('Use case should return a list of  Restaurants', () async {
      List<Pokemon> list = [
        Pokemon('', '', '')
      ];

      when(dataSourceMock!(any)).thenAnswer(((_) async => list));

      expectLater(await getPokemonRepository!(), list);
      expectLater(await getPokemonRepository!(), isA<List<Pokemon>>());
    });
  });
}
