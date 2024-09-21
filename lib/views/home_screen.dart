import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/image_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageViewModel = Provider.of<ImageViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
            'Photo Editing App',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: imageViewModel.editedImages.isEmpty
          ? Center(child: Text('No edited images yet.'))
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: imageViewModel.editedImages.length,
        itemBuilder: (context, index) {
          return Image.file(imageViewModel.editedImages[index]);
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 165, 0),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => imageViewModel.pickAndEditImage(),
          child: Icon(
              Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
