import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final otpFieldController = OTPTextEditController(codeLength: 6);
  final otpFieldFocusNode = FocusNode();

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
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
                appContext: context,
                length: 6,
                controller: widget.otpFieldController,
                focusNode: widget.otpFieldFocusNode,
                autoDisposeControllers: false,
                onChanged: (_) {
                  return;
                },
                onCompleted: (_) {
                  return;
                },
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
