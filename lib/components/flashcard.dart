import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:quizlet_flashcard/services/helper.dart';

Widget FlashcardWidget(BuildContext context, {
  Key? key,
  required String frontContent,
  required String backContent,
  GlobalKey<FlipCardState>? cardKey,
  bool isFrontSide = true,
}) {
  return Center(
    child: GestureDetector(
      onTap: () {
        cardKey!.currentState!.toggleCard();
      },
      child: FlipCard(
        key: cardKey,
        flipOnTouch: true,
        direction: FlipDirection.HORIZONTAL, 
        front: _buildCardSide(frontContent,context),
        back: _buildCardSide(backContent,context),
      ),
    ),
  );
}

Widget _buildCardSide(String text, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.height * 0.5,
    child: Card(
      color: Colors.white, 
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: (){
                    toggleTextToSpeech(text);
                  }, 
                  icon: Icon(Icons.volume_down_outlined))
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  }  

