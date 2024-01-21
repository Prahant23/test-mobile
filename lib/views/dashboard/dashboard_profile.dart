import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfile> {
  final ScrollController _scrollController = ScrollController();
  List<String> clientsList = []; // Replace this with your actual data list
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
    clientsList.clear();
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
      clientsList.add('Client ${i + 1}');
    }
    // Trigger a rebuild to update the UI
    setState(() {});
  }

  void loadMoreData() {
    // Replace this with your logic to fetch more data (e.g., API call)
    // Append the new data to the existing list
    for (int i = 0; i < 10; i++) {
      clientsList.add('New Client ${clientsList.length + 1}');
    }
    // Trigger a rebuild to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // Your existing MyProfileScreen content here

              // Clients list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: clientsList.length + 1, // +1 for loading indicator
                itemBuilder: (context, index) {
                  if (index < clientsList.length) {
                    // Display your client item (similar to Instagram messages)
                    return ListTile(
                      title: Text(clientsList[index]),
                      subtitle: Text('Last message from ${clientsList[index]}'),
                      leading: CircleAvatar(
                        // Add your client's avatar here
                        child: Text('${clientsList[index][0]}'),
                      ),
                      // Add other client information/widgets here
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
      ),
    );
  }
}
