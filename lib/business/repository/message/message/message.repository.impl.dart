import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/business/repository/message/message/message.repository.dart';
import 'package:contact_message_app/data/database/database.data.dart';

class MessageRepositoryImpl extends MessageRepository {
  @override
  Future<List<MessageModel>> getAllMessagesByContactId(String contactId) async {
    return Database().getMessagesByContactId(contactId);
  }
}
