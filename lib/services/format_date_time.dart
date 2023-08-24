class FormatDateTime {
  static String formatDate(String dateTime) {
    try {
      final date = DateTime.parse(dateTime);
      final String formatedDate = "${date.year}/${date.month}/${date.day}";
      return formatedDate;
    } catch (e) {
      // print(e);
      return "2023/08/20";
    }
  }
}
