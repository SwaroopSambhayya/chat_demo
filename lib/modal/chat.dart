class ChatData {
  String name;
  String message;
  DateTime date;
  String chatType;
  String firstPerson;
  ChatData(
      {this.name, this.message, this.date, this.chatType, this.firstPerson});
  get chatinfo => this;
  setChatData(title, subtitle, date, chatType) {
    this.name = title;
    this.message = subtitle;
    this.date = date;
    this.chatType = chatType;
  }
}

List<ChatData> results = [
  ChatData(name: "Ashok Kumar", message: "Hi, how are you?", chatType: "s"),
  ChatData(
      name: "Project Group",
      message: "Hi, how are you?",
      chatType: "g",
      firstPerson: "Ashok"),
  ChatData(name: "Rahul Kumar", message: "Hello!", chatType: "s"),
  ChatData(
      name: "Ashok Raj", message: "Hello! nice to meet you", chatType: "s"),
  ChatData(name: "Rahul Kumar", message: "Yep", chatType: "s"),
];
