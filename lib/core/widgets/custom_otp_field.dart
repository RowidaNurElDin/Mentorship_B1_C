import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';
import '../helpers/colors_manager.dart';
import '../helpers/values_manager.dart';
import '/core/widgets/custom_text_field.dart';
import '/core/widgets/space.dart';

class OtpController {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  OtpController({required int codeLength}) {
    if (codeLength < 2) {
      throw Exception('Code length must be 2 or more');
    }
    controllers = List.generate(codeLength, (index) => TextEditingController());
    focusNodes = List.generate(codeLength, (index) => FocusNode());
  }

  String getOtpCode() {
    String code = '';
    for (var element in controllers) {
      code = '$code${element.text.trim()}';
    }
    return code;
  }

  bool isTyped() {
    bool result = true;
    for (var element in controllers) {
      if (element.text.trim().isEmpty) {
        result = false;
      }
    }
    return result;
  }
}

class CustomOtpField extends StatelessWidget {
  const CustomOtpField({
    Key? key,
    required this.otpController,
  }) : super(key: key);

  final OtpController otpController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          otpController.controllers.length,
          (index) => Expanded(
                  child: Row(
                children: [
                  AppSize.s5.spaceW,
                  Expanded(
                    child: CustomTextField(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(BorderValues.b8.rc),
                          borderSide: BorderSide(
                            color: otpController.controllers[index].text
                                    .trim()
                                    .isEmpty
                                ? const Color(0xffDADADA)
                                : ColorsManager.primaryColor,
                          )),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      focusNode: otpController.focusNodes[index],
                      controller: otpController.controllers[index],
                      textInputType: TextInputType.number,
                      onChanged: (value) {
                        if (value.trim().isNotEmpty) {
                          try {
                            FocusScope.of(context).unfocus();

                            FocusScope.of(context).requestFocus(
                                otpController.focusNodes[index + 1]);
                          } catch (e) {
                            FocusScope.of(context).unfocus();
                          }
                        }
                      },
                    ),
                  ),
                  AppSize.s5.spaceW,
                ],
              ))),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return Expanded(
      child: CustomTextField(
          controller: otpController.controllers[index],
          textInputType: TextInputType.number),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) =>
      AppSize.s15.spaceW;
}
