import 'package:flutter/material.dart';
import 'package:lakini_gp/features/ai/presentation/views/result_by_Description.dart';

class SearchByDescription extends StatefulWidget {
  SearchByDescription({Key? key}) : super(key: key);
  static String id = "SearchByDescription";

  @override
  State<SearchByDescription> createState() => _SearchByDescriptionState();
}

class _SearchByDescriptionState extends State<SearchByDescription> {
  final _form = GlobalKey<FormState>();

  late String description;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(1, 23, 48, 1),
            Color.fromRGBO(1, 23, 48, 1),
            Color.fromRGBO(0, 7, 15, 1),
            Color.fromRGBO(0, 7, 15, 1),
            Color.fromRGBO(0, 2, 5, 1),
            Color.fromRGBO(1, 23, 48, 1),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * .17),
                child: SizedBox(
                  child: Image.asset(
                    alignment: Alignment.center,
                    "assets/location (2) 2.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              //

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(width, 100.0)),
                  border: const Border(
                      top: BorderSide(color: Colors.blue, width: 1)),
                ),
                child: Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * .14,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Add description",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Text(
                            "(30/450)",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              description = value;
                            });
                          },
                          validator: (value) {
                            if (value!.length < 30) {
                              return "Enter valid description of more then 30 characters!";
                            }
                          },
                          maxLines: 3,
                          maxLength: 450,
                          //keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 5, color: Colors.black),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              hintText: "Add description..."),
                        ),
                      ),
                      //
                      InkWell(
                        onTap: () {
                          if (_form.currentState!.validate()) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ResultByDescription(
                                  description: description);
                            }));
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width * .4,
                          height: height * .05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff06D83EA),
                                Color(0xff08B5FF),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            border: Border.all(width: 3, color: Colors.white),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search),
                              Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .03,
                      ),
                      //
                    ],
                  ),
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
