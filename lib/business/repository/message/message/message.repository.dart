import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';

abstract class MessageRepository {
  Future<List<MessageModel>> getConversation(ContactConversationPair conversationData);
}