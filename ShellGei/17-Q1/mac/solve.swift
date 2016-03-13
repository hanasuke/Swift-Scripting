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
    let jsonData = try! NSJSONSerialization.dataWithJSONObject(data, options: [])
    print(NSString(data: jsonData, encoding:NSUTF8StringEncoding) as! String)
}

var data: Dictionary< String, Array<String> > = [:]

while true {
    var line = readLine()!
    var parseData = line.componentsSeparatedByString(" ")

    if ( line == "" ) {
        break
    }

    if ( data[parseData[0]] == nil ) {
        data[parseData[0]] = [String(parseData[1])]
    } else {
        data[parseData[0]]!.append(String(parseData[1]))
    }

}

outputText(data)
outputJSON(data)
