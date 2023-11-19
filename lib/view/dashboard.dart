import 'package:flutter/material.dart';

void main() {
  runApp(const VintageStoreDashboard());
}

class VintageStoreDashboard extends StatelessWidget {
  const VintageStoreDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VintageStoreHomePage(),
    );
  }
}

class VintageStoreHomePage extends StatefulWidget {
  const VintageStoreHomePage({Key? key}) : super(key: key);

  @override
  _VintageStoreHomePageState createState() => _VintageStoreHomePageState();
}

class _VintageStoreHomePageState extends State<VintageStoreHomePage> {
  bool isSearchVisible = false;
  TextEditingController searchController = TextEditingController();

  // Replace these URLs with your actual image URLs
  final List<String> itemImageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUDZUBRndHddw4strMw5ICO7Hb8bLuXXdOTA&usqp=CAU',
    'https://img.huffingtonpost.com/asset/5b9e7bb42100005100c5f27a.jpeg?ops=scalefit_720_noupscale',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDbxvtjqZyj0gtKCnFX298LLMt2-bjNVnaWj2lbrVJmZ-QwVmP0wkq09mHideNbLza78I&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSASH0ZKn4xRiYGAUORYVwr7SsKwUbvduRqMw&usqp=CAU',
    'URL_for_Item_4',
    'URL_for_Item_5',
    'URL_for_Item_6',
    'URL_for_Item_7',
    'URL_for_Item_8',
    'URL_for_Item_9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      isSearchVisible = !isSearchVisible;
                      if (!isSearchVisible) {
                        searchController.clear();
                      }
                    });
                  },
                ),
                if (isSearchVisible && constraints.maxWidth > 200)
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 239, 239, 234),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    width: 100,
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                      ),
                    ),
                  ),
                const SizedBox(width: 8.0),
                const SectionButton(label: 'Clothes'),
                const SizedBox(width: 8.0),
                const SectionButton(label: 'Shoes'),
                const SizedBox(width: 8.0),
                const SectionButton(label: 'Accessories'),
                const Spacer(), // Spacer to fill the space between buttons and image
                Image.asset(
                  'images/fashion.jpg',
                  alignment: Alignment.topRight,
                ),
              ],
            );
          },
        ),
        actions: [
          if (isSearchVisible &&
              MediaQuery.of(context).size.width <=
                  400) // Adjust the threshold as needed
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 245, 243, 237),
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: 100, // Adjust the width as needed
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search...',
                ),
              ),
            ),
        ],
      ),
      body: ListView.builder(
        itemCount: itemImageUrls.length,
        itemBuilder: (context, index) {
          return VintageItemCard(
            itemName: 'Item $index',
            itemImageUrl: itemImageUrls[index],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

class VintageItemCard extends StatelessWidget {
  final String itemName;
  final String itemImageUrl;

  const VintageItemCard({
    required this.itemName,
    required this.itemImageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            itemImageUrl,
            width: double.infinity,
            height: 100, // Adjust the height as needed
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              itemName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionButton extends StatelessWidget {
  final String label;

  const SectionButton({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle section selection
      },
      child: Text(label),
    );
  }
}
