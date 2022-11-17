import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/repositories/get_pokemon_repository.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/usecase/get_pokemon_usecase.dart';

class GetPokemonRepositoryMock extends Mock
    implements GetPokemonRepository {}

main() {
  GetPokemonRepository? repoMock;
  GetPokemonUseCase? getPokemonUseCase;
  setUp(() {
    repoMock = GetPokemonRepositoryMock();
    getPokemonUseCase = GetPokemonUseCaseImpl(repoMock!);
  });

  group('Get pokemon UseCase', () {
    test('Use case should return a list of  pokemon', () async {
      List<Pokemon> list = [
        Pokemon('', '', 1, '', '' as List<String>)
      ];

      when(repoMock!()).thenAnswer((_) async => list);

      expectLater(await getPokemonUseCase!(), list);
      expectLater(await getPokemonUseCase!(), isA<List<Pokemon>>());
    });
  });
}
