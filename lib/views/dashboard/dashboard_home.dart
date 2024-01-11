import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        title: Text('VINTUFF',
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/fashion.jpg',
            fit: BoxFit.contain,
            height: 40,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.background,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  hintText: "search here",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            CarouselSlider(
              items: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/tshirt.jpg',
                        width: double.infinity, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGNsb3RoZXN8ZW58MHx8MHx8fDA%3D',
                        width: double.infinity,
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        'https://images.unsplash.com/photo-1523381294911-8d3cead13475?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNsb3RoZXN8ZW58MHx8MHx8fDA%3D',
                        width: double.infinity,
                        fit: BoxFit.cover),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 180,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(84, 175, 230, 1),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "All",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(
                          color: Theme.of(context)
                              .colorScheme
                              .primary, // Color of the border
                          width: 1, // Width of the border
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons
                                .accessibility, // Replace this with the desired icon
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        Text(
                          "Clothes",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Color of the border
                        width: 1, // Width of the border
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons
                              .shopping_bag, // Replace this with the desired icon
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Text(
                        "Accessories",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Card(
                  color: Theme.of(context).colorScheme.background,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                              'https://images.unsplash.com/photo-1604072374690-0e7d7bddd54e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGNsb3RoZXN8ZW58MHx8MHx8fDA%3D',
                              width: 100,
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tshirts',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('Detail:bangladeshi sweetshirt'),
                            Text(
                              'PRICE:700',
                              style: TextStyle(color: Colors.green),
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: Text('Add to Cart'))
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Card(
                  color: Theme.of(context).colorScheme.background,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1617331721458-bd3bd3f9c7f8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNlY29uZCUyMGhhbmQlMjBjbG90aGVzfGVufDB8fDB8fHww',
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jacket',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('Detail:jacket'),
                            Text(
                              'PRICE:2400',
                              style: TextStyle(color: Colors.green),
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: Text('Add to Cart'))
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Card(
                  color: Theme.of(context).colorScheme.background,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                            'https://media.istockphoto.com/id/534114588/photo/colorful-womens-sweaters-for-second-life-at-flea-market.webp?b=1&s=170667a&w=0&k=20&c=Hk5DmnjCHHCq0T8OUCWzPVGT2iJPIkxwzqJ9o57D5vc=',
                            width: 150,
                            fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sweaters',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('Detail:sweaters'),
                            Text(
                              'PRICE:1700',
                              style: TextStyle(color: Colors.green),
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: Text('Add to Cart'))
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              height: 100,
              color: Theme.of(context).colorScheme.onBackground,
            )
          ],
        ),
      ),
    );
  }
}
