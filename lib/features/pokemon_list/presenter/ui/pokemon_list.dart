import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/features/pokemon_list/presenter/ui/pokemon_detail.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon_list/presenter/bloc/pokemon_list_bloc.dart';

enum MenuItem { SAIR }

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  var _bloc = GetIt.instance<PokemonListBloc>();

  @override
  void initState() {
    _bloc.onLoadPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex',
            style: GoogleFonts.gloriaHallelujah(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: <Widget>[
          PopupMenuButton<MenuItem>(
            onSelected: onSelectedItem,
            itemBuilder: (BuildContext context) => <PopupMenuItem<MenuItem>>[
              const PopupMenuItem<MenuItem>(
                value: MenuItem.SAIR,
                child: Text('Sair'),
              ),
            ],
          )
        ],
      ),
      body: StreamBuilder(
          stream: _bloc.stream,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: _bloc.pokemon.length,
                itemBuilder: (context, position) {
                  Pokemon _pokemon = _bloc.pokemon.elementAt(position);

                  return _buildPokemonItem(_pokemon, position);
                });
          }),
    );
  }

  Widget _buildPokemonItem(Pokemon pokemon, int position) {
    colorType(List<String> types) {
      Color? colorType;

      if (pokemon.type.contains("Fire")) {
        colorType = Color(0xffEC7644);
        return colorType;
      } else if (pokemon.type.contains("Water")) {
        colorType = Color(0xff3592CC);
        return colorType;
      } else if (pokemon.type.contains("Grass")) {
        colorType = Color(0xff4EAD59);
        return colorType;
      } else if (pokemon.type.contains("Electric")) {
        colorType = Color(0xffEACE48);
        return colorType;
      } else if (pokemon.type.contains("Ice")) {
        colorType = Color(0xff4EB6B0);
        return colorType;
      } else if (pokemon.type.contains("Flying")) {
        colorType = Color(0xff90B4DF);
        return colorType;
      } else if (pokemon.type.contains("Fighting")) {
        colorType = Color(0xffDD4864);
        return colorType;
      } else if (pokemon.type.contains("Poison")) {
        colorType = Color(0xffAB6AA9);
        return colorType;
      } else if (pokemon.type.contains("Bug")) {
        colorType = Color(0xff92BD35);
        return colorType;
      } else if (pokemon.type.contains("Dragon")) {
        colorType = Color(0xff186AC8);
        return colorType;
      } else if (pokemon.type.contains("Fairy")) {
        colorType = Color(0xffEF90E6);
        return colorType;
      } else if (pokemon.type.contains("Ghost")) {
        colorType = Color(0xff5F6DBC);
        return colorType;
      } else if (pokemon.type.contains("Normal")) {
        colorType = Color(0xffA0A29F);
        return colorType;
      } else if (pokemon.type.contains("Steel")) {
        colorType = Color(0xfff5796A3);
        return colorType;
      } else if (pokemon.type.contains("Rock")) {
        colorType = Color(0xffC9BC8B);
        return colorType;
      } else if (pokemon.type.contains("Ground")) {
        colorType = Color(0xffDA7C4D);
        return colorType;
      } else if (pokemon.type.contains("Psychic")) {
        colorType = Color(0xffF08481);
        return colorType;
      }
    }

    return GestureDetector(
      onTap: () {
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => _onPokemonDetail(pokemon),
        //   ),
        // );
        _onPokemonDetail(pokemon);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(4, 6, 4, 6),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: colorType(pokemon.type)),
            child: Row(
              children: [
                Stack(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(4),
                        child: Image.network(pokemon.imageUrl)),
                    CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.white.withOpacity(0.15),
                      child: ClipOval(child: Container()),
                    )
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.lato(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  '#${pokemon.num}',
                                  style: GoogleFonts.arsenal(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSelectedItem(MenuItem value) async {
    switch (value) {
      case MenuItem.SAIR:
        {
          SystemNavigator.pop();
          break;
        }
    }
  }

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  _onPokemonDetail(Pokemon pokemon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PokemonDetail(
            pokemon: pokemon,
            key: Key('DETAIL-PAGE'),
          );
        },
      ),
    );
  }
}
