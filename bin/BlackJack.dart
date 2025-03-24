import 'dart:io';

import 'package:BlackJack/functions/functions.dart';
import 'package:BlackJack/lib.dart';

/*
  Can you puzzle the methods together to form the game?
 */

void main() {
  Welcome();
  int bank = BuyIn(); // Set the initial bank here, only once
  bool playAgain = true;

  // Game loop
  while (playAgain && bank > 0) {
    print("\n🎲 Your current bank: $bank");

    // Place a bet
    int bet = PlaceBet(bank);

    if (bet > bank) {
      print("❌ You do not have enough funds to place that bet.");
      continue;  // Restart the round if the player tries to bet more than they have
    }

    // Play the round and update the bank
    bank = playRound(bank, bet);  // Update the bank after each round

    // Ask if the player wants to continue playing
    print("\nWould you like to play again? (y/n)");
    String? input = stdin.readLineSync();
    if (input?.toLowerCase() != 'y') {
      playAgain = false;  // Exit the loop and end the game
    }
  }

  print("Thank you for playing! Your final bank is $bank.");
}

int playRound(int bank, int bet) {
  List<int> playerHand = [];
  List<int> houseHand = [];

  List<int> deck = ShuffledDeck();

  InitialDeal(playerHand, houseHand, deck);
  sleep(Duration(milliseconds: 500));

  // Wrap playerHand in a list to pass it to Status as List<List<int>>
  Status([playerHand], houseHand);

  HitOrStay(playerHand, houseHand, deck, bet);

  int playerScore = CalculateScore(playerHand);
  int houseScore = CalculateScore(houseHand);

  HousePlays(houseHand, deck);
  houseScore = CalculateScore(houseHand);

  // Evaluate result and update bank
  if (playerScore > 21) {
    print("💥 You busted. You lose your $bet chips.");
    bank -= bet;
  } else if (houseScore > 21 || playerScore > houseScore) {
    print("🎉 You win! You gain $bet chips.");
    bank += bet;
  } else if (playerScore == houseScore) {
    print("🤝 It's a tie! Bet returned.");
  } else {
    print("👎 House wins. You lose $bet chips.");
    bank -= bet;
  }

  print("💰 Your updated bank: $bank");

  return bank; // Return the updated bank after the round
}