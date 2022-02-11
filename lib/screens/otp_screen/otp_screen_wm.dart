import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:route_issue/screens/otp_screen/otp_screen.dart';
import 'package:route_issue/screens/otp_screen/otp_screen_model.dart';

import '../../utils/keyboard_display_listener.dart';

class OtpScreenWM extends WidgetModel<OtpScreen, OtpScreenModel> {
  final TextEditingController otpFieldController;
  final FocusNode otpFieldFocusNode;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _keyboardListener = KeyboardDisplayListener();

  final _isKeyboardOpen = ValueNotifier(false);
  BuildContext get contextForPinCodeTextField => context;
  ValueListenable<bool> get isKeyboardOpen => _isKeyboardOpen;

  OtpScreenWM(
    this.otpFieldController,
    this.otpFieldFocusNode,
    OtpScreenModel model,
  ) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _keyboardListener.addListener(
      onShow: () => _isKeyboardOpen.value = true,
      onHide: () => _isKeyboardOpen.value = false,
    );
  }

  @override
  void dispose() {
    otpFieldController.dispose();
    otpFieldFocusNode.dispose();

    _keyboardListener.dispose();

    super.dispose();
  }

  void onSubmit() {
    // ignore: avoid_print
    print('Submited');
  }
}

OtpScreenWM createWM(BuildContext context) => OtpScreenWM(
      OTPTextEditController(codeLength: 6),
      FocusNode(),
      OtpScreenModel(),
    );
