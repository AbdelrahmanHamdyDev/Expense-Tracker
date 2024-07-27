import 'package:expense/Expense/Expence.dart';
import 'package:flutter/material.dart';

class AddingExpense extends StatefulWidget {
  const AddingExpense({super.key, required this.Addexpense});

  final void Function(Expense expense) Addexpense;

  @override
  State<AddingExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddingExpense> {
  TextEditingController TitleController = TextEditingController();
  TextEditingController AmountController = TextEditingController();
  DateTime? SelectedDate;
  Catogery selectedCategory = Catogery.food;
  bool IsArabic = false;

  void DataPicker() async {
    DateTime nowdate = DateTime.now();
    DateTime firstdate = DateTime(nowdate.year - 1, nowdate.month, nowdate.day);

    final ChoosenDate = await showDatePicker(
        context: context,
        firstDate: firstdate,
        lastDate: nowdate,
        currentDate: nowdate);

    setState(() {
      SelectedDate = ChoosenDate;
    });
  }

  void Saving() {
    var Amount = double.tryParse(AmountController.text);
    if (TitleController.text.trim().isEmpty ||
        Amount == null ||
        SelectedDate == null) {
      showDialog(
        context: context,
        builder: (ctk) => AlertDialog(
          title: const Text("Alert"),
          content: const Text("Enter Data Correctly"),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(ctk);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
      return;
    }
    widget.Addexpense(
      Expense(
          title: TitleController.text,
          amount: Amount,
          date: SelectedDate!,
          catogery: selectedCategory,
          arabic: IsArabic),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    TitleController.dispose();
    AmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;

    var heightscale = (screenwidth > screenheight)
        ? keyboardSize + (screenheight / screenwidth) * 500
        : keyboardSize + (screenheight / screenwidth) * 140;

    return SingleChildScrollView(
      child: SizedBox(
        height: heightscale,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: (screenheight / screenwidth) * 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: screenheight / 50),

              //fisrt row
              if (screenwidth < screenheight)
                TextField(
                  controller: TitleController,
                  maxLength: 20,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                  ),
                )
              else
                Padding(
                  padding: EdgeInsets.all((screenheight / screenwidth) * 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: TitleController,
                          maxLength: 20,
                          decoration: const InputDecoration(
                            label: Text("Title"),
                          ),
                        ),
                      ),
                      SizedBox(width: screenwidth / 40),
                      Expanded(
                        child: TextField(
                          controller: AmountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            label: Text("Amount"),
                            prefix: Text("E£ "),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              //second row
              if (screenwidth < screenheight)
                TextField(
                  controller: AmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefix: Text("E£ "),
                  ),
                )
              else
                Row(
                  children: [
                    SizedBox(width: screenwidth / 15),
                    DropdownButton(
                        value: selectedCategory,
                        items: Catogery.values
                            .map(
                              (cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(cat.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }

                          setState(() {
                            selectedCategory = value;
                          });
                        }),
                    SizedBox(width: screenwidth / 5),
                    Row(
                      children: [
                        Text(
                          (SelectedDate == null)
                              ? "Select Date"
                              : formatter.format(SelectedDate!),
                        ),
                        IconButton(
                          onPressed: DataPicker,
                          icon: const Icon(Icons.date_range),
                        ),
                      ],
                    ),
                  ],
                ),

              SizedBox(height: screenheight / 40),

              //third row
              if (screenwidth < screenheight)
                Row(
                  children: [
                    SizedBox(width: screenwidth / 15),
                    DropdownButton(
                        value: selectedCategory,
                        items: Catogery.values
                            .map(
                              (cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(cat.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }

                          setState(() {
                            selectedCategory = value;
                          });
                        }),
                    SizedBox(width: screenwidth / 5),
                    Row(
                      children: [
                        Text(
                          (SelectedDate == null)
                              ? "Select Date"
                              : formatter.format(SelectedDate!),
                        ),
                        IconButton(
                          onPressed: DataPicker,
                          icon: const Icon(Icons.date_range),
                        ),
                      ],
                    ),
                  ],
                ),

              SizedBox(height: screenheight / 40),

              //forth row
              if (screenwidth < screenheight)
                Row(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: IsArabic,
                          onChanged: (res) => setState(
                            () {
                              IsArabic = res!;
                            },
                          ),
                        ),
                        const Text("Arabic"),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        const SizedBox(width: 5),
                        ElevatedButton(
                          onPressed: Saving,
                          child: const Text("Save Expense"),
                        ),
                      ],
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: screenwidth / 20),
                        Checkbox(
                          value: IsArabic,
                          onChanged: (res) => setState(
                            () {
                              IsArabic = res!;
                            },
                          ),
                        ),
                        const Text("Arabic"),
                      ],
                    ),
                    SizedBox(width: screenwidth / 5),
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        const SizedBox(width: 5),
                        ElevatedButton(
                          onPressed: Saving,
                          child: const Text("Save Expense"),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
