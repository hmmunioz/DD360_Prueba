import 'package:dacodes_test/app/_childrens/serie/widgets/card_serie.dart';
import 'package:dacodes_test/app/common_widgets/app_bar.dart';
import 'package:dacodes_test/app/common_widgets/card_skeleton.dart';
import 'package:dacodes_test/app/common_widgets/no_result_widget.dart';
import 'package:dacodes_test/app/models/serie_models/serie_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dacodes_test/app/_childrens/serie/bloc/bloc.dart' as bloc;

import 'package:flutter_translate/flutter_translate.dart';

import '../../../common_widgets/search_bar.dart';
import '../../../constants/colors.dart';

class SeriesPage extends StatelessWidget {
  const SeriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc.Bloc()..add(const bloc.GetSeriesEvent('')),
      child: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  _Content({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        child: AppBarDacodes(
          text: translate('series'),
        ),
        preferredSize: const Size.fromHeight(50),
      ),
      body: Container(
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsMarvel.marvelSecondary,
              ColorsMarvel.marvelPrimary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .02),
              SearchBarWidget(
                controller: _searchController,
                onSearch: () {
                  context
                      .read<bloc.Bloc>()
                      .add(bloc.GetSeriesEvent(_searchController.text));
                },
              ),
              SizedBox(height: size.height * .02),
              BlocBuilder<bloc.Bloc, bloc.State>(
                builder: (context, state) {
                  SerieModel? serie = state.model.serie;

                  if (serie == null && state is bloc.LoadedSeriesState) {
                    return Center(
                      child: NoResultWidget(
                        title: translate('resultNoFound'),
                        onTap: () {
                          context
                              .read<bloc.Bloc>()
                              .add(const bloc.GetSeriesEvent(''));
                        },
                      ),
                    );
                  } else if (state is bloc.ErrorState) {
                    return Center(
                      child: NoResultWidget(
                        title: translate('tryAgain'),
                        onTap: () {
                          context
                              .read<bloc.Bloc>()
                              .add(const bloc.GetSeriesEvent(''));
                        },
                      ),
                    );
                  } else if (state is bloc.InitialState ||
                      state is bloc.LoadingSeriesState) {
                    return const CardSkeleton();
                  } else {
                    if (serie != null) {
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * .01,
                              ),
                              child: ListTile(
                                title: Text(
                                  translate('results'),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          CardSeries(
                            serie: serie,
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
