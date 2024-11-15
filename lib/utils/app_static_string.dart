class AppStrings {

  /// <============================RegPattern ======================================>
  static RegExp emailRegexp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static RegExp passRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.{8,}$)');



  ///=============================OnBoarding================================

  static const hi = "Hi";
  static const title = "title";
  static const value = "value";
  static const address = "Address";
  static const enterAddress = "enter your address";
  static const selectCategory = "Select Category";
  static const edit = "edit";
  static const next = "Next";
  static const easyOrderingSystem  = "Easy Ordering System ";
  static const easyPaymentMethod = "Easy Payment Method";
  static const getStart = "Get Start";

  ///=============================SignUp+SignIn================================
   static const String passwordMustHaveEightWith ="Password must have 8 characters With(A-z,a-z,0-9)";
  static const String fieldCantBeEmpty="Field can't be empty";
  static const String passwordLengthAndContain =
      "Password must be 8 characters long & must include one capital letter";
  static const String pleaseEnterYourEmailAddresss="Please enter your email address";
  static const String enterAValidName="Enter a valid name";
  static const String enterValidEmail="Enter a valid email";
  static const welcomeBack = "Welcome Back";
  static const email = "Email";
  static const all = "All";
  static const category = "Category";
  static const password = "Password";
  static const rememberMe = "Remember me";
  static const forgotPassWord= "Forgot Password ?";
  static const logIn = "Log In";
  static const youDontHaveAnAccount="You don't have an account yet?";
  static const signUp = "Sign Up";
  static const orLogin= "or login with";
  static const createAccount = "Create Account";
  static const fullName = "Full name";
  static const emailAddress = "Email address";
  static const phoneNumber = "Phone Number";
  static const confirmPassword = "Confirm Password";
  static const byClickingSignupYou = "By clicking sign up you certify that you agree to our privacy policy and terms and condition";
  static const alreadyHaveAnAccount = "already have an account?";
  static const signUpSuccessfully = "Sign up Successfully";
  static const sendACode = "Send a Code";
  static const checkYourEmail = "Check your email";
  static const weSentAResetLink = "We sent a reset link to your mail enter 5 digit code that mentioned in the email";
  static const  resendOTP = " Resend OTP";
  static const verifyCode = "Verify code";
  static const setNewPassword = "Set a new password";
  static const createNewPasswordEnsure= "Create a new password. Ensure it differs from previous ones for security";
  static const newPassword = "New Password";
  static const updatePassword = "Update Password";
  static const successfully = "Successfully";
  static const yourPasswordHasBeenUpdated = "Your password has been updated, please change your password regularly to avoid this happening";
  static const coontinue="Continue";



  ///=============================Subscription Section================================
  static const getStaredFree  = "Get Stared free ";
  static const buySubscription = "Buy Subscription";
  static const note= "Note: You can add only ten ads per month";
  static const subscriptions = "Subscriptions";
  static const buyNow = "Buy Now";


  static const selectArea = "Select Area";
  static const pleaseSelectYourCitricArea= "Please Select your citric area";
  static const selectYourCurrentCity = "Select Your Current City";
  static const selectYourCurrentArea= "Select Your Current Area";
  static const submit="Submit";


  ///===================================Home Section=====================================

  static const location= "Location";
  static const search="Search";
  static const categories = "Categories";
  static const seeAll = "See all";
  static const specialOffers = "Special Offers";
  static const featuredProducts = "Featured Products";
  static const topDeals = "Top Deals";
  static const details = "Details";
  static const getANewCarDiscount = "Get a new car discount only valid this week";

  ///===================================Car details section=====================================

  static const horsepower = "Horsepower";
  static const torque = "Torque";
  static const mph = "0-60 mph";
  static const features = "Features";
  static const design = "Design";
  static const price = "Price";
  static const performance = "Performance";
  static const topSpeed = "Top Speed";
  static const transmission = "Transmission";
  static const notableFeatures = "Notable Features";
  static const bluetoothConnectivity = "Bluetooth Connectivity";
  static const automaticClimateControl = "Automatic Climate Control ";
  static const keySpecsOfTesla = "Key specs of";
  static const conversation = "Conversation";
  static const getOfferFromDealer = "Get offer from dealer";
  static const name = "Name";
  static const map = "Map";
  static const discount = "Discount";
  static const total = "Total";
  static const orderTime = "Order Time";
  static const expectedDeliveryTime = "Expected delivery time";


  ///===========================================House details=======================================
  static const rent  = "Rent";
  static const classicalHouse  = "Classical House  ";
  static const  sqft = "in sqft";

  ///===========================================House details=======================================
  static const  capacity = "Capacity";
  static const  sizeAndWeight = "Size and Weight";


  ///===========================================Add products Section=======================================

  static const car  = "Car";
  static const house = "House";
  static const mobile = "Mobile";
  static const addProducts = "Add Products";
  static const productName = "Product Name";
  static const productsShortDescription  = "Products Short Description ";
  static const productImage = "Product Image";
  static const addImageTotal = "Add Image total 6";
  static const productPriceCurrency = "Product Price Currency";
  static const productPrice = "Product Price";
  static const color  = "Color ";
  static const size = "Size";
  static const productQuantity = "Product Quantity";
  static const weight = "Weight";
  static const speed = "Speed";
  static const climateControl  = "Climate Control ";
  static const newOrUsed = "New or Used";
  static const buy = "Buy";
  static const buyAndConversation = "Buy & Conversation";
  static const publish = "Publish";
  static const bedrooms = "Bedrooms";
  static const bathrooms = "Bathrooms";
  static const buildInYear = "Build in year";
  static const livingRoom = "Living room";
  static const area = "Area";
  static const carParkingArea = "Car Parking Area";
  static const display = "Display";
  static const chip = "Chip";
  static const camera = "Camera";
  static const storage = "Storage";
  static const battery = "Battery";
  static const faceID = "Face ID";


  ///===========================================Profile details=======================================

  static const myProfile = "My profile";
  static const userID = "User@ ID";
  static const settings = "Settings";
  static const myOrder = "My order";
  static const mySubscription = "My Subscription";
  static const myDashboard = "My Dashboard";
  static const orderRequest = "Order Request";
  static const allProducts = "All Products";
  static const logOut = "Log Out ";
  static const updateYourLocation = "Update your Location";
  static const selectYourCity = "Select Your City";
  static const saveAndUpdate = "Save & Update";
  static const readAll = "Read all";
  static const delete = "Delete";
  static const makeAsRead = "make as read";
  static const cancel = "Cancel";
  static const yes = "Yes";
  static const deleteAccount = "Delete account";
  static const areYouSureYouWantToDeleteYourAccount= "Are you sure you want to Delete your account?";
  static const yourCurrentPassword = "Your Current Password";
  static const changePassword = "Change Password";
  static const notifications = "Notifications";
  static const toDays = "Todays";
  static const yesterday = "Yesterday";
  static const noNotifications = "No notifications";
  static const youHaveNonotifications= "You have no notifications at this time thank you";
  static const privacyPolicy = "Privacy Policy";
  static const startDate = "Start Date";
  static const validDate = "Valid Date";
  static const addSubscription = "Add Subscription";
  static const purchaseFor = "Purchase For";
  static const packageValidity = "Package Validity";
  static const addProductsForYourBusiness = "Add 15 Products for your business";
  static const editProductsDetails= "Edit Products details";
  static const manageOrders = "Manage Orders";
  static const areYouSureYouWantToLogout = "Are you sure you want to logout?";
  static const about = "About";
  static const budget = "Budget";
  static const filter = "Filter";


  ///==========================================For  Chat Section=================================

  static const chat = "Chat ";
  static const writeYourMessage = "Manage Orders";



  ///==========================================For  Payment Section=================================
  static const paymentMethod = "Payment Method";
  static const paymentSuccessful = "Payment Successful";
  static const yourPaymentHasBeenSuccessful = "Your payment has been successful";
  static const backToHome = "Back to home";
  static const giveRating = "Give Rating";
  static const confirmPay = "Confirm Pay";
  static const orderDetails = "Order details";
  static const buyingDate = "Buying Date";
  static const guaranty = "Guaranty";
  static const warranty = "Warranty";
  static const uploadSuccessfully = "Uploaded Successfully";
  static const itIsALogEstablishd = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";
  static const sorry="Sorry!!!!";
  static const profileUpdateSuccessfully="Profile Updated Successfully";

  ///==========================================For  Settings Section=================================

  static const firstname="First name";
  static const lastName="Last name";
  static const editProfile="Edit Profile";
  static const setYourCurrentLocation="Set your current location";
  static const orderHistory="Order history ";
  static const rateThisProducts="Rate this Products";
  static const giveAReviewToThiService ="Give a review to this service";
  static const writeSomethingAboutThisProducts="Write something about this products  ";
  static const writeHere ="Write here...";
  static const ratingSuccessfully ="Rating Successfully";
  static const myWishlist ="My Wishlist";

  ///========================================For Dashboard Section=========================================
  static const totalAddProducts ="Total Add Products";
  static const totalOrderList ="Total Order List";
  static const totalProductStock ="Total Product Stock";
  static const addNewProduct ="Add new product";
  static const complete ="Complete";
  static const rejected ="Rejected";
  static const pending ="Pending";

  static const String typeCHECKBOX = "CHECKBOX";
  static const String typeRADIO = "RADIO";
  static const String typeCHOOSE = "CHOOSE";
  static const String typeIMAGE = "IMAGE";
  static const String typeDATE = "DATE";
  static const String typeINPUT = "INPUT";
  static const String index = "index";
}
