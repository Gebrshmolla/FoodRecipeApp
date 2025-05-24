import 'package:flutter/material.dart';

class SettingsBottomSheet extends StatefulWidget {
  final Color initialColor;
  final double initialTextSize;
  final String initialLanguage;
  final Function(Color, double, String) onChanged;

  const SettingsBottomSheet({
    super.key,
    required this.initialColor,
    required this.initialTextSize,
    required this.initialLanguage,
    required this.onChanged,
  });

  @override
  State<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  late Color selectedColor;
  late double textSize;
  late String language;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.initialColor;
    textSize = widget.initialTextSize;
    language = widget.initialLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Settings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            const Text("Background Color:"),
            Row(
              children: [
                _colorOption(Colors.white),
                _colorOption(Colors.grey.shade200),
                _colorOption(Colors.black12),
              ],
            ),
            const SizedBox(height: 10),

            const Text("Text Size:"),
            Slider(
              value: textSize,
              min: 12,
              max: 24,
              divisions: 6,
              label: textSize.round().toString(),
              onChanged: (value) => setState(() => textSize = value),
            ),

            const Text("Language:"),
            Row(
              children: [
                Radio<String>(
                  value: 'English',
                  groupValue: language,
                  onChanged: (value) => setState(() => language = value!),
                ),
                const Text("English"),
                Radio<String>(
                  value: 'Amharic',
                  groupValue: language,
                  onChanged: (value) => setState(() => language = value!),
                ),
                const Text("አማርኛ"),
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  widget.onChanged(selectedColor, textSize, language);
                  Navigator.pop(context);
                },
                child: const Text("Apply"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorOption(Color color) {
    return GestureDetector(
      onTap: () => setState(() => selectedColor = color),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: selectedColor == color ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
      ),
    );
  }
}
