
import UIKit

final class ShadowView: UIView{
    init(){
        super.init(frame: .zero)
        self.backgroundColor = RakkyoIOSAsset.Colors.rakkyoShadowColor.color
        self.layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
