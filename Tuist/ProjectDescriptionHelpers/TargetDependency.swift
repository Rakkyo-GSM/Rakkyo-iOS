import ProjectDescription

extension TargetDependency{
    public struct SPM {}
}

public extension TargetDependency.SPM{
    static let SnapKit = TargetDependency.package(product: "SnapKit")
    static let Then = TargetDependency.package(product: "Then")
    static let FSCalendar = TargetDependency.package(product: "FSCalendar")
}

public extension Package {
    static let SnapKit = Package.remote(
        url: "https://github.com/SnapKit/SnapKit.git",
        requirement: .upToNextMajor(from: "5.6.0")
    )
    static let Then = Package.remote(
        url: "https://github.com/devxoul/Then.git",
        requirement: .upToNextMajor(from: "3.0.0")
    )
    static let FSCalendar = Package.remote(
        url: "https://github.com/Alamofire/Alamofire",
        requirement: .upToNextMajor(from: "5.6.2")
    )
}

