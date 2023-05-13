import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taxi_final/core/Repository/wish_repo.dart';
import 'package:taxi_final/core/app_export.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List wishlists = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAllWishLists();
  }

  getAllWishLists() async {
    setState(() {
      isLoading = true;
    });
    var res = await WishList().getProductsOfUserFromWhishList();
    print(res);
    if (res != false) {
      setState(() {
        wishlists = res;
        isLoading = false;
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Cannot fetch')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Favourites',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              wishlists.isEmpty
                  ? Center(
                      child: Text('No any wishlist to show.'),
                    )
                  : Expanded(
                      child: isLoading == true
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                            width: 150,
                                            height: 100,
                                            child: Image(
                                              image: CachedNetworkImageProvider(
                                                  ApiURL().imgUrl +
                                                      wishlists[index]['car_id']
                                                          ['image']),
                                            )),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              wishlists[index]['car_id']
                                                  ['name'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Rs.${wishlists[index]['car_id']['price'].toString()}',
                                            ),
                                            Text(
                                              wishlists[index]['car_id']
                                                  ['seater'],
                                            ),
                                            Text(
                                              wishlists[index]['car_id']
                                                  ['color'],
                                            ),
                                            IconButton(
                                                onPressed: () async {
                                                  var res = await WishList()
                                                      .deleteWishList(
                                                          wishlists[index]
                                                              ['id']);
                                                  if (res != false) {
                                                    getAllWishLists();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                Colors.green,
                                                            content: Text(
                                                                'Deleted successfully')));
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                Colors.red,
                                                            content: Text(
                                                                'Cannot delete')));
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ))
                                          ],
                                        ))
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: wishlists.length),
                    )
            ],
          ),
        ));
  }
}
