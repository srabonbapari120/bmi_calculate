import 'package:bmi/bloc/bmi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("B M I"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: height * 0.2,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 5,
                        offset: Offset(4, 8),
                        color: Colors.grey.shade100,
                      )
                    ]),
                child: BlocBuilder<BmiBloc, BmiState>(
                  builder: (context, state) {
                    if (state is BmiInitial) {
                      return Column(
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade200,
                            ),
                          ),
                          Text(
                            "Calculate",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade200,
                            ),
                          ),
                        ],
                      );
                    } else if (state is UpdateState) {
                      return Column(
                        children: [
                          Text(
                            num.parse(state.bmi.toStringAsFixed(2)).toString(),
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade200,
                            ),
                          ),
                          Text(
                            state.result.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:state.bmi>25?Colors.red: Colors.deepPurple.shade200,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade200,
                            ),
                          ),
                          Text(
                            "Calculate",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade200,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<BmiBloc, BmiState>(
                builder: (context, state) {
                  if (state is ErrorState) {
                    return Text(
                      state.message.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return Text(
                      "",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your Height :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(4, 8),
                      color: Colors.grey.shade100,
                    )
                  ],
                ),
                child: TextField(
                  controller: feetController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixText: "Feet",
                      prefixStyle: TextStyle(
                        color: Colors.black,
                      )),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(4, 8),
                      color: Colors.grey.shade100,
                    )
                  ],
                ),
                child: TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixText: "Inch",
                      prefixStyle: TextStyle(
                        color: Colors.black,
                      )),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Your Weight :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(4, 8),
                      color: Colors.grey.shade100,
                    )
                  ],
                ),
                child: TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixText: "KG",
                      prefixStyle: TextStyle(
                        color: Colors.black,
                      )),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  context.read<BmiBloc>().add(Calculate(feetController.text,inchController.text,weightController.text));
                },
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
