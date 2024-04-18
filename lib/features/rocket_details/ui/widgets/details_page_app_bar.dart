import 'package:flutter/material.dart';

class DetailsPageAppBar extends StatelessWidget {
  const DetailsPageAppBar({
    super.key,
    required this.title,
    required this.isBookmarked,
  });

  final String title;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_border_outlined),
        )
      ],
    );
  }
}
