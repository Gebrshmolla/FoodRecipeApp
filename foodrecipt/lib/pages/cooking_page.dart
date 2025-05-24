import 'package:flutter/material.dart';
import 'package:foodrecipt/widgets/discriptioncard.dart';
import 'package:foodrecipt/widgets/video_player.dart';

class CookingPage extends StatefulWidget {
  final Map<String, dynamic>? selectedItem;

  const CookingPage({super.key, this.selectedItem});

  @override
  State<CookingPage> createState() => _CookingPageState();
}

class _CookingPageState extends State<CookingPage> {
  String _textContent = '';
  String _originalText = '';
  bool _isLoading = true;
  String? _error;
  int _number = 1;

  @override
  void initState() {
    super.initState();
    _loadContent();
  }

  Future<void> _loadContent() async {
    try {
      if (widget.selectedItem != null &&
          widget.selectedItem!.containsKey('steps') &&
          widget.selectedItem!['steps'] != '') {
        final content = await DefaultAssetBundle.of(
          context,
        ).loadString(widget.selectedItem!['steps']);
        setState(() {
          _originalText = content;
          _textContent = _processContent(_originalText);
          _isLoading = false;
        });
      } else {
        setState(() {
          _textContent = 'No recipe text available';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to load recipe text: $e';
        _isLoading = false;
      });
    }
  }

  String _processContent(String originalText) {
    final numberRegex = RegExp(r'\b\d+(\.\d+)?\b');
    return originalText.replaceAllMapped(numberRegex, (match) {
      final numValue = double.tryParse(match.group(0)!);
      if (numValue == null) return match.group(0)!;
      final newValue = numValue * _number;
      return newValue.toStringAsFixed(1).replaceAll(RegExp(r'\.0\$'), '');
    });
  }

  List<String> _splitTextIntoPages(String text, int maxLines) {
    final lines = text.split('\n');
    final pages = <String>[];
    String currentPage = '';
    int currentLines = 0;

    for (var line in lines) {
      if (currentLines >= maxLines) {
        pages.add(currentPage.trim());
        currentPage = '$line\n';
        currentLines = 1;
      } else {
        currentPage += '$line\n';
        currentLines++;
      }
    }

    if (currentPage.isNotEmpty) {
      pages.add(currentPage.trim());
    }

    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.selectedItem?['description'] ?? 'Cooking Cultural Food',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setModalState) {
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Number: $_number',
                                style: const TextStyle(fontSize: 24),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      if (_number > 1) {
                                        setModalState(() {
                                          _number--;
                                          _textContent = _processContent(
                                            _originalText,
                                          );
                                        });
                                        setState(() {});
                                      }
                                    },
                                  ),
                                  Text(
                                    '$_number',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setModalState(() {
                                        _number++;
                                        _textContent = _processContent(
                                          _originalText,
                                        );
                                      });
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                ),
                                child: const Text(
                                  'OK',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
              ? Center(
                child: Text(_error!, style: const TextStyle(color: Colors.red)),
              )
              : LayoutBuilder(
                builder: (context, constraints) {
                  const textStyle = TextStyle(fontSize: 16, height: 1.5);
                  final lineHeight = textStyle.fontSize! * textStyle.height!;
                  final maxLines =
                      (constraints.maxHeight * 0.4 / lineHeight).floor();
                  final pages = _splitTextIntoPages(_textContent, maxLines);

                  return Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        child: VideoApp(
                          path: widget.selectedItem!['video'] ?? '',
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child:
                              pages.length == 1
                                  ? Discriptioncard(statement: pages[0])
                                  : PageView.builder(
                                    itemCount: pages.length,
                                    itemBuilder: (context, index) {
                                      return Discriptioncard(
                                        statement: pages[index],
                                        pageInfo:
                                            'Page ${index + 1} of ${pages.length}',
                                      );
                                    },
                                  ),
                        ),
                      ),
                    ],
                  );
                },
              ),
    );
  }
}
