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

int PlaceBet(int bankRoll){
  print("Place a bet!");
  String bet = stdin.readLineSync()?? "";
  int parsedBet = 0;

  try {
    parsedBet = int.parse(bet);
    print("You bet $parsedBet");
  }catch(e){
    print("Please type a number for the bet you would like to place!");
  }
  return parsedBet;
}

int BuyIn(){
  int buyIn = 10;
  int bet = 0;
  bool Betting = true;
  while(Betting) {

    String BuyIn = stdin.readLineSync() ?? '';
    try {
      bet = int.parse(BuyIn);
    } catch (e) {
      print('Please enter buy in number!');
    }
    if (bet <= buyIn) {
      print("Cannot place a bet lower than buy in");
      print("Please place a valid bet!");
      continue;
    } else if(bet >= buyIn){
      print("You placed $bet for buy in");
      break;
    }
  }
  return bet;
}