import 'package:flutter/material.dart';
import 'package:franchise_dashboard/widgets/card/graph_card.dart';
import 'package:franchise_dashboard/widgets/custom_drop_down/custom_drop_down.dart';

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 10),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height * 0.4,
              child: Image.asset(
                'assets/images/bg_image.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DashBoard",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Welcome to the Rashays Dashboard",
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Container(
                  height: height * 1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegionDropDown(
                        text1: "Defsys",
                        text2: "Defsys",
                        text3: "Defsys",
                      ),
                      StoreDropDown(
                        text1: "Defsys",
                        text2: "Defsys",
                        text3: "Defsys",
                      ),
                      PeriodDropDown(
                        text1: "Defsys",
                        text2: "Defsys",
                        text3: "Defsys",
                      ),
                      Row(
                        children: [
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                          Text("Compare to last year")
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 100.0,
                          child: ListView.builder(
                            itemCount: 6,
                            itemBuilder: (BuildContext context, index) {
                              return CustomGraphCard();
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
