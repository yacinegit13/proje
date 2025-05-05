import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPage extends StatefulWidget {
  final CameraDescription camera;

  const CameraPage({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  String? _gestureResult;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _checkPermissions();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high, // Use high resolution for better detection
    );
    _initializeControllerFuture = _controller.initialize();
  }

  Future<void> _checkPermissions() async {
    if (await Permission.camera.request().isGranted) {
      return;
    } else {
      setState(() {
        _gestureResult = 'Camera permission denied';
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takeAndSendImage() async {
    try {
      setState(() {
        _gestureResult = null; // Clear previous result
      });
      final image = await _controller.takePicture();
      final file = File(image.path);
      print('Captured image: ${image.path}');

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://localhost:8000/server/'), // Update with server IP if not local
      );
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file.path,
        contentType: MediaType('image', 'jpeg'),
      ));

      var response = await request.send().timeout(Duration(seconds: 10), onTimeout: () {
        throw Exception('Server timed out');
      });
      var responseData = await response.stream.bytesToString();
      print('Response: $responseData');
      if (response.statusCode != 200) {
        setState(() {
          _gestureResult = 'Server error: ${response.statusCode}';
        });
        return;
      }
      var result = json.decode(responseData);
      setState(() {
        _gestureResult = result['gesture'] ?? result['error'];
      });
    } catch (e) {
      setState(() {
        _gestureResult = 'Error: $e';
      });
    }
  }

  Future<void> _pickAndSendImage() async {
    try {
      setState(() {
        _gestureResult = null; // Clear previous result
      });
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final file = File(image.path);
      print('Picked image: ${image.path}');

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://localhost:8000/server/'), // Update with server IP if not local
      );
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        file.path,
        contentType: MediaType('image', 'jpeg'),
      ));

      var response = await request.send().timeout(Duration(seconds: 10), onTimeout: () {
        throw Exception('Server timed out');
      });
      var responseData = await response.stream.bytesToString();
      print('Response: $responseData');
      if (response.statusCode != 200) {
        setState(() {
          _gestureResult = 'Server error: ${response.statusCode}';
        });
        return;
      }
      var result = json.decode(responseData);
      setState(() {
        _gestureResult = result['gesture'] ?? result['error'];
      });
    } catch (e) {
      setState(() {
        _gestureResult = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gesture Recognition')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  return CameraPreview(_controller);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _takeAndSendImage,
                  child: const Text('Take Image'),
                ),
                ElevatedButton(
                  onPressed: _pickAndSendImage,
                  child: const Text('Pick from Gallery'),
                ),
              ],
            ),
          ),
          if (_gestureResult != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Gesture: $_gestureResult',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}