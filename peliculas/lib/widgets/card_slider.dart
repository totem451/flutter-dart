import 'package:cartas/bloc/modelos/pelicula.dart';
import 'package:cartas/services/movies_service.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatefulWidget {
  final List<Movie> peliculas;
  final Function onNextPage;
  CardSlider({
    required this.peliculas,
    required this.onNextPage,
  });

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  final movieService = new MovieService();
  final pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      if (pageController.position.pixels >=
          pageController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
    return Container(
        width: double.infinity,
        height: 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Populares',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: PageView.builder(
                pageSnapping: true,
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.peliculas.length,
                itemBuilder: (context, int index) {
                  return _cardPoster(context, widget.peliculas[index]);
                },
              ),
            ),
          ],
        ));
  }
}

Widget _cardPoster(BuildContext context, Movie pelicula) {
  return Container(
    width: 130,
    height: 190,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, 'details', arguments: pelicula),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(pelicula.getPosterImg()),
              width: 130,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          pelicula.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
