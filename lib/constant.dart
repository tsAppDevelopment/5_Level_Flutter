import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double 
  pickerWidth = 160,
  pickerHeight = 30,
  timeGridDivSize = 1,
  rowHeight = 30,
  divThickness=1.5,
  rowInset = 10.0,
  modalSpinHeight = 210,
  cardP = 4,
  maxCardWidth = 700,
  cardTabSize =30,

  textSizeCardTitle = 14,
  textSizeModalSpinner = 22,
  textSize = 16;

  final 
  fwSpinner=FontWeight.normal;

  const int 
    animationDuration = 100;

  const Color topBot = Colors.black87,
      navBarSelected = Colors.white70,
      navBarDeselected = Colors.white30,
      bottombarcolor = Colors.white10,
      background = Colors.black,

      cardColor = Colors.white10,
      buttonColor = Colors.white10,
      buttonColorGetMAC = Color.fromRGBO(255,255,255,0.19),
      cargoUIColor = Color.fromRGBO(255,255,255,0.07),

      divColor = Colors.white30,
      textColor = Color.fromRGBO(255,255,255,0.88),

      modalPickerColor= Color.fromRGBO(55,55,55,1),
      
      focusedBorderColor = Color.fromRGBO(165,214,167,1),//Color.fromRGBO(255,255,255,0.88),
      nonfocusedBoderColors = Color.fromRGBO(165,214,167,1), //Colors.white30,

      focusedErrorBorderColor = Color.fromRGBO(244,143,177,1),//Color.fromRGBO(254,112, 123, 1),
      nonfocusedErrorBoderColor = Color.fromRGBO(244,143,177,1);
     
    const _funColors = <Color>[
      Color.fromRGBO(179,157,219,1),
      Color.fromRGBO(144,202,249,1),
      Color.fromRGBO(244,143,177,1),
      Color.fromRGBO(165,214,167,1),
      Color.fromRGBO(255,204,128,1),
      //Color.fromRGBO(62,98,210,1),
    ];

    int next =-1;

     Color rc(){
      next++; if(next>_funColors.length-1){next =0;}
      return _funColors[next];
    }

class InputDec {
  static final OutlineInputBorder _wi = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: focusedBorderColor,
        width: divThickness,
      ),
    );

    static final OutlineInputBorder _wiNF = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: nonfocusedBoderColors,
        width: divThickness,
      ),
    );

    static final OutlineInputBorder _div = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: divColor,
        width: divThickness,
      ),
    );

    static final OutlineInputBorder _divNF = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: divColor,
        width: divThickness,
      ),
    );

  static final OutlineInputBorder _re = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: focusedErrorBorderColor,
        width: divThickness,
      ),
    );

    static final OutlineInputBorder _reNF = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
      borderSide: BorderSide(
        color: nonfocusedErrorBoderColor,
        width: divThickness,
      ),
    );

  static final InputDecoration wi = InputDecoration(
    enabledBorder: _wiNF,
    focusedBorder: _wi,
  );

  static final InputDecoration re = InputDecoration(
    enabledBorder: _reNF,
    focusedBorder: _re,
  );

  static final InputDecoration div = InputDecoration(
    enabledBorder: _divNF,
    focusedBorder: _div,
  );

}

final dmSelected = GoogleFonts.dmSans(
    color: Color.fromRGBO(56, 56, 56, 1),
    fontSize: 14.0,
    fontWeight: FontWeight.bold);
final dmSelectedNormal = GoogleFonts.dmSans(
    color: Color.fromRGBO(56, 56, 56, 1),
    fontSize: 14.0,
    fontWeight: FontWeight.normal);

final dmSelectedWhiteBold = GoogleFonts.dmSans(
    color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold);

final dmDisabled = GoogleFonts.dmSans(
    color: Color.fromRGBO(151, 151, 151, 1),
    fontSize: 14.0,
    fontWeight: FontWeight.normal);
final dmTitle2 = GoogleFonts.dmSans(
    color: Color.fromRGBO(56, 56, 56, 1),
    fontSize: 18.0,
    fontWeight: FontWeight.bold);
final dmTitle1 = GoogleFonts.dmSans(
    color: Color.fromRGBO(56, 56, 56, 1),
    fontSize: 36.0,
    fontWeight: FontWeight.bold);
final dmbody1 = GoogleFonts.dmSans(
    color: Color.fromRGBO(51, 51, 51, 1),
    fontSize: 16.0,
    fontWeight: FontWeight.normal);

const topEPs = <String>[
  aircraftS,
  cargoS,
  configS,
  tankS,
  userS,
  glossaryS
];


// magic strings //
//please see more magic strings within model constructors

/// this is a json map instead of an enum
/// so it can be passed to a common dropdown button
const cargoCategorys = [
  {searchField:'Steward', cargoCategoryPK: 0},
  {searchField:'Emergency', cargoCategoryPK: 1},
  {searchField:'Extra', cargoCategoryPK: 2},

];
enum CargoCategory {Steward, Emergency,Extra}

const cargoCategoryMap = {
    CargoCategory.Steward:0,
    CargoCategory.Emergency: 1,
    CargoCategory.Extra:2
};
// .entries.where((x) => x.key == selected)))

// base url for api requests
const baseurl = 'http://localhost:8080/fl-api/';

// endpoints
const aircraftS = 'aircraft';
const cargoS = 'cargo';
const configS = 'config';
const tankS = 'tank';
const userS = 'user';
const glossaryS = 'glossary';
const configCargosS = 'configCargo';

// api model primary keys
const topLvlEPPK = 'aircraftId';
const airPK = 'aircraftId';
const configCargoPK = 'configId';
const configFK = 'configCargos';
const apiErrorKey = 'msg';
const cargoCategoryPK = 'id';

/// will be common to all modifiable models,
/// sorted alabeticly as well
const searchField = 'name';

/// keys containing this will be filterd from the json table
const rmKey = 'Id';

// keys containing this will be filtered from api query strings
const rmKeyQS = 'Id';

/// the font family used for icon datas
const matIcons = 'MaterialIcons';

/// http req headers
const reqHeaders = {"Content-Type": "application/json"};

const loadingTexts = [
    'Reticulating splines...',
    'Generating witty dialog...',
    'Swapping time and space...',
    'Spinning violently around the y-axis...',
    'Tokenizing real life...',
    'Bending the spoon...',
    'Filtering morale...',
    'Don\'t think of purple hippos...',
    'We need a new fuse...',
    'Have a good day.',
    'Upgrading Windows, your PC will restart several times. Sit back and relax.',
    '640K ought to be enough for anybody',
    'The architects are still drafting',
    'The bits are breeding',
    'We\'re building the buildings as fast as we can',
    'Would you prefer chicken, steak, or tofu?',
    '(Pay no attention to the man behind the curtain)',
    '...and enjoy the elevator music...',
    'Please wait while the little elves draw your map',
    'Don\'t worry - a few bits tried to escape, but we caught them',
    'Would you like fries with that?',
    'Checking the gravitational const in your locale...',
    'Go ahead -- hold your breath!',
    '...at least you\'re not on hold...',
    'Hum something loud while others stare',
    'You\'re not in Kansas any more',
    'The server is powered by a lemon and two electrodes.',
    'Please wait while a larger software vendor in Seattle takes over the world',
    'We\'re testing your patience',
    'As if you had any other choice',
    'Follow the white rabbit',
    'Why don\'t you order a sandwich?',
    'While the satellite moves into position',
    'keep calm and npm install',
    'The bits are flowing slowly today',
    'Dig on the \'X\' for buried treasure... ARRR!',
    'It\'s still faster than you could draw it',
    'The last time I tried this the monkey didn\'t survive. Let\'s hope it works better this time.',
    'I should have had a V8 this morning.',
    'My other loading screen is much faster.',
    'Testing on Timmy... We\'re going to need another Timmy.',
    'Reconfoobling energymotron...',
    '(Insert quarter)',
    'Are we there yet?',
    'Have you lost weight?',
    'Just count to 10',
    'Why so serious?',
    'It\'s not you. It\'s me.',
    'Counting backwards from Infinity',
    'Don\'t panic...',
    'Embiggening Prototypes',
    'Do not run! We are your friends!',
    'Do you come here often?',
    'Warning: Don\'t set yourself on fire.',
    'We\'re making you a cookie.',
    'Creating time-loop inversion field',
    'Spinning the wheel of fortune...',
    'Loading the enchanted bunny...',
    'Computing chance of success',
    'I\'m sorry Dave, I can\'t do that.',
    'Looking for exact change',
    'All your web browser are belong to us',
    'All I really need is a kilobit.',
    'I feel like im supposed to be loading something. . .',
    'What do you call 8 Hobbits? A Hobbyte.',
    'Should have used a compiled language...',
    'Is this Windows?',
    'Adjusting flux capacitor...',
    'Please wait until the sloth starts moving.',
    'Don\'t break your screen yet!',
    'I swear it\'s almost done.',
    'Let\'s take a mindfulness minute...',
    'Unicorns are at the end of this road, I promise.',
    'Listening for the sound of one hand clapping...',
    'Keeping all the 1\'s and removing all the 0\'s...',
    'Putting the icing on the cake. The cake is not a lie...',
    'Cleaning off the cobwebs...',
    'Making sure all the i\'s have dots...',
    'We are not liable for any broken screens as a result of waiting.',
    'We need more dilithium crystals',
    'Where did all the internets go',
    'Connecting Neurotoxin Storage Tank...',
    'Granting wishes...',
    'Time flies when you’re having fun.',
    'Get some coffee and come back in ten minutes..',
    'Spinning the hamster…',
    '99 bottles of beer on the wall..',
    'Stay awhile and listen..',
    'Be careful not to step in the git-gui',
    'You edhall not pass! yet..',
    'Load it and they will come',
    'Convincing AI not to turn evil..',
    'There is no spoon. Because we are not done loading it',
    'Your left thumb points to the right and your right thumb points to the left.',
    'How did you get here?',
    'Wait, do you smell something burning?',
    'Computing the secret to life, the universe, and everything.',
    'When nothing is going right, go left!!...',
    'I love my job only when I\'m on vacation...',
    'i\'m not lazy, I\'m just relaxed!!',
    'Never steal. The government hates competition....',
    'Why are they called apartments if they are all stuck together?',
    'Life is Short – Talk Fast!!!!',
    'Optimism – is a lack of information.....',
    'Save water and shower together',
    'Whenever I find the key to success, someone changes the lock.',
    'Sometimes I think war is God’s way of teaching us geography.',
    'I’ve got problem for your solution…..',
    'Where there’s a will, there’s a relative.',
    'User: the word computer professionals use when they mean !!idiot!!',
    'Adults are just kids with money.',
    'I think I am, therefore, I am. I think.',
    'A kiss is like a fight, with mouths.',
    'You don’t pay taxes—they take taxes.',
    'Coffee, Chocolate, Men. The richer the better!',
    'I am free of all prejudices. I hate everyone equally.',
    'git happens',
    'May the forks be with you',
    'A commit a day keeps the mobs away',
    'This is not a joke, it\'s a commit.',
    'Constructing additional pylons...',
    'Roping some seaturtles...',
    'Locating Jebediah Kerman...',
    'We are not liable for any broken screens as a result of waiting.',
    'Hello IT, have you tried turning it off and on again?',
    'If you type Google into Google you can break the internet',
    'Well, this is embarrassing.',
    'What is the airspeed velocity of an unladen swallow?',
    'Hello, IT... Have you tried forcing an unexpected reboot?',
    'They just toss us away like yesterday\'s jam.',
    'They\'re fairly regular, the beatings, yes. I\'d say we\'re on a bi-weekly beating.',
    'The Elders of the Internet would never stand for it.',
    'Space is invisible mind dust, and stars are but wishes.',
    'Didn\'t know paint dried so quickly.',
    'Everything sounds the same',
    'I\'m going to walk the dog',
    'I didn\'t choose the engineering life. The engineering life chose me.',
    'Dividing by zero...',
    'Spawn more Overlord!',
    'If I’m not back in five minutes, just wait longer.',
    'Some days, you just can’t get rid of a bug!',
    'We’re going to need a bigger boat.',
    'Chuck Norris never git push. The repo pulls before.',
    'Web developers do it with <style>',
    'I need to git pull --my-life-together',
    'Java developers never RIP. They just get Garbage Collected.',
    'Cracking military-grade encryption...',
    'Simulating traveling salesman...',
    'Proving P=NP...',
    'Entangling superstrings...',
    'Twiddling thumbs...',
    'Searching for plot device...',
    'Trying to sort in O(n)...',
    'Laughing at your pictures-i mean, loading...',
    'Sending data to NS-i mean, our servers.',
    'Looking for sense of humour, please hold on.',
    'Please wait while the intern refills his coffee.',
    'A different error message? Finally, some progress!',
    'Hold on while we wrap up our git together...sorry',
    'Please hold on as we reheat our coffee',
    'Kindly hold on as we convert this bug to a feature...',
    'Kindly hold on as our intern quits vim...',
    'Winter is coming...',
    'Installing dependencies',
    'Switching to the latest JS framework...',
    'Distracted by cat gifs',
    'Finding someone to hold my beer',
    'BRB, working on my side project',
    '@todo Insert witty loading message',
    'Let\'s hope it\'s worth the wait',
    'Aw, snap! Not..',
    'Ordering 1s and 0s...',
    'Updating dependencies...',
    'Whatever you do, don\'t look behind you...',
    'Please wait... Consulting the manual...',
    'It is dark. You\'re likely to be eaten by a grue.',
    'Loading funny message...',
    'It\'s 10:00pm. Do you know where your children are?',
    'Waiting Daenerys say all her titles...',
    'Feel free to spin in your chair',
    'What the what?',
    'format C: ...',
    'Forget you saw that password I just typed into the IM ...',
    'What\'s under there?',
    'Your computer has a virus, its name is Windows!',
    'Go ahead, hold your breath and do an ironman plank till loading complete',
    'Bored of slow loading spinner, buy more RAM!',
    'Help, I\'m trapped in a loader!',
    'What is the difference btwn a hippo and a zippo? One is really heavy, the other is a little lighter',
    'Please wait, while we purge the Decepticons for you. Yes, You can thanks us later!',
    'Chuck Norris once urinated in a semi truck\'s gas tank as a joke....that truck is now known as Optimus Prime.',
    'Chuck Norris doesn’t wear a watch. HE decides what time it is.',
    'Mining some bitcoins...',
    'Downloading more RAM..',
    'Updating to Windows Vista...',
    'Deleting System32 folder',
    'Hiding all ;\'s in your code',
    'Alt-F4 speeds things up.',
    'Initializing the initializer...',
    'When was the last time you dusted around here?',
    'Optimizing the optimizer...',
    'Last call for the data bus! All aboard!',
    'Running swag sticker detection...',
    'When nothing is going right, go left!',
    'Never let a computer know you\'re in a hurry.',
    'A computer will do what you tell it to do, but that may be much different from what you had in mind.',
    'Some things man was never meant to know. For everything else, there\'s Google.',
    'Unix is user-friendly. It\'s just very selective about who its friends are.',
    'Shovelling coal into the server',
    'Pushing pixels...',
    'How about this weather, eh?',
    'Building a wall...',
    'Everything in this universe is either a potato or not a potato',
    'The severity of your issue is always lower than you expected.',
    'Updating Updater...',
    'Downloading Downloader...',
    'Debugging Debugger...',
    'Reading Terms and Conditions for you.',
    'Digested cookies being baked again.',
    'Live long and prosper.',
    'There is no cow level, but there\'s a goat one!',
    'Deleting all your hidden porn...',
    'Running with scissors...',
    'Definitely not a virus...',
    'You may call me Steve.',
    'You seem like a nice person...',
    'Coffee at my place, tommorow at 10A.M. - don\'t be late!',
    'Work, work...',
    'Patience! This is difficult, you know...',
    'Discovering new ways of making you wait...',
    'Your time is very important to us. Please wait while we ignore you...',
    'Time flies like an arrow; fruit flies like a banana',
    'Two men walked into a bar; the third ducked...',
    'Sooooo... Have you seen my vacation photos yet?',
    'Sorry we are busy catching em\' all, we\'re done soon',
    'TODO: Insert elevator music',
    'Still faster than Windows update',
    'Composer hack: Waiting for reqs to be fetched is less frustrating if you add -vvv to your command.',
  ];