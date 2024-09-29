import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/business/repository/message/message/message.repository.dart';
import 'package:contact_message_app/data/database/database.data.dart';
import 'package:contact_message_app/data/provider/message/message/message.data.provider.dart';
import 'package:contact_message_app/data/provider/message/message/message.data.provider.impl.dart';
import 'package:get_it/get_it.dart';

class MessageRepositoryImpl extends MessageRepository {
  final MessageDataProvider messageDataProvider =
      GetIt.instance<MessageDataProviderImpl>();

  @override
  Future<List<MessageModel>> getAllMessagesByContactId(String contactId) async {
    return await messageDataProvider.getAllMessagesByContactId(contactId);
  }
}
