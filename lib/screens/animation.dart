/*import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MainScreen extends StatefulWidget {
  final String translatedText;

  const MainScreen({super.key, required this.translatedText});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> _words = [];
  int _currentWordIndex = 0;
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  String? _errorMessage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _words =
        widget.translatedText
            .split(' ')
            .where((word) => word.trim().isNotEmpty)
            .toList();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    if (_words.isEmpty) {
      setState(() {
        _errorMessage = 'There are no words to translate';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final currentWord = _words[_currentWordIndex];
    final videoPath = _getVideoForWord(currentWord);

    try {
      await _controller?.dispose();

      _controller = VideoPlayerController.asset(videoPath)
        ..initialize()
            .then((_) {
              setState(() {
                _isLoading = false;
              });
              _controller?.setLooping(false);
              _controller?.addListener(_videoListener);
            })
            .catchError((error) {
              setState(() {
                _isLoading = false;
                _errorMessage = 'No video available for the word"$currentWord"';
              });
            });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'An error occurred: ${e.toString()}';
      });
    }
  }

  void _videoListener() {
    if (_controller != null &&
        !_controller!.value.isPlaying &&
        _controller!.value.position == _controller!.value.duration) {
      setState(() {
        _isPlaying = false;
      });
    }
  }

  String _getVideoForWord(String word) {
    // Convertir le mot en minuscules pour une correspondance insensible à la casse
    final lowerWord = word.toLowerCase();

    // Map des vidéos avec toutes les clés en minuscules
    final Map<String, String> videoMap = {
      "Hello": "assets/videos/Hello(240p).mp4",
      "Goodbye": "assets/videos/Goodbye(240p).mp4",
      "Whisper": "assets/videos/Whisper(240p).mp4",
      "Myself": "assets/videos/Myself(240p).mp4",
      "Herself": "assets/videos/Herself(240p).mp4",
      "Himself": "assets/videos/Himself(240p).mp4",
      "Itself": "assets/videos/Itself(240p).mp4",
      "Push": "assets/videos/Push(240p).mp4",
      "Pull": "assets/videos/Pull(240p).mp4",
      "Give": "assets/videos/Give(240p).mp4",
      "Hold": "assets/videos/Hold(240p).mp4",
      "Climb": "assets/videos/Climb(240p).mp4",
      "Take": "assets/videos/Take(240p).mp4",
      "Clothes": "assets/videos/Clothes(240p).mp4",
      "Blouse": "assets/videos/Blouse(240p).mp4",
      "Dress": "assets/videos/Dress(240p).mp4",
      "Necklace": "assets/videos/Necklace(240p).mp4",
      "Necktie": "assets/videos/Necktie(240p).mp4",
      "Glasses": "assets/videos/Glasses(240p).mp4",
      "Bowtie": "assets/videos/Bowtie(240p).mp4",
      "Cup": "assets/videos/Cup(240p).mp4",
      "Glass": "assets/videos/Glass(240p).mp4",
      "Berry": "assets/videos/Berry(240p).mp4",
      "Pear": "assets/videos/Pear(240p).mp4",
      "Deer": "assets/videos/Deer(240p).mp4",
      "Racoon": "assets/videos/Racoon(240p).mp4",
      "Skunk": "assets/videos/Skunk(240p).mp4",
      "Rooster": "assets/videos/Rooster(240p).mp4",
      "Turkey": "assets/videos/Turkey(240p).mp4",
      "Camel": "assets/videos/Camel(240p).mp4",
      "Wolf": "assets/videos/Wolf(240p).mp4",
      "Zebra": "assets/videos/Zebra(240p).mp4",
      "Card": "assets/videos/Card(240p).mp4",
      "Sign": "assets/videos/Sign(240p).mp4",
      "Jail": "assets/videos/Jail(240p).mp4",
      "Tent": "assets/videos/Tent(240p).mp4",
      "Reduce": "assets/videos/Reduce(240p).mp4",
      "Spread": "assets/videos/Spread(240p).mp4",
      "Freeze": "assets/videos/Freeze(240p).mp4",
      "Melt": "assets/videos/Melt(240p).mp4",
      "Warn": "assets/videos/Warn(240p).mp4",
      "Punish": "assets/videos/Punish(240p).mp4",
      "Chew": "assets/videos/Chew(240p).mp4",
      "Bite": "assets/videos/Bite(240p).mp4",
      "Measure": "assets/videos/Measure(240p).mp4",
      "Balance": "assets/videos/Balance(240p).mp4",
      "Vote": "assets/videos/Vote(240p).mp4",
      "Divide": "assets/videos/Divide(240p).mp4",
      "Shine": "assets/videos/Shine(240p).mp4",
      "Beg": "assets/videos/Beg(240p).mp4",
      "Bleed": "assets/videos/Bleed(240p).mp4",
      "Boil": "assets/videos/Boil(240p).mp4",
      "Fox": "assets/videos/Fox(240p).mp4",
      "Law": "assets/videos/Law(240p).mp4",
      "License": "assets/videos/License(240p).mp4",
      "Queen": "assets/videos/Queen(240p).mp4",
      "Shake": "assets/videos/Shake(240p).mp4",
      "Spread Scatter": "assets/videos/Spread Scatter(240p).mp4",
      "Sweat": "assets/videos/Sweat(240p).mp4",
      "Share": "assets/videos/Share(240p).mp4",
      "Bleed and Blood": "assets/videos/Bleed and Blood(240p).mp4",
      "Throw out": "assets/videos/Throw out(240p).mp4",
      "Wed": "assets/videos/Wed(240p).mp4",
      "Lesson and Course": "assets/videos/Lesson and Course(240p).mp4",
      "Coffee bad for you": "assets/videos/Coffee bad for you(240p).mp4",
      "President": "assets/videos/President(240p).mp4",
      "Decorate": "assets/videos/Decorate(240p).mp4",
      "Hands communicating": "assets/videos/Hands communicating(240p).mp4",
      "Give 6 meanings": "assets/videos/Give 6 meanings(240p).mp4",
      "Shhh": "assets/videos/Shhh(240p).mp4",
      "Me and I": "assets/videos/Me and I(240p).mp4",
      "My and Mine": "assets/videos/My and Mine(240p).mp4",
      "You": "assets/videos/You(240p).mp4",
      "Car": "assets/videos/Car(240p).mp4",
      "Telephone": "assets/videos/Telephone(240p).mp4",
      "Eat and Food": "assets/videos/Eat and Food(240p).mp4",
      "Drink": "assets/videos/Drink(240p).mp4",
      "Camera": "assets/videos/Camera(240p).mp4",
      "Strong": "assets/videos/Strong(240p).mp4",
      "Pray": "assets/videos/Pray(240p).mp4",
      "Stink": "assets/videos/Stink(240p).mp4",
      "Crazy": "assets/videos/Crazy(240p).mp4",
      "A little bit": "assets/videos/A little bit(240p).mp4",
      "None": "assets/videos/None(240p).mp4",
      "Big": "assets/videos/Big(240p).mp4",
      "Small": "assets/videos/Small(240p).mp4",
      "Throw": "assets/videos/Throw(240p).mp4",
      "Catch": "assets/videos/Catch(240p).mp4",

      "Drop": "assets/videos/Drop(240p).mp4",
      "Move": "assets/videos/Move(240p).mp4",
      "Carry": "assets/videos/Carry(240p).mp4",
      "Writing": "assets/videos/Writing(240p).mp4",
      "Break": "assets/videos/Break(240p).mp4",
      "Tear or rip": "assets/videos/Tear or rip(240p).mp4",
      "Exercise": "assets/videos/Exercise(240p).mp4",
      "Swim": "assets/videos/Swim(240p).mp4",
      "Tennis": "assets/videos/Tennis(240p).mp4",
      "Ball": "assets/videos/Ball(240p).mp4",
      "Boxing": "assets/videos/Boxing(240p).mp4",
      "Fishing": "assets/videos/Fishing(240p).mp4",
      "Archery": "assets/videos/Archery(240p).mp4",
      "Baseball": "assets/videos/Baseball(240p).mp4",
      "Strangle": "assets/videos/Strangle(240p).mp4",
      "Nervous": "assets/videos/Nervous(240p).mp4",
      "Time": "assets/videos/Time(240p).mp4",
      "Baby": "assets/videos/Baby(240p).mp4",
      "Umbrella": "assets/videos/Umbrella(240p).mp4",
      "Faucet": "assets/videos/Faucet(240p).mp4",
      "Razor": "assets/videos/Razor(240p).mp4",
      "Brush": "assets/videos/Brush(240p).mp4",
      "Ring": "assets/videos/Ring(240p).mp4",
      "Iron": "assets/videos/Iron(240p).mp4",
      "Sweep or broom": "assets/videos/Sweep or broom(240p).mp4",
      "Vacuum": "assets/videos/Vacuum(240p).mp4",
      "Sew": "assets/videos/Sew(240p).mp4",
      "Scissors": "assets/videos/Scissors(240p).mp4",
      "Face": "assets/videos/Face(240p).mp4",
      "Eyebrow": "assets/videos/Eyebrow(240p).mp4",
      "Eye": "assets/videos/Eye(240p).mp4",
      "Nose": "assets/videos/Nose(240p).mp4",
      "Mouth": "assets/videos/Mouth(240p).mp4",
      "Tooth": "assets/videos/Tooth(240p).mp4",
      "Hands": "assets/videos/Hands(240p).mp4",
      "Body": "assets/videos/Body(240p).mp4",
      "We": "assets/videos/We(240p).mp4",
      "Our": "assets/videos/Our(240p).mp4",
      "Your": "assets/videos/Your(240p).mp4",
      "Her": "assets/videos/Her(240p).mp4",
      "Their": "assets/videos/Their(240p).mp4",
      "Here": "assets/videos/Here(240p).mp4",
      "There": "assets/videos/There(240p).mp4",
      "This": "assets/videos/This(240p).mp4",
      "These": "assets/videos/These(240p).mp4",
      "Other": "assets/videos/Other(240p).mp4",
      "Any": "assets/videos/Any(240p).mp4",
      "Don't": "assets/videos/Don't(240p).mp4",
      "Not": "assets/videos/Not(240p).mp4",
      "Remind": "assets/videos/Remind(240p).mp4",

      // Ajoutez ici toutes vos autres vidéos avec les clés en minuscules
    };

    // Retourne le chemin de la vidéo ou une vidéo par défaut si non trouvée
    return videoMap[lowerWord] ?? 'assets/videos/default.mp4';
  }

  void _playVideo() {
    if (_controller?.value.isInitialized ?? false) {
      setState(() {
        _isPlaying = true;
      });
      _controller?.play();
    }
  }

  void _pauseVideo() {
    setState(() {
      _isPlaying = false;
    });
    _controller?.pause();
  }

  void _changeWord(int index) {
    if (index < 0 || index >= _words.length) return;

    setState(() {
      _currentWordIndex = index;
      _isPlaying = false;
    });
    _initializeVideo();
  }

  @override
  void dispose() {
    _controller?.removeListener(_videoListener);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWord = _words.isNotEmpty ? _words[_currentWordIndex] : '';

    return Scaffold(
      appBar: AppBar(
        title: Text("sign language"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
                height: 400,
                child: Center(
                  child:
                      _isLoading
                          ? CircularProgressIndicator()
                          : _errorMessage != null
                          ? Text(_errorMessage!)
                          : _controller != null &&
                              _controller!.value.isInitialized
                          ? AspectRatio(
                            aspectRatio: _controller!.value.aspectRatio,
                            child: VideoPlayer(_controller!),
                          )
                          : Text('No video available'),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: _isPlaying ? _pauseVideo : _playVideo,
                  ),
                  IconButton(
                    icon: Icon(Icons.replay),
                    onPressed: () {
                      _controller?.seekTo(Duration.zero);
                      _playVideo();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(currentWord, style: TextStyle(fontSize: 32)),
              SizedBox(height: 10),
              Text(widget.translatedText, style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed:
                        _currentWordIndex > 0
                            ? () => _changeWord(_currentWordIndex - 1)
                            : null,
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed:
                        _currentWordIndex < _words.length - 1
                            ? () => _changeWord(_currentWordIndex + 1)
                            : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// Removed misplaced constructor
late final SupabaseClient supabase;
final Map<String, String> _videoUrlCache = {};

Future<void> runIntegrationTest(List<String> words) async {
  
  // 1. Test de connexion
  await testSupabaseConnection();
  
  // 2. Test de récupération de données
  await testVideoFetchingLocalDebugMainRenamedV2();
  
  // 3. Test de lecture vidéo
  if (words.isNotEmpty) {
      Future<void> playVideo() async {
        // Add logic to play the video
      }

      Future<void> pauseVideo() async {
        // Add logic to pause the video
      }

      Future<void> changeWord(int index) async {
        // Add logic to handle word change
      }

      await changeWord(0);
      await playVideo();
      await Future.delayed(Duration(seconds: 2));
    await pauseVideo();
  }
}



Future<void> testVideoFetchingLocalDebugMainRenamedV2() async {
  final testWords = ['hello', 'goodbye', 'test_missing_word'];
  
  for (final word in testWords) {
    try {
      await _getVideoUrlForWord(word);
    // ignore: empty_catches
    } catch (e) {
    }
  }
}

Future<String> _getVideoUrlForWord(String word) async {
  // 1. Check cache first
  if (_videoUrlCache.containsKey(word)) {
    return _videoUrlCache[word]!;
  }

  // 2. Try Supabase exact match
  try {
    final response = await supabase
        .from('sign_videos')
        .select('video_url')
        .eq('word', word)
        .maybeSingle();

    if (response != null && response['video_url'] != null) {
      final url = response['video_url'] as String;
      _videoUrlCache[word] = url;
      return url;
    }

    // 3. Try Supabase partial match if exact not found
    final fallbackResponse = await supabase
        .from('sign_videos')
        .select('video_url')
        .ilike('word', '%$word%')
        .limit(1)
        .maybeSingle();

    if (fallbackResponse != null && fallbackResponse['video_url'] != null) {
      final url = fallbackResponse['video_url'] as String;
      _videoUrlCache[word] = url;
      return url;
    }
    
  // ignore: empty_catches
  } catch (e) {
  }

  // 4. Fallback to local assets
  String getLocalVideoForWord(String word) {
    final videoMap = {
      "hello": "assets/videos/Hello(240p).mp4",
      "goodbye": "assets/videos/Goodbye(240p).mp4",
      "whisper": "assets/videos/Whisper(240p).mp4",
      "myself": "assets/videos/Myself(240p).mp4",
      "herself": "assets/videos/Herself(240p).mp4",
      "himself": "assets/videos/Himself(240p).mp4",
      "itself": "assets/videos/Itself(240p).mp4",
      "push": "assets/videos/Push(240p).mp4",
      "pull": "assets/videos/Pull(240p).mp4",
      "give": "assets/videos/Give(240p).mp4",
      "hold": "assets/videos/Hold(240p).mp4",
      "climb": "assets/videos/Climb(240p).mp4",
      "take": "assets/videos/Take(240p).mp4",
      "clothes": "assets/videos/Clothes(240p).mp4",
      "blouse": "assets/videos/Blouse(240p).mp4",
      "dress": "assets/videos/Dress(240p).mp4",
      "necklace": "assets/videos/Necklace(240p).mp4",
      "necktie": "assets/videos/Necktie(240p).mp4",
      "glasses": "assets/videos/Glasses(240p).mp4",
      "bowtie": "assets/videos/Bowtie(240p).mp4",
      "cup": "assets/videos/Cup(240p).mp4",
      "glass": "assets/videos/Glass(240p).mp4",
      "berry": "assets/videos/Berry(240p).mp4",
      "pear": "assets/videos/Pear(240p).mp4",
      "deer": "assets/videos/Deer(240p).mp4",
      "racoon": "assets/videos/Racoon(240p).mp4",
      "skunk": "assets/videos/Skunk(240p).mp4",
      "rooster": "assets/videos/Rooster(240p).mp4",
      "turkey": "assets/videos/Turkey(240p).mp4",
      "camel": "assets/videos/Camel(240p).mp4",
      "wolf": "assets/videos/Wolf(240p).mp4",
      "zebra": "assets/videos/Zebra(240p).mp4",
      "card": "assets/videos/Card(240p).mp4",
      "sign": "assets/videos/Sign(240p).mp4",
      "jail": "assets/videos/Jail(240p).mp4",
      "tent": "assets/videos/Tent(240p).mp4",
      "reduce": "assets/videos/Reduce(240p).mp4",
      "spread": "assets/videos/Spread(240p).mp4",
      "freeze": "assets/videos/Freeze(240p).mp4",
      "melt": "assets/videos/Melt(240p).mp4",
      "warn": "assets/videos/Warn(240p).mp4",
      "punish": "assets/videos/Punish(240p).mp4",
      "chew": "assets/videos/Chew(240p).mp4",
      "bite": "assets/videos/Bite(240p).mp4",
      "measure": "assets/videos/Measure(240p).mp4",
      "balance": "assets/videos/Balance(240p).mp4",
      "vote": "assets/videos/Vote(240p).mp4",
      "divide": "assets/videos/Divide(240p).mp4",
      "shine": "assets/videos/Shine(240p).mp4",
      "beg": "assets/videos/Beg(240p).mp4",
      "bleed": "assets/videos/Bleed(240p).mp4",
      "boil": "assets/videos/Boil(240p).mp4",
      "fox": "assets/videos/Fox(240p).mp4",
      "law": "assets/videos/Law(240p).mp4",
      "license": "assets/videos/License(240p).mp4",
      "queen": "assets/videos/Queen(240p).mp4",
      "shake": "assets/videos/Shake(240p).mp4",
      "spread scatter": "assets/videos/Spread Scatter(240p).mp4",
      "sweat": "assets/videos/Sweat(240p).mp4",
      "share": "assets/videos/Share(240p).mp4",
      "bleed and blood": "assets/videos/Bleed and Blood(240p).mp4",
      "throw out": "assets/videos/Throw out(240p).mp4",
      "wed": "assets/videos/Wed(240p).mp4",
      "lesson and course": "assets/videos/Lesson and Course(240p).mp4",
      "coffee bad for you": "assets/videos/Coffee bad for you(240p).mp4",
      "president": "assets/videos/President(240p).mp4",
      "decorate": "assets/videos/Decorate(240p).mp4",
      "hands communicating": "assets/videos/Hands communicating(240p).mp4",
      "give 6 meanings": "assets/videos/Give 6 meanings(240p).mp4",
      "shhh": "assets/videos/Shhh(240p).mp4",
      "me and i": "assets/videos/Me and I(240p).mp4",
      "my and mine": "assets/videos/My and Mine(240p).mp4",
      "you": "assets/videos/You(240p).mp4",
      "car": "assets/videos/Car(240p).mp4",
      "telephone": "assets/videos/Telephone(240p).mp4",
      "eat and food": "assets/videos/Eat and Food(240p).mp4",
      "drink": "assets/videos/Drink(240p).mp4",
      "camera": "assets/videos/Camera(240p).mp4",
      "strong": "assets/videos/Strong(240p).mp4",
      "pray": "assets/videos/Pray(240p).mp4",
      "stink": "assets/videos/Stink(240p).mp4",
      "crazy": "assets/videos/Crazy(240p).mp4",
      "a little bit": "assets/videos/A little bit(240p).mp4",
      "none": "assets/videos/None(240p).mp4",
      "big": "assets/videos/Big(240p).mp4",
      "small": "assets/videos/Small(240p).mp4",
      "throw": "assets/videos/Throw(240p).mp4",
      "catch": "assets/videos/Catch(240p).mp4",
      "drop": "assets/videos/Drop(240p).mp4",
      "move": "assets/videos/Move(240p).mp4",
      "carry": "assets/videos/Carry(240p).mp4",
      "writing": "assets/videos/Writing(240p).mp4",
      "break": "assets/videos/Break(240p).mp4",
      "tear or rip": "assets/videos/Tear or rip(240p).mp4",
      "exercise": "assets/videos/Exercise(240p).mp4",
      "swim": "assets/videos/Swim(240p).mp4",
      "tennis": "assets/videos/Tennis(240p).mp4",
      "ball": "assets/videos/Ball(240p).mp4",
      "boxing": "assets/videos/Boxing(240p).mp4",
      "fishing": "assets/videos/Fishing(240p).mp4",
      "archery": "assets/videos/Archery(240p).mp4",
      "baseball": "assets/videos/Baseball(240p).mp4",
      "strangle": "assets/videos/Strangle(240p).mp4",
      "nervous": "assets/videos/Nervous(240p).mp4",
      "time": "assets/videos/Time(240p).mp4",
      "baby": "assets/videos/Baby(240p).mp4",
      "umbrella": "assets/videos/Umbrella(240p).mp4",
      "faucet": "assets/videos/Faucet(240p).mp4",
      "razor": "assets/videos/Razor(240p).mp4",
      "brush": "assets/videos/Brush(240p).mp4",
      "ring": "assets/videos/Ring(240p).mp4",
      "iron": "assets/videos/Iron(240p).mp4",
      "sweep or broom": "assets/videos/Sweep or broom(240p).mp4",
      "vacuum": "assets/videos/Vacuum(240p).mp4",
      "sew": "assets/videos/Sew(240p).mp4",
      "scissors": "assets/videos/Scissors(240p).mp4",
      "face": "assets/videos/Face(240p).mp4",
      "eyebrow": "assets/videos/Eyebrow(240p).mp4",
      "eye": "assets/videos/Eye(240p).mp4",
      "nose": "assets/videos/Nose(240p).mp4",
      "mouth": "assets/videos/Mouth(240p).mp4",
      "tooth": "assets/videos/Tooth(240p).mp4",
      "hands": "assets/videos/Hands(240p).mp4",
      "body": "assets/videos/Body(240p).mp4",
      "we": "assets/videos/We(240p).mp4",
      "our": "assets/videos/Our(240p).mp4",
      "your": "assets/videos/Your(240p).mp4",
      "her": "assets/videos/Her(240p).mp4",
      "their": "assets/videos/Their(240p).mp4",
      "here": "assets/videos/Here(240p).mp4",
      "there": "assets/videos/There(240p).mp4",
      "this": "assets/videos/This(240p).mp4",
      "these": "assets/videos/These(240p).mp4",
      "other": "assets/videos/Other(240p).mp4",
      "any": "assets/videos/Any(240p).mp4",
      "don't": "assets/videos/Don't(240p).mp4",
      "not": "assets/videos/Not(240p).mp4",
      "remind": "assets/videos/Remind(240p).mp4",
    };
  
    return videoMap[word.toLowerCase()] ?? '';
  }

  final localPath = getLocalVideoForWord(word);
  _videoUrlCache[word] = localPath;
  return localPath;
}

// À appeler après l'initialisation
void main() {
  testVideoFetchingLocalDebugMainRenamedV2();
}



// Ajoutez cette méthode à votre code
Future<void> testSupabaseConnection() async {
  try {
    final response = await supabase.from('sign_videos').select().limit(1);
    if (response.isNotEmpty) {
    }
  // ignore: empty_catches
  } catch (e) {
  }
}

// Appelez cette méthode dans initState() après l'initialisation
class SupabaseInitializer extends StatefulWidget {
  const SupabaseInitializer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SupabaseInitializerState createState() => _SupabaseInitializerState();
}

class _SupabaseInitializerState extends State<SupabaseInitializer> {
  @override
  void initState() {
    super.initState();
    initializeSupabase().then((_) {
      testSupabaseConnection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with your desired widget
  }
}


Future<void> initializeSupabase() async {
  await Supabase.initialize(
    url: 'VOTRE_URL_SUPABASE',
    anonKey: 'VOTRE_CLE_PUBLIQUE_ANON',
  );
  supabase = Supabase.instance.client;
}

class MainScreen extends StatefulWidget {
  final String translatedText;

  const MainScreen({super.key, required this.translatedText});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> _words = [];
  int _currentWordIndex = 0;
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  String? _errorMessage;
  bool _isLoading = false;
  bool _autoPlayMode = false;
  final Map<String, String> _videoUrlCache = {};
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeWords();
  }

  void _initializeWords() {
    _words = widget.translatedText
        .split(' ')
        .where((word) => word.trim().isNotEmpty)
        .toList();
    
    if (_words.isNotEmpty) {
      _isInitialized = true;
      _initializeVideo();
    } else {
      setState(() {
        _errorMessage = 'No words to translate';
      });
    }
  }

  Future<void> _initializeVideo() async {
    if (!_isInitialized || _words.isEmpty) return;

    final currentWord = _words[_currentWordIndex].toLowerCase();
    
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Dispose old controller
      await _controller?.dispose();
      _controller = null;

      // Get video URL
      final String videoUrl = await _getVideoUrlForWord(currentWord);
      
      // Initialize new controller
      // ignore: deprecated_member_use
      _controller = VideoPlayerController.network(videoUrl)
        ..initialize().then((_) {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
            _controller?.setLooping(false);
            _controller?.addListener(_videoListener);
            
            if (_autoPlayMode) {
              _playVideo();
            }
          }
        }).catchError((error) {
          if (mounted) {
            _handleVideoError(currentWord, error);
          }
        });
    } catch (e) {
      if (mounted) {
        _handleVideoError(currentWord, e);
      }
    }
  }

  Future<String> _getVideoUrlForWord(String word) async {
    // 1. Check cache first
    if (_videoUrlCache.containsKey(word)) {
      return _videoUrlCache[word]!;
    }

    // 2. Try Supabase exact match
    try {
      final response = await supabase
          .from('sign_videos')
          .select('video_url')
          .eq('word', word)
          .maybeSingle();

      if (response != null && response['video_url'] != null) {
        final url = response['video_url'] as String;
        _videoUrlCache[word] = url;
        return url;
      }

      // 3. Try Supabase partial match if exact not found
      final fallbackResponse = await supabase
          .from('sign_videos')
          .select('video_url')
          .ilike('word', '%$word%')
          .limit(1)
          .maybeSingle();

      if (fallbackResponse != null && fallbackResponse['video_url'] != null) {
        final url = fallbackResponse['video_url'] as String;
        _videoUrlCache[word] = url;
        return url;
      }
    // ignore: empty_catches
    } catch (e) {
    }

    // 4. Fallback to local assets
    final localPath = _getLocalVideoForWord(word);
    _videoUrlCache[word] = localPath;
    return localPath;
  }

  String _getLocalVideoForWord(String word) {
    final videoMap = {
     "hello": "assets/videos/Hello(240p).mp4",
      "goodbye": "assets/videos/Goodbye(240p).mp4",
      "whisper": "assets/videos/Whisper(240p).mp4",
      "myself": "assets/videos/Myself(240p).mp4",
      "herself": "assets/videos/Herself(240p).mp4",
      "himself": "assets/videos/Himself(240p).mp4",
      "itself": "assets/videos/Itself(240p).mp4",
      "push": "assets/videos/Push(240p).mp4",
      "pull": "assets/videos/Pull(240p).mp4",
      "give": "assets/videos/Give(240p).mp4",
      "hold": "assets/videos/Hold(240p).mp4",
      "climb": "assets/videos/Climb(240p).mp4",
      "take": "assets/videos/Take(240p).mp4",
      "clothes": "assets/videos/Clothes(240p).mp4",
      "blouse": "assets/videos/Blouse(240p).mp4",
      "dress": "assets/videos/Dress(240p).mp4",
      "necklace": "assets/videos/Necklace(240p).mp4",
      "necktie": "assets/videos/Necktie(240p).mp4",
      "glasses": "assets/videos/Glasses(240p).mp4",
      "bowtie": "assets/videos/Bowtie(240p).mp4",
      "cup": "assets/videos/Cup(240p).mp4",
      "glass": "assets/videos/Glass(240p).mp4",
      "berry": "assets/videos/Berry(240p).mp4",
      "pear": "assets/videos/Pear(240p).mp4",
      "deer": "assets/videos/Deer(240p).mp4",
      "racoon": "assets/videos/Racoon(240p).mp4",
      "skunk": "assets/videos/Skunk(240p).mp4",
      "rooster": "assets/videos/Rooster(240p).mp4",
      "turkey": "assets/videos/Turkey(240p).mp4",
      "camel": "assets/videos/Camel(240p).mp4",
      "wolf": "assets/videos/Wolf(240p).mp4",
      "zebra": "assets/videos/Zebra(240p).mp4",
      "card": "assets/videos/Card(240p).mp4",
      "sign": "assets/videos/Sign(240p).mp4",
      "jail": "assets/videos/Jail(240p).mp4",
      "tent": "assets/videos/Tent(240p).mp4",
      "reduce": "assets/videos/Reduce(240p).mp4",
      "spread": "assets/videos/Spread(240p).mp4",
      "freeze": "assets/videos/Freeze(240p).mp4",
      "melt": "assets/videos/Melt(240p).mp4",
      "warn": "assets/videos/Warn(240p).mp4",
      "punish": "assets/videos/Punish(240p).mp4",
      "chew": "assets/videos/Chew(240p).mp4",
      "bite": "assets/videos/Bite(240p).mp4",
      "measure": "assets/videos/Measure(240p).mp4",
      "balance": "assets/videos/Balance(240p).mp4",
      "vote": "assets/videos/Vote(240p).mp4",
      "divide": "assets/videos/Divide(240p).mp4",
      "shine": "assets/videos/Shine(240p).mp4",
      "beg": "assets/videos/Beg(240p).mp4",
      "bleed": "assets/videos/Bleed(240p).mp4",
      "boil": "assets/videos/Boil(240p).mp4",
      "fox": "assets/videos/Fox(240p).mp4",
      "law": "assets/videos/Law(240p).mp4",
      "license": "assets/videos/License(240p).mp4",
      "queen": "assets/videos/Queen(240p).mp4",
      "shake": "assets/videos/Shake(240p).mp4",
      "spread scatter": "assets/videos/Spread Scatter(240p).mp4",
      "sweat": "assets/videos/Sweat(240p).mp4",
      "share": "assets/videos/Share(240p).mp4",
      "bleed and blood": "assets/videos/Bleed and Blood(240p).mp4",
      "throw out": "assets/videos/Throw out(240p).mp4",
      "wed": "assets/videos/Wed(240p).mp4",
      "lesson and course": "assets/videos/Lesson and Course(240p).mp4",
      "coffee bad for you": "assets/videos/Coffee bad for you(240p).mp4",
      "president": "assets/videos/President(240p).mp4",
      "decorate": "assets/videos/Decorate(240p).mp4",
      "hands communicating": "assets/videos/Hands communicating(240p).mp4",
      "give 6 meanings": "assets/videos/Give 6 meanings(240p).mp4",
      "shhh": "assets/videos/Shhh(240p).mp4",
      "me and i": "assets/videos/Me and I(240p).mp4",
      "my and mine": "assets/videos/My and Mine(240p).mp4",
      "you": "assets/videos/You(240p).mp4",
      "car": "assets/videos/Car(240p).mp4",
      "telephone": "assets/videos/Telephone(240p).mp4",
      "eat and food": "assets/videos/Eat and Food(240p).mp4",
      "drink": "assets/videos/Drink(240p).mp4",
      "camera": "assets/videos/Camera(240p).mp4",
      "strong": "assets/videos/Strong(240p).mp4",
      "pray": "assets/videos/Pray(240p).mp4",
      "stink": "assets/videos/Stink(240p).mp4",
      "crazy": "assets/videos/Crazy(240p).mp4",
      "a little bit": "assets/videos/A little bit(240p).mp4",
      "none": "assets/videos/None(240p).mp4",
      "big": "assets/videos/Big(240p).mp4",
      "small": "assets/videos/Small(240p).mp4",
      "throw": "assets/videos/Throw(240p).mp4",
      "catch": "assets/videos/Catch(240p).mp4",
      "drop": "assets/videos/Drop(240p).mp4",
      "move": "assets/videos/Move(240p).mp4",
      "carry": "assets/videos/Carry(240p).mp4",
      "writing": "assets/videos/Writing(240p).mp4",
      "break": "assets/videos/Break(240p).mp4",
      "tear or rip": "assets/videos/Tear or rip(240p).mp4",
      "exercise": "assets/videos/Exercise(240p).mp4",
      "swim": "assets/videos/Swim(240p).mp4",
      "tennis": "assets/videos/Tennis(240p).mp4",
      "ball": "assets/videos/Ball(240p).mp4",
      "boxing": "assets/videos/Boxing(240p).mp4",
      "fishing": "assets/videos/Fishing(240p).mp4",
      "archery": "assets/videos/Archery(240p).mp4",
      "baseball": "assets/videos/Baseball(240p).mp4",
      "strangle": "assets/videos/Strangle(240p).mp4",
      "nervous": "assets/videos/Nervous(240p).mp4",
      "time": "assets/videos/Time(240p).mp4",
      "baby": "assets/videos/Baby(240p).mp4",
      "umbrella": "assets/videos/Umbrella(240p).mp4",
      "faucet": "assets/videos/Faucet(240p).mp4",
      "razor": "assets/videos/Razor(240p).mp4",
      "brush": "assets/videos/Brush(240p).mp4",
      "ring": "assets/videos/Ring(240p).mp4",
      "iron": "assets/videos/Iron(240p).mp4",
      "sweep or broom": "assets/videos/Sweep or broom(240p).mp4",
      "vacuum": "assets/videos/Vacuum(240p).mp4",
      "sew": "assets/videos/Sew(240p).mp4",
      "scissors": "assets/videos/Scissors(240p).mp4",
      "face": "assets/videos/Face(240p).mp4",
      "eyebrow": "assets/videos/Eyebrow(240p).mp4",
      "eye": "assets/videos/Eye(240p).mp4",
      "nose": "assets/videos/Nose(240p).mp4",
      "mouth": "assets/videos/Mouth(240p).mp4",
      "tooth": "assets/videos/Tooth(240p).mp4",
      "hands": "assets/videos/Hands(240p).mp4",
      "body": "assets/videos/Body(240p).mp4",
      "we": "assets/videos/We(240p).mp4",
      "our": "assets/videos/Our(240p).mp4",
      "your": "assets/videos/Your(240p).mp4",
      "her": "assets/videos/Her(240p).mp4",
      "their": "assets/videos/Their(240p).mp4",
      "here": "assets/videos/Here(240p).mp4",
      "there": "assets/videos/There(240p).mp4",
      "this": "assets/videos/This(240p).mp4",
      "these": "assets/videos/These(240p).mp4",
      "other": "assets/videos/Other(240p).mp4",
      "any": "assets/videos/Any(240p).mp4",
      "don't": "assets/videos/Don't(240p).mp4",
      "not": "assets/videos/Not(240p).mp4",
      "remind": "assets/videos/Remind(240p).mp4",
    };
    
    // Return specific video if found, otherwise return null
    return videoMap[word.toLowerCase()] ?? '';
  }

  void _handleVideoError(String word, dynamic error) {
    
    setState(() {
      _isLoading = false;
      _errorMessage = 'No video available for "$word"';
      
      if (_autoPlayMode) {
        if (_currentWordIndex < _words.length - 1) {
          Future.delayed(const Duration(milliseconds: 500), () {
            _changeWord(_currentWordIndex + 1);
          });
        } else {
          setState(() {
            _autoPlayMode = false;
          });
        }
      }
    });
  }

  void _videoListener() {
    if (_controller != null &&
        !_controller!.value.isPlaying &&
        _controller!.value.position >= _controller!.value.duration - const Duration(milliseconds: 300)) {
      setState(() {
        _isPlaying = false;
      });
      
      if (_autoPlayMode && _currentWordIndex < _words.length - 1) {
        Future.delayed(const Duration(milliseconds: 500), () {
          _changeWord(_currentWordIndex + 1);
        });
      } else if (_autoPlayMode) {
        setState(() {
          _autoPlayMode = false;
        });
      }
    }
  }

  void _changeWord(int index) {
    if (index < 0 || index >= _words.length) return;

    setState(() {
      _currentWordIndex = index;
      _isPlaying = false;
    });
    _initializeVideo();
  }

  void _playVideo() {
    if (_controller?.value.isInitialized ?? false) {
      _controller?.seekTo(Duration.zero);
      setState(() {
        _isPlaying = true;
      });
      _controller?.play();
    }
  }

  void _pauseVideo() {
    setState(() {
      _isPlaying = false;
    });
    _controller?.pause();
  }

  void _startAutoPlaySequence() {
    if (_words.isEmpty) return;
    
    setState(() {
      _autoPlayMode = true;
      _currentWordIndex = 0;
    });
    _initializeVideo();
  }

  void _stopAutoPlaySequence() {
    setState(() {
      _autoPlayMode = false;
    });
    _pauseVideo();
  }

  @override
  void dispose() {
    _controller?.removeListener(_videoListener);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWord = _words.isNotEmpty ? _words[_currentWordIndex] : '';
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Language Translation"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              // Progress indicator
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "${_currentWordIndex + 1}/${_words.length}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: _words.isEmpty ? 0 : (_currentWordIndex + 1) / _words.length,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              // Video display
              SizedBox(
                height: 400,
                child: Center(
                  child: _isLoading
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 10),
                            Text('Loading video...'),
                          ],
                        )
                      : _errorMessage != null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                  size: 50,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _errorMessage!,
                                  style: const TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          : _controller != null && _controller!.value.isInitialized
                              ? AspectRatio(
                                  aspectRatio: _controller!.value.aspectRatio,
                                  child: VideoPlayer(_controller!),
                                )
                              : const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.videocam_off,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 10),
                                    Text('No video available'),
                                  ],
                                ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Auto-play toggle
                  ElevatedButton.icon(
                    icon: Icon(_autoPlayMode ? Icons.stop : Icons.play_arrow),
                    label: Text(_autoPlayMode ? 'Stop Auto Play' : 'Auto Play'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _autoPlayMode ? Colors.red : Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _words.isEmpty ? null : () {
                      if (_autoPlayMode) {
                        _stopAutoPlaySequence();
                      } else {
                        _startAutoPlaySequence();
                      }
                    },
                  ),
                  const SizedBox(width: 20),
                  
                  // Play/pause button
                  IconButton(
                    icon: Icon(
                      _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                      size: 50,
                      color: Colors.blue,
                    ),
                    onPressed: _autoPlayMode || _controller == null || !_controller!.value.isInitialized 
                        ? null 
                        : () {
                            if (_isPlaying) {
                              _pauseVideo();
                            } else {
                              _playVideo();
                            }
                          },
                  ),
                  // Replay button
                  IconButton(
                    icon: const Icon(
                      Icons.replay_circle_filled,
                      size: 50,
                      color: Colors.blue,
                    ),
                    onPressed: _autoPlayMode || _controller == null || !_controller!.value.isInitialized 
                        ? null 
                        : () {
                            _controller?.seekTo(Duration.zero);
                            _playVideo();
                          },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Current word
              Text(
                currentWord,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              
              // Full translated text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.translatedText,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              
              // Manual navigation
              _autoPlayMode 
                  ? const Text(
                      "Manual navigation disabled during auto play",
                      style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
                          onPressed: _currentWordIndex > 0
                              ? () => _changeWord(_currentWordIndex - 1)
                              : null,
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                          onPressed: _currentWordIndex < _words.length - 1
                              ? () => _changeWord(_currentWordIndex + 1)
                              : null,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
