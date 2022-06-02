class Response {
  String recipient_id = "";
  String text = "";

  Response(String recipientId, String text) {
    this.recipient_id = recipientId;
    this.text = text;
  }

  Response.fromJson(Map json)
      : recipient_id=json['recipient_id'],
        text=json['text'];

}