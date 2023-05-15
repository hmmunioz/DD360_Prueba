import 'package:dd360_test/app/common_widgets/app_bar.dart';
import 'package:dd360_test/app/common_widgets/card_skeleton.dart';
import 'package:dd360_test/app/common_widgets/list_view_infinite.dart';
import 'package:dd360_test/app/common_widgets/no_result_widget.dart';
import 'package:dd360_test/app/common_widgets/skeleton_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dd360_test/app/_childrens/superheros/bloc/bloc.dart' as bloc;

import 'package:dd360_test/app/_childrens/superheros/widgets/card_superhero.dart';
import 'package:dd360_test/app/constants/assets.dart';
import 'package:dd360_test/app/constants/texts.dart';

import 'package:dd360_test/app/models/marvel_models/superhero_model.dart';

class SuperheroPage extends StatelessWidget {
  const SuperheroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc.Bloc()..add(bloc.GetSuperheroEvent()),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        child: AppBarMarvel(
          text: TextUIValues.superHeroCharacterscharacters,
          exitApp: true,
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
                List<SuperheroModel> superhero =
                    state.model.superheroList.toSet().toList();

                if (superhero.isEmpty && state is bloc.LoadedSuperHerosState) {
                  return Center(
                    child: NoResultWidget(
                      title: TextUIValues.resultNoFound,
                      onTap: () {
                        context
                            .read<bloc.Bloc>()
                            .add(bloc.GetMoreSuperheroEvent());
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
                            .add(bloc.GetMoreSuperheroEvent());
                      },
                    ),
                  );
                } else if (state is bloc.InitialState ||
                    state is bloc.LoadingSuperHerosState) {
                  return const CardSkeletonList();
                } else {
                  return SizedBox(
                    height: size.height * .85,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<bloc.Bloc>()
                            .add(bloc.ReloadSuperheroEvent());
                      },
                      child: ListViewInfinite(
                        onLoadingMore: () {
                          context
                              .read<bloc.Bloc>()
                              .add(bloc.GetMoreSuperheroEvent());
                        },
                        isLastPage: (state.model.countSuperheros *
                                state.model.pageSuperhero) >=
                            state.model.totalSuperheros,
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
                          superhero.length,
                          (index) {
                            final superHeroTemp = superhero[index];

                            return CardSuperHero(
                              superHerotemp: superHeroTemp,
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
