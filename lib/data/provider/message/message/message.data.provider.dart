import 'package:contact_message_app/business/models/message/message.model.dart';

abstract class MessageDataProvider {
  Future<List<MessageModel>> getAllMessagesByContactId(String contactId);
}