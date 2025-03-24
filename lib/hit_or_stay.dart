import 'package:BlackJack/functions/functions.dart';
import 'dart:io';
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

void HitOrStay(List<int> playerHand, List<int> houseHand, List<int> deck, int bet) {
  bool split = false;
  List<List<int>> splitHands = [];

  // Check if player has a pair to split
  if (playerHand.length == 2 && playerHand[0] == playerHand[1]) {
    print('Do you want to split? [y/n]');
    String? input = stdin.readLineSync();

    if (input?.toLowerCase() == 'y') {
      split = true;
      splitHands.add([playerHand[0]]);
      splitHands.add([playerHand[1]]);
      print("You chose to split! You have two hands now.");

      bet *= 2; // Double the bet for the second hand

      // Now call Status() with split hands
      Status(splitHands, houseHand);  // Pass the list of split hands
    }
  }

  if (split) {
    // Handle both hands after split
    for (int i = 0; i < splitHands.length; i++) {
      print("\nHand ${i + 1} (Bet: $bet):");
      Status([splitHands[i]], houseHand);  // Wrap each split hand in a list

      while (true) {
        int choiceIndex = OptionSelect('What would you like to do?', ['Hit', 'Stay']);

        if (choiceIndex == 0) { // Hit
          int card = DealCard(deck);
          splitHands[i].add(card);
          print('🃏 You drew: ${CardNamer(card)}');
          Status([splitHands[i]], houseHand);  // Update Status with the new hand

          if (CalculateScore(splitHands[i]) > 21) {
            print('💥 You busted! Hand ${i + 1} is over.');
            break;
          }
        } else if (choiceIndex == 1) { // Stay
          print('🛑 You chose to stay with hand ${i + 1}.');
          break;
        }
      }
    }
  } else {
    // Normal Hit or Stay flow for the non-split hand
    while (true) {
      int choiceIndex = OptionSelect('What would you like to do?', ['Hit', 'Stay']);

      if (choiceIndex == 0) { // Hit
        int card = DealCard(deck);
        playerHand.add(card);
        print('🃏 You drew: ${CardNamer(card)}');
        Status([playerHand], houseHand);  // Wrap playerHand in a list

        if (CalculateScore(playerHand) > 21) {
          print('💥 You busted!');
          break;
        }
      } else if (choiceIndex == 1) { // Stay
        print('🛑 You chose to stay.');
        break;
      }
    }
  }
}