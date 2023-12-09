class UserModel {
  String? username;
  String? email;
  String? photoUrl;
  String? country;
  String? bio;
  String? id;
  String? signedUpAt; // change to Timestamp from cloud
  String? lastSeen; // change to Timestamp from cloud
  bool? isOnline; 

  UserModel(
      {this.username,
      this.email,
      this.id,
      this.photoUrl,
      this.signedUpAt,
      this.isOnline,
      this.lastSeen,
      this.bio,
      this.country});
}