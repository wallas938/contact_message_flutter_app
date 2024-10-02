import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/business/repository/message/message/message.repository.dart';
import 'package:contact_message_app/data/provider/message/message/message.data.provider.dart';
import 'package:contact_message_app/data/provider/message/message/message.data.provider.impl.dart';
import 'package:get_it/get_it.dart';

class MessageRepositoryImpl extends MessageRepository {
  final MessageDataProvider messageDataProvider =
      GetIt.instance<MessageDataProviderImpl>();

  @override
  Future<List<MessageModel>> getConversation(ContactConversationPair conversationData) async {
      return await messageDataProvider.getConversation(conversationData);
    }
  }
