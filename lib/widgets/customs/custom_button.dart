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
    this.isOutlined = false, // Valor predeterminado: ElevatedButton
    this.isDisabled = false, // Valor predeterminado: habilitado
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 16);

    return SizedBox(
      width: double.infinity,
      child: isOutlined
          ? OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: verticalPadding,
                side: BorderSide(
                  width: 1.5,
                  color: isDisabled
                      ? Colors.grey
                      : const Color(0xFF22A45D), // Gris si está deshabilitado
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
                  color: isDisabled
                      ? Colors.grey
                      : const Color(
                          0xFF22A45D), // Texto gris si está deshabilitado
                ),
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: verticalPadding,
                backgroundColor: isDisabled
                    ? Colors.grey
                    : const Color(0xFF22A45D), // Gris si está deshabilitado
                elevation: 0,
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
                  color: isDisabled
                      ? Colors.black38
                      : Colors.white, // Texto más claro si está deshabilitado
                ),
              ),
            ),
    );
  }
}
