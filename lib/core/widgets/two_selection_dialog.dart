import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/space.dart';
import '../helpers/colors_manager.dart';
import '../helpers/values_manager.dart';
import '/config/theme/themes_manager.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class TwoSelectionDialog extends StatefulWidget {
  const TwoSelectionDialog(
      {Key? key,
      required this.firstText,
      required this.firstOnTap,
      required this.secondText,
      required this.secondOnTap,
      this.gradient,
      this.showButtons = true,
      this.title})
      : super(key: key);

  final LinearGradient? gradient;
  final String firstText;
  final String secondText;
  final VoidCallback firstOnTap;
  final VoidCallback secondOnTap;
  final String? title;
  final bool showButtons;

  @override
  State<TwoSelectionDialog> createState() => _TwoSelectionDialogState();
}

class _TwoSelectionDialogState extends State<TwoSelectionDialog>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 250,
      ),
      vsync: this,
      value: 0.1,
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(_animation),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: PaddingValues.pDefault.rw,
              vertical: PaddingValues.pDefault.rh,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: PaddingValues.pDefault.rw,
              vertical: PaddingValues.pDefault.rh,
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: Values.shadowBlur.toDouble(),
                      color: Theme.of(context).scaffoldBackgroundColor)
                ],
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.title != null)
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            onTap: () {},
                            clickable: false,
                            wPadding: PaddingValues.p2,
                            hPadding: PaddingValues.p2,
                            transparentButton: true,
                            child: Icon(
                              Icons.close,
                              color: ColorsManager.transparent,
                              size: AppSize.s20.rs,
                            ),
                          ),
                          AppSize.s10.spaceW,
                          Expanded(
                            child: CustomText(
                              widget.title!,
                              textAlign: TextAlign.center,
                              textStyle:
                                  ThemesManager.blackWhiteRegular24(context),
                            ),
                          ),
                          AppSize.s10.spaceW,
                          CustomButton(
                            onTap: () => Navigator.pop(context),
                            wPadding: PaddingValues.p2,
                            hPadding: PaddingValues.p2,
                            transparentButton: false,
                            child: Icon(
                              Icons.close,
                              color: ColorsManager.blackColor,
                              size: AppSize.s20.rs,
                            ),
                          )
                        ],
                      ),
                      if (widget.showButtons) AppSize.s25.spaceH
                    ],
                  )
                else ...[
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: CustomButton(
                      onTap: () => Navigator.pop(context),
                      wPadding: PaddingValues.p2,
                      hPadding: PaddingValues.p2,
                      transparentButton: true,
                      child: Icon(
                        Icons.close,
                        color: ColorsManager.blackColor,
                        size: AppSize.s20.rs,
                      ),
                    ),
                  ),
                  if (widget.showButtons) AppSize.s5.spaceH,
                ],
                if (widget.showButtons) ...[
                  CustomButton(
                    onTap: widget.firstOnTap,
                    gradient: widget.gradient,
                    text: widget.firstText,
                  ),
                  AppSize.s15.spaceH,
                  CustomButton(
                    onTap: widget.secondOnTap,
                    isFilled: false,
                    text: widget.secondText,
                  )
                ] else
                  AppSize.s10.spaceH
              ],
            ),
          ),
        ),
      ],
    );
  }
}
