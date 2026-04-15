import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stellar_shop/Features/onBoarding/presentation/view/widget/build_boarding_item.dart';
import '../../data/model/boarding_model.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  static const String routeName= "OnBoarding";

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  /// to control foe moving between screens ;
  var boardController = PageController();
  bool isLast = false;

  List<BoardingModel> boarding = [
    BoardingModel(
        image: "assets/images/intro.png",
        title: "Discover Destinations",
        body: "Explore top places, hotels, and activities tailored for you."
    ),
    BoardingModel(
        image: "assets/images/intro1.png",
        title: "Plan Your Journey",
        body: "Save favorites, compare options, and organize trips easily."
    ),
    BoardingModel(
        image: "assets/images/intro2.png",
        title: "Book Seamlessly",
        body: "Enjoy fast, secure booking with a smooth user experience."
    ),
  ];

  void submit(){
    // Navigator.pushReplacement(context,
    //   MaterialPageRoute(builder: (context) => LoginScreen()),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: TextButton(onPressed:submit, child: const Text("Skip",
              style: TextStyle(fontSize: 24, color:Color(0xFFFF6B00),),),),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int index)
                  {
                    if(index == boarding.length-1){
                      setState(() {
                        isLast= true;
                      });
                    }else{
                      setState(() {
                        isLast= false;
                      });
                    }
                  },
                  controller: boardController,
                  itemCount: boarding.length,
                  itemBuilder: (context, index)=>buildBoardingItem(boarding[index])
              ),
            ),
            const SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(controller: boardController,count: boarding.length,
                    effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Color(0xFFFF6B00),
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5.0,
                        expansionFactor: 4
                    )),
                const Spacer(),
                FloatingActionButton(onPressed: ()
                {
                  if(isLast){
                    submit();
                  }else{
                    boardController.nextPage(duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                  backgroundColor: const Color(0xFFFF6B00),
                  child: const Icon(Icons.arrow_forward_ios, color: Colors.white,size: 32,),)
              ],
            ),
            const SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }
}
