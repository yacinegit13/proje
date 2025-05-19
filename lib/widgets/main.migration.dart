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
  "any": "assets/videos/Any(240p).mp4",
  "archery": "assets/videos/Archery(240p).mp4",
  "baby": "assets/videos/Baby(240p).mp4",
  "ball": "assets/videos/Ball(240p).mp4",
  "baseball": "assets/videos/Baseball(240p).mp4",
  "big": "assets/videos/Big(240p).mp4",
  "body": "assets/videos/Body(240p).mp4",
  "boxing": "assets/videos/Boxing(240p).mp4",
  "balance": "assets/videos/Balance(240p).mp4",
  "beg": "assets/videos/Beg(240p).mp4",
  "berry": "assets/videos/Berry(240p).mp4",
  "bite": "assets/videos/Bite(240p).mp4",
  "bleed": "assets/videos/Bleed(240p).mp4",
  "blouse": "assets/videos/Blouse(240p).mp4",
  "boil": "assets/videos/Boil(240p).mp4",
  "bowtie": "assets/videos/Bowtie(240p).mp4",
  "break": "assets/videos/break(240p).mp4",
  "broom": "assets/videos/broom(240p).mp4",
  "brush": "assets/videos/Brush(240p).mp4",
  "carry": "assets/videos/Carry(240p).mp4",
  "catch": "assets/videos/Catch(240p).mp4",
  "crazy": "assets/videos/Crazy(240p).mp4",
  "camel": "assets/videos/Camel(240p).mp4",
  "camera": "assets/videos/camera(240p).mp4",
  "car": "assets/videos/car(240p).mp4",
  "card": "assets/videos/Card(240p).mp4",
  "chew": "assets/videos/Chew(240p).mp4",
  "climb": "assets/videos/Climb(240p).mp4",
  "clothes": "assets/videos/Clothes(240p).mp4",
  "course": "assets/videos/Course(240p).mp4",
  "cup": "assets/videos/Cup(240p).mp4",

  "drop": "assets/videos/Drop(240p).mp4",
  "decorate": "assets/videos/Decorate(240p).mp4",
  "deer": "assets/videos/Deer(240p).mp4",
  "divide": "assets/videos/divide(240p).mp4",
  "dress": "assets/videos/dress(240p).mp4",
  "drink": "assets/videos/drink(240p).mp4",

  "eat": "assets/videos/Eat(240p).mp4",
  "exercise": "assets/videos/Exercise(240p).mp4",
  "eye": "assets/videos/eye(240p).mp4",
  "eyebrow": "assets/videos/Eyebrow(240p).mp4",

  "face": "assets/videos/Face(240p).mp4",
  "faucet": "assets/videos/Faucet(240p).mp4",
  "fishing": "assets/videos/Fishing(240p).mp4",
  "food": "assets/videos/food(240p).mp4",
  "fox": "assets/videos/Fox(240p).mp4",
  "freeze": "assets/videos/Freeze(240p).mp4",

  "give": "assets/videos/Give(240p).mp4",
  "glass": "assets/videos/Glass(240p).mp4",
  "glasses": "assets/videos/Glasses(240p).mp4",
  "goodbye": "assets/videos/Goodbye(240p).mp4",

  "her": "assets/videos/Her(240p).mp4",
  "here": "assets/videos/Here(240p).mp4",
  "hands": "assets/videos/Hands(240p).mp4",
  "hello": "assets/videos/Hello(240p).mp4",
  "herself": "assets/videos/Herself(240p).mp4",
  "himself": "assets/videos/Himself(240p).mp4",
  "hold": "assets/videos/Hold(240p).mp4",

  "i": "assets/videos/I(240p).mp4",
  "itself": "assets/videos/Itself(240p).mp4",
  "iron": "assets/videos/Iron(240p).mp4",

  "jail": "assets/videos/Jail(240p).mp4",

  "law": "assets/videos/Law(240p).mp4",
  "lesson": "assets/videos/Lesson(240p).mp4",
  "license": "assets/videos/License(240p).mp4",
  "little bit": "assets/videos/little bit(240p).mp4",


  "me": "assets/videos/me(240p).mp4",
  "measure": "assets/videos/Measure(240p).mp4",
  "melt": "assets/videos/Melt(240p).mp4",
  "mine": "assets/videos/mine(240p).mp4",
  "my": "assets/videos/my(240p).mp4",
  "mouth": "assets/videos/Mouth(240p).mp4",
  "move": "assets/videos/Move(240p).mp4",
  "myself": "assets/videos/Myself(240p).mp4",

  "necklace": "assets/videos/Necklace(240p).mp4",
  "necktie": "assets/videos/Necktie(240p).mp4",
  "nervous": "assets/videos/Nervous(240p).mp4",
  "none": "assets/videos/None(240p).mp4",
  "nose": "assets/videos/Nose(240p).mp4",
  "not": "assets/videos/Not(240p).mp4",

  "other": "assets/videos/Other(240p).mp4",
  "our": "assets/videos/Our(240p).mp4",

  "pear": "assets/videos/Pear(240p).mp4",
  "pray": "assets/videos/pray(240p).mp4",
  "pull": "assets/videos/Pull(240p).mp4",
  "punish": "assets/videos/Punish(240p).mp4",
  "push": "assets/videos/Push(240p).mp4",

  "queen": "assets/videos/Queen(240p).mp4",

  "racoon": "assets/videos/Racoon(240p).mp4",
  "razor": "assets/videos/Razor(240p).mp4",
  "ring": "assets/videos/Ring(240p).mp4",
  "reduce": "assets/videos/Reduce(240p).mp4",
  "rip": "assets/videos/rip(240p).mp4",
  "rooster": "assets/videos/Rooster(240p).mp4",

  "share": "assets/videos/Share(240p).mp4",
  "shake": "assets/videos/Shake(240p).mp4",
  "shhh": "assets/videos/shhh(240p).mp4",
  "shine": "assets/videos/Shine(240p).mp4",
  "sign": "assets/videos/Sign(240p).mp4",
  "skunk": "assets/videos/Skunk(240p).mp4",
  "scissors": "assets/videos/Scissors(240p).mp4",
  "sew": "assets/videos/Sew(240p).mp4",
  "small": "assets/videos/Small(240p).mp4",
  "strangle": "assets/videos/Strangle(240p).mp4",
  "swim": "assets/videos/Swim(240p).mp4",
  "spread": "assets/videos/Spread(240p).mp4",
  "stink": "assets/videos/stink(240p).mp4", 
  "sweat": "assets/videos/Sweat(240p).mp4",
  "sweep": "assets/videos/sweep(240p).mp4",
  "strong": "assets/videos/strong(240p).mp4",

  "tennis": "assets/videos/Tennis(240p).mp4",
  "their": "assets/videos/Their(240p).mp4",
  "there": "assets/videos/there(240p).mp4",
  "these": "assets/videos/these(240p).mp4",
  "throw": "assets/videos/throw(240p).mp4",
  "time": "assets/videos/Time(240p).mp4",
  "tooth": "assets/videos/Tooth(240p).mp4",
  "turkey": "assets/videos/Turkey(240p).mp4",
  "take": "assets/videos/Take(240p).mp4",
  "tear": "assets/videos/tear(240p).mp4",
  "telephone": "assets/videos/telephone(240p).mp4",
  "tent": "assets/videos/Tent(240p).mp4",


  "umbrella": "assets/videos/Umbrella(240p).mp4",

  "vacuum": "assets/videos/Vacuum(240p).mp4",
  "vote": "assets/videos/Vote(240p).mp4",

  "warn": "assets/videos/Warn(240p).mp4",
  "wed": "assets/videos/Wed(240p).mp4",
  "whisper": "assets/videos/Whisper(240p).mp4",
  "wolf": "assets/videos/Wolf(240p).mp4",
  "we": "assets/videos/We(240p).mp4",
  "writing": "assets/videos/Writing(240p).mp4",

  "your": "assets/videos/your(240p).mp4",
  "you": "assets/videos/you(240p).mp4",

  "zebra": "assets/videos/zebra(240p).mp4",
  "ابتسامة": "assets/videos/ابتسامة.mp4",
  "ابيض": "assets/videos/ابيض.mp4",
  "اجلس": "assets/videos/اجلس.mp4",
  "احراج": "assets/videos/احراج.mp4",
  "احمر": "assets/videos/احمر.mp4",
  "احمرار": "assets/videos/احمرار.mp4",
  "اخضر": "assets/videos/اخضر.mp4",
  "ارجوك": "assets/videos/ارجوك.mp4",
  "ارنب": "assets/videos/ارنب.mp4",
  "اريد": "assets/videos/اريد.mp4",
  "ازرق": "assets/videos/ازرق.mp4",
  "استغاثة": "assets/videos/استغاثة.mp4",
  "اسد": "assets/videos/اسد.mp4",
  "اسود": "assets/videos/اسود.mp4",
  "اصفر": "assets/videos/اصفر.mp4",
  "اعطني": "assets/video/اعطني.mp4",
  "الاذن": "assets/videos/الاذن.mp4",
  "الاسلام": "assets/videos/الاسلام.mp4",
  "الاسنان": "assets/videos/الاسنان.mp4",
  "الانف": "assets/videos/الانف.mp4",
  "الايسر": "assets/videos/الايسر.mp4",
  "الايمن": "assets/videos/الايمن.mp4",
  "البطن": "assets/videos/البطن.mp4",
  "التواصل": "assets/videos/التواصل.mp4",
  "الجانب": "assets/videos/الجانب.mp4",
  "الجزائر": "assets/videos/الجزائر.mp4",
  "الحمد": "assets/videos/الحمد.mp4",
  "الدراسة": "assets/videos/الدراسة.mp4",
  "السلام": "assets/videos/السلام.mp4",
  "الشارع": "assets/videos/الشارع.mp4",
  "الشرطة": "assets/videos/الشرطة.mp4",
  "الصدر": "assets/videos/الصدر.mp4",
  "الطعام": "assets/videos/الطعام.mp4",
  "الظهر": "assets/videos/الظهر.mp4",
  "العنق": "assets/videos/العنق.mp4",
  "الكتف": "assets/videos/الكتف.mp4",
  "الله": "assets/videos/الله.mp4",
  "الماء": "assets/videos/الماء.MP4",
  "المنزل": "assets/videos/المنزل.mp4",
  "النص": "assets/videos/النص.MP4",
  "الى": "assets/videos/الى.mp4",
  "اليوم": "assets/videos/اليوم.MP4",
  "امس": "assets/videos/امس.mp4",
  "انا": "assets/videos/انا.mp4",
  "انت": "assets/videos/انت.mp4",
  "انتم": "assets/videos/انتم.mp4",
  "انتما": "assets/videos/انتما.mp4",
  "او": "assets/videos/او.mp4",
  "ابن": "assets/videos/ابن.mp4",
  "ب": "assets/videos/ب.MP4",
  "باب": "assets/videos/باب.mp4",

  "بحر": "assets/videos/بحر.mp4",
  "بعض": "assets/videos/بعض.mp4",
  "بقرة": "assets/videos/بقرة.mp4",
  "بنت": "assets/videos/بنت.mp4",
  "بنفسجي": "assets/videos/بنفسجي.mp4",
  "بني": "assets/videos/بني.mp4",
  "بين": "assets/videos/بين.mp4",
  "بينما": "assets/videos/بينما.mp4",
  "ت": "assets/videos/ت.MP4",
  "تأخر": "assets/videos/تأخر.mp4",
  "تاريخ": "assets/videos/تاريخ.mp4",
  "تحب": "assets/videos/تحب.mp4",
  "تحذير": "assets/videos/تحذير.mp4",
  "تشرفت": "assets/videos/تشرفت.mp4",
  "تعرف": "assets/videos/تعرف.mp4",
  "تلفاز": "assets/videos/تلفاز.mp4",
  "تلك": "assets/videos/تلك.mp4",
  "ثقة": "assets/videos/ثقة.mp4",
  "ثلاجة": "assets/videos/ثلاجة.mp4",
  "ثم": "assets/videos/ثم.mp4",
  "م": "assets/videos/م.MP4",
  "جبان": "assets/videos/جبان.mp4",
  "جد": "assets/videos/جد.mp4",
  "جمل": "assets/videos/جمل.mp4",
  "ح": "assets/videos/ح.mp4",
  "حالتك": "assets/videos/حالتك.mp4",
  "حزين": "assets/videos/حزين.mp4",
  "حصان": "assets/videos/حصان.mp4",
  "حليب": "assets/videos/حليب.MP4",
  "حمار": "assets/videos/حمار.mp4",
  "حواجب": "assets/videos/حواجب.mp4",
  "خ": "assets/videos/خ.MP4",
  "خاص": "assets/videos/خاص.mp4",
  "خال": "assets/videos/خال.mp4",
  "خروف": "assets/videos/خروف.mp4",
  "خوف": "assets/videos/خوف.mp4",
  "د": "assets/videos/د.MP4",
  "ذ": "assets/videos/ذ.MP4",
  "ذئب": "assets/videos/ذئب.mp4",
  "شاي": "assets/videos/شاي.MP4",
  "شجرة": "assets/videos/شجرة.mp4",
  "شعور": "assets/videos/شعور.mp4",
  "شكرا": "assets/videos/شكرا.mp4",
  "شكولاطة": "assets/videos/شكولاطة.mp4",
  "شمس": "assets/videos/شمس.mp4",
  "ص": "assets/videos/ص.MP4",
  "صعب": "assets/videos/صعب.mp4",
  "ض": "assets/videos/ض.MP4",
  "ضد": "assets/videos/ضد.mp4",
  "ضوء": "assets/videos/ضوء.mp4",
  "طاولة": "assets/videos/طاولة.mp4",
  "طبق": "assets/videos/طبق.mp4",
  "طبيب": "assets/videos/طبيب.mp4",
  "طفل": "assets/videos/طفل.mp4",
  "طلب": "assets/videos/طلب.mp4",
  "ظ": "assets/videos/ظ.MP4",
  "ع": "assets/videos/ع.MP4",
  "عجوز": "assets/videos/عجوز.mp4",
  "عفوا": "assets/videos/عفوا.mp4",
  "على": "assets/videos/على.mp4",
  "عليك": "assets/videos/عليك.mp4",
  "عم": "assets/videos/عم.mp4",
  "عند": "assets/videos/عند.mp4",
  "عندنا": "assets/videos/عندنا.mp4",
  "اخ": "assets/videos/اخ.mp4",
  "غرفة": "assets/videos/غرفة.mp4",
  "غسالة": "assets/videos/غسالة.mp4",
  "ف": "assets/videos/ف.MP4",
  "فأر": "assets/videos/فأر.mp4",
  "فرشاة": "assets/videos/فرشاة.mp4",
  "فستان": "assets/videos/فستان.mp4",
  "فوق": "assets/videos/فوق.MP4",
  "في": "assets/videos/في.mp4",
  "فيل": "assets/videos/فيل.mp4",
  "ق": "assets/videos/ق.MP4",
  "قبعة": "assets/videos/قبعة.mp4",
  "قصة": "assets/videos/قصة.mp4",
  "قمر": "assets/videos/قمر.mp4",



  "قميص": "assets/videos/قميص.mp4",
  "قهوة": "assets/videos/قهوة.MP4",
  "قواعد": "assets/videos/قواعد.mp4",
  "ك": "assets/videos/ك.MP4",
  "كأس": "assets/videos/كأس.mp4",
  "كبير": "assets/videos/كبير.MP4",
  "كرسي": "assets/videos/كرسي.mp4",
  "كم": "assets/videos/كم.mp4",
  "كيف": "assets/videos/كيف.mp4",
  "أم": "assets/videos/أم.mp4",
  "لماذا": "assets/videos/لماذا.MP4",
  "لو": "assets/videos/لو.mp4",
  "مازال": "assets/videos/مازال.mp4",
  "مرأة": "assets/videos/مرأة.mp4",
  "مرحاض": "assets/videos/مرحاض.mp4",
  "مرحبا": "assets/videos/مرحبا.mp4",
  "مستعجل": "assets/videos/مستعجل.mp4",



  };
}