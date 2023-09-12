import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:dacodes_test/app/_childrens/serie/bloc/bloc.dart' as bloc;
import 'package:animate_do/animate_do.dart';

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
  bool fadeOutAnimation = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeOutDown(
      animate: fadeOutAnimation,
      delay: const Duration(seconds: 0),
      duration: const Duration(seconds: 1),
      child: Stack(
        children: List<Widget>.generate(
          listCreditCardLength,
          (index) => Padding(
            padding: EdgeInsets.only(top: (index * 90.0)),
            child: InkWell(
              onTap: () => redirectToDetail(index),
              child: Selector<TiptiWalletProvider, bool>(
                selector: (_, provider) => provider.isShowCardsRegistered,
                builder: (_, isShowCardsRegistered, __) {
                  return !isShowCardsRegistered
                      ? const Offstage()
                      : CreditCardWallet(
                          index: index,
                          selectedIndex: widget.selectedIndex,
                          fetchCreditCards: widget.fetchCreditCards,
                        );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
