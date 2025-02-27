import 'package:flutter/material.dart';

class TextInputV1Widget extends StatefulWidget {
  final TextEditingController? textController;
  final String? erroText;
  final Function(String)? onChanged;
  final bool isPasswordInput;
  final bool isEmailInput;

  const TextInputV1Widget({super.key, required this.textController, this.erroText, this.onChanged, required this.isPasswordInput, required this.isEmailInput});

  @override
  State<TextInputV1Widget> createState() => _TextInputV1WidgetState();
}

class _TextInputV1WidgetState extends State<TextInputV1Widget> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      onChanged: widget.onChanged,
      obscureText: widget.isPasswordInput ? isVisible : false,
      decoration: InputDecoration(
        suffixIcon: widget.isPasswordInput ? 
          IconButton(
            onPressed: () {
              setState(() {
                isVisible ? isVisible = false : isVisible = true;
              });
            }, 
            icon: Icon(Icons.remove_red_eye)
          ) : 
          null,
        errorText: widget.erroText,
        
      ),
    );
  }
}