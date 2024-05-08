void main() {
  final List<String> words = ["android", "flutter", "dart", "sdk", "ieee"];
  Hangman game = Hangman(words);

  while (!game.isGameOver()) {
    game.printHangman();
    print(game.guessedWord);
    print("Enter a letter: ");
    String input = stdin.readLineSync()?.toLowerCase() ?? '';
    game.guessLetter(input);
  }

  if (game.isWinner()) {
    print("✅ You won The word was: ${game.selectedWord}");
  } else {
    print("❌ You lost The word was: ${game.selectedWord}");
  }
}