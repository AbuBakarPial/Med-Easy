import '../../../Utillity/libraries.dart';

class MedicineGridView extends StatelessWidget {
  final List<MedicinesTableData> list;
  MedicineGridView(this.list);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MedicineModel>(
        builder: (context, child, model) {
      return ListView(
        // crossAxisCount: 2,
        shrinkWrap: true,
        children: list.map((medicine) {
          return InkWell(
            onTap: () {
              // details screen
            },
            child: buildLongPressDraggable(medicine, model),
          );
        }).toList(),
      );
    });
  }

  LongPressDraggable<MedicinesTableData> buildLongPressDraggable(
      medicine, MedicineModel model) {
    return LongPressDraggable<MedicinesTableData>(
      data: medicine,
      onDragStarted: () {
        // show the delete icon
        model.toggleIconState();
      },
      onDragEnd: (v) {
        // hide the delete icon
        model.toggleIconState();
      },
      child: FadeAnimation(
        .05,
        Container(child: MecicineCard(medicine)),
      ),
      childWhenDragging: Container(
        color: Color(0xff3EB16E).withOpacity(.3),
      ),
      feedback: Card(
        child: MecicineCard(medicine),
      ),
    );
  }
}
