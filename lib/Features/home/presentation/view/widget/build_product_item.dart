import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class BuildProductItem extends StatelessWidget {
  const BuildProductItem({super.key, required this.image, required this.name, required this.description, required this.price, required this.id,});

  final String image;
  final String name;
  final String description;
  final String price;
  final String id;

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsBlocConsumer(productId: id)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.fill,
                      height: height * 0.24, // Adjust height
                      width: double.infinity, // Full width
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[700]!,
                        highlightColor: Colors.grey[500]!,
                        child: Container(
                          height: height * 0.2,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    right: 5.0,
                    top: 5.0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      child: const Icon(Icons.favorite, color: Color(0xFFFF6B00),),),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(name,
                style: const TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              Text(description,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                children: [
                  Text("$price EL", style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  const Text("(4.8)", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  const Icon(Icons.star, color: Colors.yellow),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}