import 'package:flutter/material.dart';

class addWidget extends StatefulWidget {
  addWidget({Key? key}) : super(key: key);

  @override
  State<addWidget> createState() => _addWidgetState();
}

class _addWidgetState extends State<addWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Expense'),
          centerTitle: true,
        ),
        backgroundColor: Colors.blue,
        body: ListView(children: [
          Column(
            children: [
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'How much?',
                          style: TextStyle(color: Colors.white54, fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 50),
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "0",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                            )),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          color: Colors.white),
                      width: double.infinity,
                      height: 572,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]));
  }
}
