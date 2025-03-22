import 'package:BlackJack/functions/functions.dart';

import 'functions/status.dart';
import 'functions/card_namer.dart';
import 'functions/deal_card.dart';
import 'functions/option_select.dart';
import 'functions/check_if_busted.dart';

/*
This is a complicated function,which accepts three inputs,

the current player hand (list of integers),
house hand (list of integers)
the current deck (list of integers)

It should be a infinite loop that asks the user if he
wants to draw a card or stay. If he chooses to stay,
then the loop should stop.

If he wants to draw a card, add a card to his hand,
tell him what card he drew and print the current information of the game.

If he busts after drawing this card, break the loop as well.
 */

void HitOrStay(List<int> playerHand, List<int> houseHand, List<int> deck) {
  bool i = true;
  while (i) {
    int choiceIndex = OptionSelect(
        'What would you like to do?', ['Hit', 'Stay',]);
   // String choice = (choiceIndex == 0) ? "Hit" : 'Stay';
    if (choiceIndex == 1) {
      int card = DealCard(ShuffledDeck());
      playerHand.add(card);
      print('🃏 You drew: ${CardNamer(card)}');

      Status(playerHand, houseHand);

      if (CheckIfBusted(playerHand)) {
        print('💥 You busted! Your turn is over.');
        break;
      }
    }
    if (choiceIndex == 2) {
      print('🛑 You chose to stay.');

      break;
    }
  }
}
