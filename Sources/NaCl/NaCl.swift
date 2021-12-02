import Foundation
import NaClC

public struct NaCl {
    public init() {}
    
    public func toPublic(_ input: [UInt8]) -> [UInt8] {
        let pk = UnsafeMutablePointer<UInt8>.allocate(capacity: 32)
        let sk = UnsafeMutablePointer<UInt8>.allocate(capacity: 32)
        var pkCopy: [UInt8] = Array(repeating: 0, count: 32)

        for i in 0..<32 {
            (pk + i).initialize(to: 0)
            (sk + i).initialize(to: input[i])
        }

        modified_crypto_sign_publickey(pk, sk)

        for index in 0..<pkCopy.count {
            pkCopy[index] = (pk + index).pointee
        }

        pk.deallocate()
        sk.deallocate()

        return pkCopy
    }

}
