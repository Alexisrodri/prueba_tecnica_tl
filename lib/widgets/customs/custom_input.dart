import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final Color background;
  final bool isPassword;
  final TextInputType? type;
  final IconData icon;
  final void Function(String)? onChanged;

  const CustomInput({
    super.key,
    required this.label,
    this.type,
    this.onChanged,
    this.background = Colors.white,
    this.icon = Icons.abc,
    this.isPassword = false,
  });

  @override
  CustomInputState createState() => CustomInputState();
}

class CustomInputState extends State<CustomInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: widget.isPassword ? _obscureText : false,
          keyboardType: widget.type,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget.label,
            hintStyle: TextStyle(color: Theme.of(context).primaryColor),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                )),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: _obscureText
                          ? Theme.of(context).disabledColor
                          : Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
