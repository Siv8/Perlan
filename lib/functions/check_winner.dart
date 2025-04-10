/*
Create a function that takes in FOUR inputs.

houseHand which is list of integers
playerHand which is a list of integers
currentBet which is an integer
currentBankRoll which is an integer

Google the rules of black jack and calculate if house or player won the match.
Subtract / Add bets where applicable and return the updated currentBankRoll
of the user, which should have decreased/increased based on if he won or not.
 */



import 'package:BlackJack/functions/functions.dart';

int CheckWinner(List<int> playerHand, List<int> houseHand, int currentBankRoll, int currentBet){
  //Calculated player hand in blackJack
  int playerTotal = CalculateScore(playerHand);
  //Calculates houses hand in blackJack
  int houseTotal = CalculateScore(houseHand);

  //Player looses
  if (playerTotal > 21) {
    return currentBankRoll - currentBet;
  }
  //House looses
  if (houseTotal > 21){
    return currentBankRoll + currentBet; //check if this return the player his bet and more
  }
  //Player wins
  if (playerTotal > houseTotal){
    return currentBankRoll + houseTotal; //check if this return the player his bet and more
  }
  //Player and house ties
  if (playerTotal == houseTotal){
    return currentBankRoll;
  }
  //House wins
  if (houseTotal > playerTotal){
    return currentBankRoll - currentBet;
  }
  return 0;
}
