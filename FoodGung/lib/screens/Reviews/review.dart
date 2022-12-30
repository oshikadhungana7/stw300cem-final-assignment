import 'package:flutter/material.dart';
import '../../models/Review.dart';


class Reviews extends StatefulWidget {
  String? reviewname;
  Reviews({
    this.reviewname
  });
  
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  
  bool isMore = false;
  List<double> ratings = [0.1, 0.3, 0.5, 0.7, 0.9];

  @override
  Widget build(BuildContext context) {
     final args = ModalRoute.of(context)!.settings.arguments as List<Review>;

    //  String id = args['id'].toString();
    //  print(id);
     List<Review> review  = args;
     print(review.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
        backgroundColor: const Color(0xFF4C53A5),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            // color: kAccentColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "4.5",
                            style: TextStyle(fontSize: 48.0),
                          ),
                          TextSpan(
                            text: "/5",
                            style: TextStyle(
                              fontSize: 24.0,
                              // color: kLightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SmoothStarRating(
                    //   starCount: 5,
                    //   rating: 4.5,
                    //   size: 28.0,
                    //   color: Colors.orange,
                    //   borderColor: Colors.orange,
                    // ),
                    SizedBox(height: 16.0),
                    // Text(
                    //   "${reviewList.length} Reviews",
                    //   style: TextStyle(
                    //     fontSize: 20.0,
                    //     color: kLightColor,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  width: 200.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: review.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            "${review[index].comment}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          // Text(
                          //   "${review.length}"
                          // ),
                          const SizedBox(width: 4.0),
                          const Icon(Icons.star, color: Colors.orange),
                          const SizedBox(width: 8.0),
                          // LinearPercentIndicator(
                          //   lineHeight: 6.0,
                          //   // linearStrokeCap: LinearStrokeCap.roundAll,
                          //   width: MediaQuery.of(context).size.width / 2.8,
                          //   animation: true,
                          //   animationDuration: 2500,
                          //   percent: ratings[index],
                          //   progressColor: Colors.orange,
                          // ),
                        ],
                      );
                    },
                  ),
                ),

                //             FutureBuilder<ReviewResponse?>(
                //            future: ReviewRepository().getReview(),
                //            builder: ((context, snapshot) {
                //            if(snapshot.connectionState == ConnectionState.done){
                //            if(snapshot.hasData){
                //            List<Review> lstReview=[];
                //            lstReview =snapshot.data!.reviews!;
                //            print(lstReview.length);
                        
                  
                      
                //         return GridView.builder(
                //            shrinkWrap: true,
                //            primary: true,
                //            itemCount: lstReview.length,
                //            physics: const NeverScrollableScrollPhysics(),
                //            gridDelegate:
                //                const SliverGridDelegateWithFixedCrossAxisCount(
                //              crossAxisCount: 2,
                //              childAspectRatio: 0.7,
                //            ),
                //            itemBuilder: (context, index) {
                //              var data = lstReview[index];
                //              return ItemPage(

                //                   // productImage: lstProduct[index].images![0].url.toString(),
                //                   //  lstReview[index].name
                                       
                //              );
                                
                //            }
                //            );
                //        }
                //     }
                //     else if (snapshot.connectionState==ConnectionState.waiting){
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }
                //    return const Text("Error");
                //   }),
                //  ),
              ],
            ),
          ),
          // Expanded(
          //   child: ListView.separated(
          //     padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
          //     itemCount: 1
          //     itemBuilder: (context, index) {
          //       // return ReviewUI(
          //       //   image: reviewList[index].image,
          //       //   name: reviewList[index].name,
          //       //   date: reviewList[index].date,
          //       //   comment: reviewList[index].comment,
          //       //   rating: reviewList[index].rating,
          //       //   onPressed: () => print("More Action $index"),
          //       //   onTap: () => setState(() {
          //       //     isMore = !isMore;
          //       //   }),
          //       //   isLess: isMore,
          //       // );
          //     },
          //     separatorBuilder: (context, index) {
          //       return Divider(
          //         thickness: 2.0,
          //         // color: kAccentColor,
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}