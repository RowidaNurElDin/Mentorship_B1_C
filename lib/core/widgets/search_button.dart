import 'package:flutter/material.dart';

import '../helpers/strings_manager.dart';
import '../helpers/values_manager.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key, this.onClick}) : super(key: key);

  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppSize.s50),
      ),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(AppSize.s50),
        child: ListTile(
          leading: const Icon(Icons.search),
          title: Text(
            StringsManager.search,
            textAlign: TextAlign.start,
          ),
          trailing: const Icon(Icons.mic),
        ),
      ),
    );
  }
}
