class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answers); // "of" constructor function creates a new list based on existing list , basically it copies a list and make a new list .
    shuffledAnswers.shuffle(); 
    return shuffledAnswers;
  }
}

 // List.of(answers).shuffle() this is known as chaininig .
 // "shuffle()" returns nothing so we have to create a new variable so that we can return the shuffled list .