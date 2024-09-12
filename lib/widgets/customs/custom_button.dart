import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onPress;
  final bool isOutlined;
  final bool isDisabled;
  final IconData? icon;
  final TextAlign? aligntext;

  const CustomButton({
    super.key,
    required this.text,
    this.onPress,
    this.icon,
    this.aligntext = TextAlign.center,
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
                  color: isDisabled
                      ? Theme.of(context).disabledColor
                      : Theme.of(context).primaryColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: isDisabled ? null : onPress,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        textAlign: aligntext,
                        style: TextStyle(
                          color: isDisabled
                              ? Theme.of(context).disabledColor
                              : Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    if (icon != null) ...[
                      const SizedBox(width: 5),
                      Icon(
                        icon,
                        color: isDisabled
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).primaryColor,
                      ),
                    ],
                  ],
                ),
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: verticalPadding,
                backgroundColor: isDisabled
                    ? Theme.of(context).disabledColor
                    : Theme.of(context).primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: isDisabled ? null : onPress,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      textAlign: aligntext,
                      style: TextStyle(
                        color: isDisabled
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
                  if (icon != null) ...[
                    const SizedBox(width: 5),
                    Icon(icon, color: Colors.white),
                  ],
                ],
              ),
            ),
    );
  }
}
