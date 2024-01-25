import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget singleProducts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 230,
      width: 160,
      decoration: BoxDecoration(
          color: Color(0xffd9dad9), borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 2,
          child: Image.network(
              fit: BoxFit.cover,
              'https://upload.wikimedia.org/wikipedia/commons/4/42/Vegetables_0006.JPG'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fresh vegitable',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  '100 birr 1 kg',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(right: 1),
                              height: 30,
                              width: 50,
                              child: MaterialButton(
                                child: Row(children: [
                                  Expanded(
                                      child: Text(
                                    '1 KG',
                                    style: TextStyle(fontSize: 10),
                                  )),
                                  Center(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 10,
                                      color: Colors.blue,
                                    ),
                                  )
                                ]),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove,
                              size: 15,
                              color: Colors.orange,
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.orange,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xffd4d181),
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.indigo,
              ),
            ),
          )
        ],
        backgroundColor: Color(0xffd6b738),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: ListView(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.wallpaperflare.com/static/965/895/782/vegetables-herbs-lots-of-wallpaper.jpg')),
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      // color: Colors.red,
                      child: Column(children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 115, bottom: 10),
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xffd1ad17),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50)),
                            ),
                            child: Center(
                              child: Text(
                                'Dagu',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 10,
                                          offset: Offset(3, 3))
                                    ]),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '25% off',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[100],
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'On all products',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]),
                    )),
                Expanded(child: Container())
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Herbs Seasuogis'),
                Text(
                  'View all',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('freshi frut'),
                Text(
                  'View all',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
                singleProducts(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
