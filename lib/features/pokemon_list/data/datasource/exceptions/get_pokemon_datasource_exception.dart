class GetPokemonDataSourceException implements Exception {
  String statusCode;
  String cause;
  GetPokemonDataSourceException(this.statusCode,this.cause);

  String toString() => 'GetPokemonDataSourceException[$statusCode]: $cause';
}
