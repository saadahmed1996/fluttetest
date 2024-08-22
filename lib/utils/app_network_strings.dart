class NetworkStrings {
  ////////////////////// API BASE URL //////////////////////////////////
  // Client CPanel
  static const String API_BASE_URL = "https://dummyjson.com/";

  /////// API HEADER TEXT ////////////////////////
  static const String ACCEPT = 'application/json';
  ////////////////////// API ENDPOINTS  ////////////////////////

  static const String POST_ENDPOINT = "posts";
  static const String POST_ADD_ENDPOINT = "posts/add";
  static const String POST_DELETE_ENDPOINT = "posts/";

  ////// API STATUS CODE/////////////
  static const int SUCCESS_CODE = 200;
  static const int UNAUTHORIZED_CODE = 401;
  static const int CARD_ERROR_CODE = 402;
  static const int BAD_REQUEST_CODE = 400;
  static const int FORBIDDEN_CODE = 403;

  /////////// API MESSAGES /////////////////
  static const int API_SUCCESS_STATUS = 1;
  static const String EMAIL_UNVERIFIED = "0";
  static const String EMAIL_VERIFIED = "1";
  static const String PROFILE_INCOMPLETED = "0";
  static const String PROFILE_COMPLETED = "1";

  static const String ADMIN_APROVED = "1";
  static const String ADMIN_NOTAPROVED = "0";
  static const int USER_SUBSCRIBED = 1;
  static const int USER_NOTSUBSCRIBED = 0;

  /////////// USER PAYMENT STATUS VALUE /////////////////
  static const int PAID_USER = 1;
  static const int UN_PAID_USER = 0;
  static const int PAID_DATA = 1;
  static const int UN_PAID_DATA = 0;
  static const int GUEST_USER = 1;
  static const String ADMIN_ACTIVITY = 'admins';
  static const String USER_ACTIVITY = 'users';

  /////////// API TOAST MESSAGES //////////////////
  static const String NO_INTERNET_CONNECTION = "No Internet Connection!";
  static const String SOMETHING_WENT_WRONG = "Something Went Wrong";
  static const String STATUS_NOT_FOUND = "No Status Found";
  static const String INVALID_CARD_ERROR = "Invalid Card Details.";
  static const String CARD_TYPE_ERROR = "Wrong card type.";
  static const String INVALID_BANK_ACCOUNT_DETAILS_ERROR =
      "Invalid Bank Account Details.";
  static const String MERCHANT_ACCOUNT_ERROR =
      "Error:Merchant Account can not be created.";

//---------------- API SHOW ERROR MESSAGE -------------------//

  static const String NOTIFICATION_EMPTY_ERROR = "Notification not found";
  static const String CONTENT_EMPTY_ERROR = "Content not found";
  static const String CHAT_EMPTY_ERROR = "Chat not found";
  static const String STATUS_EMPTY_ERROR = "Stories not found";
  static const String MY_STATUS_EMPTY_ERROR = "My Stories not found";
  static const String MEDIA_EMPTY_ERROR = "Media not found";
  static const String CONNECTION_REQUEST_EMPTY_ERROR =
      "Connection Request not found";
  static const String PARTNER_EMPTY_ERROR = "Partners not found";
  static const String PENDING_PARTNER_EMPTY_ERROR =
      "Pending partners not found";
  static const String REQUEST_EMPTY_ERROR = "Requests not found";
}
