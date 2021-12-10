import Foundation
import NaClC

public struct NaCl {
    public init() {}
    
    public func toPublic(_ input: [UInt8]) -> [UInt8] {
        let capacity = 32
        let pk = UnsafeMutablePointer<UInt8>.allocate(capacity: capacity)
        let sk = UnsafeMutablePointer<UInt8>.allocate(capacity: capacity)
        var pkCopy: [UInt8] = Array(repeating: 0, count: capacity)

        for i in 0..<capacity {
            (pk + i).initialize(to: 0)
            (sk + i).initialize(to: input[i])
        }

        modified_crypto_sign_publickey(pk, sk)

        for i in 0..<capacity {
            pkCopy[i] = (pk + i).pointee
        }

        pk.deallocate()
        sk.deallocate()

        return pkCopy
    }

}
