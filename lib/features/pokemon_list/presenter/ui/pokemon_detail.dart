import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon_list/presenter/bloc/pokemon_list_bloc.dart';
import 'package:pokedex_flutter/features/pokemon_list/presenter/ui/pokemon_list.dart';

class PokemonDetail extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetail({required Key key, required this.pokemon})
      : super(key: key);



  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}


class _PokemonDetailState extends State<PokemonDetail> {
  PokemonListBloc bloc = GetIt.instance<PokemonListBloc>();
  @override

  String getImagebackGround(Pokemon pokemon) {
    if (pokemon.type.contains('Water') || pokemon.type.contains('Normal')) {
      return 'assets/images/water.png';
    } else if (pokemon.type.contains('Fire') ||
        pokemon.type.contains('Fairy')) {
      return 'assets/images/fire.png';
    } else if (pokemon.type.contains('Grass')) {
      return 'assets/images/grass.png';
    } else if (pokemon.type.contains('Electric') ||
        pokemon.type.contains('Psychic')) {
      return 'assets/images/Electric.png';
    } else if (pokemon.type.contains('Poison')) {
      return 'assets/images/Poison.png';
    } else if (pokemon.type.contains('Ground') ||
        pokemon.type.contains('Fighting')) {
      return 'assets/images/Ground.png';
    } else {
      return 'assets/images/other.png';
    }
  }

  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Pokedex',
                style: GoogleFonts.gloriaHallelujah(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
        ),
        body: buildDetail(widget.pokemon),
      );

  }

  Widget buildDetail(Pokemon pokemon) {

    return Stack(children: [
      CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              toolbarHeight: 85,
              backgroundColor: Colors.white,
              expandedHeight: 247,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                    children: [
                      Positioned(
                          right: -33,
                          bottom: -22,
                          child: Image.asset(
                            getImagebackGround(widget.pokemon),
                            height: 176,
                            width: 176,
                          )),
                      Positioned(
                        right: 16,
                        bottom: 0,
                        child: Image.network(widget.pokemon.imageUrl,
                          width: 136,
                          height: 125,
                        ),
                      ),
                      Positioned(
                        bottom: 111,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.pokemon.name,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.lato(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 14,
                        left: 16,
                        child: Text(
                            '#${widget.pokemon.id.toString().padLeft(3, '0')}',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff161A33),)
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: widget.pokemon.type
                              .map((types) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(types,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black)),
                            ),
                          ))
                              .toList(),
                        ),
                      ),

                    ]
                ),
              ),
            ),
          ])
    ],
    );
  }

  }
