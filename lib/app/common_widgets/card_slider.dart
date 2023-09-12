import 'package:carousel_slider/carousel_slider.dart';
import 'package:dacodes_test/app/_childrens/serie/widgets/card_season.dart';
import 'package:dacodes_test/app/models/serie_models/serie_model.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({
    Key? key,
    required this.serie,
  }) : super(key: key);

  final SerieModel serie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: int.parse(serie.totalSeasons),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return CardSeason(seasonNumber: '${itemIndex + 1}');
        },
        options: CarouselOptions(
          height: size.width * .25,
          autoPlay: true,
          viewportFraction: 0.3,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          enlargeCenterPage: true,
          pageSnapping: true,
        ),
      ),
    );
  }
}
