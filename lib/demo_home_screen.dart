import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getx_flutter/presentation/demo_bloc/demo_bloc.dart';
import 'package:getx_flutter/presentation/demo_bloc/demo_state.dart';

import 'presentation/demo_bloc/demo_event.dart';
import 'presentation/demo_code_bloc/demo_code_bloc.dart';
import 'presentation/demo_code_bloc/demo_code_event.dart';
import 'presentation/demo_code_bloc/demo_code_state.dart';



class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({Key? key}) : super(key: key);

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  var dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DemoBloc()..add(FetchDemoEvent()),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<DemoBloc, DemoState>(builder: (context, state) {
                  if (state is DemoLoadedState) {
                    return DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: state.demoModel.map((e) {
                        return DropdownMenuItem(
                          value: e.classCode,
                          child: Text(e.className.toString()),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownvalue = newValue!;

                          final demoBloc = BlocProvider.of<DemoCodeBloc>(context);
                          demoBloc.add(FetchDemoCodeEvent(dropdownvalue));

                        });
                      },
                    );
                  } else if (state is DemoErrorState) {
                    Fluttertoast.showToast(msg: state.message);
                    return Container();
                  } else {
                    return Container();
                  }
                }),

                /// second dropdownmenu
                BlocBuilder<DemoCodeBloc, DemoCodeState>(builder: (context, state) {
                  if (state is DemoCodeLoadedState) {
                    return Text("Class code is : ${state.democodeModel.classCode}");

                  } else if (state is DemoErrorState) {
                    Fluttertoast.showToast(msg: "error not found");
                    return Container();
                  } else {
                    return Container();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
