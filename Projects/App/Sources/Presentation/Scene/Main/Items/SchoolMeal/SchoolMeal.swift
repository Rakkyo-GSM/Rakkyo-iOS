
import UIKit

final class SchoolMealVC: baseVC{
    
    private let menuType: [String] = ["아침", "점심", "저녁"]
    
    private let menuLabel = UILabel().then {
        $0.text = "아침 급식"
        $0.font = .systemFont(ofSize: 26)
    }
    
    private let menuListView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 30
        $0.layer.shadowRadius = 15
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
    }
    private let datePickerView = UIDatePicker().then {
        $0.preferredDatePickerStyle = .compact
        $0.datePickerMode = .date
        $0.locale = Locale(identifier: "ko-KR")
    }
        
    private lazy var menuTypeSegmentedControl = UISegmentedControl(items: menuType).then {
        $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1), .font: UIFont.systemFont(ofSize: 13, weight: .semibold)], for: .normal)
        $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.425, green: 0.62, blue: 1, alpha: 1), .font: UIFont.systemFont(ofSize: 16, weight: .semibold)], for: .selected)
    }
    
    override func addView() {
        view.addSubViews(menuLabel, menuListView, menuTypeSegmentedControl, datePickerView)
    }
    
    override func setLayout() {
        menuLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(85)
            $0.leading.equalTo(menuListView.snp.leading).offset(15)
        }
        
        datePickerView.snp.makeConstraints {
            $0.top.equalTo(menuLabel.snp.top)
            $0.centerX.equalToSuperview()
            $0.trailing.equalTo(menuListView.snp.trailing)
        }
        
        menuListView.snp.makeConstraints {
            $0.top.equalTo(datePickerView.snp.bottom).offset(49)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
            $0.height.equalTo(362)
        }
        
        menuTypeSegmentedControl.snp.makeConstraints {
            $0.top.equalTo(menuListView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(40)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
    }
}

