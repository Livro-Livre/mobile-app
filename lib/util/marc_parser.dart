import 'package:livro_livre/model/biblio_item.dart';

class MarcParser {
  static BiblioItem parseBiblio(
      BiblioItem biblioItem, Map<String, dynamic> marcInJSON) {
    for (var field in marcInJSON["fields"]) {
      var fieldId = field.keys.first;

      if (field[fieldId].runtimeType == String ||
          !field[fieldId].containsKey("subfields")) {
        continue;
      }

      var subfields = field[fieldId]["subfields"];

      for (var subfield in subfields) {
        var subfieldId = subfield.keys.first;
        if (subfield[subfieldId] == null) {
          continue;
        }

        switch (fieldId) {
          case "245":
            switch (subfieldId) {
              case "a":
                biblioItem.title = subfield[subfieldId];
                break;
              case "b":
                biblioItem.subtitle = subfield[subfieldId];
                break;
              case "c":
                biblioItem.author = subfield[subfieldId];
                break;
            }
            break;
          case "300":
            if (subfieldId == "a") {
              biblioItem.pages = subfield[subfieldId];
            }
            break;
          case "830":
            if (subfieldId == "a") {
              biblioItem.publisher = subfield[subfieldId];
            }
            break;
          case "250":
            if (subfieldId == "a") {
              biblioItem.publication = subfield[subfieldId];
            }
            break;
        }
      }
    }

    return biblioItem;
  }
}
