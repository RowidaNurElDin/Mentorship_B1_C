import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';

import '../../config/locale/app_localizations.dart';
import '../../config/routes/routes.dart';
import '../../injection_container.dart';
import '../cache/cache_consumer.dart';
import '../cache/cache_keys.dart';
import '../helpers/strings_manager.dart';
import '../helpers/values_manager.dart';
import '../locale/presentation/cubit/locale_cubit.dart';
import '../model/place.dart';
import '../networking/api_consumer.dart';
import '../themes/presentation/cubit/theme_cubit.dart';
import '../widgets/loading.dart';
import '../widgets/two_selection_dialog.dart';
String formattedCalenderDateTime(DateTime date) {
  return '${date.month}-${date.year}';
}
// Function to check if a TimeOfDay is before another TimeOfDay
bool isTimeOfDayBefore(TimeOfDay startTime, TimeOfDay endTime) {
  if (startTime.hour < endTime.hour) {
    return true;
  } else if (startTime.hour == endTime.hour && startTime.minute <= endTime.minute) {
    return true;
  }
  return false;
}

InputBorder customBorder(Color color) {
  return UnderlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.rs));
}
InputBorder customNoteBorder(Color color) {
  //borderRadius: BorderRadius.circular(100.rc),
  //                             border:
  //                                 Border.all(color: ColorsManager.greyLightColor300),
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(100.rc),
      borderSide: BorderSide(color: color, width: 1.rs));
}

double getScreenHight() {
  return ScreenUtil().screenHeight -
      ScreenUtil().statusBarHeight -
      AppBar().preferredSize.height;
}

// String getLocaleString(String key, BuildContext context) {
//   return AppLocalizations.of(context)!.translate(key) ?? 'Error : not found';
// }

String getLocaleStringFrom(
    {required String arabic,
    required String english,
    required BuildContext context}) {
  return LocaleCubit.get(context).state.languageCode == 'en' ? english : arabic;
}
Color? getLocaleColorFrom(
    {required Color? light,
    required Color? dark,
    required BuildContext context}) {
  return ThemeCubit.get(context).state.name == 'light' ? light : dark;
}

dynamic getLocaleFrom(
    {required dynamic arabic,
    required dynamic english,
    required BuildContext context}) {
  return LocaleCubit.get(context).state.languageCode == 'en' ? english : arabic;
}

void wrapper(context) {
  CacheConsumer cacheConsumer = diInstance<CacheConsumer>();
  bool boardingSeen =
      cacheConsumer.getData(key: CacheKeys.boarding, defaultValue: false);

  ///Todo: make it !boardingSeen after confirm the on boarding api requests
  if (boardingSeen) {
    Navigator.pushReplacementNamed(context, Routes.boardingScreen,
        arguments: 0);

    return;
  }
  Navigator.pushReplacementNamed(context, Routes.loginScreen);
  // Navigator.pushReplacementNamed(context, Routes.layoutScreen);
}

void showLoadingDialog(context) {
  showDialog(
    context: context,
    builder: (context) => const LoadingDialog(),
  );
}

// bool isUserLoggedIn(context, {bool showLoginDialog = true}) {
//   if (AuthCubit.get(context).user != null) {
//     return true;
//   }
//   if (showLoginDialog) {
//     showDialog(
//       context: context,
//       builder: (context) => TwoSelectionDialog(
//           title: getLocaleString(StringsManager.youHaveToLoginFirst, context),
//           firstText: getLocaleString(StringsManager.login, context),
//           firstOnTap: () => Navigator.pushNamed(context, Routes.blank),
//           secondText: getLocaleString(StringsManager.cancel, context),
//           secondOnTap: () => Navigator.pop(context)),
//     );
//   }
//
//   return false;
// }

// bool isUserLoggedInNoDialog(context) {
//   if (AuthCubit.get(context).user != null) {
//     return true;
//   }
//
//   return false;
// }
//
// User getUser(context) => AuthCubit.get(context).user!;
//
// User setUser(context, {required User user}) =>
//     AuthCubit.get(context).user = user;

List<Widget> customActions(context) {
  return [
    // GestureDetector(
    //   onTap: () {
    //     Navigator.pushNamedAndRemoveUntil(
    //         context,
    //         Routes.blank,
    //         (Route<dynamic> route) =>
    //             route.settings.name == Routes.blank);
    //   },
    //   child: BlocBuilder<QuestionsCubit, QuestionsStates>(
    //     buildWhen: (pre, current) =>
    //         current is GetNotificationsSuccessState ||
    //         current is GetNotificationsLoadingState ||
    //         current is GetNotificationsFailedState,
    //     builder: (context, state) {
    //       if (state is GetNotificationsSuccessState) {
    //         return isUserLoggedIn(context, showLoginDialog: false)
    //             ? Container(
    //                 alignment: Alignment.center,
    //                 child: Badge(
    //                   backgroundColor: ColorsManager.whiteColor,
    //                   isLabelVisible: state.notificationData.data != null &&
    //                       state.notificationData.data![0].items != null &&
    //                       state.notificationData.data![0].items!.isNotEmpty,
    //                   label: CustomText(
    //                     (state.notificationData.data != null &&
    //                             state.notificationData.data![0].items != null &&
    //                             state.notificationData.data![0].items!
    //                                 .isNotEmpty)
    //                         ? '${state.notificationData.data![0].items!.length}'
    //                         : '',
    //                     color: ColorsManager.primaryColor,
    //                     textAlign: TextAlign.center,
    //                     fontSize: AppSize.s10,
    //                   ),
    //                   child: const Icon(Icons.notification_important_outlined,
    //                       color: Colors.white),
    //                 ),
    //               )
    //             : SizedBox();
    //       }
    //       return const SizedBox();
    //     },
    //   ),
    // ),
    // AppSize.s6.spaceW,
    // GestureDetector(
    //   onTap: () {
    //     Navigator.pushNamedAndRemoveUntil(
    //         context,
    //         Routes.cartScreen,
    //         (Route<dynamic> route) =>
    //             route.settings.name == Routes.layoutScreen);
    //   },
    //   child: BlocBuilder<CartCubit, CartStates>(
    //     buildWhen: (pre, current) =>
    //         current is GetCartDataSuccessState ||
    //         current is GetCartDataLoadingState ||
    //         current is GetCartDataLoadingState,
    //     builder: (context, state) {
    //       if (state is GetCartDataSuccessState) {
    //         return Container(
    //           alignment: Alignment.center,
    //           child: Badge(
    //             backgroundColor: ColorsManager.whiteColor,
    //             isLabelVisible: state.cartModel.data != null &&
    //                 state.cartModel.data!.cart != null &&
    //                 state.cartModel.data!.cart!.isNotEmpty,
    //             label: CustomText(
    //               (state.cartModel.data != null &&
    //                       state.cartModel.data!.cart != null &&
    //                       state.cartModel.data!.cart!.isNotEmpty)
    //                   ? '${state.cartModel.data!.cart!.length}'
    //                   : '',
    //               color: ColorsManager.primaryColor,
    //               textAlign: TextAlign.center,
    //               fontSize: AppSize.s10,
    //             ),
    //             child: const CustomSvg(
    //               AssetsManager.cart,
    //               color: ColorsManager.whiteColor,
    //             ),
    //           ),
    //         );
    //       }
    //       return const SizedBox();
    //     },
    //   ),
    // ),
    // AppSize.s2.spaceW,
    // const LocaleButton(),
    // AppSize.s5.spaceW
  ];
}

// Future<LatLng> getUserMapLocation(
//     GoogleMapController? googleMapController) async {
//   await Geolocator.requestPermission();
//
//   Position position = await Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.high,
//   );
//   double lat = position.latitude;
//   double long = position.longitude;
//   LatLng location = LatLng(lat, long);
//
//   googleMapController?.animateCamera(CameraUpdate.newLatLngZoom(location, 14));
//   return location;
// }
//
// Future<String> getLocationName(context) async {
//   LatLng location = await getUserMapLocation(null);
//   List<Placemark> list = await placemarkFromCoordinates(
//       location.latitude, location.longitude,
//       localeIdentifier:
//           LocaleCubit.get(context).state.languageCode == 'en' ? 'en' : 'ar');
//
//   return '${list[0].subThoroughfare} ${list[0].thoroughfare}, ${list[0].subLocality}, ${list[0].administrativeArea}, ${list[0].country}';
// }
//
// Place? place;

// Future<String> updateMapLocation(context, LatLng location) async {
//   String _host = 'https://maps.google.com/maps/api/geocode/json';
//   String mapApiKey = 'AIzaSyBaUmZqLrBQj3LQHChTJOHJuqvDbg_lbAU';
//   final url =
//       '$_host?key=$mapApiKey&language=${LocaleCubit.get(context).state.languageCode == 'en' ? 'en' : 'ar'}&latlng=${location.latitude},${location.longitude}';
//   var response = await http.get(Uri.parse(url));
//   Map data = jsonDecode(response.body);
//   final Place place = Place.fromJson(jsonDecode(response.body));
//
//   return '${place.results![0].formattedAddress}';
// }

void cancelCurrentRequest() => diInstance<ApiConsumer>().cancelRequest();
final ImagePicker imagePicker = ImagePicker();
//imageCoverList!.isEmpty && imageCoverList!.length < 1
Future<XFile?> selectCoverImages() async {
  final XFile? selectedImages = await imagePicker.pickImage(
    source: ImageSource.gallery,
    maxHeight: 480,
    maxWidth: 640,
  );
  if (selectedImages != null) {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: selectedImages.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        // 100 means no compression
        maxWidth: AppSize.s300.rh.toInt(),
        maxHeight: AppSize.s250.rh.toInt(),
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );

      if (croppedFile != null) {
        File file = File(croppedFile.path);
        XFile selectedXFile = XFile(file.path);

        return selectedXFile;
      }
    } catch (e) {
      print('Error cropping image: $e');
      return null;
    }
  }

  return null;
}

String formatDate(DateTime dateTime) {
  // Format the time part
  String timeString = DateFormat.jm().format(dateTime); // "9:00 PM"

  // Format the date part
  String dateString = DateFormat('M/d/yyyy').format(dateTime); // "7/3/2024"

  // Combine the formatted time and date
  String formattedDateTime = '$timeString, $dateString';

  return formattedDateTime;
}

String formatOptDate(DateTime dateTime) {
  // Format the time part
  String timeString = DateFormat.jm().format(dateTime); // "9:00 PM"

  // Format the date part
  String dateString = DateFormat('M/d/yyyy').format(dateTime); // "7/3/2024"

  // Combine the formatted time and date
  String formattedDateTime = '$dateString $timeString';

  return formattedDateTime;
}

String formatYearDate(DateTime dateTime) {
  String dateString = DateFormat('M/d/yyyy').format(dateTime); // "7/3/2024"

  // Combine the formatted time and date
  String formattedDateTime = dateString;

  return formattedDateTime;
}

String formatTimeDate(TimeOfDay timeOfDay) {
  DateTime dummyTime = DateTime(2000, 1, 1, timeOfDay.hour, timeOfDay.minute);
  String timeString = DateFormat.jm().format(dummyTime); // "9:00 PM"

  // Combine the formatted time and date
  String formattedDateTime = timeString;

  return formattedDateTime;
}

String formatTimeFromDateTime(DateTime dateTime) {
  DateTime dummyTime = DateTime(2000, 1, 1, dateTime.hour, dateTime.minute);
  String timeString = DateFormat.jm().format(dummyTime); // "9:00 PM"

  // Combine the formatted time and date
  String formattedDateTime = timeString;

  return formattedDateTime;
}

Future<List<XFile>?> selectImages() async {
  final List<XFile> selectedImages = await imagePicker.pickMultiImage(
    maxHeight: 480,
    maxWidth: 640,
  );
  if (selectedImages.isNotEmpty) {
    return selectedImages;
  }
  return null;
}

Future<XFile?> selectImage() async {
  final XFile? selectedImage =
      await imagePicker.pickImage(source: ImageSource.gallery);
  if (selectedImage != null) {
    return selectedImage;
  }
  return null;
}

Future<String?> pickAndEncodeImage() async {
  final imagePicker = ImagePicker();
  final pickedImage = await imagePicker.pickImage(
      source: ImageSource
          .gallery); // You can also use camera with ImageSource.camera

  if (pickedImage != null) {
    // Read image file bytes
    final imageBytes = await pickedImage.readAsBytes();

    // Encode image as Base64 string
    final encodedImage = img.encodeJpg(img.decodeImage(imageBytes)!);
    return base64Encode(encodedImage);
  } else {
    return null;
  }
}

Future<List<String>> getImageXFileByUrl(List<String> imagesUrl) async {
  List<String> imagesFiles = [];
  await Future.wait(imagesUrl.map((element) async {
    var file = await DefaultCacheManager().getSingleFile(element);
    imagesFiles.add(file.path);
  }));
  return imagesFiles;
}

Map<String, dynamic> parseDateString(String dateString) {
  return Map<String, dynamic>.from(jsonDecode(dateString));
}

String formatBirthdayDate(int day, int month, int year) {
  return '${_addLeadingZero(month)}/${_addLeadingZero(day)}/$year';
}

String _addLeadingZero(int value) {
  return value.toString().padLeft(2, '0');
}
