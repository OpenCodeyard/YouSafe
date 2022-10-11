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
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(15),
            backgroundColor: Colors.red,
            shape: CircleBorder(),
          ),
          child: Icon(
            Icons.call,
            color: Colors.white,
            size: 36,
          ),
          onPressed: () async {
            final status = await emergencyButtonPressed();
            if (status) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Email Sent'),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
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
