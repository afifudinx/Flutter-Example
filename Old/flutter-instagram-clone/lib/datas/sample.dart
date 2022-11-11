import 'package:flutter_instagram_clone/models/post.dart';
import 'package:flutter_instagram_clone/models/user.dart';

class Sample {
  static User zaksheuskaya = User(
      username: 'zaksheuskaya',
      profilePic: 'zaksheuskaya.jpg',
      isHasStory: true);
  static User bward = User(
    username: 'bward',
    profilePic: 'bob_ward.jpg',
  );
  static User khoa = User(username: 'khoa', profilePic: 'khoa.jpg');
  static User angle = User(
    username: 'angle',
    profilePic: 'angle.jpg',
    bioDesc:
        'Deserunt non velit duis in laborum minim cillum enim do fugiat cillum occaecat. Velit duis est laboris ullamco in ad. Pariatur proident anim aute ea ea ad id veniam. Quis exercitation ea ex mollit dolor qui labore.',
    isHasStory: true,
    name: 'Angle Hamilton',
  );
  static User bruno =
      User(username: 'brunosvd', profilePic: 'bruno_salvadori.jpg');
  static User selena = User(
    name: 'Selena Origin',
    username: 'selenaorigin',
    bioDesc:
        'Irure eiusmod elit exercitation aute. Culpa incididunt incididunt eu ullamco sint non duis mollit. Aliquip mollit cillum laborum fugiat cupidatat sunt fugiat incididunt veniam ullamco occaecat.',
    isHasStory: true,
    profilePic: 'selena.jpg',
  );
  static Post post1 = Post(
      caption:
          'Aliquip ad reprehenderit labore commodo dolor culpa exercitation incididunt in tempor. Laborum do consectetur reprehenderit qui mollit voluptate enim Lorem. Est quis irure aute fugiat fugiat. Excepteur dolor qui ipsum aliquip amet labore officia sint velit. Duis consectetur labore esse et duis deserunt laboris duis ullamco commodo consectetur cillum.',
      comments: {bward: 'great post!🔥', bruno: 'OMG!🤯'},
      user: angle,
      image: '1.jpg');
  static Post post2 = Post(
      caption:
          'Commodo adipisicing pariatur aliqua ad adipisicing veniam ipsum proident eu tempor. Excepteur proident eu veniam excepteur consectetur magna. Anim culpa irure incididunt id aute culpa dolore nulla reprehenderit laborum occaecat nisi. Ea ut officia anim ipsum adipisicing irure do eu Lorem ut amet anim.',
      comments: {bward: 'great post!🔥', bruno: 'OMG!🤯'},
      user: angle,
      image: '2.jpg');
  static Post post3 = Post(
    caption:
        'Nulla id nisi sit incididunt aliquip anim voluptate sint laboris ut. Excepteur cillum velit incididunt fugiat qui consequat laborum mollit eiusmod et dolore ut mollit laborum. Eu magna ullamco ea minim tempor Lorem. Aliquip reprehenderit Lorem fugiat anim ullamco dolore reprehenderit ex tempor non tempor labore irure. Deserunt dolor aliqua id deserunt anim velit. Minim velit non excepteur voluptate ea incididunt Lorem ullamco irure amet ipsum sit fugiat adipisicing.',
    comments: {bward: 'great post!🔥', bruno: 'OMG!🤯'},
    user: angle,
    image: '3.jpg',
  );
  static Post post4 = Post(
    caption:
        'Dolore deserunt nisi in aliquip elit. Eiusmod est proident non tempor aliquip labore minim nulla pariatur exercitation eiusmod aute. Voluptate incididunt quis ut aute nulla amet ut velit enim ullamco. Ut eiusmod eiusmod id incididunt cillum voluptate voluptate exercitation.',
    comments: {bward: 'great post!🔥', bruno: 'OMG!🤯'},
    user: angle,
    image: '4.jpg',
  );
  static Post post5 = Post(
    caption:
        'Excepteur Lorem aute ipsum reprehenderit minim ut laborum occaecat aliqua occaecat id elit. Commodo cillum elit veniam sit consequat enim quis non qui est. Aliquip proident excepteur ad irure sint proident do dolor irure laborum enim. Fugiat cupidatat est nostrud cupidatat sint elit esse magna. Ad cupidatat labore reprehenderit est ex eu ea ad ut deserunt mollit. Reprehenderit laborum minim aliquip dolor minim sit dolore aliqua commodo ut. Ea esse ullamco cillum consequat tempor.',
    comments: {bward: 'great post!🔥', bruno: 'OMG!🤯'},
    user: angle,
    image: '5.jpg',
  );
  static Post post6 = Post(
    caption:
        'Reprehenderit proident ea ullamco ipsum amet proident exercitation magna voluptate cillum excepteur ex cupidatat. Minim et ullamco nisi et. Pariatur ad quis veniam sint non excepteur cupidatat voluptate sint irure labore in labore.',
    comments: {bward: 'great post!🔥', bruno: 'OMG!🤯'},
    user: angle,
    image: '6.jpg',
  );
  static Post post7 = Post(
    caption:
        'Dolore dolor ad adipisicing ea amet magna cillum excepteur quis cupidatat cillum est minim proident. Sunt et excepteur culpa mollit cupidatat excepteur cupidatat mollit pariatur elit aute. Pariatur aliqua consectetur veniam quis commodo cupidatat incididunt mollit voluptate cillum aliqua tempor aliqua. Magna eiusmod labore ea mollit. Occaecat ipsum ad eu pariatur non sunt elit. Commodo dolor nisi aute aute minim Lorem quis ex dolore.',
    comments: {bward: 'great post!🔥', bruno: 'OMG!🤯'},
    user: angle,
    image: '7.jpg',
  );
  static Post post8 = Post(
    caption:
        'Adipisicing eu mollit incididunt velit id. Esse commodo reprehenderit fugiat do eiusmod aliquip dolore exercitation. Adipisicing ipsum ea cupidatat officia.',
    comments: {bward: 'great post!🔥', bruno: 'OMG!🤯'},
    user: angle,
    image: '8.jpg',
  );
  static Post post9 = Post(
    caption:
        'Deserunt mollit cillum pariatur anim nulla et exercitation. Cupidatat enim laboris enim voluptate pariatur. Veniam officia ex deserunt cillum exercitation exercitation minim nisi incididunt. Laboris ad occaecat dolor dolor irure nostrud aliqua magna aliqua et duis.',
    comments: {bward: 'great post!🔥', bruno: 'OMG!🤯'},
    user: angle,
    image: '9.jpg',
  );
  static Post post10 = Post(
    caption:
        'Tempor duis sunt eiusmod reprehenderit pariatur anim magna magna dolore ut veniam consequat sint. Officia tempor commodo amet minim exercitation aliqua magna aute ipsum occaecat ad elit voluptate. Sit reprehenderit aliquip excepteur sint id eu minim non cupidatat cillum id ex.',
    comments: {bward: 'great post!🔥', bruno: 'OMG!🤯'},
    user: angle,
    image: '10.jpg',
  );
}
