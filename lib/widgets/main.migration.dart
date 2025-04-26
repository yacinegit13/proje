// main_migration.dart
// Ce script doit être exécuté séparément pour migrer vos vidéos vers Supabase

// ignore_for_file: unused_local_variable

import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:supabase/supabase.dart';
import 'package:path/path.dart' as path;

// Configuration Supabase
const String supabaseUrl = 'VOTRE_URL_SUPABASE';
const String supabaseKey = 'VOTRE_CLE_SERVICE_SUPABASE'; // Utiliser la clé service, pas la clé anon
const String storageBucket = 'sign_videos';

// Dossier local contenant vos vidéos
const String localVideoDir = 'assets/videos/';

void main() async {
  
  // Initialiser le client Supabase
  final client = SupabaseClient(supabaseUrl, supabaseKey);
  
  // Extraire les informations de la map des vidéos
  final videoMap = _getVideoMap();
  
  // Compter le nombre total de vidéos à migrer
  final totalVideos = videoMap.length;
  int processedVideos = 0;
  int successfulUploads = 0;
  
  
  // Pour chaque entrée dans le dictionnaire
  for (final entry in videoMap.entries) {
    final word = entry.key;
    final localPath = entry.value;
    
    processedVideos++;
    
    try {
      // 1. Vérifier si le fichier existe localement
      final file = File(localPath);
      if (!file.existsSync()) {
        continue;
      }
      
      // 2. Télécharger la vidéo vers Supabase Storage
      
      final fileBytes = await file.readAsBytes();
      final fileName = path.basename(localPath);
      
      final storageResponse = await client
          .storage
          .from(storageBucket)
          .uploadBinary(
            'videos/$fileName',
            fileBytes,
            fileOptions: FileOptions(
              contentType: 'video/mp4',
              upsert: true,
            ),
          );
      
      if (storageResponse.isEmpty) {
        throw Exception('Échec du téléchargement de la vidéo');
      }
      
      // 3. Obtenir l'URL publique
      final videoUrl = client
          .storage
          .from(storageBucket)
          .getPublicUrl('videos/$fileName');
      
      
      // 4. Insérer l'entrée dans la base de données
      await client
          .from('sign_videos')
          .upsert({
            'word': word,
            'video_url': videoUrl,
            'language': 'en',  // Langue par défaut, à adapter selon vos besoins
          });
      
      successfulUploads++;
      
    // ignore: empty_catches
    } catch (e) {
    }
  }
  
  // Afficher le résumé
  
  if (successfulUploads == totalVideos) {
  } else {
  }
}

// La même map que dans votre code
Map<String, String> _getVideoMap() {
  return {
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
}