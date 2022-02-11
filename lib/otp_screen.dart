import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:route_issue/otp_screen_wm.dart';

class OtpScreen extends ElementaryWidget<OtpScreenWM> {
  const OtpScreen({
    Key? key,
    required WidgetModelFactory<OtpScreenWM> wmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(OtpScreenWM wm) {
    return Scaffold(
      key: wm.scaffoldKey,
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Test',
              ),
              const SizedBox(height: 16),
              PinCodeTextField(
                animationCurve: Curves.easeOut,
                hintCharacter: '0',
                animationDuration: Duration.zero,
                appContext: wm.contextForPinCodeTextField,
                length: 6,
                controller: wm.otpFieldController,
                focusNode: wm.otpFieldFocusNode,
                autoDisposeControllers: false,
                onChanged: (_) {
                  return;
                },
                onCompleted: (_) => wm.onSubmit(),
                mainAxisAlignment: MainAxisAlignment.center,
                animationType: AnimationType.none,
                keyboardType: TextInputType.number,
                autoFocus: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                useHapticFeedback: true,
                hapticFeedbackTypes: HapticFeedbackTypes.medium,
                textInputAction: TextInputAction.send,
                autoDismissKeyboard: false,
                pinTheme: const PinTheme.defaults(
                  fieldWidth: 32,
                  fieldOuterPadding: EdgeInsets.symmetric(horizontal: 8),
                ),
                showCursor: false,
                scrollPadding: const EdgeInsets.only(bottom: 120),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
