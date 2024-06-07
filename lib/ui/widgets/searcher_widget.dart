import 'package:flutter/material.dart';

class SearcherWidget extends StatefulWidget {
  const SearcherWidget({
    super.key,
    this.searchController,
    this.historyData,
    this.onDeleteHistory,
    required this.onSearch,
  });

  final TextEditingController? searchController;
  final Function(String) onSearch;
  final Function(String)? onDeleteHistory;
  final List<String>? historyData;

  @override
  State<SearcherWidget> createState() => _SearcherWidgetState();
}

class _SearcherWidgetState extends State<SearcherWidget> {
  late TextEditingController controller;
  bool isShowingHistory = false;

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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                  ),
                ),
                if (widget.historyData?.isNotEmpty ?? false)
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            isShowingHistory = !isShowingHistory;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          child: const Icon(Icons.history),
                        )),
                  ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        widget.onSearch(controller.text);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: const Icon(Icons.search),
                      )),
                ),
              ],
            ),
            if (isShowingHistory)
              Column(
                children: [
                  for (String value in widget.historyData ?? [])
                    Row(
                      children: [
                        InkWell(
                          onTap: () => widget.onSearch(value),
                          child: Container(
                            child: Text(value),
                          ),
                        ),
                        if (widget.onDeleteHistory != null)
                          InkWell(
                              onTap: () {
                                widget.onDeleteHistory!(value);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                child: const Icon(Icons.delete),
                              )),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
