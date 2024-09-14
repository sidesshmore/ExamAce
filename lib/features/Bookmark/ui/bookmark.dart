import 'package:examace/features/Home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // Import for Markdown
import 'package:intl/intl.dart'; // Import for date formatting

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  int _expandedIndex = -1;

  void _removeBookmark(int index) {
    setState(() {
      bookmarkedMessages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    String _formatDate(DateTime date) {
      final DateFormat formatter = DateFormat('dd/MM/yy');
      return formatter.format(date);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Saved',
              style: TextStyle(
                  fontSize: screenWidth * 27 / 432,
                  fontWeight: FontWeight.w600)),
        ),
        body: ListView.builder(
          itemCount: bookmarkedMessages.length,
          itemBuilder: (context, index) {
            final message = bookmarkedMessages[index];
            final isExpanded = _expandedIndex == index;

            return Dismissible(
              key: Key(message.text),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                _removeBookmark(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Bookmark removed')),
                );
              },
              background: Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      message.text,
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: isExpanded ? null : 1,
                    ),
                    subtitle: isExpanded
                        ? null
                        : Text(
                            'Saved on ${_formatDate(message.createdAt)}',
                            style: TextStyle(color: Colors.grey),
                          ),
                    onTap: () {
                      setState(() {
                        _expandedIndex = isExpanded ? -1 : index;
                      });
                    },
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  if (isExpanded)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xff262626),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(Icons.close, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _expandedIndex = -1;
                                  });
                                },
                              ),
                            ),
                            MarkdownBody(
                              data: message.text,
                              styleSheet: MarkdownStyleSheet(
                                p: TextStyle(fontSize: 16, color: Colors.white),
                                strong: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
