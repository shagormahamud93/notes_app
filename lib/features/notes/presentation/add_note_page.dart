import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/core/theme/app_colors.dart';
import 'package:notes_app/core/utils/app_snackbar.dart';
import 'package:notes_app/core/widgets/app_button.dart';
import 'package:notes_app/core/widgets/app_text_field.dart';
import 'package:notes_app/features/notes/data/note_service.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final title = TextEditingController();
  final desc = TextEditingController();
  final service = NoteService();
  @override
  void dispose() {
    title.dispose();
    desc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("USER: ${FirebaseAuth.instance.currentUser}");
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.mainGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.go("/home"),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Add Note",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                //input field
                AppTextField(hint: "Title", controller: title),
                AppTextField(
                  hint: "Description",
                  controller: desc,
                  maxLines: 5,
                ),
                const Spacer(),
                AppButton(
                  text: "Save Note",
                  onPressed: () async {
                    final uid = FirebaseAuth.instance.currentUser?.uid;
                    if (uid == null) return;

                    final titleText = title.text.trim();
                    final descText = desc.text.trim();

                    // Validation
                    if (titleText.isEmpty || descText.isEmpty) {
                      AppSnackBar.show(
                        context,
                        message: "Field is required",
                        isError: true,
                      );
                      return;
                    }
                    await service.addNote(titleText, descText, uid);

                    //clear fields
                    title.clear();
                    desc.clear();

                    AppSnackBar.show(
                      context,
                      message: "Note saved successfully",
                    );
                    // context.go("/home");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
