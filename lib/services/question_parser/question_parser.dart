import 'package:what_when_where/services/question_parser/section_giveaway.dart';
import 'package:what_when_where/services/question_parser/section_image.dart';
import 'package:what_when_where/services/question_parser/section_speaker_note.dart';
import 'package:what_when_where/services/question_parser/section_text.dart';
import 'package:what_when_where/utils/extensions.dart';
import 'package:what_when_where/utils/texts.dart';

class QuestionParser {
  static final _instance = QuestionParser._();

  factory QuestionParser() => _instance;

  QuestionParser._();

  static Iterable<dynamic> split(String text) sync* {
    text = TextUtils.removeParagraphs(text);
    text = TextUtils.replaceMultipleSpacesWithNewLine(text);

    while (text.isNotEmpty) {
      text = text.trim();

      if (text.startsWith(SpeakerNoteSection.regExp)) {
        var notes = SpeakerNoteSection.regExp.stringMatch(text);
        yield SpeakerNoteSection(notes);
        text = text.replaceFirst(notes, '');
        continue;
      }

      if (text.startsWith(ImageSection.regExp)) {
        var picture = ImageSection.regExp.stringMatch(text);
        yield ImageSection(picture);
        text = text.replaceFirst(picture, '');
        continue;
      }

      if (text.startsWith(GiveAwaySection.regExp)) {
        var giveaway = GiveAwaySection.regExp.stringMatch(text);
        yield GiveAwaySection(giveaway);
        text = text.replaceFirst(giveaway, '');
        continue;
      }

      var nextRegExpIndexes = [
        (text.indexOf(SpeakerNoteSection.regExp)),
        (text.indexOf(ImageSection.regExp)),
        (text.indexOf(GiveAwaySection.regExp))
      ].where((i) => i != -1);

      var plainText = text;
      if (nextRegExpIndexes.isNotEmpty) {
        var firstOfRegExpMatchIndex = IterableExtensions.min(nextRegExpIndexes);
        plainText = text.substring(0, firstOfRegExpMatchIndex);
      }
      yield TextSection(plainText);
      text = text.replaceFirst(plainText, '');
    }
  }

  static String trim(String text) {
    text = TextUtils.removeParagraphs(text);
    text = TextUtils.removeMultipleSpaces(text);
    text = text.replaceAll(SpeakerNoteSection.regExp, '');
    text = text.replaceAll(ImageSection.regExp, '');
    text = text.replaceAll(GiveAwaySection.regExp, '');
    text = TextUtils.removeMultipleSpaces(text);
    text = text.trim();
    return text;
  }
}
