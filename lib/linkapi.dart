class LinkApi {
  static const String serveur = "http://localhost/ecommerce_Kmandi";

//Images
  static const String imagestatic = "http://localhost/ecommerce_Kmandi/upload";
  static const String imagesCategories = "$imagestatic/categories ";
  static const String imagesItems = "$imagestatic/items ";
/*-------------------------*/


  static const String test = "$serveur/test.php";

  // Auth Links
  static const String signUp = "$serveur/auth/signup.php";
  static const String verifycodeSignUp = "$serveur/auth/verfiycode.php";

  static const String login = "$serveur/auth/login.php";

  // Forget Password
  static const String checkEmail = "$serveur/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "$serveur/forgetpassword/verifycode.php";
  static const String resetPassword =
      "$serveur/forgetpassword/resetpassword.php";

  //Home
  static const String homepage = "$serveur/home.php";

  // items
  static const String items = "$serveur/items/items.php"  ;

    // Favorite
  static const String favoriteAdd = "/favorite/add.php";
  static const String favoriteRemove = "/favorite/remove.php";
}
