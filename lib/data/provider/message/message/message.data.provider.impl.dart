import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/data/database/database.data.dart';
import 'package:contact_message_app/data/provider/message/message/message.data.provider.dart';
import 'package:get_it/get_it.dart';

class MessageDataProviderImpl extends MessageDataProvider {
  @override
  Future<List<MessageModel>> getConversation(ContactConversationPair conversationData) async {
    return GetIt.instance<Database>().getConversation(conversationData);
  }

  @override
  Future<MessageModel> postMessage(MessageModel message) async {
    return await GetIt.instance<Database>().postMessage(message);
  }
}
