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
        title: TextField(
          onChanged: (value) {
            _search(value);
          },
          decoration: InputDecoration(
            hintText: widget.title,
            suffixIcon: const Icon(Icons.search_rounded),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width * 0.06)),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width * 0.06)),
            ),
            hintStyle: Theme.of(context).textTheme.bodyMedium!,
            //border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
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
