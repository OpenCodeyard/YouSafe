import 'package:flutter/material.dart';
import 'package:yousafe/api_repository.dart';

class EmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency'),
      ),
      body: Center(
        child: RaisedButton(
          padding: EdgeInsets.all(15),
          child: Icon(
            Icons.call,
            color: Colors.white,
            size: 36,
          ),
          color: Colors.red,
          shape: CircleBorder(),
          onPressed: () async {
            final status = await emergencyButtonPressed();
            if (status) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Email Sent'),
                ),
              );
            } else {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error occurred'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
