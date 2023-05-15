import 'package:dd360_test/app/_childrens/superheros/widgets/card_info_marvel.dart';
import 'package:dd360_test/app/common_widgets/app_bar.dart';
import 'package:dd360_test/app/common_widgets/card_skeleton.dart';
import 'package:dd360_test/app/common_widgets/list_view_infinite.dart';
import 'package:dd360_test/app/common_widgets/no_result_widget.dart';
import 'package:dd360_test/app/common_widgets/skeleton_list.dart';
import 'package:dd360_test/app/models/marvel_models/serie_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dd360_test/app/_childrens/superheros/bloc/bloc.dart' as bloc;

import 'package:dd360_test/app/constants/assets.dart';
import 'package:dd360_test/app/constants/texts.dart';

import 'package:dd360_test/app/models/marvel_models/superhero_model.dart';

class SeriesPage extends StatelessWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final superheroModel =
        ModalRoute.of(context)?.settings.arguments as SuperheroModel;
    return BlocProvider(
      create: (_) => bloc.Bloc()..add(bloc.GetSeriesEvent(superheroModel)),
      child: _Content(
        superheroModel: superheroModel,
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key, required this.superheroModel}) : super(key: key);
  final SuperheroModel superheroModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        child: AppBarMarvel(
          text: TextUIValues.series,
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsUIValues.bgMarvel),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .02),
              BlocBuilder<bloc.Bloc, bloc.State>(builder: (context, state) {
                List<Series> seriesList =
                    (state.model.seriesList ?? []).toSet().toList();

                if (seriesList.isEmpty && state is bloc.LoadedSeriesState) {
                  return Center(
                    child: NoResultWidget(
                      title: TextUIValues.resultNoFound,
                      onTap: () {
                        context
                            .read<bloc.Bloc>()
                            .add(bloc.GetMoreSeriesEvent(superheroModel));
                      },
                    ),
                  );
                } else if (state is bloc.ErrorState) {
                  return Center(
                    child: NoResultWidget(
                      title: TextUIValues.tryAgain,
                      onTap: () {
                        context
                            .read<bloc.Bloc>()
                            .add(bloc.GetMoreSeriesEvent(superheroModel));
                      },
                    ),
                  );
                } else if (state is bloc.InitialState ||
                    state is bloc.LoadingSeriesState) {
                  return const CardSkeletonList();
                } else {
                  return SizedBox(
                    height: size.height * .86,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<bloc.Bloc>()
                            .add(bloc.ReloadSeriesEvent(superheroModel));
                      },
                      child: ListViewInfinite(
                        onLoadingMore: () {
                          context
                              .read<bloc.Bloc>()
                              .add(bloc.GetMoreSeriesEvent(superheroModel));
                        },
                        isLastPage: (state.model.countSeries *
                                state.model.pageSeries) >=
                            state.model.totalSeries,
                        loadingWidget: Padding(
                          padding: const EdgeInsets.only(
                            left: 17,
                            right: 17,
                            bottom: 25,
                          ),
                          child: Column(
                            children: const [
                              CardSkeleton(),
                            ],
                          ),
                        ),
                        children: List.generate(
                          seriesList.length,
                          (index) {
                            final seriestemp = seriesList[index];
                            return CardInfoMarvel(
                              superHerotemp: state.model.currentSuperhero!,
                              dynamicModel: seriestemp,
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
