import 'dart:io';

/*
Create two functions called

PlaceBet(int currentBank)
- Asks the user how much they want to bet this round, return the amount.
- Solve edge cases when the bet is larger than current bank or if
the user chooses to bet 0.

BuyIn
- Ask the user for how much they want to buy in to black jack

These methods should return an integer.

BONUS POINTS:
Can you design the function such that it will ask the user again if
he doesn't input a integer?
 */

int PlaceBet(int currentBank) {
  int bet = 0;
  bool validBet = false;

  while (!validBet) {
    stdout.write("Place your bet: ");
    String? input = stdin.readLineSync();

    try {
      bet = int.parse(input ?? '');
      if (bet <= 0) {
        print("❌ You must bet more than 0!");
      } else if (bet > currentBank) {
        print("❌ You can't bet more than you have!");
      } else {
        validBet = true;
      }
    } catch (e) {
      print("❌ Invalid input. Please enter a valid number.");
    }
  }

  print("✅ You bet $bet");
  return bet;
}

int BuyIn() {
  int buyIn = 0;
  bool validInput = false;

  while (!validInput) {
    stdout.write("🎲 How much would you like to buy in with? ");
    String? input = stdin.readLineSync();

    try {
      buyIn = int.parse(input ?? '');
      if (buyIn <= 0) {
        print("❌ Buy-in must be greater than 0.");
      } else {
        validInput = true;
      }
    } catch (e) {
      print("❌ Invalid input. Please enter a number.");
    }
  }

  print("✅ You bought in with $buyIn chips.");
  return buyIn;
}