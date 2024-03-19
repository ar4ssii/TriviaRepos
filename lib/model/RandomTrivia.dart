class RandomTrivia {
  final String question;
  final String correctAnswer;
  final String incorrectAnswers;
  final String category;

  RandomTrivia({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.category
  });

  factory RandomTrivia.fromJson(Map<String, dynamic> trivia) {

    return RandomTrivia(
      question: trivia["results"][0]["question"],
      correctAnswer: trivia["results"][0]["correct_answer"],
      incorrectAnswers: trivia["results"][0]["incorrect_answers"][0],
      category: trivia["results"][0]["category"]
    );
  }
}