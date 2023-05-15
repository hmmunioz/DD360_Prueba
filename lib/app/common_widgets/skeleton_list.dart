import 'package:dd360_test/app/common_widgets/card_skeleton.dart';
import 'package:flutter/material.dart';

class CardSkeletonList extends StatelessWidget {
  const CardSkeletonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height * .85,
        child: ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 16,
          ),
          separatorBuilder: (_, __) => const SizedBox(height: 15.0),
          itemBuilder: (_, __) => const CardSkeleton(),
        ),
      );
}
