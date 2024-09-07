import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onPress;
  final bool isOutlined;
  final bool isDisabled;

  const CustomButton({
    super.key,
    required this.text,
    this.onPress,
    this.isOutlined = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 16);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: isOutlined
          ? OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: verticalPadding,
                side: BorderSide(
                  width: 1.5,
                  color: isDisabled ? Colors.grey : Colors.blue,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4), // Borde casi cuadrado
                ),
              ),
              onPressed: isDisabled
                  ? null
                  : onPress, // Se deshabilita el botón si `isDisabled` es true
              child: Text(
                text,
                style: TextStyle(
                  color: isDisabled ? Colors.grey : Colors.blue,
                ),
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: verticalPadding,
                backgroundColor: isDisabled ? Colors.grey : Colors.blue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: isDisabled ? null : onPress,
              child: Text(
                text,
                style: TextStyle(
                  color: isDisabled ? Colors.black38 : Colors.white,
                ),
              ),
            ),
    );
  }
}
