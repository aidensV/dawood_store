import 'package:dawood_store/cart.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int valueSelectType = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Nurmila",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              "Cabang 1",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: DropdownButton(
                  underline: SizedBox(),
                  value: valueSelectType,
                  items: [
                    DropdownMenuItem(
                      child: Text("Online"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Offline"),
                      value: 2,
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      valueSelectType = value;
                    });
                  }),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "Daftar Menu",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              )),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(6, (index) {
                    int type = index % 2;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(
                        children: [
                          Card(
                            color: Color.fromARGB(255, 246, 248, 248),
                            child: InkWell(
                              onTap: () {
                                showDialogAdd();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      type == 0 ? "Martabak M" : "Martabak L",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "12.000 - 20.000",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(255, 255, 23, 68)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  type == 0 ? "M" : "L",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        },
        child: const Icon(
          Icons.chevron_right,
          size: 42,
        ),
        backgroundColor: Color.fromARGB(255, 255, 23, 68),
      ),
    );
  }

  showDialogAdd() {
    String dropdownValue = 'One';
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
                    // key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                         Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Variant",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black87)),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                isExpanded: true,
                                
                                iconSize: 24,
                                elevation: 16,
                                focusColor: Colors.grey[100],
                                
                                underline: Container(
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>['One', 'Two', 'Free', 'Four']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Jumlah Pembelian",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black87)),
                        ),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: CommonStyle.textFieldStyle(
                                  ),
                            )),
                          Divider(),
                           Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Extra Toping",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black87)),
                        ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(4)
                                    ),
                                    child: DropdownButton<String>(
                                      value: dropdownValue,
                                      isExpanded: true,
                                      
                                      iconSize: 24,
                                      elevation: 16,
                                      focusColor: Colors.grey[100],
                                      
                                      underline: Container(
                                        height: 2,
                                        color: Colors.transparent,
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: <String>['One', 'Two', 'Free', 'Four']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                               SizedBox(width: 4,),
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    child: Icon(Icons.add),
                                    onPressed: (){},
                                  ),
                                )
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text("Simpan"),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class CommonStyle {
  static InputDecoration textFieldStyle(
      {String labelTextStr = "", String hintTextStr = ""}) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(12),
      labelText: labelTextStr,
      hintText: hintTextStr,
      fillColor: Colors.grey[100],
      filled: true,
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.green[100])),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey[100])),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
