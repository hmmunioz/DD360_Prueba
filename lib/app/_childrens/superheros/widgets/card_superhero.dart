import 'package:dd360_test/app/_childrens/superheros/pages/comics_page.dart';
import 'package:dd360_test/app/_childrens/superheros/pages/event_page.dart';
import 'package:dd360_test/app/_childrens/superheros/pages/series_page.dart';
import 'package:dd360_test/app/_childrens/superheros/pages/stories_page.dart';
import 'package:dd360_test/app/common_widgets/filters_widget.dart';
import 'package:dd360_test/app/constants/assets.dart';
import 'package:dd360_test/app/enums/marvel/superhero_filter_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:dd360_test/app/models/marvel_models/superhero_model.dart';
import 'package:dd360_test/app/_childrens/superheros/bloc/bloc.dart' as bloc;

class CardSuperHero extends StatelessWidget {
  const CardSuperHero({Key? key, required this.superHerotemp})
      : super(key: key);
  final SuperheroModel superHerotemp;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<bloc.Bloc, bloc.State>(
      listener: listener,
      child: BlocBuilder<bloc.Bloc, bloc.State>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .25,
                child: Card(
                  color: Colors.black.withOpacity(0.3),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size.width * .63,
                        child: Text(
                          " ${superHerotemp.name}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size.width * .56,
                        child: Text(
                          " ${superHerotemp.description}",
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CachedNetworkImage(
                imageUrl: superHerotemp.thumbnail.path +
                    "." +
                    superHerotemp.thumbnail.extension,
                placeholder: (context, url) =>
                    Image.asset(AssetsUIValues.loading),
                errorWidget: (context, url, error) =>
                    Image.asset(AssetsUIValues.loading),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width * .40,
              ),
              Positioned(
                bottom: 0,
                left: size.width * .17,
                child: ChipOptionsMarvel(marvelEnumList: [
                  {
                    'enum': MarvelEnum.comic.value,
                    'action': () {
                      gotoPage(context, '/comics', const ComicsPage());
                    }
                  },
                  {
                    'enum': MarvelEnum.event.value,
                    'action': () {
                      gotoPage(context, '/events', const EventMarvelPage());
                    }
                  },
                  {
                    'enum': MarvelEnum.serie.value,
                    'action': () {
                      gotoPage(context, '/series', const SeriesPage());
                    }
                  },
                  {
                    'enum': MarvelEnum.story.value,
                    'action': () {
                      gotoPage(context, '/stories', const StoryPage());
                    }
                  },
                ]),
              )
            ]),
          );
        },
      ),
    );
  }

  void gotoPage(BuildContext context, String route, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(
          name: route,
          arguments: superHerotemp,
        ),
      ),
    );
  }

  void listener(BuildContext context, bloc.State state) {}

  void myCallback(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
  }
}
