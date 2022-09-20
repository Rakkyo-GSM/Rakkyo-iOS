import Foundation
import UIKit

final class DatePickerView: UIView {
    
    private let availableYear: [Int] = []
    private let allMonth: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    private var selectedYear = 0
    private var selectedMonth = 0
    private let todayYear = "0"
    private let todayMonth = "0"
    private let menuType: [String] = ["아침", "점심", "저녁"]
    
    private let dateTextField = UITextField().then {
        $0.placeholder = "20xx년"
        $0.layer.cornerRadius = 8
        $0.backgroundColor = RakkyoIOSAsset.Colors.rakkyoMainColor.color
        $0.tintColor = .clear
    }
    
    private let datePickerView = UIPickerView()
   
}

extension DatePickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    func createPickerView() {
         datePickerView.delegate = self
         datePickerView.dataSource = self
     
         dateTextField.inputView = datePickerView
        
        configToolbar()
     }
    
    func configToolbar() {
          let toolBar = UIToolbar()
          toolBar.barStyle = UIBarStyle.default
          toolBar.isTranslucent = true
          toolBar.tintColor = UIColor.white
          toolBar.sizeToFit()
          
          let doneBT = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(self.donePicker))
          let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
          let cancelBT = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(self.cancelPicker))
          
          toolBar.setItems([cancelBT,flexibleSpace,doneBT], animated: false)
          toolBar.isUserInteractionEnabled = true
          
          dateTextField.inputAccessoryView = toolBar
      }

      @objc func donePicker() {
          let row = self.datePickerView.selectedRow(inComponent: 0)
          self.datePickerView.selectRow(row, inComponent: 0, animated: false)
          self.dateTextField.resignFirstResponder()
      }

      @objc func cancelPicker() {
          self.dateTextField.text = nil
          self.dateTextField.resignFirstResponder()
      }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 3
       }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           switch component {
                case 0:
                    return availableYear.count
                case 1:
                    return allMonth.count
                default:
                    return 0
           }
       }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           switch component {
                case 0:
                    return "\(availableYear[row])년"
                case 1:
                    return "\(allMonth[row])월"
                default:
                    return ""
         }
       }
       
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           switch component {
                case 0:
                    selectedYear = availableYear[row]
                case 1:
                    selectedMonth = allMonth[row]
                default:
                    break
                }
            }
}
