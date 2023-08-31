class ApiConstants {
  static const String baseUrl =
      "https://luno-butget-production-43d5.up.railway.app/";
  static const String pathLogIn = "auth/userLogin";
  static const String pathLogInGoogle = "auth/googleLogin";
  static const String getListExpense = "category/findMany";
  static const String postCategory = "category/create";
  static const String pathGetCategory = "category/findMany";
  static const String pathGetExpense = "expense/findMany";
  static const String pathGetUser = "user/findOne";
  static const String pathPostExpense = "expense/create";
  static const String pathDeleteExpense = "expense/delete";
  static const String pathUpdateExpense = "expense/update";
  static const String pathUserRegister = "user/signUpWithUserName";
  static const String pathGetCategoryD = "category/findManyDefault";
  static const String pathGetReportExpense = "reportExpense";
  static const String pathRefreshToken = "auth/refreshToken";
  static const String pathDeleteCategory = "category/delete";
  static const String pathUpdateUser = "user/update";
}
