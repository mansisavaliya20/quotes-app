import 'package:google_fonts/google_fonts.dart';

String imagepath = 'assets/images/';

class global {
  static List quote = [
    {
      'quote': "Life is what happens when your are busy making other plans.",
      'image': imagepath + 'download.jpg',
    },
    {
      'quote': "Get busy living or get busy dying.",
      'image': imagepath + 'img2.jpg',
    },
    {
      'quote':
          " Many of life’s failures are people who did not realize how close they were to success when they gave up.",
      'image': imagepath + 'img3.jpg',
    },
    {
      'quote':
          "If you want to live a happy life, tie it to a goal, not to people or things.",
      'image': imagepath + 'img4.webp',
    },
    {
      'quote':
          "Money and success don’t change people; they merely amplify what is already there.",
      'image': imagepath + 'img5.webp',
    },
    {
      'quote':
          "Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma – which is living with the results of other people’s thinking.",
      'image': imagepath + 'download.jpg',
    }
  ];
  static List background = [
    '${imagepath}download.jpg',
    '${imagepath}img2.jpg',
    '${imagepath}img3.jpg',
    '${imagepath}img4.webp',
    '${imagepath}img5.webp',
    '${imagepath}download.jpg'
  ];
  static List qoutes = [
    "Life is what happens when your are busy making other plans.",
    "Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma – which is living with the results of other people’s thinking.",
    "Money and success don’t change people; they merely amplify what is already there.",
    "If you want to live a happy life, tie it to a goal, not to people or things.",
    " Many of life’s failures are people who did not realize how close they were to success when they gave up.",
    "Get busy living or get busy dying.",
  ];
  static List fav = [];
  static var image;
  static var q;
  static List font = [
    GoogleFonts.aBeeZeeTextTheme,
    GoogleFonts.abelTextTheme,
    GoogleFonts.poppins,
    GoogleFonts.aladin,
    GoogleFonts.akayaKanadaka,
    GoogleFonts.abel,
  ];
}
