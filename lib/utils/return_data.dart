class ReturnData<T> {
  bool success = false;
  String? message = "";
  T? data;
  List<MessagesReturn>? messageList = [];

  ReturnData(
    this.success, {
    this.data,
    this.message,
    this.messageList,
  });
}

class MessagesReturn {
  String? message;
  bool? success;

  MessagesReturn({
    this.message,
    this.success,
  });
}
