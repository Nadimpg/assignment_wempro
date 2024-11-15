class ApiConstant {
 //live
  static const baseUrl = "http://167.172.249.13:5000";

  //local
  //static const baseUrl = "http://192.168.10.116:5000";


  static const socketUrl = "http://167.172.249.13:5000";
  //static const socketUrl = "http://192.168.10.116:5000";

  ///<=================================== For Auth section ====================>
  static const logIn = "/api/auth/login";
  static const signUp = "/api/auth/register";
  static const verified = "/api/auth/verify-email";
  static const forgetPass = "/api/auth/forgot-password";
  static const reset = "/api/auth/reset-password";

  ///<================================== profile ===============================>
  static const loggedUser = "/api/auth/loggeduser";
  static const profileUpdate = "/api/auth/profile-update";

  ///<================================== Settings ===============================>
  static const updatePassword = "/api/auth/change-password";
  static const privacy = "/api/privacy";
  static const aboutUs = "/api/aboutus";
  static const allCat = "/api/allcategory";
  static const myProduct = "/api/product-me";
  static const banner = "/api/product/banner/all";
  static const cateWiseProduct = "/api/product/category";
  static const featureProduct = "/api/product/featured/all";
  static const notification = "/api/my-notification";
  static const product = "/api/product";
  static const productDetails = "/api/product";
  static const search = "/api/product/search/byname";
  static const filter = "/api/product/filter/byquery";
  static const getWish = "/api/product/wishlist/all";
  static const addWishList = "/api/product/add/wishlist";
  static const category = "/api/category";
  static const postProduct = "/api/product";
  static const updateProduct = "/api/product/update";
  static const deleteProduct = "/api/product";
  static const conversation = "/api/get-conversation";
  static const conversationId = "/api/conversationId";
  static const getMessage = "/api/get-message";
  static const deleteAccount = "/api/auth/delete-account";

}