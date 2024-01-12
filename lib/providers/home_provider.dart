import 'package:flutter/foundation.dart';
import 'package:goflex/features/message/data/models/message_model.dart';

class HomeProvider extends ChangeNotifier {
  final List<MessageModel> _messages = [];

  List<MessageModel> get messages => _messages;

  addNewMessage(MessageModel message) {
    _messages.add(message);
    notifyListeners();
  }
}
