
import UIKit

final class SchoolMealVC: baseVC{
    
    private var availableYear: [Int] = []
    private let allMonth: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    private var selectedYear = 0
    private var selectedMonth = 0
    private var todayYear = "0"
    private var todayMonth = "0"
    private let menuType: [String] = ["아침", "점심", "저녁"]
    
    private let menuLabel = UILabel().then {
        $0.text = "아침 급식"
        $0.font = .systemFont(ofSize: 26)
    }
    
    private let dateTextField = UITextField().then {
        $0.placeholder = "20xx년"
        $0.layer.cornerRadius = 8
        $0.backgroundColor = RakkyoIOSAsset.Colors.rakkyoMainColor.color
        $0.tintColor = .clear
    }
    
    private let menuListView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 30
        $0.layer.shadowRadius = 15
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
    }
    private let datePickerView = UIPickerView()
        
    private lazy var menuTypeSegmentedControl = UISegmentedControl(items: menuType).then {
            $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1), .font: UIFont.systemFont(ofSize: 13, weight: .semibold)], for: .normal)
            $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.425, green: 0.62, blue: 1, alpha: 1), .font: UIFont.systemFont(ofSize: 16, weight: .semibold)], for: .selected)
    }
    
    override func addView() {
        view.addSubViews(menuLabel, dateTextField, menuListView, menuTypeSegmentedControl)
    }
    
    override func setLayout() {
        menuLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(55)
            $0.centerX.equalToSuperview()
        }
        
        dateTextField.snp.makeConstraints {
            $0.top.equalTo(menuLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(117)
        }
        
        menuListView.snp.makeConstraints {
            $0.top.equalTo(dateTextField.snp.bottom).offset(49)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
            $0.height.equalTo(362)
        }
        
        menuTypeSegmentedControl.snp.makeConstraints {
            $0.top.equalTo(menuListView.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(40)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
    }
   
    override func configureVC() {
        createPickerView()
        setAvailableDate()
    }
    
    func setAvailableDate() {
        /// 선택 가능한 연도 설정
        let formatterYear = DateFormatter()
        formatterYear.dateFormat = "yyyy"
        todayYear = formatterYear.string(from: Date())
            
        for i in 2020...Int(todayYear)! {
            availableYear.append(i)
        }
        
        /// 선택 가능한 달 설정
        let formatterMonth = DateFormatter()
        formatterMonth.dateFormat = "MM"
        todayMonth = formatterMonth.string(from: Date())
            
        selectedYear = Int(todayYear)!
        selectedMonth = Int(todayMonth)!
    }
}

extension SchoolMealVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func createPickerView() {
        datePickerView.delegate = self
        datePickerView.dataSource = self

        let toolBar = UIToolbar()
        toolBar.sizeToFit()
           
        let btnDone = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(donePicker))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btnCancel = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(cancelPicker))
        toolBar.setItems([btnCancel , space , btnDone], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        dateTextField.inputView = datePickerView
        dateTextField.inputAccessoryView = toolBar
    }
    
    @objc func donePicker() {
        let row = self.datePickerView.selectedRow(inComponent: 0)
        self.datePickerView.selectRow(row, inComponent: 0, animated: false)
        self.dateTextField.text = "\(availableYear[row])년"
        dateTextField.resignFirstResponder()
      }

      @objc func cancelPicker() {
          self.dateTextField.text = nil
          self.dateTextField.resignFirstResponder()
      }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 2
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

