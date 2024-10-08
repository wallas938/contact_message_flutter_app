
class MessageModel {
  final String id;
  final String content;
  final DateTime date;
  final String from;
  final String to;

  MessageModel({required this.id, required this.content, required this.date, required this.from, required this.to});

  @override
  String toString() {
    return "id => $id; content => $content; date => $date; from => $from; to => $to;";
  }
}