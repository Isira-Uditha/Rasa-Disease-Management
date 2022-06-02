
class Message {
  final String text;
  final bool check;

  Message({
    required this.text,
    required this.check,
  });
}

final List<Message> messages = [
  Message(
    text: "...",
    check: false,
  ),
  Message(
    text: "Hi!",
    check: true,
  ),
  Message(
    text: "Hello!",
    check: false,
  ),
  Message(
    text: "How can I help you?",
    check: false,
  ),
  Message(
    text:
    "What can you do?",
    check: true,
  ),
  Message(
    text: "I can give you interesting facts about Pineapple.",
    check: false,
  ),
  Message(
    text: "I want to know about pineapple Wilt",
    check: true,
  ),
  Message(
    text: "The wilt disease is thought to be caused by a virus transmitted by mealybugs (Dysmicoccus brevipes). The mealybugs feed on an infected plant and then move to other plants with the help of ants or wind. Wilt is transmitted when the mealybug feeds on young leaves. The amount of wilt in a field is related to the number of mealybugs present, the length time they feed and the activity of ants.\n\nAbove-ground symptoms appear some time after the mealybugs have fed and develop most rapidly on young plants. Visible symptoms may take between 3 and 8 months to develop. Plants which have recovered and do not show obvious symptoms can still be sources of infection.",
    check: false,
  ),
  Message(
    text: "Is it spreading?",
    check: true,
  ),
  Message(
    text: "Of course, due to the activity of ants the mealybug will spread to the cultivations, hence it may spread the will diseases to the whole cultivation.",
    check: false,
  ),
  Message(
    text: "How can I avoid it?",
    check: true,
  ),
  Message(
    text: "Pineapple Wilt Disease Managment\n\n1) Always select healthy planting material.\n\n2) If less than 3% of plants show wilt symptoms, pull up affected plants by hand and destroy them.\n\n3) If more than 3% of plants show wilt symptoms, implement the recommended mealybug control spray program.\n\n4) If more than 10% of plants show wilt symptoms, not use the field as a source of planting material.\n\n5) Keep headlands and field boundaries free of weeds, fallen timber and rubbish, as these encourage populations of ants and mealybugs.",
    check: false,
  ),
];