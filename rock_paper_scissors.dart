import 'dart:io';

const List<String> rps = ['rock', 'paper', 'scissors'];

List<String> getPlayerName() {
  stdout.write("Enter Player 1 name: ");
  String? playerOne = stdin.readLineSync();
  if (playerOne == null || playerOne.trim().isEmpty) {
    playerOne = "Player 1";
    print("(No name entered. Using 'Player 1'.)");
  }

  stdout.write("Enter Player 2 name: ");
  String? playerTwo = stdin.readLineSync();
  if (playerTwo == null || playerTwo.trim().isEmpty) {
    playerTwo = "Player 2";
    print("(No name entered. Using 'Player 2'.)");
  }

  return [playerOne, playerTwo];
}

void clearScreen() {
  for (int i = 0; i < 30; i++) {
    print("");
  }
  print("(screen cleared)");
}

List<String?> getMove(String? playerOne, String? playerTwo) {
  String? playerOneMove;
  String? playerTwoMove;

  do {
    stdout.write("$playerOne, enter your move (rock/paper/scissors): ");
    playerOneMove = stdin.readLineSync()?.toLowerCase();
  } while (validateMove(playerOneMove) == null);

  do {
    stdout.write("$playerTwo, enter your move (rock/paper/scissors): ");
    playerTwoMove = stdin.readLineSync()?.toLowerCase();
  } while (validateMove(playerTwoMove) == null);

  return [playerOneMove, playerTwoMove];
}

String? validateMove(playerMove) {
  if (!rps.contains(playerMove)) {
    print("Invalid move.");
    return null;
  }

  return playerMove;
}

String? decideWinner(playerOne, playerTwo, playerOneMove, playerTwoMove) {
  String rock = rps[0];
  String paper = rps[1];
  String scissors = rps[2];

  String? result;

  if (playerOneMove == playerTwoMove) {
    return null;
  }

  if (playerOneMove == rock && playerTwoMove == paper) {
    result = "$playerTwo wins the round!";
  } else if (playerOneMove == rock && playerTwoMove == scissors) {
    result = "$playerOne wins the round!";
  } else if (playerOneMove == paper && playerTwoMove == rock) {
    result = "$playerOne wins the round!";
  } else if (playerOneMove == paper && playerTwoMove == scissors) {
    result = "$playerTwo wins the round!";
  } else if (playerOneMove == scissors && playerTwoMove == paper) {
    result = "$playerOne wins the round!";
  } else if (playerOneMove == scissors && playerTwoMove == rock) {
    result = "$playerTwo wins the round!";
  }

  return result;
}

void main() {
  int playerOneScore = 0;
  int playerTwoScore = 0;
  List<String> playerNames = getPlayerName();
  String playerOne = playerNames[0];
  String playerTwo = playerNames[1];
  String? choice;
  int rounds = 1;
  do {
    print("===== ROCK, PAPER, SCISSORS =====");
    print("--- Rounds $rounds ---");
    List<String?> playerMoves = getMove(playerOne, playerTwo);
    String? playerOneMove = playerMoves[0];
    String? playerTwoMove = playerMoves[1];

    String? result = decideWinner(
      playerOne,
      playerTwo,
      playerOneMove,
      playerTwoMove,
    );

    if (result != null) {
      print("Result: $result");

      if (result.contains(playerOne)) {
        playerOneScore++;
      } else if (result.contains(playerTwo)) {
        playerTwoScore++;
      }
    } else {
      print("Result: Draw");
    }
    print("Score -> $playerOne: $playerOneScore | $playerTwo: $playerTwoScore");

    stdout.write("Play again? (y/n): ");
    choice = stdin.readLineSync()?.trim().toLowerCase();

    if (choice == "y") {
      rounds++;
    }
  } while (choice != "n");

  String overAllWinner;

  if (playerOneScore > playerTwoScore) {
    overAllWinner = "$playerOne";
  } else if (playerOneScore < playerTwoScore) {
    overAllWinner = "$playerTwo";
  } else {
    overAllWinner = "Draw";
  }

  print("===== FINAL SCORE =====");
  print("$playerOne: $playerOneScore | $playerTwo: $playerTwoScore");
  print("Overall winner: $overAllWinner");
}
