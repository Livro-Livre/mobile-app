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
      "itemId": this.itemId,
      "biblioId": this.biblioId,
      "title": this.title,
      "subtitle": this.subtitle,
      "author": this.author,
      "itemType": this.itemType,
      "pages": this.pages,
      "publisher": this.publisher,
      "publication": this.publication,
    };
    return map.toString();
  }
}
