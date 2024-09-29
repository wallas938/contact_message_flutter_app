import 'package:contact_message_app/business/models/message/message.model.dart';

import 'package:contact_message_app/business/models/message/message.model.dart';

abstract class MessageRepository {
  Future<List<MessageModel>> getAllMessagesByContactId(String contactId);
}