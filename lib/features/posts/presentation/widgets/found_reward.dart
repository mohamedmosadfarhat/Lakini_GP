import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class FoundReward extends StatelessWidget {
  const FoundReward({Key? key, this.textEditingController}) : super(key: key);
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.06,
      width: width * 0.9,
      decoration: BoxDecoration(
        color: const Color(0xff0E1823),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            child: TextField(
              controller: textEditingController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0000',
                  hintStyle: Styles.textStyle18
                      .copyWith(color: const Color(0xff555557))),
            ),
          ),
          Text(
            'EGP',
            style: Styles.textStyle18,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
