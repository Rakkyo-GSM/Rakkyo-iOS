
import UIKit
import SnapKit
import Then

final class TodoCell: baseTableViewCell{
    
    private let mainButton = UIButton().then{
        $0.backgroundColor = RakkyoIOSAsset.Colors.rakkyoMainColor.color
        $0.layer.cornerRadius = 16
        $0.setTitle("헤으응", for: .normal)
    }
    
    private let buttonShadowView = ShadowView()
    
    override func addView() {
        self.addSubViews(mainButton,buttonShadowView)
        self.bringSubviewToFront(mainButton)
    }
    
    override func setLayout() {
        mainButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(60)
            
        }
        buttonShadowView.snp.makeConstraints { make in
            make.centerX.equalTo(mainButton)
            make.width.equalTo(300)
            make.height.equalTo(34)
            make.bottom.equalTo(mainButton).offset(13)
        }
    }
}
