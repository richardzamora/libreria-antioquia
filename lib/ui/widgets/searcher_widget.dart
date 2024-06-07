import 'package:flutter/material.dart';

class SearcherWidget extends StatefulWidget {
  const SearcherWidget({
    super.key,
    this.searchController,
    required this.onSearch,
  });

  final TextEditingController? searchController;
  final Function(String) onSearch;

  @override
  State<SearcherWidget> createState() => _SearcherWidgetState();
}

class _SearcherWidgetState extends State<SearcherWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.searchController ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(),
              ),
            ),
            InkWell(
                onTap: () {
                  widget.onSearch(controller.text);
                },
                child: const Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
