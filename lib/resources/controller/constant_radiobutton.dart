import 'package:flutter/material.dart';

class ConstantRadioGroup<T> extends StatefulWidget {
  final List<T> items;
  final T value;
  final void Function(T?)? onChanged;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Color activeColor;
  final Widget Function(T item) itemBuilder;

  ConstantRadioGroup({
    required this.items,
    required this.value,
    this.onChanged,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.activeColor = Colors.blue,
    required this.itemBuilder,
  });

  @override
  State<ConstantRadioGroup<T>> createState() => _ConstantRadioGroupState<T>();
}

class _ConstantRadioGroupState<T> extends State<ConstantRadioGroup<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: widget.items.map<Widget>((item) {
        return Row(
          children: [
            Radio<T>(
              value: item,
              groupValue: widget.value,
              onChanged: widget.onChanged,
              activeColor: widget.activeColor,
            ),
            widget.itemBuilder(item), // You can replace this with your custom label
          ],
        );
      }).toList(),
    );
  }
}
