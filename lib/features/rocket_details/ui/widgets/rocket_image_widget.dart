import 'package:flutter/cupertino.dart';

import 'details_page_app_bar.dart';

class RocketImageWidget extends StatelessWidget {
  const RocketImageWidget({
    super.key,
    required this.imageUrl, required this.title,
  });

  final String imageUrl;
  final String title;

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
      child:  Padding(
        padding:const EdgeInsetsDirectional.only(top: 60, start: 10, end: 10),
        child: DetailsPageAppBar(
          title: title,
          isBookmarked: true,
        ),
      ),
    );
  }
}
