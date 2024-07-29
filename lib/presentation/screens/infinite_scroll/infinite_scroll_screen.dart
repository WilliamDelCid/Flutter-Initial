import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent) { //Antes de llegar al final -> para cargar más imagenes
      //Load next page
      loadNextPage();
      }
    });

  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async{

    if(isLoading) return; //Si ya se esta cargando no hagas nada más.
    isLoading = true;
    setState(() {
      
    });

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    //TODO: Revisar si esta montado el componente / widget
    if(!isMounted) return;
    setState(() {
      
    });

    //TODO: mover scroll hacia abajo

  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e)=> lastId + e)
    );
    // setState(() {
      
    // });
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    // appBar: AppBar(
    //   title: const Text('Infinite Scroll'),
    // ),
    body: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ListView.builder(
        controller: scrollController,
        itemCount: imagesIds.length,
        itemBuilder: (context, index) {
          return FadeInImage(
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
            placeholder: const AssetImage('assets/Images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'));
        },
      ),
    ),
    floatingActionButton: Stack(
      children:[
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            heroTag: 'btn1', 
            onPressed: () {
              setState(() {
                imagesIds = [...imagesIds, imagesIds.length + 1];
              });
            },
            child: const Icon(Icons.add),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 70.0),
            child: FloatingActionButton(
              heroTag: 'btn2', 
              onPressed: () {
                context.pop();
              },
              // ,
              child: !isLoading ? FadeInRight(child: const Icon(Icons.arrow_back_ios_new_outlined)) :  SpinPerfect(
                infinite: true,
                child:FadeIn(child: const Icon(Icons.refresh_rounded))
              )
            ),
          ),
        ),
      ],
    ),
  );
}

}