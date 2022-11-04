import 'dart:async';

import 'package:flutter/material.dart';

import 'input_helper.dart';

typedef void CaretMoved(Offset? globalCaretPosition);
typedef void TextChanged(String text);

// Helper widget to track caret position.
class TrackingTextInput extends StatefulWidget {
  TrackingTextInput(
      {Key? key,
      this.onCaretMoved,
      this.onTextChanged,
      this.decoration,
      this.controller,
      this.isObscured = false,
      this.style,
      this.cursorColor,
      this.validator,
      this.focusNode})
      : super(key: key);
  final CaretMoved? onCaretMoved;
  final TextChanged? onTextChanged;
  final TextEditingController? controller;
  final TextStyle? style;
  final Color? cursorColor;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final InputDecoration? decoration;
  final bool isObscured;
  @override
  _TrackingTextInputState createState() => _TrackingTextInputState();
}

class _TrackingTextInputState extends State<TrackingTextInput> {
  final GlobalKey _fieldKey = GlobalKey();
  late final TextEditingController _textController;
  Timer? _debounceTimer;
  @override
  initState() {
    _textController = widget.controller ?? TextEditingController();
    _textController.addListener(() {
      // We debounce the listener as sometimes the caret position is updated after the listener
      // this assures us we get an accurate caret position.
      if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        if (_fieldKey.currentContext != null) {
          // Find the render editable in the field.
          final RenderObject? fieldBox =
              _fieldKey.currentContext?.findRenderObject();
          var caretPosition =
              fieldBox is RenderBox ? getCaretPosition(fieldBox) : null;

          widget.onCaretMoved?.call(caretPosition);
        }
      });
      widget.onTextChanged?.call(_textController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: widget.decoration,
      key: _fieldKey,
      style: widget.style,
      cursorColor: widget.cursorColor,
      controller: _textController,
      focusNode: widget.focusNode,
      obscureText: widget.isObscured,
      validator: widget.validator,
    );
  }
}
