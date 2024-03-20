import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:lakini_gp/core/utils/styles.dart';

void buildDialog({required BuildContext context,required String title,required String message,required void Function() function,required String order}) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  final AlertDialog alert = AlertDialog(
    backgroundColor: const Color.fromRGBO(14, 24, 35, 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    contentTextStyle: Styles.textStyle16,
    title: Text(
      title,
      style: Styles.textStyle18,
    ),
    content: SizedBox(
      height: height * 0.15,
      child: Column(
        children: <Widget>[
          const Divider(
            color: Colors.grey,
          ),
           Text(message,style: Styles.textStyle16,),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(201, 43, 39, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: function,
                    child: Text(
                      order,
                      style: TextStyle(color: Colors.white),
                     /*  style: GoogleFonts.lato(color: Colors.white), */
                    )),
              ),
              SizedBox(
                width: width * 0.035,
              ),
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          mainColor.withOpacity(0.6)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontFamily: 'Raleway',color: Colors.white),
                      /* style: GoogleFonts.lato(color: Colors.white), */
                    )),
              ),
            ],
          ),
        ],
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return alert;
    },
    barrierDismissible: true,
    //barrierColor: Colors.orange.withOpacity(0.3)
  );
}
