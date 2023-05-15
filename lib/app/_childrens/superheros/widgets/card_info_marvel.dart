import 'package:dd360_test/app/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:dd360_test/app/models/marvel_models/superhero_model.dart';
import 'package:dd360_test/app/_childrens/superheros/bloc/bloc.dart' as bloc;

class CardInfoMarvel extends StatelessWidget {
  const CardInfoMarvel(
      {Key? key, required this.superHerotemp, this.dynamicModel})
      : super(key: key);
  final SuperheroModel superHerotemp;
  final dynamic dynamicModel;
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
                          " ${dynamicModel.title}",
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
                          " ${dynamicModel.description}",
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
                imageUrl: dynamicModel.thumbnail.path +
                    "." +
                    dynamicModel.thumbnail.extension,
                placeholder: (context, url) =>
                    Image.asset(AssetsUIValues.loading),
                errorWidget: (context, url, error) =>
                    Image.asset(AssetsUIValues.loading),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width * .40,
              ),
            ]),
          );
        },
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
