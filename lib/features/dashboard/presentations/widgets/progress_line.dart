import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class ProgressLine extends StatefulWidget {
  Color? color;
  int? percentage;


  ProgressLine({
    Key? key,
    this.color = mtPrimaryColor,
    @required this.percentage,
  }) : super(key: key);

  @override
  State<ProgressLine> createState() => _ProgressLineState();
}

class _ProgressLineState extends State<ProgressLine> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: widget.color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (widget.percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}