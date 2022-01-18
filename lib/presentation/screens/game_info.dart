import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class GameInfo extends StatelessWidget {
  const GameInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Column(
          children: [
            Image.network(
                'https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg'),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Grand Theft Auto V',
              style: TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.schedule),
                Text('71 hours'),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.star_border),
                Text('97 (Metactitic)')
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Synopsis'),
            const ReadMoreText(
              'Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. \r\nSimultaneous storytelling from three unique perspectives: \r\nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. \r\nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.',
              moreStyle: TextStyle(color: Colors.blue),
              lessStyle: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
