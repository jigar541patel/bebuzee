/// status : 1
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5iZWJ1emVlLmNvbS9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY4ODY1NzE3NywiZXhwIjoxNjg4NjYwNzc3LCJuYmYiOjE2ODg2NTcxNzcsImp0aSI6ImhNNlpUeTAwWHZmRnowamoiLCJzdWIiOiIxODA1MDcyIiwicHJ2IjoiNDBhOTdmY2EyZDQyNGU3NzhhMDdhMGEyZjEyZGM1MTdhODVjYmRjMSJ9.FR1y-kEsv1DhipiOIcGMxzZrpTjhXJZW6-zpUrAECHk"
/// token_type : "bearer"
/// expires_in : 3600
/// data : {"user_id":1805072,"type":"user","name":"flutter","email":"bebuzeeflutter2@gmail.com","shortcode":"bebuzeeflutter2rot7","image":"https://www.bebuzee.com/upload/images/users/profile/20230706071038_64a668eee9254.webp","gender":"male","designation":null,"mobile":"1234567890","country_code":"0","member_token":"","varified":"","website_url":null,"category_display":false,"category":"","account_private":false,"direct_message":false,"highlight_status":false,"post_total":5,"follower_count":0,"following_count":9,"follow_status":0,"profile_bio":null,"country_id":5,"country_name":"India","location_logo":"https://www.bebuzee.com/upload/images/country/20220215145542_620bbeee3c47e.png","shopping_logo":"https://www.bebuzee.com/upload/images/country/shopping/20220215145542_620bbeee3c47e.png","properbuz_logo":"https://www.bebuzee.com/upload/images/country/properbuz/20220215145542_620bbeee3c47e.png","tradesmen_logo":"https://www.bebuzee.com/upload/images/country/tradesmen/20220215145542_620bbeee3c47e.png","two_step_verification":false,"two_step_verification_pin":"","firebase_token":"","chat_send":"0","read_status":false,"meadia_visibility":"0","font_size":"small","tradesmen_type":null}

class LoginModel {
  LoginModel({
      num? status, 
      String? accessToken, 
      String? tokenType, 
      num? expiresIn, 
      Data? data,}){
    _status = status;
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresIn = expiresIn;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _accessToken;
  String? _tokenType;
  num? _expiresIn;
  Data? _data;
LoginModel copyWith({  num? status,
  String? accessToken,
  String? tokenType,
  num? expiresIn,
  Data? data,
}) => LoginModel(  status: status ?? _status,
  accessToken: accessToken ?? _accessToken,
  tokenType: tokenType ?? _tokenType,
  expiresIn: expiresIn ?? _expiresIn,
  data: data ?? _data,
);
  num? get status => _status;
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  num? get expiresIn => _expiresIn;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// user_id : 1805072
/// type : "user"
/// name : "flutter"
/// email : "bebuzeeflutter2@gmail.com"
/// shortcode : "bebuzeeflutter2rot7"
/// image : "https://www.bebuzee.com/upload/images/users/profile/20230706071038_64a668eee9254.webp"
/// gender : "male"
/// designation : null
/// mobile : "1234567890"
/// country_code : "0"
/// member_token : ""
/// varified : ""
/// website_url : null
/// category_display : false
/// category : ""
/// account_private : false
/// direct_message : false
/// highlight_status : false
/// post_total : 5
/// follower_count : 0
/// following_count : 9
/// follow_status : 0
/// profile_bio : null
/// country_id : 5
/// country_name : "India"
/// location_logo : "https://www.bebuzee.com/upload/images/country/20220215145542_620bbeee3c47e.png"
/// shopping_logo : "https://www.bebuzee.com/upload/images/country/shopping/20220215145542_620bbeee3c47e.png"
/// properbuz_logo : "https://www.bebuzee.com/upload/images/country/properbuz/20220215145542_620bbeee3c47e.png"
/// tradesmen_logo : "https://www.bebuzee.com/upload/images/country/tradesmen/20220215145542_620bbeee3c47e.png"
/// two_step_verification : false
/// two_step_verification_pin : ""
/// firebase_token : ""
/// chat_send : "0"
/// read_status : false
/// meadia_visibility : "0"
/// font_size : "small"
/// tradesmen_type : null

class Data {
  Data({
      num? userId, 
      String? type, 
      String? name, 
      String? email, 
      String? shortcode, 
      String? image, 
      String? gender, 
      dynamic designation, 
      String? mobile, 
      String? countryCode, 
      String? memberToken, 
      String? varified, 
      dynamic websiteUrl, 
      bool? categoryDisplay, 
      String? category, 
      bool? accountPrivate, 
      bool? directMessage, 
      bool? highlightStatus, 
      num? postTotal, 
      num? followerCount, 
      num? followingCount, 
      num? followStatus, 
      dynamic profileBio, 
      num? countryId, 
      String? countryName, 
      String? locationLogo, 
      String? shoppingLogo, 
      String? properbuzLogo, 
      String? tradesmenLogo, 
      bool? twoStepVerification, 
      String? twoStepVerificationPin, 
      String? firebaseToken, 
      String? chatSend, 
      bool? readStatus, 
      String? meadiaVisibility, 
      String? fontSize, 
      dynamic tradesmenType,}){
    _userId = userId;
    _type = type;
    _name = name;
    _email = email;
    _shortcode = shortcode;
    _image = image;
    _gender = gender;
    _designation = designation;
    _mobile = mobile;
    _countryCode = countryCode;
    _memberToken = memberToken;
    _varified = varified;
    _websiteUrl = websiteUrl;
    _categoryDisplay = categoryDisplay;
    _category = category;
    _accountPrivate = accountPrivate;
    _directMessage = directMessage;
    _highlightStatus = highlightStatus;
    _postTotal = postTotal;
    _followerCount = followerCount;
    _followingCount = followingCount;
    _followStatus = followStatus;
    _profileBio = profileBio;
    _countryId = countryId;
    _countryName = countryName;
    _locationLogo = locationLogo;
    _shoppingLogo = shoppingLogo;
    _properbuzLogo = properbuzLogo;
    _tradesmenLogo = tradesmenLogo;
    _twoStepVerification = twoStepVerification;
    _twoStepVerificationPin = twoStepVerificationPin;
    _firebaseToken = firebaseToken;
    _chatSend = chatSend;
    _readStatus = readStatus;
    _meadiaVisibility = meadiaVisibility;
    _fontSize = fontSize;
    _tradesmenType = tradesmenType;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _type = json['type'];
    _name = json['name'];
    _email = json['email'];
    _shortcode = json['shortcode'];
    _image = json['image'];
    _gender = json['gender'];
    _designation = json['designation'];
    _mobile = json['mobile'];
    _countryCode = json['country_code'];
    _memberToken = json['member_token'];
    _varified = json['varified'];
    _websiteUrl = json['website_url'];
    _categoryDisplay = json['category_display'];
    _category = json['category'];
    _accountPrivate = json['account_private'];
    _directMessage = json['direct_message'];
    _highlightStatus = json['highlight_status'];
    _postTotal = json['post_total'];
    _followerCount = json['follower_count'];
    _followingCount = json['following_count'];
    _followStatus = json['follow_status'];
    _profileBio = json['profile_bio'];
    _countryId = json['country_id'];
    _countryName = json['country_name'];
    _locationLogo = json['location_logo'];
    _shoppingLogo = json['shopping_logo'];
    _properbuzLogo = json['properbuz_logo'];
    _tradesmenLogo = json['tradesmen_logo'];
    _twoStepVerification = json['two_step_verification'];
    _twoStepVerificationPin = json['two_step_verification_pin'];
    _firebaseToken = json['firebase_token'];
    _chatSend = json['chat_send'];
    _readStatus = json['read_status'];
    _meadiaVisibility = json['meadia_visibility'];
    _fontSize = json['font_size'];
    _tradesmenType = json['tradesmen_type'];
  }
  num? _userId;
  String? _type;
  String? _name;
  String? _email;
  String? _shortcode;
  String? _image;
  String? _gender;
  dynamic _designation;
  String? _mobile;
  String? _countryCode;
  String? _memberToken;
  String? _varified;
  dynamic _websiteUrl;
  bool? _categoryDisplay;
  String? _category;
  bool? _accountPrivate;
  bool? _directMessage;
  bool? _highlightStatus;
  num? _postTotal;
  num? _followerCount;
  num? _followingCount;
  num? _followStatus;
  dynamic _profileBio;
  num? _countryId;
  String? _countryName;
  String? _locationLogo;
  String? _shoppingLogo;
  String? _properbuzLogo;
  String? _tradesmenLogo;
  bool? _twoStepVerification;
  String? _twoStepVerificationPin;
  String? _firebaseToken;
  String? _chatSend;
  bool? _readStatus;
  String? _meadiaVisibility;
  String? _fontSize;
  dynamic _tradesmenType;
Data copyWith({  num? userId,
  String? type,
  String? name,
  String? email,
  String? shortcode,
  String? image,
  String? gender,
  dynamic designation,
  String? mobile,
  String? countryCode,
  String? memberToken,
  String? varified,
  dynamic websiteUrl,
  bool? categoryDisplay,
  String? category,
  bool? accountPrivate,
  bool? directMessage,
  bool? highlightStatus,
  num? postTotal,
  num? followerCount,
  num? followingCount,
  num? followStatus,
  dynamic profileBio,
  num? countryId,
  String? countryName,
  String? locationLogo,
  String? shoppingLogo,
  String? properbuzLogo,
  String? tradesmenLogo,
  bool? twoStepVerification,
  String? twoStepVerificationPin,
  String? firebaseToken,
  String? chatSend,
  bool? readStatus,
  String? meadiaVisibility,
  String? fontSize,
  dynamic tradesmenType,
}) => Data(  userId: userId ?? _userId,
  type: type ?? _type,
  name: name ?? _name,
  email: email ?? _email,
  shortcode: shortcode ?? _shortcode,
  image: image ?? _image,
  gender: gender ?? _gender,
  designation: designation ?? _designation,
  mobile: mobile ?? _mobile,
  countryCode: countryCode ?? _countryCode,
  memberToken: memberToken ?? _memberToken,
  varified: varified ?? _varified,
  websiteUrl: websiteUrl ?? _websiteUrl,
  categoryDisplay: categoryDisplay ?? _categoryDisplay,
  category: category ?? _category,
  accountPrivate: accountPrivate ?? _accountPrivate,
  directMessage: directMessage ?? _directMessage,
  highlightStatus: highlightStatus ?? _highlightStatus,
  postTotal: postTotal ?? _postTotal,
  followerCount: followerCount ?? _followerCount,
  followingCount: followingCount ?? _followingCount,
  followStatus: followStatus ?? _followStatus,
  profileBio: profileBio ?? _profileBio,
  countryId: countryId ?? _countryId,
  countryName: countryName ?? _countryName,
  locationLogo: locationLogo ?? _locationLogo,
  shoppingLogo: shoppingLogo ?? _shoppingLogo,
  properbuzLogo: properbuzLogo ?? _properbuzLogo,
  tradesmenLogo: tradesmenLogo ?? _tradesmenLogo,
  twoStepVerification: twoStepVerification ?? _twoStepVerification,
  twoStepVerificationPin: twoStepVerificationPin ?? _twoStepVerificationPin,
  firebaseToken: firebaseToken ?? _firebaseToken,
  chatSend: chatSend ?? _chatSend,
  readStatus: readStatus ?? _readStatus,
  meadiaVisibility: meadiaVisibility ?? _meadiaVisibility,
  fontSize: fontSize ?? _fontSize,
  tradesmenType: tradesmenType ?? _tradesmenType,
);
  num? get userId => _userId;
  String? get type => _type;
  String? get name => _name;
  String? get email => _email;
  String? get shortcode => _shortcode;
  String? get image => _image;
  String? get gender => _gender;
  dynamic get designation => _designation;
  String? get mobile => _mobile;
  String? get countryCode => _countryCode;
  String? get memberToken => _memberToken;
  String? get varified => _varified;
  dynamic get websiteUrl => _websiteUrl;
  bool? get categoryDisplay => _categoryDisplay;
  String? get category => _category;
  bool? get accountPrivate => _accountPrivate;
  bool? get directMessage => _directMessage;
  bool? get highlightStatus => _highlightStatus;
  num? get postTotal => _postTotal;
  num? get followerCount => _followerCount;
  num? get followingCount => _followingCount;
  num? get followStatus => _followStatus;
  dynamic get profileBio => _profileBio;
  num? get countryId => _countryId;
  String? get countryName => _countryName;
  String? get locationLogo => _locationLogo;
  String? get shoppingLogo => _shoppingLogo;
  String? get properbuzLogo => _properbuzLogo;
  String? get tradesmenLogo => _tradesmenLogo;
  bool? get twoStepVerification => _twoStepVerification;
  String? get twoStepVerificationPin => _twoStepVerificationPin;
  String? get firebaseToken => _firebaseToken;
  String? get chatSend => _chatSend;
  bool? get readStatus => _readStatus;
  String? get meadiaVisibility => _meadiaVisibility;
  String? get fontSize => _fontSize;
  dynamic get tradesmenType => _tradesmenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['type'] = _type;
    map['name'] = _name;
    map['email'] = _email;
    map['shortcode'] = _shortcode;
    map['image'] = _image;
    map['gender'] = _gender;
    map['designation'] = _designation;
    map['mobile'] = _mobile;
    map['country_code'] = _countryCode;
    map['member_token'] = _memberToken;
    map['varified'] = _varified;
    map['website_url'] = _websiteUrl;
    map['category_display'] = _categoryDisplay;
    map['category'] = _category;
    map['account_private'] = _accountPrivate;
    map['direct_message'] = _directMessage;
    map['highlight_status'] = _highlightStatus;
    map['post_total'] = _postTotal;
    map['follower_count'] = _followerCount;
    map['following_count'] = _followingCount;
    map['follow_status'] = _followStatus;
    map['profile_bio'] = _profileBio;
    map['country_id'] = _countryId;
    map['country_name'] = _countryName;
    map['location_logo'] = _locationLogo;
    map['shopping_logo'] = _shoppingLogo;
    map['properbuz_logo'] = _properbuzLogo;
    map['tradesmen_logo'] = _tradesmenLogo;
    map['two_step_verification'] = _twoStepVerification;
    map['two_step_verification_pin'] = _twoStepVerificationPin;
    map['firebase_token'] = _firebaseToken;
    map['chat_send'] = _chatSend;
    map['read_status'] = _readStatus;
    map['meadia_visibility'] = _meadiaVisibility;
    map['font_size'] = _fontSize;
    map['tradesmen_type'] = _tradesmenType;
    return map;
  }

}