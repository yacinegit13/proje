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
      "ضد": "assets/videos/ضد.mp4",
"اخ": "assets/videos/اخ.mp4",
"اختـ": "assets/videos/اختـ.mp4",
"ابنة": "assets/videos/ابنة.mp4",
"جدة": "assets/videos/جدة.mp4",
"هل": "assets/videos/هل.mp4",
"متى": "assets/videos/متى.mp4",
"كم": "assets/videos/كم.mp4",
"عند": "assets/videos/عند.mp4",
"كيف": "assets/videos/كيف.mp4",
"لما": "assets/videos/لما.mp4",
"او": "assets/videos/او.mp4",
"حالتك": "assets/videos/حالتك.mp4",
"ثم": "assets/videos/ثم.mp4",
"تشرفت": "assets/videos/تشرفت.mp4",
"تعرف": "assets/videos/تعرف.mp4",
"عليك": "assets/videos/عليك.mp4",
"معك": "assets/videos/معك.mp4",
"التواصل": "assets/videos/التواصل.mp4",
"رقم": "assets/videos/رقم.mp4",
"عدد": "assets/videos/عدد.mp4",
"وقت": "assets/videos/وقت.mp4",
"ارجو": "assets/videos/ارجو.mp4",
"وردي": "assets/videos/وردي.mp4",
"رمادي": "assets/videos/رمادي.mp4",
"ابيض": "assets/videos/ابيض.mp4",
"بنفسجي": "assets/videos/بنفسجي.mp4",
"اخضر": "assets/videos/اخضر.mp4",
"بني": "assets/videos/بني.mp4",
"ازرق": "assets/videos/ازرق.mp4",
"اسود": "assets/videos/اسود.mp4",
"احمر": "assets/videos/احمر.mp4",
"رياضيات": "assets/videos/رياضيات.mp4",
"رسم": "assets/videos/رسم.mp4",
"خوف": "assets/videos/خوف.mp4",
"شجاعة": "assets/videos/شجاعة.mp4",
"جبان": "assets/videos/جبان.mp4",
"ابتسامة": "assets/videos/ابتسامة.mp4",
"ثقة": "assets/videos/ثقة.mp4",
"لو": "assets/videos/لو.mp4",
"حواجب": "assets/videos/حواجب.mp4",
"مستعجل": "assets/videos/مستعجل.mp4",
"استغاثة": "assets/videos/استغاثة.mp4",
"قبعة": "assets/videos/قبعة.mp4",
"احراج": "assets/videos/احراج.mp4",
"غدا": "assets/videos/غدا.mp4",
"قميص": "assets/videos/قميص.mp4",
"سروال": "assets/videos/سروال.mp4",
"فستان": "assets/videos/فستان.mp4",
"مازال": "assets/videos/مازال.mp4",
"حزين": "assets/videos/حزين.mp4",
"شعور": "assets/videos/شعور.mp4",
"ضوء": "assets/videos/ضوء.mp4",
"استحمام": "assets/videos/استحمام.mp4",
"مشي": "assets/videos/مشي.mp4",
"الله يسلمك": "assets/videos/الله يسلمك.mp4",
"الله يحميك": "assets/videos/الله يحميك.mp4",
"الله يستر عليك": "assets/videos/الله يستر عليك.mp4",
"الله يحفظك": "assets/videos/الله يحفظك.mp4",
"الله يوفقك": "assets/videos/الله يوفقك.mp4",
"الله يعينك": "assets/videos/الله يعينك.mp4",
"الجزائر": "assets/videos/الجزائر.mp4",
"جيد": "assets/videos/جيد.mp4",
"تحذير": "assets/videos/تحذير.mp4",
"انتبه": "assets/videos/انتبه.mp4",
"تأخر": "assets/videos/تأخر.mp4",
"تاريخ": "assets/videos/تاريخ.mp4",
"سيئ": "assets/videos/سيئ.mp4",
"ان": "assets/videos/ان.mp4",
"صعب": "assets/videos/صعب.mp4",
"سهل": "assets/videos/سهل.mp4",
"بعض": "assets/videos/بعض.mp4",
"كبير": "assets/videos/كبير.mp4",
"طبيب": "assets/videos/طبيب.mp4",
"شاب": "assets/videos/شاب.mp4",
"رجل": "assets/videos/رجل.mp4",
"امرأة": "assets/videos/امرأة.mp4",
"ولد": "assets/videos/ولد.mp4",
"رضيع": "assets/videos/رضيع.mp4",
"طفل": "assets/videos/طفل.mp4",
"بنت": "assets/videos/بنت.mp4",
"قصة": "assets/videos/قصة.mp4",
"قواعد": "assets/videos/قواعد.mp4",
"عندنا": "assets/videos/عندنا.mp4",
"تحب": "assets/videos/تحب.mp4",
"ماذا": "assets/videos/ماذا.mp4",
"شكرا": "assets/videos/شكرا.mp4",
"امس": "assets/videos/امس.mp4",
"السلام عليكم": "assets/videos/السلام عليكم.mp4",
"معلم": "assets/videos/معلم.mp4",
"سنة": "assets/videos/سنة.mp4",
"شرطة": "assets/videos/شرطة.mp4",
"عجوز": "assets/videos/عجوز.mp4",
"اصفر": "assets/videos/اصفر.mp4",
"الله": "assets/videos/الله.mp4",
"كم عمرك": "assets/videos/كم عمرك.mp4",
"الحمد": "assets/videos/الحمد.mp4",
"عفوا": "assets/videos/عفوا.mp4",
"الاسم": "assets/videos/الاسم.mp4",
"تلك": "assets/videos/تلك.mp4",
"هاتان": "assets/videos/هاتان.mp4",
"هؤلاء": "assets/videos/هؤلاء.mp4",
"ذلك": "assets/videos/ذلك.mp4",
"هذا": "assets/videos/هذا.mp4",
"هذه": "assets/videos/هذه.mp4",
"هذان": "assets/videos/هذان.mp4",
"هما": "assets/videos/هما.mp4",
"هم": "assets/videos/هم.mp4",
"هن": "assets/videos/هن.mp4",
"نحن": "assets/videos/نحن.mp4",
"هو": "assets/videos/هو.mp4",
"هي": "assets/videos/هي.mp4",
"انتما": "assets/videos/انتما.mp4",
"انتم": "assets/videos/انتم.mp4",
"انا": "assets/videos/انا.mp4",
"انت": "assets/videos/انت.mp4",
"ص": "assets/videos/ص.mp4",
"ض": "assets/videos/ض.mp4",
"ظ": "assets/videos/ظ.mp4",
"ع": "assets/videos/ع.mp4",
"غ": "assets/videos/غ.mp4",
"ف": "assets/videos/ف.mp4",
"ق": "assets/videos/ق.mp4",
"ك": "assets/videos/ك.mp4",
"ل": "assets/videos/ل.mp4",
"م": "assets/videos/م.mp4",
"ن": "assets/videos/ن.mp4",
"ه": "assets/videos/ه.mp4",
"و": "assets/videos/و.mp4",
"ي": "assets/videos/ي.mp4",
"اعطني": "assets/videos/اعطني.mp4",
"اجلس": "assets/videos/اجلس.mp4",
"لماذا": "assets/videos/لماذا.mp4",
"فوق": "assets/videos/فوق.mp4",
"يوجد": "assets/videos/يوجد.mp4",
"ساعة": "assets/videos/ساعة.mp4",
"نص": "assets/videos/نص.mp4",
"رأيك": "assets/videos/رأيك.mp4",
"يهمنا": "assets/videos/يهمنا.mp4",
"باب": "assets/videos/باب.mp4",
"سرير": "assets/videos/سرير.mp4",
"غرفة": "assets/videos/غرفة.mp4",
"خزانة ملابس": "assets/videos/خزانة ملابس.mp4",
"صحن": "assets/videos/صحن.mp4",
"ملعقة": "assets/videos/ملعقة.mp4",
"مطبخ": "assets/videos/مطبخ.mp4",
"كأس": "assets/videos/كأس.mp4",
"غسالة": "assets/videos/غسالة.mp4",
"كرسي": "assets/videos/كرسي.mp4",
"طاولة": "assets/videos/طاولة.mp4",
"ثلاجة": "assets/videos/ثلاجة.mp4",
"تلفاز": "assets/videos/تلفاز.mp4",
"هاتف": "assets/videos/هاتف.mp4",
"مفتاح": "assets/videos/مفتاح.mp4",
"ة": "assets/videos/ة.mp4",
"ء": "assets/videos/ء.mp4",
"احمرار": "assets/videos/احمرار.mp4",
"الاذن": "assets/videos/الاذن.mp4",
"الاسنان": "assets/videos/الاسنان.mp4",
"الانف": "assets/videos/الانف.mp4",
"الايسر": "assets/videos/الايسر.mp4",
"الايمن": "assets/videos/الايمن.mp4",
"الجانب": "assets/videos/الجانب.mp4",
"البطن": "assets/videos/البطن.mp4",
"العنق": "assets/videos/العنق.mp4",
"الصدر": "assets/videos/الصدر.mp4",
"الظهر": "assets/videos/الظهر.mp4",
"الكتف": "assets/videos/الكتف.mp4",
"خبز": "assets/videos/خبز.mp4",
"اريد": "assets/videos/اريد.mp4",
"دراسة": "assets/videos/دراسة.mp4",
"بين": "assets/videos/بين.mp4",
"بينما": "assets/videos/بينما.mp4",
"شارع": "assets/videos/شارع.mp4",
"منزل": "assets/videos/منزل.mp4",
"سيارة": "assets/videos/سيارة.mp4",
"لبن": "assets/videos/لبن.mp4",
"شاي": "assets/videos/شاي.mp4",
"قهوة": "assets/videos/قهوة.mp4",
"الى": "assets/videos/الى.mp4",
"اين": "assets/videos/اين.mp4",
"في": "assets/videos/في.mp4",
"مع": "assets/videos/مع.mp4",
"من": "assets/videos/من.mp4",
"اطلب": "assets/videos/اطلب.mp4",
"على": "assets/videos/على.mp4",
"الطعام": "assets/videos/الطعام.mp4",
"اليوم": "assets/videos/اليوم.mp4",
"كيف حالك": "assets/videos/كيف حالك.mp4",
"ماء": "assets/videos/ماء.mp4",
"أ": "assets/videos/أ.mp4",
"ب": "assets/videos/ب.mp4",
"ت": "assets/videos/ت.mp4",
"ث": "assets/videos/ث.mp4",
"ج": "assets/videos/ج.mp4",
"ح": "assets/videos/ح.mp4",
"خ": "assets/videos/خ.mp4",
"د": "assets/videos/د.mp4",
"ذ": "assets/videos/ذ.mp4",
"ز": "assets/videos/ز.mp4",
"س": "assets/videos/س.mp4",
"ش": "assets/videos/ش.mp4",
"الاسلام": "assets/videos/الاسلام.mp4",
"شجرة": "assets/videos/شجرة.mp4",
"خروف": "assets/videos/خروف.mp4",
"جمل": "assets/videos/جمل.mp4",
"بقرة": "assets/videos/بقرة.mp4",
"شكولاتة": "assets/videos/شكولاتة.mp4",
"معجون اسنان": "assets/videos/معجون اسنان.mp4",
"فرشاة اسنان": "assets/videos/فرشاة اسنان.mp4",
"ذئب": "assets/videos/ذئب.mp4",
"اسد": "assets/videos/اسد.mp4",
"فيل": "assets/videos/فيل.mp4",
"حمار": "assets/videos/حمار.mp4",
"ارنب": "assets/videos/ارنب.mp4",
"فأر": "assets/videos/فأر.mp4",
"حصان": "assets/videos/حصان.mp4",
"حمام": "assets/videos/حمام.mp4",
"شمس": "assets/videos/شمس.mp4",
"قمر": "assets/videos/قمر.mp4",
"سماء": "assets/videos/سماء.mp4",
"بحر": "assets/videos/بحر.mp4",
"مطر": "assets/videos/مطر.mp4",
// ignore: equal_keys_in_map
"ضد": "assets/videos/ضد.mp4",
"سؤال": "assets/videos/سؤال.mp4",
"يلوّح": "assets/videos/يلوّح.mp4",
"ام": "assets/videos/ام.mp4",
"اب": "assets/videos/اب.mp4",
// ignore: equal_keys_in_map
"اخ": "assets/videos/اخ.mp4",
"اخت": "assets/videos/اخت.mp4",
"ابن": "assets/videos/ابن.mp4",
"خال": "assets/videos/خال.mp4",
"عم": "assets/videos/عم.mp4",
"جد": "assets/videos/جد.mp4",
"خاص": "assets/videos/خاص.mp4"

  };
}