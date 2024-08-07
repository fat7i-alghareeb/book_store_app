String getImage({String? olid, int? id}) {
  if (olid != null) {
    return getImageByOlid(olid);
  } else {
    return getImageById(id ?? 1);
  }
}

String getImageByOlid(String olid) {
  return "https://covers.openlibrary.org/b/olid/$olid-L.jpg";
}

String getImageById(int id) {
  return "https://covers.openlibrary.org/b/id/$id-L.jpg";
}
