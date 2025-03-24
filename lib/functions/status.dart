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
void Status(List<List<int>> playerHands, List<int> houseHand) {
  List<String> houseCards = [];
  String dealerVisibleCard = CardNamer(houseHand.first); // The visible card

  print('\n========== GAME STATUS ==========');

  // Display each player hand
  for (int i = 0; i < playerHands.length; i++) {
    List<int> hand = playerHands[i];
    int playerScore = CalculateScore(hand);
    String handCards = hand.map((card) => CardNamer(card)).join(', ');

    print('🧑 Hand ${i + 1}: [$handCards]');
    print('🎯 Your Score for Hand ${i + 1}: $playerScore');
  }

  // Show only one house card
  print('🏛️ House Shows: $dealerVisibleCard');
  print('=================================');
}