import Glibc
import Foundation

func sortKeyInDictionary(data: Dictionary<String, Array<String>>) -> Array<String> {
    return data.keys.sort(<)
}

func outputText(data: Dictionary<String, Array<String>>) {
    let sortedKeys: Array<String> = sortKeyInDictionary(data)

    for skey in sortedKeys {
        for (key, values) in data {
            if ( key == skey ) {
                let value = values.joinWithSeparator(" ")
                print(key, value)
            }
        }
    }
}

func outputJSON(data:Dictionary<String, Array<String>>) {
    //let jsonData = try! NSJSONSerialization.dataWithJSONObject(data, options: [])
    //print(NSString(data: jsonData, encoding:NSUTF8StringEncoding) as! String)
}

var data: Dictionary< String, Array<String> > = [:]

let args = Process.arguments.suffixFrom(0)
let option = args[1]
let filePath = args[2]

let fileData = try! NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
let lineData = fileData.componentsSeparatedByString("\n")

for var i in 0..<lineData.count {
    var parseData = lineData[i].componentsSeparatedByString(" ")

    if ( lineData[i] == "" ) {
        break
    }

    if ( data[parseData[0]] == nil ) {
        data[parseData[0]] = [String(parseData[1])]
    } else {
        data[parseData[0]]!.append(String(parseData[1]))
    }
}

switch option {
case "-json" :
    outputJSON(data)
    break
case "-text" :
    outputText(data)
    break
default :
    print("argument error")
}
