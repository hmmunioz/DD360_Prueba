import 'package:dd360_test/app/_childrens/superheros/widgets/card_info_marvel.dart';
import 'package:dd360_test/app/common_widgets/app_bar.dart';
import 'package:dd360_test/app/common_widgets/card_skeleton.dart';
import 'package:dd360_test/app/common_widgets/list_view_infinite.dart';
import 'package:dd360_test/app/common_widgets/no_result_widget.dart';
import 'package:dd360_test/app/models/marvel_models/story_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dd360_test/app/_childrens/superheros/bloc/bloc.dart' as bloc;

import 'package:dd360_test/app/constants/assets.dart';
import 'package:dd360_test/app/constants/texts.dart';

import 'package:dd360_test/app/models/marvel_models/superhero_model.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final superheroModel =
        ModalRoute.of(context)?.settings.arguments as SuperheroModel;
    return BlocProvider(
      create: (_) => bloc.Bloc()..add(bloc.GetStoriesEvent(superheroModel)),
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
          text: TextUIValues.stories,
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
                List<Story> storyList =
                    (state.model.storiesList ?? []).toSet().toList();

                if (storyList.isEmpty && state is bloc.LoadedStoriesState) {
                  return Center(
                    child: NoResultWidget(
                      title: TextUIValues.resultNoFound,
                      onTap: () {
                        context
                            .read<bloc.Bloc>()
                            .add(bloc.GetMoreStoriesEvent(superheroModel));
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
                            .add(bloc.GetMoreStoriesEvent(superheroModel));
                      },
                    ),
                  );
                } else if (state is bloc.InitialState ||
                    state is bloc.LoadingStoriesState) {
                  return const _CardSkeletonList();
                } else {
                  return SizedBox(
                    height: size.height * .86,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<bloc.Bloc>()
                            .add(bloc.ReloadStoriesEvent(superheroModel));
                      },
                      child: ListViewInfinite(
                        onLoadingMore: () {
                          context
                              .read<bloc.Bloc>()
                              .add(bloc.GetMoreStoriesEvent(superheroModel));
                        },
                        isLastPage: (state.model.countStory *
                                state.model.pageStories) >=
                            state.model.totalStory,
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
                          storyList.length,
                          (index) {
                            final storytemp = storyList[index];
                            return CardInfoMarvel(
                              superHerotemp: state.model.currentSuperhero!,
                              dynamicModel: storytemp,
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

class _CardSkeletonList extends StatelessWidget {
  const _CardSkeletonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 16,
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 15.0),
        itemBuilder: (_, __) => const CardSkeleton(),
      );
}
