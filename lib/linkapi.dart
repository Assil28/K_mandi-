class LinkApi {
  static const String serveur = "http://localhost:4200/ecommerce";

  static const String test = "$serveur/test.php";

  // Auth Links
  static const String signUp = "$serveur/auth/signup.php";
  static const String verifycodeSignUp = "$serveur/auth/verfiycode.php";

  static const String login = "$serveur/auth/login.php";


  // Forget Password
  static const String checkEmail = "$serveur/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword   = "$serveur/forgetpassword/verifycode.php";
  static const String resetPassword = "$serveur/forgetpassword/resetpassword.php";
}
