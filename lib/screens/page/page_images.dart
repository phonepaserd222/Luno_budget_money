import 'package:flutter/material.dart';

class PageImages extends StatefulWidget {
  const PageImages({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PageImagesState createState() => _PageImagesState();
}

class _PageImagesState extends State<PageImages> {
  //TODO: delete
  final List<Map<String, dynamic>> _items = [
    {
      'imageUrl': 'https://picsum.photos/id/237/200/300',
      'description': 'Image 1'
    },
    {
      'imageUrl': 'https://picsum.photos/id/238/200/300',
      'description': 'Image 2'
    },
    {
      'imageUrl': 'https://picsum.photos/id/239/200/300',
      'description': 'Image 3'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _items[index];
          return ListTile(
            leading: Image.network(
              item['imageUrl'],
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
            title: Text(item['description']),
          );
        },
      ),
    );
  }
}
