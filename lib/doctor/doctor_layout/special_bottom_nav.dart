import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/doctor/doctor_layout/cubit/doctor_cubit.dart';
import 'package:mednet/doctor/doctor_layout/cubit/doctor_state.dart';
import '../../constants/colors.dart';


class SpecialBottomNav extends StatefulWidget {
  const SpecialBottomNav({super.key});

  @override
  State<SpecialBottomNav> createState() => _SpecialBottomNavState();
}

class _SpecialBottomNavState extends State<SpecialBottomNav> {
  late DoctorCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = DoctorCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    List<TabItem> tabItems = [
      TabItem(icon: Icons.home, label: 'Form'),
      TabItem(icon: Icons.search, label: 'Applied'),
      TabItem(icon: Icons.access_time, label: 'Bills'),
      TabItem(icon: Icons.person_2_outlined, label: 'profile'),
    ];
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: false,
          body: Stack(
            fit: StackFit.expand,
            children: [
              cubit.screens[cubit.currentIndex],
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: AnimatedOpacity(
                  opacity: cubit.isBottomBarVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: cubit.isBottomBarVisible ? 75.0 : 0.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: tabItems
                          .asMap()
                          .entries
                          .map(
                            (entry) => buildTabItem(
                          entry.value.icon,
                          entry.value.label,
                          entry.key,
                          cubit.currentIndex,
                              () => cubit.changeBot(entry.key, context),
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget buildTabItem(
      IconData icon,
      String label,
      int index,
      int currentIndex,
      VoidCallback onTap,
      ) {
    bool isSelected = index == currentIndex;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Color.fromRGBO(0, 0, 0, 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  transform: isSelected
                      ? Matrix4.identity()
                      : Matrix4.diagonal3Values(0.8, 0.8, 1.0),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: isSelected ? TextDecoration.underline : null,
                  ),
                ),
                SizedBox(height: 5),
                isSelected
                    ? Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 5,
                  width: 30,
                )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabItem {
  final IconData icon;
  final String label;

  TabItem({required this.icon, required this.label});
}
