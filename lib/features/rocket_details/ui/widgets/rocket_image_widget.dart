import 'package:flutter/cupertino.dart';

import 'details_page_app_bar.dart';

class RocketImageWidget extends StatelessWidget {
  const RocketImageWidget({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageUrl,
            )),
      ),
      child: const Padding(
        padding: EdgeInsetsDirectional.only(top: 60, start: 10, end: 10),
        child: DetailsPageAppBar(
          title: 'StarLink Mission',
          isBookmarked: true,
        ),
      ),
    );
  }
}
