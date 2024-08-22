class AppStrings {
  static bool isFromPhone = false;
  static const String appTitle = "Flutter Test Project";
  static const String defaultCountryCodeOnPhoneNumber = 'US';
  static const String googleMapKey = "none";

  static const String CURRENT_USER_EMAIL_KEY = 'current_user_email';

  ////////////////////// DYNAMIC LINK DATA //////////////////////////////////
  static const String DYNAMIC_URL = 'none';
  static const String POST_ID = 'postId';
  static const String POST_INDEX = 'postIndex';
  static const String APP_PACKAGE_NAME = 'none';
  static const String APP_BUNDLE_ID = 'none';
  static const int ANDROID_MINIMUM_VERSION = 1;
  static const String IOS_MINIMUM_VERSION = '1';
  static const String APP_STORE_ID = 'none';

  ///Order status
  static const CURRENT = 'current';
  static const HISTORY = 'history';
  static const IN_PROGRESS = 'In_Progress';
  static const ON_THE_WAY = 'On_The_Way';
  static const COMPLETED = 'Completed';
  static const CANCELLED = 'Cancelled';
  static const CANCEL = 'Cancel';
  static const INPROGRESS = 'In Progress';
  static const ONTHEWAY = 'On the way';

  //Add New Card
  static const CARD_HOLDER_TEXT = 'Card Holder';
  static const CARD_NUMBER_TEXT = 'Card Number';
  static const EXPIRY_DATE_TEXT = 'Expiry Date';
  static const CVC_TEXT = 'CVC';
  static const ADD_TEXT = 'Add';

  static const String message = "Message";
  static const String audio = "Audio";
  static const String image = "Image";
  static const String camera = "Camera";
  static const String gallery = "Gallery";

  static const String DESCRIPTION_EMPTY_ERROR =
      'Description field can\'t be empty';
  static const String EMAIL_EMPTY_ERROR = "Email field can't be empty.";
  // static const String EMAIL_INVALID_ERROR = "Please enter valid email address.";
  static const String EMAIL_INVALID_ERROR = "Email field can't be empty.";
  static const String PHONE_NO_EMPTY_ERROR =
      'Phone number field can\'t be empty.';
  static const String PHONE_NO_INVALID_LENGTH =
      'Please enter valid Phone number.';
  static const String USERNAME_EMPTY_ERROR_TEXT = 'Name field can\'t be empty';
  static const String USERNAME_INVALID_ERROR_TEXT =
      'Please enter valid User name.';
  static const String USERNAME_SPACE_ERROR_TEXT = 'Name field can\'t be empty';
  static const String FACEBOOK_URL_EMPTY_ERROR = ' field can\'t be empty';
  static const String INSTA_URL_EMPTY_ERROR = 'Instagram field can\'t be empty';
  static const String TWITTER_URL_EMPTY_ERROR = 'Twitter field can\'t be empty';
  static const String FEEDBACK_URL_EMPTY_ERROR =
      'Feedback field can\'t be empty';

  //Gallery Camera Text
  static const String IMAGE_FILE_TYPE = "file";
  static const String IMAGE_ASSETS_TYPE = "Asset";
  static const String IMAGE_NETWORK_TYPE = "network";
  static const String SOMETHING_WENT_WRONG_ERROR = "Something went wrong";
  static const String CAMERA = "Camera";
  static const String GALLERY = "Gallery";
  static const String FILE = "File";

  //Prelogin
  static const String signinWithEmail = "Sign in with Email";
  static const String signinWithPhone = "Sign in with Phone";
  static const String signinWithGoogle = "Sign in with Google";
  static const String signinWithApple = "Sign in with Apple";
  static const String preLogin = "Pre Login";
  static const String termsAndCondition = "Terms & Conditions";
  static const termsAndConditionType = 'tc';
  static const privacyPolicy = "Privacy Policy";
  static const privacyPolicyType = "pp";
  static const aboutAppPolicyType = "about-app-policy";
  static const bySigningIn = 'By Sign-in, You agree to our\n';

  //Verification
  static const verfication = "Verification";
  static const invalidVerficationCode = "Please enter valid verification code";
  static const verifcationDetailTxt = '''
  We have sent you a six-digits one-time\n password on your email address / phone 
  number with instructions. Please follow the instructions to sign-in.
  ''';
  static const String codeDidntReceiveCode = "Don't received the code?";
  static const String resend = " Resend";
  static const String resndCodeMessage =
      'We have resend  OTP verification code at your email address';
  static const String phoneOtpCodeMessage =
      'OTP verification code has been sent to your phone number.';

  static const String webViewUrll = "https://www.lipsum.com/";
  static const String firstName = "First Name";
  static const String lastName = "Last Name";
  static const String dob = "Date of Birth";
  static const String address = "Address";
  static const String phoneNumber = "Phone Number";
  static const String emailAddress = "Email Address";
  static const String country = "Country";
  static const String zipCode = "Zip Code";
  static const String age = "Age";
  static const String continueTxt = "Continue";
  static const String reSetTxt = "Reset Design";
  static const String productPreview = "Product Preview";
  static const String productVariants = "Product Variants";
  static const String invalidPhoneNumber = "Invalid phone number.";
  static const String emptyPhoneNumber = "Phone number field can't be empty.";
  static const String emptyCardNumber = "Card number field can't be empty.";
  static const String emptyZipCode = "Zip Code field can't be empty.";
  static const String invalidEmailAddress = "Please enter valid email address.";
  static const String invalidZipCode = "Please enter valid zip code.";
  static const String invalidCardNumber = "Please enter valid card number.";
  static const String emptyEmailAddress = "Email field can't be empty.";
  static const String add = "Add";

  //Notifications
  static const String notifications = "Notification";
  static const String notificationRemoveDialogue =
      "Are you sure you want \n to remove this notification?";
  static const String reviewRemoveDialogue =
      "Are you sure you want \n to remove this reivew?";
  static const String reviewEditDialogue =
      "Are you sure you want \n to edit this reivew?";
  static const String notificationDeleted =
      "Notification deleted successfully.";
  static const String SELECT_RATING = "Please Select Rating";

  //drawer
  static const String helpAndFeedback = "Help & Feedback";
  static const String logoutSuccessfully = "User log out successfully.";
  static const String logOut = "Logout";

  // ---------------------- Shared Preference Key Names ------------------------ //
  static const String BEARER_TOKEN_KEY = "bearer_token";
  static const String CURRENT_USER_DATA_KEY = "current_user_data";
  static const String CURRENT_FILTER_DATA_KEY = "current_filter_data";
  static const String NOTIFICATION_MESSAGE_ID_KEY = "notification_message_id";
  static const String VIEW_ONBOARDING_DATA_KEY = 'onboard';
  static const String LANGUAGE_KEY = 'languagekey';
  static const String CART = 'CART';

  static const String WISHLIST = 'WISHLIST';

  // ----------------------- Device Type ------------------------------ //
  static const String ANDROID = "android";
  static const String IOS = "ios";

  //----------------- Content Type -----------------
  static const String TERMS_CONDITION_TYPE = "terms-and-condition";
  static const String PRIVACY_POLICY_TYPE = "privacy-policy";

//----------------- Not Found Text-----------------
  static const String dataNotFound = "Data not found.";
  static const String frameNotFound = "Frame  not found.";
  static const String designNotFound = "Design not found.";
  static const String reviewNotFound = "Review not found.";

  // ------------------- Firebase Error Strings -------------------------//
  static const String INVALID_PHONE_NUMBER = "invalid-phone-number";
  static const String INVALID_PHONE_NUMBER_MESSAGE = "Invalid phone number";
  static const String CODE_EXPIRED_ERROR = "Code expired.";

  /// PUSH NOTIFICATION CHANNEL /////////////
  static const String NOTIFICATION_ID = "none";
  static const String NOTIFICATION_TITLE = "TrueHomes Notification";
  static const String NOTIFICATION_DESCRIPTION =
      "This channel is used for important notifications.";

  ///LOCAL NOTIFICATION CHANNEL ///////////
  static const String LOCAL_NOTIFICATION_ID = "sumair_local_channel1";
  static const String LOCAL_NOTIFICATION_TITLE = "Sumair local Notification.";
  static const String LOCAL_NOTIFICATION_DESCRIPTION =
      "This channel is used for local notifications.";

  ///PUSH NOTIFICATION TYPE ///////////
  static const String FOREGROUND_NOTIFICATION = "foreground";
  static const String BACKGROUND_NOTIFICATION = "background";
  static const String KILLED_NOTIFICATION = "killed";

  ///----------------- NOTIFICATION KEY TYPE ------------- //
  static const String ANNOUNCEMENT_NOTIFICATION_TYPE = "announcement";

  //Bottom Navigation Strings
  static const String HOME_TITLE = "Home";
  static const String CART_TITLE = "Cart";
  static const String ORDER_HISTORY_TITLE = "Categories";
  static const String PROFILE_TITLE = "Profile";
  static const String WALLET_TITLE = "Wallet";

  // -------------- Galley Camera Text ---------
  static const String CAMERA_TEXT = "CAMERA";
  static const String GALLERY_TEXT = "GALLERY";
  static const String FILE_TEXT = "FILE";
  static const String IMAGE_TYPE_FILE = "file";
  static const String IMAGE_TYPE_NETWORK = "network";
  static const String IMAGE_TYPE_ASSET = "asset";

  //Login Types
  static const String GOOGLE_SOCIAL_TYPE = "google";
  static const String PHONE_SOCIAL_TYPE = "phone";
  static const String APPLE_SOCIAL_TYPE = "apple";

  static const String BIO_DUMMY =
      "Lorem ipsum dolor sit amet, conse ctetur ipisic ingelit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim adinim veniam, quis nostrud exercitation";

  //FOR NOTIFICATION
  static const String NOTIFICAITION_APPBAR_TITLE = "Notifications";
  static const loremIpsum = "Lorem Ipsum is simply";
  static const smallText =
      'Lorem ipsum dolor sit amet non consectetur Egestas tellus';

  //! =============================> Pre Login Strings

  //! =============================> Create Profile Dropdowns List

  static List<String> languageList = [
    "English",
    "Mandarin",
    "Korean",
  ];

  static const List<String> genderList = [
    "Male",
    "Female",
  ];

  static const List<String> ethnicityList = [
    'Asian',
    'Black or African American',
    'Hispanic or Latino',
    'White',
    'Other',
  ];

  static const List<String> familyPlanOptions = [
    'Basic',
    'Standard',
    'Premium',
  ];

  static const List<String> animeNicheOptions = [
    'Shounen',
    'Shoujo',
    'Seinen',
    'Josei',
    'Mecha',
    'Isekai',
    'Slice of Life',
    'Fantasy',
    'Sci-Fi',
    'Romance',
    'Action',
    'Adventure',
    'Comedy',
    'Drama',
    'Horror',
    'Mystery',
  ];

  static const List<String> languagesList = [
    "English",
    "Mandarin",
    "Korean",
  ];

  static const List<String> drawerTitleListUser = [
    "Home",
    "Shop",
    "Cart",
    "Chat",
    "My Whishlist",
    "Order Tracking",
    "Contact Us",
  ];

  // //! =============================> Dummy Response

  static const String USER_EMAIL = "none";
  static const String USER_PASSWORD = "none";

  static const String VENDOR_EMAIL = "none";
  static const String VENDOR_PASSWROD = "none";
}
