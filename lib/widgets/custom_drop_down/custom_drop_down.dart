import 'package:flutter/material.dart';

class RegionDropDown extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;

  const RegionDropDown({Key key, this.text1, this.text2, this.text3})
      : super(key: key);

  @override
  _RegionDropDownState createState() => _RegionDropDownState();
}

class _RegionDropDownState extends State<RegionDropDown> {
  int _value1 = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 240, 240, 10),
        ),
        child: DropdownButtonFormField(
          value: _value1,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8.0),
              labelText: 'select Region',
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(240, 240, 240, 10)))),
          iconSize: 25.0,
          items: [
            DropdownMenuItem(
              child: Text(widget.text1),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text(widget.text2),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text(widget.text3),
              value: 3,
            ),
          ],
          onChanged: (int value) {
            setState(() {
              _value1 = value;
            });
          },
        ),
      ),
    );
  }
}

class StoreDropDown extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;

  const StoreDropDown({Key key, this.text1, this.text2, this.text3})
      : super(key: key);

  @override
  _StoreDropDownState createState() => _StoreDropDownState();
}

class _StoreDropDownState extends State<StoreDropDown> {
  int _value2 = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 240, 240, 10),
        ),
        child: DropdownButtonFormField(
          value: _value2,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8.0),
              isDense: true,
              labelText: 'select Store',
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(240, 240, 240, 10)))),
          iconSize: 25.0,
          items: [
            DropdownMenuItem(
              child: Text(widget.text1),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text(widget.text2),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text(widget.text3),
              value: 32,
            ),
          ],
          onChanged: (int value) {
            setState(() {
              _value2 = value;
            });
          },
        ),
      ),
    );
  }
}

class PeriodDropDown extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;

  const PeriodDropDown({Key key, this.text1, this.text2, this.text3})
      : super(key: key);

  @override
  _PeriodDropDownState createState() => _PeriodDropDownState();
}

class _PeriodDropDownState extends State<PeriodDropDown> {
  int _value3 = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 240, 240, 10),
        ),
        child: DropdownButtonFormField(
          value: _value3,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8.0),
              isDense: true,
              labelText: 'select Period',
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(240, 240, 240, 10)))),
          iconSize: 25.0,
          items: [
            DropdownMenuItem(
              child: Text(widget.text1),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text(widget.text2),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text(widget.text3),
              value: 31,
            ),
          ],
          onChanged: (int value) {
            setState(() {
              _value3 = value;
            });
          },
        ),
      ),
    );
  }
}
