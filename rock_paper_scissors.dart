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

List<String?> getMove(String? playerOne, String? playerTwo) {
  String? playerOneMove;
  String? playerTwoMove;

  while (validateMove(playerOneMove) == null) {
    stdout.write("$playerOne, enter your move (rock/paper/scissors): ");
    playerOneMove = stdin.readLineSync()?.toLowerCase();
  }

  while (validateMove(playerTwoMove) == null) {
    stdout.write("$playerTwo, enter your move (rock/paper/scissors): ");
    playerTwoMove = stdin.readLineSync()?.toLowerCase();
  }

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
    result = "Draw";
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
  }

  print("Score -> $playerOne: $playerOneScore | $playerTwo: $playerTwoScore");
}
