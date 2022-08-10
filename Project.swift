import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "Rakkyo-iOS"
let orginazationIden = "Rakkyo-iOS.Rakkyo-iOS"

let project = Project.excutable(
    name: projectName,
    platform: .iOS,
    packages: [
        .Then,
        .SnapKit,
        .FSCalendar,
        .Tabman,
        .Alamofire
    ],
    product: .app,
    deploymentTarget: .iOS(targetVersion: "13.5", devices: [.iphone, .ipad]),
    dependencies: [
        .SPM.Then,
        .SPM.SnapKit,
        .SPM.FSCalendar,
        .SPM.Tabman,
        .SPM.Alamofire
    ]
)
