import UIKit

final class MenuTypeSegmentedControl: UIView {
    
    let menuType: [String] = ["아침", "점심", "저녁"]
    
    private lazy var menuTypeSegmentedControl = UISegmentedControl(items: menuType).then {
        $0.backgroundColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 1)
        $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:.normal )
           $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.425, green: 0.62, blue: 1, alpha: 1), .font: UIFont.systemFont(ofSize: 13, weight: .semibold)], for: .selected)
    }
    
    init() {
          super.init(frame: .zero)
          addView()
          setLayout()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}

private extension MenuTypeSegmentedControl {
    func addView() {
        addSubViews(menuTypeSegmentedControl)
    }
    
    func setLayout() {
        menuTypeSegmentedControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    
}