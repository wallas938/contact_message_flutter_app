import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/data/database/database.data.dart';
import 'package:contact_message_app/data/provider/message/message/message.data.provider.dart';

class MessageDataProviderImpl extends MessageDataProvider {
  @override
  Future<List<MessageModel>> getAllMessagesByContactId(String contactId) async {
    return await Database().getMessagesByContactId(contactId);
  }
}
