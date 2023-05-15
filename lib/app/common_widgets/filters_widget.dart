import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dd360_test/app/_childrens/superheros/bloc/bloc.dart' as bloc;
import 'package:flutter/material.dart';

class ChipOptionsMarvel extends StatelessWidget {
  const ChipOptionsMarvel({
    Key? key,
    required this.marvelEnumList,
  }) : super(key: key);
  final List<Map<String, dynamic>> marvelEnumList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<bloc.Bloc, bloc.State>(builder: (context, state) {
      return SizedBox(
        /*       width: size.width * 0.95, */
        height: size.height * 0.055,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: marvelEnumList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: marvelEnumList[index]['action'],
              child: Transform(
                transform: Matrix4.identity()..scale(0.8),
                child: Chip(
                  backgroundColor: Colors.orange.withOpacity(0.7),
                  label: Text(
                    marvelEnumList[index]['enum'],
                    style: TextStyle(
                      fontSize: size.width * 0.035,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
