import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_shop/utils/formmatters/formmatter.dart';

class UserModel {
  final String id, username, email;
  String firstName, lastName, phoneNumber, profilePicture;

  UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.profilePicture});

  /// helper function to get full name
  String get fullName => '$firstName $lastName';

  /// helper function to format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// helper function to split full name into first and last name
  static List<String> nameParts(String fullName) => fullName.split(" ");

  /// helper function to generate username from the full name
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toUpperCase() : "";
    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  /// create empty user model
  static UserModel empty() => UserModel(
      id: '',
      username: '',
      email: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      profilePicture: '');

  /// convert to json for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  /// create user model from firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          username: document['username'] ?? '',
          email: document['email'] ?? '',
          firstName: document['firstName'] ?? '',
          lastName: document['lastName'] ?? '',
          phoneNumber: document['phoneNumber'] ?? '',
          profilePicture: document['profilePicture'] ?? '');
    }
    return UserModel.empty();
  }
}
