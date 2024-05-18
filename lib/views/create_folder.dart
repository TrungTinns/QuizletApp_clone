import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/views/home.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import '../widgets/widget.dart';

class CreateFolder extends StatefulWidget {
  @override
  _CreateFolderState createState() => _CreateFolderState();
}

class _CreateFolderState extends State<CreateFolder> {
  final _formKey = GlobalKey<FormState>();
  late String folderName, folderDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      backgroundColor: authThemeColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Center(
                child: Text(
                  'Create new folder',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                autofocus: true,
                validator: (val) => val!.isEmpty ? "Enter folder name" : null,
                style: const TextStyle(color: textColor),
                cursorColor: textColor,
                decoration: const InputDecoration(
                  helperText: "Folder name",
                  helperStyle: TextStyle(color: textColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  )
                ),
                onChanged: (val) {
                  folderName = val;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: textColor),
                cursorColor: textColor,
                decoration: const InputDecoration(
                  helperText: "Description (optional)",
                  helperStyle: TextStyle(color: textColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  )
                ),
                onChanged: (val) {
                  folderDescription = val;
                },
              ),
              SizedBox(height: 20),
              blueButton(context, label: "Save", navigateTo: HomePage()),
            ],
          )
        )
      )
    );
  }
}