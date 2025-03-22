import 'dart:math';

/*
Create a function called Shuffler which takes a List of integer as an input
and outputs a shuffled list of integers.

I.e, it should return a RANDOMIZED version of the list.
 */

List<int> Shuffler(List<int> theList){
  List<int> shuffledList = List.from(theList); // Create a copy of the input list
  Random random = Random();

  // Fisher-Yates shuffle algorithm
  for (int i = shuffledList.length - 1; i > 0; i--) {
    int j = random.nextInt(i + 1);
    int temp = shuffledList[i];
    shuffledList[i] = shuffledList[j];
    shuffledList[j] = temp;
  }

  return shuffledList;

}