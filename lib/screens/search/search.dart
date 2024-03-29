// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/config/colors.dart';
import 'package:flutterproject/models/product_model.dart';
import 'package:flutterproject/widgets/single_item.dart';

enum SinginCharacter { lowToHigh, highToLow, alphabetically }

class Search extends StatefulWidget {
  final List<ProductModel> search;
  Search({required this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";
  SinginCharacter _character = SinginCharacter.alphabetically;

  List<ProductModel> searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);

    void bottomShett() => showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: new Text(
                    'Sort By',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                RadioListTile(
                    value: SinginCharacter.lowToHigh,
                    groupValue: _character,
                    title: Text("Price - Low to High"),
                    onChanged: (vav) {
                      setState(() {
                        _character = vav!;
                      });
                      Navigator.of(context).pop();
                    }),
                RadioListTile(
                    value: SinginCharacter.highToLow,
                    groupValue: _character,
                    title: Text("Price - High to Low"),
                    onChanged: (vav) {
                      setState(() {
                        _character = vav!;
                      });
                      Navigator.of(context).pop();
                    }),
                RadioListTile(
                    value: SinginCharacter.alphabetically,
                    groupValue: _character,
                    title: Text("Alpbettically"),
                    onChanged: (vav) {
                      setState(() {
                        _character = vav!;
                      });
                      Navigator.of(context).pop();
                    }),
                Container(
                  height: 46,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text("Submit"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: primaryColor,
                    onPressed: () {},
                  ),
                )
              ],
            );
          },
        );

    return Scaffold(
      appBar: AppBar(title: Text("search"), actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu_rounded),
        ),
      ]),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Search for  Items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isBool: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
