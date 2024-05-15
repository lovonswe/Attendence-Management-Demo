import 'package:attendence_and_leave_management/widgets/image_card.dart';
import 'package:attendence_and_leave_management/widgets/image_card_list_view.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isShared;

  const ImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.isShared = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageDetailsCard(
                              imageUrl: imageUrl,
                              title: title,
                              isShared: isShared,
                            )));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Delete action
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                    ),
                    IconButton(
                      onPressed: () {
                        // Share action
                      },
                      icon: const Icon(Icons.share),
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    if (isShared)
                      const Icon(
                        Icons.people,
                        color: Colors.green,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageCardGridView extends StatefulWidget {
  const ImageCardGridView({super.key});

  @override
  State<ImageCardGridView> createState() => _ImageCardGridViewState();
}

class _ImageCardGridViewState extends State<ImageCardGridView> {
  bool isGridView = true;

  void changeView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

//   Future<void> getLostData() async {
//   final ImagePicker picker = ImagePicker();
//   final LostDataResponse response = await picker.retrieveLostData();
//   if (respo
//nse.isEmpty) {
//     return;
//   }
//   final List<XFile>? files = response.files;
//   if (files != null) {
//     _handleLostFiles(files);
//   } else {
//     _handleError(response.exception);
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Photo Gallery",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF5E62DB),
        shadowColor: const Color.fromARGB(255, 82, 72, 218),
        elevation: 59,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                changeView();
              },
              icon: isGridView
                  ? const Icon(
                      Icons.list,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.grid_on,
                      color: Colors.white,
                    )),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
          // DropdownButton<String>(
          //   onChanged: (String? value) {
          //     // Handle dropdown item selection
          //   },
          //   items: <String>['Option 1', 'Option 2', 'Option 3']
          //       .map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          // ),
          PopupMenuButton<String>(
            iconColor: Colors.white,
            onSelected: (String value) {
              // Handle sorting option selection
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Name (Ascending)',
                child: Row(
                  children: [
                    Icon(Icons.sort_by_alpha),
                    SizedBox(width: 8),
                    Text('Sort by Name (Ascending)'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Name (Descending)',
                child: Row(
                  children: [
                    Icon(Icons.sort_by_alpha, size: 20, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Sort by Name (Descending)'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Date (Ascending)',
                child: Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 8),
                    Text('Sort by Date (Ascending)'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Date (Descending)',
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, size: 20, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Sort by Date (Descending)'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Size (Ascending)',
                child: Row(
                  children: [
                    Icon(Icons.arrow_upward),
                    SizedBox(width: 8),
                    Text('Sort by Size (Ascending)'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'Size (Descending)',
                child: Row(
                  children: [
                    Icon(Icons.arrow_downward),
                    SizedBox(width: 8),
                    Text('Sort by Size (Descending)'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: isGridView
          ? GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                10, // Change this to the number of images you want to display
                (index) => ImageCard(
                  //imageUrl: 'https://via.placeholder.com/150', // Example URL
                  imageUrl:
                      "https://chaldn.com/_mpimage/red-tomato-25-gm-500-gm?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D64361&q=best&v=1&m=400&webp=1",
                  title: 'Image $index', // Example title
                  isShared: index % 2 == 0, // Example shared indicator
                ),
              ),
            )
          : ListView.builder(
              itemCount:
                  10, // Change this to the number of images you want to display
              itemBuilder: (context, index) {
                return ImageCardListView(
                  imageUrl:
                      "https://chaldn.com/_mpimage/red-tomato-25-gm-500-gm?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D64361&q=best&v=1&m=400&webp=1",
                  title: 'Image $index', // Example title
                  isShared: index % 2 == 0, // Example shared indicator
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {}),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.photo), label: "My Photos"),
        BottomNavigationBarItem(
            icon: Icon(Icons.people), label: "Shared with Me"),
      ]),
    );
  }
}
