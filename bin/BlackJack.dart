import 'dart:io';

import 'package:BlackJack/functions/functions.dart';
import 'package:BlackJack/lib.dart';

/*
  Can you puzzle the methods together to form the game?
 */

void main() {
  List<int> playerHand = [];
  List<int> houseHand = [];
Welcome();

DeckOfCards();
Shuffler(DeckOfCards());
BuyIn();
InitialDeal(playerHand, houseHand, ShuffledDeck());
sleep(Duration(milliseconds: 500));
Status(playerHand, houseHand);
HitOrStay(playerHand, houseHand, ShuffledDeck());
sleep(Duration(milliseconds: 500));
HousePlays(houseHand, ShuffledDeck());
}
