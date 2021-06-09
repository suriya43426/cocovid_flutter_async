import 'package:flutter/material.dart';

class StatBox extends StatelessWidget {

  final String? title;
  final int? total;
  final Color? backgroundColor;

  const StatBox({this.title, this.total, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor!,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title!, style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          ),
          Expanded(
            child: Text(
              '${total ?? '....'}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
