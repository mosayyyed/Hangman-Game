import "dart:io";
import "dart:math";

class Hangman {
  late String selectedWord;
  late String guessedWord;
  int incorrectGuesses = 0;

  Hangman(List<String> words) {
    selectedWord = _getRandomWord(words);
    guessedWord = '*' * selectedWord.length;
  }

  String _getRandomWord(List<String> words) {
    final Random random = Random();
    return words[random.nextInt(words.length)];
  }

  bool guessLetter(String letter) {
    if (selectedWord.contains(letter)) {
      guessedWord = _updateGuessedWord(selectedWord, guessedWord, letter);
      return true;
    } else {
      incorrectGuesses++;
      return false;
    }
  }

  String _updateGuessedWord(String word, String guessedWord, String letter) {
    String updatedWord = '';
    for (int i = 0; i < word.length; i++) {
      if (word[i] == letter || guessedWord[i] != '*') {
        updatedWord += word[i];
      } else {
        updatedWord += '*';
      }
    }
    return updatedWord;
  }

  bool isGameOver() {
    return !guessedWord.contains('*') || incorrectGuesses == 6;
  }

  bool isWinner() {
    return !guessedWord.contains('*');
  }

  void printHangman() {
    const List<String> hangmanArt = [
      '''
      +---+
      |   |
          |
          |
          |
          |
    =========
    ''',
      '''
      +---+
      |   |
      O   |
          |
          |
          |
    =========
    ''',
      '''
      +---+
      |   |
      O   |
      |   |
          |
          |
    =========
    ''',
      '''
      +---+
      |   |
      O   |
     /|   |
          |
          |
    =========
    ''',
      '''
      +---+
      |   |
      O   |
     /|\\  |
          |
          |
    =========
    ''',
      '''
      +---+
      |   |
      O   |
     /|\\  |
     /    |
          |
    =========
    ''',
      '''
      +---+
      |   |
      O   |
     /|\\  |
     / \\  |
          |
    =========
    '''
    ];
    
    print(hangmanArt[incorrectGuesses]);
  }
}