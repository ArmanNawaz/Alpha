class ChatModel {
  ChatModel(
      {required this.name,
      this.timer,
      this.currentMessage,
      this.branch,
      this.course});

  String name;
  var timer;
  var currentMessage;
  // late String profileUrl;
  var course;
  var branch;
}

// class ChatModel2 {
//   ChatModel2({required this.name, required this.course, required this.branch});
//
//   String name;
//   String course;
//   String branch;
// }