import '../entities/pokemon.dart';
import '../repositories/get_pokemon_repository.dart';

abstract class GetPokemonUseCase {
  call();
}

class GetPokemonUseCaseImpl implements GetPokemonUseCase {
  final GetPokemonRepository repository;

  GetPokemonUseCaseImpl(this.repository);

  @override
  Future<List<Pokemon>> call() async => await repository();
}
