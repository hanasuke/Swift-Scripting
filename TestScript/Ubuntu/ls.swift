import Foundation
import Glibc

let args = Process.arguments.suffixFrom(0)

let fileManager:NSFileManager = NSFileManager()

let files = try? fileManager.contentsOfDirectoryAtPath(args[1])

for filename in files! {
    print(filename)
}
