import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lakini_gp/core/utils/styles.dart';
import 'package:lakini_gp/features/home/data/models/item_model.dart';
import 'package:lakini_gp/features/home/presentation/views/wedgits/capitalize_extension.dart';

import '../item_details_screen.dart';

class CustomItem extends StatelessWidget {
  CustomItem({required this.itemModel});
  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ItemDetails.itemId,
          arguments: itemModel,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: height * .024,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue),
            color: Color(0xff182533),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: Container(
                  width: width * .33,
                  height: height * .18,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.network(
                      "https://wdw888lb-7075.uks1.devtunnels.ms/resources/${itemModel.itemImage}",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                width: width * .53,
                height: height * .18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * .01,
                    ),
                    Text(
                      "${itemModel.itemName}".capitalize(),
                      style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.w700, fontFamily: "inter"),
                    ),
                    Text(
                      "${itemModel.description}".capitalize(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle16,
                    ),
                    SizedBox(
                      height: height * .005,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xffFA9600),
                          size: 20,
                        ),
                        SizedBox(
                          width: width * .02,
                        ),
                        Flexible(
                          child: Text(
                            "${itemModel.foundPlace}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Styles.textStyle14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .006,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_view_month_rounded,
                          size: 20,
                        ),
                        SizedBox(
                          width: width * .02,
                        ),
                        Text(
                          "${itemModel.foundDate}".capitalize(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Styles.textStyle14,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
