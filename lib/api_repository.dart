import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';
import 'package:geolocator/geolocator.dart';

void emergencyButtonPressed() async {
  // TODO: retrieve list of contacts.
  final contacts = ['9674429152', '9433285155'];
  // TODO: retrieve primary contact.
  final primaryContact = '9674429152';

  final Position _currentPosition =
      await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  // TODO: retrieve the name of the current user.
  final String message =
      'User needs your help!!!\n\nLocate him at https://www.google.com/maps/place/${_currentPosition.latitude},${_currentPosition.longitude},14z';

  _sendSMS(message, contacts);
}

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
