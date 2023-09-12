import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;

  final VoidCallback onSearch;

  const SearchBarWidget({
    Key? key,
    required this.controller,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white.withOpacity(0.2),
      margin: EdgeInsets.symmetric(horizontal: size.width * .05),
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: translate('search'),
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                onSearch();
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearch,
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => controller.clear(),
          ),
        ],
      ),
    );
  }
}
