import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamesdb/blocs/gamelist_bloc/gamelist_bloc.dart';
import 'package:gamesdb/data/api_provider.dart';

class SearchPages extends StatelessWidget {
  const SearchPages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<NumberButton>.generate(5, (index) {
        return NumberButton(
          number: index + 1,
        );
      }),
    );
  }
}

class NumberButton extends StatefulWidget {
  final int number;

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
    final GamelistBloc gamelistBloc = BlocProvider.of<GamelistBloc>(context);
    return InkWell(
      onTap: () => setState(() {
        number = widget.number;
        gamelistBloc.add(GetGamelist());
      }),
      child: Container(
        color: number == widget.number ? Colors.blue : Colors.grey,
        child: Text(widget.number.toString()),
        padding: const EdgeInsets.all(5),
      ),
    );
  }
}
