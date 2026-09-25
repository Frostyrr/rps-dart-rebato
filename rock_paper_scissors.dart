import 'dart:io';

const List<String> rps = ['rock', 'paper', 'scissors'];

List<String> getPlayerName() {
  stdout.write("Enter Player 1 name: ");
  String playerOne = stdin.readLineSync() ?? "Player 1";

  stdout.write("Enter Player 2 name: ");
  String playerTwo = stdin.readLineSync() ?? "Player 2";

  return [playerOne, playerTwo];
}

List<String?> getMove(String playerOne, String playerTwo) {
  stdout.write("$playerOne, enter your move (rock/paper/scissors): ");
  String? playerOneMove = stdin.readLineSync()?.toLowerCase();

  stdout.write("$playerTwo, enter your move (rock/paper/scissors): ");
  String? playerTwoMove = stdin.readLineSync()?.toLowerCase();

  validateMove(playerOne, playerTwo);

  return [playerOneMove, playerTwoMove];
}

dynamic validateMove(playerOneMove, playerTwoMove) {
  if (playerOneMove == playerTwoMove) {
    print("Draw");
    return null;
  }

  if (!rps.contains(playerOneMove) || !rps.contains(playerTwoMove)) {
    print("Invalid move.");
    return null;
  }
}

dynamic decideWinner(playerOne, playerTwo, playerOneMove, playerTwoMove) {
  String rock = rps[0];
  String paper = rps[1];
  String scissors = rps[2];

  dynamic result;

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
