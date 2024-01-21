import 'package:flutter/material.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  _MyprofileScreenState createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<Myprofile> {
  final ScrollController _scrollController = ScrollController();
  List<String> customerList = []; // Replace this with your actual data list
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    // Load initial data or call your API to fetch data here
    loadInitialData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshData() async {
    // Add your logic to refresh data (e.g., API call)
    // Clear the existing data
    customerList.clear();
    // Load fresh data
    loadInitialData();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has reached the end of the list, load more data
      if (!isLoading) {
        // Set isLoading to true to prevent multiple simultaneous requests
        setState(() {
          isLoading = true;
        });

        // Delay for 2 seconds before loading more data
        Future.delayed(const Duration(seconds: 2), () {
          loadMoreData();
          // Set isLoading back to false after loading is complete
          setState(() {
            isLoading = false;
          });
        });
      }
    }
  }

  void loadInitialData() {
    // Replace this with your logic to fetch initial data (e.g., API call)
    // Add data to the list
    for (int i = 0; i < 20; i++) {
      customerList.add('Plant ${i + 1}');
    }
    // Trigger a rebuild to update the UI
    setState(() {});
  }

  void loadMoreData() {
    // Replace this with your logic to fetch more data (e.g., API call)
    // Append the new data to the existing list
    for (int i = 0; i < 10; i++) {
      customerList.add('New Plant ${customerList.length + 1}');
    }
    // Trigger a rebuild to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Your existing MyPlantsScreen content here

            // Plant list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: customerList.length + 1, // +1 for loading indicator
              itemBuilder: (context, index) {
                if (index < customerList.length) {
                  // Display your plant item
                  return ListTile(
                    title: Text(customerList[index]),
                    // Add other plant information/widgets here
                  );
                } else {
                  // Loading indicator while fetching more data
                  return isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(); // Show an empty container when not loading
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
