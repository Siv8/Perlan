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
  List<String> houseCards = [];
  List<String> playerCards = [];
  for(int i = 0; i < 2; i++){
    houseCards.add(CardNamer(houseHand[i]));
    playerCards.add(CardNamer(playerHand[i]));

  }
  int playerScore = CalculateScore(playerHand);

  String dealerVisibleCard = CardNamer(houseHand.first);
  if(dealerVisibleCard.contains("A")){
    print(houseHand);
  }
  print('\n========== GAME STATUS ==========');
  print('🧑 Your Hand: $playerHand');
  print('🎯 Your Score: $playerScore');
  print('🏛️ House Shows: $dealerVisibleCard');
  print('=================================');
}