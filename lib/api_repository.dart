import 'package:flutter_phone_state/flutter_phone_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';



void emergencyButtonPressed() async {
  final String username = 'hashtagsteam1@gmail.com';
  final String password = 'hashtags2020';

  final smtpServer = gmail(username, password);

  // TODO: retrieve list of contacts.
  final contacts = ['9674429152', '9433285155'];
  // TODO: retrieve primary contact.
  final primaryContact = '9674429152';

  final Position _currentPosition =
      await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  // TODO: retrieve the name of the current user.
  final String messageText =
      'User needs your help!!!\n\nLocate him at https://www.google.com/maps/place/${_currentPosition.latitude},${_currentPosition.longitude}?zoom=14';
  print(messageText);

  final message = Message()
    ..from = Address(username, 'YouSafe')
    ..recipients.add('suvranilduttabiswas@gmail.com')
    ..subject = 'Alert for Rescue'
    ..text = messageText;

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print(e);
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }

  // FlutterPhoneState.startPhoneCall("9433285155"); 
}
