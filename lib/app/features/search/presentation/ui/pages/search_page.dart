import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Item> items = [
    Item(
      url: 'https://via.placeholder.com/150',
      name: 'Item 1',
    ),
    Item(
      url: 'https://via.placeholder.com/150',
      name: 'Item 1',
    ),
    Item(
      url: 'https://via.placeholder.com/150',
      name: 'Item 1',
    ),
    Item(
      url: 'https://via.placeholder.com/150',
      name: 'Item 1',
    ),
    Item(
      url: 'https://via.placeholder.com/150',
      name: 'Item 1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Text(
                  'O que você está procurando?',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 18, right: 15),
                            child: const Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                          const Expanded(
                            child: TextField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 15),
                                hintText: 'Digite aqui',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: const Icon(
                              FontAwesomeIcons.xmark,
                              color: Colors.white,
                              size: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 47,
                    margin: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Buscar'),
                    ),
                  )
                ],
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black.withOpacity(0.7),
                margin: const EdgeInsets.only(bottom: 15, top: 20),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Text(
                  'Principais Categorias',
                  style: GoogleFonts.montserrat()
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12.5)
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  final String url;
  final String name;

  Item({required this.url, required this.name});
}
