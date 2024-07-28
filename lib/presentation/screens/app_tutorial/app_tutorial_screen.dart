import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo(
    this.title,
    this.caption,
    this.imageUrl,
  );
}

final slides =   <SlideInfo>[
  const SlideInfo(
      'Busca la comida',
      'Culpa officia irure sit tempor magna tempor Lorem quis consequat irure. Commodo minim esse pariatur officia. Ea mollit labore consequat ad nisi eiusmod pariatur sunt adipisicing et sit anim. Sunt sit occaecat labore ipsum eu nostrud magna ullamco dolore culpa velit exercitation dolore. Duis do laboris ex duis aliqua deserunt adipisicing voluptate voluptate tempor magna eu cillum. Culpa irure voluptate anim exercitation minim sit velit laborum ex culpa est. Magna dolore nulla labore cillum aliquip elit tempor qui quis qui elit enim.',
      'assets/Images/1.png'),
  const SlideInfo(
      'Entrega rapida',
      'Lorem do consectetur amet deserunt occaecat cupidatat exercitation exercitation. Velit ex eiusmod amet quis proident exercitation amet ad consectetur ex Lorem laborum in. Eiusmod laborum velit dolore fugiat eu non magna in sint. Laboris laboris commodo officia eu elit. Consequat sunt eu nulla ad duis cupidatat exercitation Lorem reprehenderit magna eiusmod qui pariatur. Velit amet sunt adipisicing sit laboris. Et aliqua in laboris qui incididunt magna exercitation.',
      'assets/Images/2.png'),
  const SlideInfo(
      'Disfruta la comida',
      'Mollit aute nulla ut eu dolore culpa aliquip aute. Nostrud sunt in ipsum duis sint duis. Pariatur id adipisicing dolor Lorem cupidatat tempor irure labore est occaecat culpa. Sint quis laboris reprehenderit proident nostrud ex laboris est dolor ipsum laborum duis incididunt. Laboris voluptate cupidatat consequat veniam exercitation adipisicing consectetur enim aute occaecat non ea exercitation. Proident consectetur minim deserunt laborum voluptate qui ut Lorem ut nostrud ad anim. Ex amet occaecat ea dolor ipsum.',
      'assets/Images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {

      final page = pageViewController.page ?? 0;

      if(!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }else{
        setState(() {
          endReached = false;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          PageView(
            controller: pageViewController,
            physics:
                const BouncingScrollPhysics(), //Tener el mismo comportamiento en iOS y Android
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Salir'),
            ),
          ),
          endReached ? Positioned(
            right: 30,
            bottom: 30,
            child: FadeInRight(
              from: 15,
              child: FilledButton(
                onPressed: (){
                  context.pop();
              },
                child: const Text('Comenzar'),
              ),
            ),
          ):const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
