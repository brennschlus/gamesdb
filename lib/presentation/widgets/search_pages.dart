import 'package:flutter/material.dart';
import 'package:gamesdb/data/api_provider.dart';

class SearchPages extends StatelessWidget {
  const SearchPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        NumberButton(
          number: '1',
        ),
        NumberButton(
          number: '2',
        ),
        NumberButton(
          number: '3',
        ),
        NumberButton(
          number: '4',
        ),
        NumberButton(
          number: '5',
        ),
      ],
    );
  }
}

class NumberButton extends StatefulWidget {
  final String number;

  const NumberButton({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        isTapped = !isTapped;
        number = int.parse(widget.number);
      }),
      child: Container(
        color: isTapped ? Colors.blue : Colors.grey,
        child: Text(widget.number),
        padding: const EdgeInsets.all(5),
      ),
    );
  }
}
