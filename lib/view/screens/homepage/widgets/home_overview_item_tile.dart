import 'package:flutter/material.dart';
import 'package:flutter_hackout/utils/constants/typography_constants.dart';

class HomeOverviewItemTile extends StatelessWidget {
  const HomeOverviewItemTile(
      {super.key,
      required this.title,
      required this.color,
      required this.number,
      required this.iconData});
  final String title;
  final Color color;
  final int number;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ],
          border: Border.all(width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: TT.f12w500,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: color.withOpacity(.2), shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          iconData,
                          color: color,
                        ),
                      ),
                    ),
                    Text(
                      number.toString(),
                      style: TT.f22w700.copyWith(color: color),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
