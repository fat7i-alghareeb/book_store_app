String getImage({String? olid, int? id}) {
  if (olid != null) {
    return getImageByOlid(olid);
  } else {
    return getImageById(id!);
  }
}

String getImageByOlid(String olid) {
  return "https://covers.openlibrary.org/b/olid/$olid-M.jpg";
}

String getImageById(int id) {
  return "https://covers.openlibrary.org/b/id/$id-M.jpg";
}
