import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

Widget FlashcardWidget(BuildContext context, {
  Key? key,
  required String frontContent,
  required String backContent,
  required GlobalKey<FlipCardState> cardKey,
  bool isFrontSide = true,
}) {
  return Center(
    child: GestureDetector(
      onTap: () {
        cardKey.currentState!.toggleCard();
      },
      child: FlipCard(
        key: cardKey,
        flipOnTouch: true,
        direction: FlipDirection.HORIZONTAL, 
        front: _buildCardSide(frontContent),
        back: _buildCardSide(backContent),
      ),
    ),
  );
}

Widget _buildCardSide(String text) {
  return Container(
      width: 400,
      height: 200,
      color: Color.fromARGB(181, 32, 38, 82), 
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }  

