class Pokemon {
  final String name;
  final String num;
  final int id;
  final String img;
  final List<String> type;



  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';



  Pokemon(
      this.name,
      this.num,
      this.id, this.img, this.type);
}
