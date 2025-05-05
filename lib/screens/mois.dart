import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:video_player/video_player.dart';

class MonthsPage extends StatelessWidget {
  final List<String> monthsList = [
    'January', 'February', 'March', 'April',
    'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Language Months")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: monthsList.length,
          itemBuilder: (context, index) {
            String month = monthsList[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.blueAccent),
                ),
              ),
              onPressed: () => _showSignDialog(context, month),
              child: Text(
                month,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }
void _showSignDialog(BuildContext context, String month) {
  showDialog(
    context: context,
    builder: (_) => MediaDialog(month: month),
  );
}
  /*void _showSignDialog(BuildContext context, String month) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(month),
        content: Image.asset(
          'assets/mois/$month.gif',
           // تأكد من تطابق أسماء الصور
          fit: BoxFit.cover,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }*/
  
}


class MediaDialog extends StatefulWidget {
  final String month;
  const MediaDialog({super.key, required this.month});

  @override
  _MediaDialogState createState() => _MediaDialogState();
}

class _MediaDialogState extends State<MediaDialog> {
  late VideoPlayerController _controller;
  bool isVideo = false;

  final List<String> videoMonths = ['August', 'July', 'June', 'May', 'October','September'];

  @override
  void initState() {
    super.initState();
    isVideo = videoMonths.contains(widget.month);

    if (isVideo) {
      final path = 'assets/mois/${widget.month}.mp4';
      _controller = VideoPlayerController.asset(path)
        ..initialize().then((_) {
          _controller.setLooping(true);
          _controller.play();
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    if (isVideo) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.month),
      content: isVideo
          ? _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const SizedBox(
                  height: 150,
                  child: Center(child: CircularProgressIndicator()),
                )
          : Image.asset(
              'assets/mois/${widget.month}.gif',
              fit: BoxFit.cover,
            ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Close"),
        ),
      ],
    );
  }
}