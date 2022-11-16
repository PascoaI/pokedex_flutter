import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/usecase/get_pokemon_usecase.dart';
import 'package:pokedex_flutter/features/pokemon_list/presenter/bloc/pokemon_list_bloc.dart';

class GetPokemonUseCaseMock extends Mock implements GetPokemonUseCase {}

void main() async {
  late GetPokemonUseCase useCase;
  late PokemonListBloc bloc;
  setUp(() {
    useCase = GetPokemonUseCaseMock();
    bloc = PokemonListBloc(useCase);
  });

  group('pokemon List Bloc', () {
    test('onLoadpokemon should return list of pokemon', () async {
      List<Pokemon> list = [
        Pokemon('', '', '')
      ];

      when(useCase()).thenAnswer((_) async => list);

      expectLater(bloc.pokemon.length, 0);

      bloc.onLoadPokemon();

      expectLater(bloc.stream, emits(true));

      bloc.stream.listen((e) {
        expect(e, true);
        expect(bloc.pokemon.length, 1);
      });
    });
  });

  tearDown(() {
    bloc.dispose();
  });
}
