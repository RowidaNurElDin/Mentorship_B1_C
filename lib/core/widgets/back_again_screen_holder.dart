// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../features/main_layout/presentation/cubit/main_layout_cubit.dart';
// import '../manager/strings_manager.dart';
// import 'toast.dart';
//
// // ignore: must_be_immutable
// class BackAgainScreenHolder extends StatelessWidget {
//   final Widget child;
//   DateTime preBackPress = DateTime.now();
//
//   BackAgainScreenHolder({
//     Key? key,
//     required this.child,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     MainLayoutCubit cubit =
//         BlocProvider.of<MainLayoutCubit>(context, listen: true);
//
//     return WillPopScope(
//       onWillPop: () async {
//         if (cubit.state == 0) {
//           if (Navigator.canPop(context)) {
//             return true;
//           }
//           final timeGap = DateTime.now().difference(preBackPress);
//           final canExit = timeGap < const Duration(seconds: 2);
//           preBackPress = DateTime.now();
//           if (canExit) {
//             return true; // true will exit the app
//           } else {
//             showToast(StringsManager.pressBackButtonAgainToExit, time: 2);
//             return false; // false will do nothing when back press
//           }
//         } else {
//           cubit.changeCurrentPageIndex(0);
//         }
//         return false; // false will do nothing when back press
//       },
//       child: child,
//     );
//   }
// }
