
/*
Create a function called DealCard

The function should accept a list of integers as an input. It should remove
the first item in that list, and return said item. Check example code

List
int myCard = DealCard(<int> deck = [1, 2, 3, 4];deck);
print(myCard); // Should print 1
print(deck); // Should print [2, 3, 4]

 */


int DealCard(List<int> deck){
  if (deck.isEmpty) {
    throw Exception('Deck is empty. Cannot deal a card.');
  }

  return deck.removeAt(0); // Removes and returns the first item

}