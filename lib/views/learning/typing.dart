import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/model/quiz.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class TypingScreen extends StatefulWidget {
  final List<Quiz> quizz;
  TypingScreen({super.key, required this.quizz});

  @override
  State<TypingScreen> createState() => _TypingScreenState();
}

class _TypingScreenState extends State<TypingScreen> {
  int _currIdx = 0;
  final TextEditingController _controller = TextEditingController();
  bool _isTextEntered = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkInput);
  }

  @override
  void dispose() {
    _controller.removeListener(_checkInput);
    _controller.dispose();
    super.dispose();
  }

  void _checkInput() {
    setState(() {
      _isTextEntered = _controller.text.isNotEmpty;
    });
  }

  void _nextQuestion() {
    if (_currIdx < widget.quizz.length - 1) {
      setState(() {
        _currIdx += 1;
        _controller.clear();
        _isTextEntered = false;
      });
    } else {
      // Thực hiện hành động khi hết câu hỏi
      // Ví dụ: điều hướng đến màn hình kết quả hoặc hiển thị thông báo
      print("Quiz Completed!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: authThemeColor,
      body: Container(
        padding: EdgeInsets.only(top: 80, left: 12, right: 12),
        child: Column(
          children: [
            Container(
              height: 400,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      widget.quizz[_currIdx].question,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                icon: Icon(Icons.send, color: Colors.blue),
                hintText: 'Hint Text',
                helperText: 'Helper Text',
                counterText: '${_controller.text.length} characters',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(child: Container()),
            if (_isTextEntered)
              TextButton(
                onPressed: _nextQuestion,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _currIdx < widget.quizz.length - 1 ? "Next" : "Done",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
