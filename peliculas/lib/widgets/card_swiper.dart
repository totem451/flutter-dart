import 'package:card_swiper/card_swiper.dart';
import 'package:cartas/bloc/bloc.dart';
import 'package:cartas/bloc/modelos/card.dart' as c;
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> peliculas;
  CardSwiper({required this.peliculas});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.85,
      child: Swiper(
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.7,
        itemHeight: size.height * 0.7,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: peliculas[index]),
            child: Hero(
              tag: peliculas[index].id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(peliculas[index].getPosterImg()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
