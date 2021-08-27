import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue; //input de texto /validador
  final String? Function(String?)? validator; //input de texto /validador
  final TextEditingController? controller; //input de texto /validador
  final void Function(String value) onChanged;//Dar feedback sobre o input de texto do usuario 

  const InputTextWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            TextFormField(
              controller: controller, //input de texto /validador
              onChanged: onChanged,
              initialValue: initialValue, //input de texto /validador
              validator: validator, //input de texto /validador
              style: TextStyles.input,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: label,
                  labelStyle: TextStyles.input,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal:
                                18), //recebe os icones de insert_boleto_page
                        child: Icon(icon, color: AppColors.primary),
                      ),
                      Container(
                        width: 1,
                        height: 48,
                        color: AppColors.stroke,
                      ),
                    ],
                  ),
                  border: InputBorder.none),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.stroke,
            )
          ],
        ),
      ),
    );
  }
}
