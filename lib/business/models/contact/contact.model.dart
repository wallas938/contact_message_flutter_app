import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  final String id;
  final String name;
  final String profile;
  final int scores;
  final ContactRole role;

  const ContactModel(
      {required this.id,
      required this.name,
      required this.profile,
      required this.scores,
      required this.role});

  const ContactModel.initialUserState()
      : id = 'NULL',
        name = "Unknown",
        profile = "NO",
        scores = 0,
        role = ContactRole.contact;

  const ContactModel.initialReceiverState()
      : id = 'NULL',
        name = "Unknown",
        profile = "NO",
        scores = 0,
        role = ContactRole.contact;

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
