class BiblioItem {
  int? itemId;
  int? biblioId;
  String? title;
  String? subtitle;
  String? author;
  String? itemType;
  String? pages;
  String? publisher;
  String? publication;

  String getFullName() {
    return (title ?? '') + (subtitle ?? '');
  }

  @override
  String toString() {
    Map<String, dynamic> map = {
      "itemId": itemId,
      "biblioId": biblioId,
      "title": title,
      "subtitle": subtitle,
      "author": author,
      "itemType": itemType,
      "pages": pages,
      "publisher": publisher,
      "publication": publication,
    };
    return map.toString();
  }
}
