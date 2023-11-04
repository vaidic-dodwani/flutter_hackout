import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/constants.dart';
import 'package:flutter_leadify/utils/toast_functions.dart';
import 'package:flutter_leadify/view_model/scarp_view_model/scarp_view_model.dart';
import 'package:provider/provider.dart';

class Schedules extends StatelessWidget {
   Schedules({super.key});
  
  TextEditingController targetUrl= TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController keywords = TextEditingController();
  TextEditingController institution = TextEditingController();
  TextEditingController typeofService = TextEditingController();
  TextEditingController ageCategory = TextEditingController();
  TextEditingController industry = TextEditingController();
  TextEditingController companySize = TextEditingController();
  TextEditingController function = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Consumer<ScrapViewModel>(
          builder: (_,ref,__) {
            return SizedBox(

              child: ref.loading? Center(child: Container(
                width: 50,
                child: LinearProgressIndicator()),):Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.unselectedBottomNavigationBarColor.withOpacity(0.5),width: 2)),
                child: Column(children: [
                  CustomTextField(controller: targetUrl,label: "Target Url",),
                  const SizedBox(height: 16,),
                  CustomTextField(controller: title,label: "Title",),
                  const SizedBox(height: 16,),
                  CustomTextField(controller: companyName,label: "Company Name*",),
                  const SizedBox(height: 16,),
                  CustomTextField(controller: keywords,label: "Keywords*",),
                  const SizedBox(height: 16,),
                   CustomTextField(controller: institution,label: "Institution",),
                  const SizedBox(height: 16,),
                  CustomTextField(controller: typeofService,label: "Type of Service",),
                  const SizedBox(height: 16,),
                  CustomTextField(controller: ageCategory,label: "ageCategory",),
                  const SizedBox(height: 16,),
                  CustomTextField(controller: industry,label: "Industry",),
                  const SizedBox(height: 16,),
                   CustomTextField(controller: companySize,label: "Company Size",),
                  const SizedBox(height: 16,),
                  CustomTextField(controller: function,label: "Function",),
                  const SizedBox(height: 16,),
                  CustomTextField(controller: time,label: "Time",),
                  const SizedBox(height: 16,),
                  CustomTextField(controller: date,label: "Date",),
                  const SizedBox(height: 16,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: (){
                      if(companyName.text.isEmpty){
                        showErrorToast(context, "Company Name cannot be empty");
                        return;
                      }else if(keywords.text.isEmpty){
                        showErrorToast(context, "Keywords cannot be empty");
                        return;
                      }else{
                        ref.scrap(companyName: companyName.text, keywords: keywords.text,context: context);
                      }
                    }, child:  Text("Scrap",style: TT.f18w500.copyWith(color: AppColors.textWhite),))
                ],),
              ),
            );
          }
        ),
      ),
    );
  }
}
