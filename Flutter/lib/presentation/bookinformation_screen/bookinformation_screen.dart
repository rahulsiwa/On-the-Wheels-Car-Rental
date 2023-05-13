import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:taxi_final/presentation/bookinformation_screen/map.dart';

class Bookinginformation extends StatefulWidget {
  Map infoCarInfo;
  Bookinginformation(this.infoCarInfo);

  @override
  State<Bookinginformation> createState() => _BookinginformationState();
}

class _BookinginformationState extends State<Bookinginformation> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  DateTime pickupSelectedDate = DateTime.now();
  DateTime returnSelectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    print(widget.infoCarInfo);
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => LocationMap(
                          bookingInfo: {
                            'pickup': pickupSelectedDate.toIso8601String(),
                            'return': returnSelectedDate.toIso8601String(),
                            "carinfo": widget.infoCarInfo
                          },
                        )));
          }
        },
        child: Container(
          padding: EdgeInsets.all(8),
          height: 50,
          color: Color(0XFFE5B8F4),
          child: Center(
            child: Text(
              'Continue',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Text(
              'Booking Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pickup date and time',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                      ),
                      mode: DateTimeFieldPickerMode.dateAndTime,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) {
                        if (e == null) return 'Date cannot be null';
                        return null;
                      },
                      onDateSelected: (DateTime value) {
                        setState(() {
                          pickupSelectedDate = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Return date and time',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DateTimeFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.event_note),
                      ),
                      mode: DateTimeFieldPickerMode.dateAndTime,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (e) {
                        if (e == null) return 'Date cannot be null';
                        return null;
                      },
                      onDateSelected: (DateTime value) {
                        setState(() {
                          returnSelectedDate = value;
                        });
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
