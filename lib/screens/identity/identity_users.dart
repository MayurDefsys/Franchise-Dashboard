import 'package:flutter/material.dart';
import 'package:franchise_dashboard/widgets/drawer/custom_drawer.dart';

class IdentityUsers extends StatefulWidget {
  @override
  _IdentityUsersState createState() => _IdentityUsersState();
}

class _IdentityUsersState extends State<IdentityUsers> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Users",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu_rounded, color: Colors.blue),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 24.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Container(
            height: height * 0.4,
            child: Image.asset(
              'assets/images/bg_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Users",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "List of all Users",
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                        inactiveTrackColor: Colors.blue,
                      ),
                      Text(
                        "Compare to last year",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Add New',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(253, 57, 122, 10)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                height: height * 1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0)),
                margin: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: TextField(
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            filled: true,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "Type in your text",
                            fillColor: Colors.white70),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "James Gilbert",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.87),
                                        fontSize: 14.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "james@defsys.com.au	",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.87),
                                        fontSize: 14.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "1234567890",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.87),
                                        fontSize: 14.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Type",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.87),
                                        fontSize: 14.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Divider(
                                    height: 1.0,
                                    color: Color.fromRGBO(0, 0, 0, 0.87),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
