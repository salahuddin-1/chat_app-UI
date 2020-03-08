import 'package:calculator_app/models/user_model.dart';

class Message {

  // Variables
  final User sender;
  final String time;  //Would usually be type DateTime or Firebase Timestamp
  final String text;
  final bool isLiked;
  final bool unread;

// Constructer
Message({
  this.sender,
  this.time,
  this.text,
  this.isLiked,
  this.unread,

  });
}

// YOU - current user
final User currentUser = User (
  id: 0,
  name: "Current user",
  imageUrl: "assets/images/greg.jpg", // url of image
);

// USERS
final User naruto = User (
  id: 1,
  name: 'Naruto',
  imageUrl: "assets/images/greg.jpeg",
);
final User itachi = User (
  id: 2,
  name: 'Itachi',
  imageUrl: "assets/images/james.png",
);
final User luffy = User (
  id: 3,
  name: 'Luffy',
  imageUrl: "assets/images/john.jpeg",
);
final User natsu = User (
  id: 4,
  name: 'Natsu',
  imageUrl: "assets/images/olivia.jpeg",
);
final zoro = User (
  id: 5,
  name: 'Zoro',
  imageUrl: "assets/images/sam.jpeg",
);
final User kira = User (
  id: 6,
  name: 'Kira',
  imageUrl: "assets/images/sophia.jpeg",
);
final User vegeta = User (
  id: 7,
  name: 'Vegeta',
  imageUrl: "assets/images/steven.jpeg",
);

// FAVOURITES CONTACTS
List<User> favourites = [zoro, vegeta, natsu, luffy, naruto];

// EXAMPLES CHATS ON HOMESCREEN
List<Message> chats = [
  Message(
    sender: itachi,
    time: '5:30 PM',
    text: 'You don\'t have enough hate',
    isLiked: false,
    unread: true,
  ),
  
  Message(
    sender: natsu,
    time: '4:30 PM',
    text: 'I am fired up now',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: luffy,
    time: '3:30 PM',
    text: 'I am going to be the king of the pirates',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: kira,
    time: '2:30 PM',
    text: 'I am Kira !! And what can you do?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: vegeta,
    time: '1:30 PM',
    text: 'Kakaroooott I will surpass you',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: zoro,
    time: '12:30 PM',
    text: 'Till my name reaches upto the heaven',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: naruto,
    time: '11:30 AM',
    text: 'I will become Hokage',
    isLiked: false,
    unread: false,
  ),
];

//EXAMPLES MESSAGES IN CHAT SCREEN

List<Message> messages = [
  Message(
    sender: itachi,
    time: '5:30 PM',
    text: 'Yeah !!! I am just behind you, just you wait',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Still improvising',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: itachi,
    time: '3:45 PM',
    text: 'How\'s the workout going?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: itachi,
    time: '3:15 PM',
    text: 'I am good',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Fine what about you??',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: itachi,
    time: '2:00 PM',
    text: 'Hey , how are you ',
    isLiked: false,
    unread: true,
  ),

];


