
/*
Create a function called CalculateScore that can calculate the score of a given hand of cards.
The score is blackjack score, so the following rules apply

An ace can either be 1 or 11
10, Jack, Queen and King count as 10

For this score function, we will do it a bit differently than real life.

If a card is an Ace, it's AUTOMATICALLY an 11. Any ace that comes after that
gets the score 1. So if the method gets the hand [1, 1] the score would be 12

  Here are few test cases to test your method against

  hand = [1, 1] -> Score 12
  hand = [13, 1] -> Score 21
  hand = [1, 13, 1] -> Score 22
  hand = [1, 1, 1, 1] -> Score 14
  hand = [11, 13] -> Score 20
  hand = [7, 1] -> Score 18

 */



int CalculateScore(List<int> hand) {
  int totalScore = 0;
  int aceCount = 0;

  for (int card in hand) {
    if (card == 1) {
      // Ace: treat as 11 initially
      totalScore += 11;
      aceCount++;
    } else if (card >= 11 && card <= 13) {
      // Face cards: Jack, Queen, King → 10 points
      totalScore += 10;
    } else {
      totalScore += card;
    }
  }

  // Adjust Aces if total goes over 21
  while (totalScore > 21 && aceCount > 0) {
    totalScore -= 10; // Treat one Ace as 1 instead of 11
    aceCount--;
  }

  return totalScore;
}