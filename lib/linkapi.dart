class LinkApi {
  // ce file contient les APIs du backend

  static const String serveur = "http://localhost/ecommerce_Kmandi";

//Images
  static const String imagestatic = "http://localhost/ecommerce_Kmandi/upload";
  static const String imagesCategories = "$imagestatic/categories ";
  static const String imagesItems = "$imagestatic/items ";
/*-------------------------*/

  static const String test = "$serveur/test.php";

  // Notification
  static const String notification = "$serveur/notification.php";

  // Auth Links
  static const String signUp = "$serveur/auth/signup.php";
  static const String verifycodeSignUp = "$serveur/auth/verfiycode.php";
  static const String resend = "$serveur/auth/resend.php";

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
  static const String items = "$serveur/items/items.php";
  static const String searchitems = "$serveur/items/search.php";

  // Favorite
  static const String favoriteAdd = "$serveur/favorite/add.php";
  static const String favoriteRemove = "$serveur/favorite/remove.php";
  //to display favorite product
  static const String favoriteView = "$serveur/favorite/view.php";

  static const String deletefromfavorite =
      "$serveur/favorite/deletefromfavroite.php";

  //Cart
  static const String cartview = "$serveur/cart/view.php";
  static const String cartadd = "$serveur/cart/add.php";
  static const String cartdelete = "$serveur/cart/delete.php";
  static const String cartgetcountitems = "$serveur/cart/cartgetcountitems.php";

  // Adress Client

  static const String addressView = "$serveur/address/view.php";
  static const String addressAdd = "$serveur/address/add.php";
  static const String addressEdit = "$serveur/address/edit.php";
  static const String addressDelete = "$serveur/address/delete.php";

  //Coupon
  static const String checkcoupon = "$serveur/coupon/checkcoupon.php";

  // Checkout
  static const String checkout = "$serveur/orders/checkout.php";

  static const String pendingorders =
      "$serveur/orders/pending.php"; //mes commandes en cours
  static const String ordersarchive =
      "$serveur/orders/archive.php"; // les commandes l c'est bon weslouni
  static const String ordersdetails = "$serveur/orders/details.php";
  static const String ordersdelete = "$serveur/orders/delete.php";

  //Offers
  static const String offers = "$serveur/offers.php";


}
