import 'package:api_integration/controller/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController descontroller = TextEditingController();

  @override
  void initState() {
    Provider.of<screen_controller>(context, listen: false).getemployee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Homescreenprovider = Provider.of<screen_controller>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("EMPLOYEE DETAILS"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 30),
                          TextFormField(
                            controller: namecontroller,
                            maxLines: 2,
                            decoration: InputDecoration(
                                hintText: "Name",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: descontroller,
                            maxLines: 2,
                            decoration: InputDecoration(
                                hintText: "Designation",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                          SizedBox(height: 35),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Homescreenprovider.addemployee(
                                    name: namecontroller.text,
                                    des: descontroller.text);
                                Homescreenprovider.getemployee();
                              },
                              child: Text("save"))
                        ],
                      ),
                    ),
                  ));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
              height: 780,
              child: ListView.builder(
                itemCount: Homescreenprovider.employeelist.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(Homescreenprovider
                              .employeelist[index].employeeName),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    namecontroller.text = Homescreenprovider
                                        .employeelist[index].employeeName;

                                    descontroller.text = Homescreenprovider
                                        .employeelist[index].designation;

                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) => Container(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(height: 30),
                                                    TextFormField(
                                                      controller:
                                                          namecontroller,
                                                      maxLines: 2,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText: "Name",
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.black))),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    TextFormField(
                                                      controller: descontroller,
                                                      maxLines: 2,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  "Designation",
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.black))),
                                                    ),
                                                    SizedBox(height: 35),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Homescreenprovider.updateemployee(
                                                              id: Homescreenprovider
                                                                  .employeelist[
                                                                      index]
                                                                  .id
                                                                  .toString(),
                                                              newname:
                                                                  namecontroller
                                                                      .text,
                                                              des: descontroller
                                                                  .text);

                                                          print(namecontroller
                                                              .text);
                                                          // print(id);
                                                          Navigator.of(context)
                                                              .pop();
                                                          print(index);
                                                        },
                                                        child: Text("update"))
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                onPressed: () {
                                  Homescreenprovider.deleteemployee(
                                      id: Homescreenprovider
                                          .employeelist[index].id
                                          .toString());
                                },
                                icon: Icon(Icons.delete),
                              )
                            ],
                          ),
                          Text(Homescreenprovider
                              .employeelist[index].designation),
                        ],
                      ),
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.tealAccent,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
