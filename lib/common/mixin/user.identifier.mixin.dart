import 'package:contact_message_app/business/models/contact/contact.model.dart';

mixin UserIdentifierMixin {
  bool isCurrentUser(String userId, ContactModel contact) {

    return userId == contact.id;
  }
}