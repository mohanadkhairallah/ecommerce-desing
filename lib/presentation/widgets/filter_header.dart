import 'package:flutter/material.dart';

class FilterHeader extends StatefulWidget {
  const FilterHeader({Key? key, required this.filters}) : super(key: key);
  final List<String> filters;
  @override
  State<FilterHeader> createState() => _FilterHeaderState();
}

class _FilterHeaderState extends State<FilterHeader> {
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: widget.filters.length,
      separatorBuilder: (context, i) {
        if (selectedIndex == i + 1 || selectedIndex == i) {
          return Container();
        }
        return Container(
          width: 1,
          height: 5,
          margin: EdgeInsets.symmetric(vertical: 16),
          color: Colors.grey,
        );
      },
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = i;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                color: selectedIndex == i ? Colors.white : null,
                boxShadow: selectedIndex == i
                    ? [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                        )
                      ]
                    : []),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24,
              ),
              child: Text(
                widget.filters[i],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == i ? Colors.black : Colors.grey,
                ),
              ),
            )),
          ),
        );
      },
    );
  }
}
