import ProjectDescription

public enum Environment {
    public static let appName = "Rakkyo-iOS"
    public static let targetName = "Rakkyo-iOS"
    public static let targetTestName = "\(targetName)Tests"
    public static let organizationName = "Rakkyo-iOS"
    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "13.0", devices: [.iphone, .ipad])
    public static let platform = Platform.iOS
    public static let baseSetting: SettingsDictionary = SettingsDictionary()
}
