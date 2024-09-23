import 'package:contact_message_app/business/models/contact/contact_enum.dart';
import 'package:equatable/equatable.dart';

class ContactModel extends Equatable{
  final String name;
  final String profile;
  final int scores;
  final ContactRole role;

  const ContactModel({required this.name, required this.profile, required this.scores, required this.role});

  @override
  // TODO: implement props
  List<Object?> get props => [name, profile, scores, role];
}
