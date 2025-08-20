import 'package:flutter/material.dart';
import 'package:note_app/view/widget/coustom_button.dart';
import 'package:note_app/view/widget/coustom_text_field.dart';

// ignore: must_be_immutable
class CoustomBottomSheet extends StatefulWidget {
  CoustomBottomSheet({
    super.key,
    required this.onTap,
    required this.titleController,
    required this.contentController,
    required this.titleBottomSheet,
    required this.titleButton,
    this.color = -1,
  });

  final String titleBottomSheet;
  final String titleButton;
  int color;
  final void Function(int) onTap;
  final TextEditingController titleController;
  final TextEditingController contentController;

  @override
  State<CoustomBottomSheet> createState() => _CoustomBottomSheetState();
}

class _CoustomBottomSheetState extends State<CoustomBottomSheet> {
  final List<int> colorsInt = [
    0xff577590,
    0xffF3CA40,
    0xffF2A541,
    0xffF08A4B,
    0xffD78A76,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.titleBottomSheet,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            CoustomTextField(
              controller: widget.titleController,
              hintText: 'Title',
            ),
            SizedBox(height: 12),
            CoustomTextField(
              controller: widget.contentController,
              hintText: 'Content',
              maxLines: 3,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colorsInt.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.color = colorsInt[index];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: widget.color == -1
                                    ? index == 0
                                          ? 4
                                          : 0
                                    : widget.color == colorsInt[index]
                                    ? 4
                                    : 0,
                              ),
                              borderRadius: BorderRadius.circular(50),
                              color: Color(colorsInt[index]),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 70,
                            width: 70,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            CoustomButton(
              onTap: () =>
                  widget.onTap(widget.color == -1 ? 0xff577590 : widget.color),
              titleButton: widget.titleButton,
            ),
          ],
        ),
      ),
    );
  }
}
