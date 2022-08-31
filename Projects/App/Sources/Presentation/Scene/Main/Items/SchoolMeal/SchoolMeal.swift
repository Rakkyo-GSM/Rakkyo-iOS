
import UIKit

final class SchoolMealVC: baseVC{
    
    private let menuLabel = UILabel().then {
        $0.text = "아침 급식"
        $0.font = .systemFont(ofSize: 26)
    }
    
    private let dateButton = UIButton().then {
        $0.setTitle("2022년 6월 11일", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.layer.cornerRadius = 8
        $0.backgroundColor = RakkyoIOSAsset.Colors.rakkyoMainColor.color
    }
    
    private let menuListView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 30
        $0.layer.shadowRadius = 15
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
    }
    
    private let menuTypeSegmentControl = MenuTypeSegmentedControl().then {
        $0.layer.cornerRadius = 10
    }
    
    override func addView() {
        view.addSubViews(menuLabel, dateButton, menuListView, menuTypeSegmentControl)
    }
    
    override func setLayout() {
        menuLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(55)
            $0.centerX.equalToSuperview()
        }
        
        dateButton.snp.makeConstraints {
            $0.top.equalTo(menuLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(117)
        }
        
        menuListView.snp.makeConstraints {
            $0.top.equalTo(dateButton.snp.bottom).offset(49)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
            $0.height.equalTo(362)
        }
        
        menuTypeSegmentControl.snp.makeConstraints {
            $0.top.equalTo(menuListView.snp.bottom).offset(36)
            $0.leading.equalToSuperview().offset(40)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
        }
    }
    
    
    
    
}
