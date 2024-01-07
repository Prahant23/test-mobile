import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final List<String> itemImageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6zHTBHgOn0IEX9Pr-YBp97JCW0oJEAB1MoQ&usqp=CAU?text=Tshirt',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6zHTBHgOn0IEX9Pr-YBp97JCW0oJEAB1MoQ&usqp=CAU?text=Tshirt',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6zHTBHgOn0IEX9Pr-YBp97JCW0oJEAB1MoQ&usqp=CAU?text=Tshirt',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6zHTBHgOn0IEX9Pr-YBp97JCW0oJEAB1MoQ&usqp=CAU?text=Tshirt',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6N0IPepwo560TJjVzKmXXzuuQNjDa1-vhag&usqp=CAU?text=Image5',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6zHTBHgOn0IEX9Pr-YBp97JCW0oJEAB1MoQ&usqp=CAU?text=Tshirt',
  ];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 1.0,
        ),
        itemCount: itemImageUrls.length.bitLength,
        itemBuilder: (context, index) {
          return VintageItemCard(
            itemName: 'Item $index',
            itemImageUrl: itemImageUrls[index],
          );
        },
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
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              itemImageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 1.0), // Adjust the height as needed
            Padding(
              padding:
                  const EdgeInsets.all(4.0), // Adjust the padding as needed
              child: Text(
                itemName,
                style: const TextStyle(
                  fontSize: 14, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
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
