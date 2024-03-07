import 'package:child_goods_store_flutter/widgets/app_font.dart';
import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final String? value;
  final List<String> values;
  final Function(String? value) onChanged;
  final String hint;
  final double? width;

  const AppDropdown({
    super.key,
    this.value,
    required this.values,
    required this.onChanged,
    required this.hint,
    this.width,
  });

  String? _valueCheck() {
    if (values.contains(value)) return value;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButton(
        isExpanded: width != null,
        value: _valueCheck(),
        menuMaxHeight: 300,
        hint: AppFont(hint),
        items: [
          for (var value in values)
            DropdownMenuItem(
              value: value,
              child: AppFont(value),
            ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
