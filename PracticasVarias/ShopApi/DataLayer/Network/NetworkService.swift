import Foundation

public protocol NetworkService {
    var url: URL { get }
    var path: String { get }
}
