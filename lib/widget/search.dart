import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search(
      {super.key,
      required this.searchFunction,
      required this.onTap,
      required this.title});

  final Future<List<dynamic>> Function(String) searchFunction;
  final Function(dynamic) onTap;
  final String title;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<dynamic> _searchResults = [];

  void _search(String searchName) async {
    if (searchName.isNotEmpty) {
      List<dynamic> results = await widget.searchFunction(searchName);
      setState(() {
        _searchResults = results;
      });
    } else {
      // ถ้าไม่มีข้อความในการค้นหา ล้างผลลัพธ์
      setState(() {
        _searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE5C1C5),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.06),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      _search(value);
                    },
                    decoration: InputDecoration(
                      hintText: widget.title,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => widget.onTap(_searchResults[index]),
                  title: Text(_searchResults[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}