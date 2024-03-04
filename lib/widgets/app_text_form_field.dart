import 'package:child_goods_store_flutter/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  final String? hintText;
  final Function(String value)? onChange;
  final Function(String value)? onFieldSubmitted;
  final bool singleLine;
  final bool expanded;
  final bool dynamicSize;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool hasNext;
  final bool obscureText;

  const AppTextFormField({
    super.key,
    this.hintText,
    this.onChange,
    this.onFieldSubmitted,
    this.singleLine = true,
    this.expanded = false,
    this.dynamicSize = false,
    this.controller,
    this.keyboardType,
    this.hasNext = false,
    this.obscureText = false,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onChange(String value) {
    widget.onChange?.call(value);
  }

  void _unfocus() {
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      textInputAction: widget.hasNext ? TextInputAction.next : null,
      autocorrect: false,
      onTapOutside: (_) => _unfocus(),
      onChanged: _onChange,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: Sizes.size5,
          horizontal: Sizes.size10,
        ),
        hintText: widget.hintText,
      ),
      obscureText: widget.obscureText,
      cursorRadius: const Radius.circular(Sizes.size5),
      keyboardType: widget.keyboardType ??
          (widget.singleLine ? null : TextInputType.multiline),
      maxLines: widget.singleLine ? 1 : null,
      expands: widget.expanded,
    );
  }
}
