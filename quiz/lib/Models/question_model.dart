class QuestionModel {
  const QuestionModel(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> shruflleAnswers() {
    final shruffledAnswers = List.of(answers);
    shruffledAnswers.shuffle();
    return shruffledAnswers;
  }
}
