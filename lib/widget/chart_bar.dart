import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctTotal;

  CharBar(this.label, this.spendingAmount, this.spendingPctTotal) {}

  @override
  Widget build(BuildContext context) {
    print(spendingPctTotal);

    return LayoutBuilder(builder: (context, constraint) {
      return Column(
        children: [
          Container(
            height: constraint.maxHeight * 0.15,
            child: FittedBox(
              child: Text('${spendingAmount.toStringAsFixed(0)}€'),
            ),
          ),
          SizedBox(
            height: constraint.maxHeight * 0.05,
          ),
          Container(
            height: constraint.maxHeight * 0.60,
            width: 10,
            child:
                Stack(alignment: AlignmentDirectional.bottomStart, children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                  heightFactor: spendingPctTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))
            ]),
          ),
          SizedBox(
            height: constraint.maxHeight * 0.05,
          ),
          Container(
            height: constraint.maxHeight * 0.15,
            child: FittedBox(
              child: Text(label),
            ),
          ),
        ],
      );
    });
  }
}
