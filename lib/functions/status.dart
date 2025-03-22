import 'score_function.dart';
import 'card_namer.dart';

/*
Create a function that prints the current "Status" of the match,
called ... uh... Status! Yes! That's it!

The function should take in two lists of integers, the playerHand and houseHand.

Using the score function and cardnamer, print info that informs the user
on what hand he has, his score and the hand of the house.

(Check out blackjack rules on what we actually get to know from the house
hand before showdown.)

 */
String GetCardNames(List<int> hand) {
  return hand.map((card) => CardNamer(card)).join(', ');
}



void Status(List<int> playerHand, List<int> houseHand) {
<<<<<<< Updated upstream
  List<int> playerCards = [];
  for(int playerCard = 0; playerCard <= playerHand.length; playerCard++){
    CardNamer(houseHand[playerCard]);
    CardNamer(playerHand[playerCard]);
    playerCards.add(playerCard);
  }
=======
  String playerCards = GetCardNames(playerHand);
>>>>>>> Stashed changes
  int playerScore = CalculateScore(playerHand);

  String dealerVisibleCard = CardNamer(houseHand.first);

  print('\n========== GAME STATUS ==========');
  print('🧑 Your Hand: $playerCards');
  print('🎯 Your Score: $playerScore');
  print('🏛️ House Shows: $dealerVisibleCard');
  print('=================================');
}