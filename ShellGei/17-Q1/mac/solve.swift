import Foundation

func outputText(data: Dictionary<String, Array<String>>) {
    let sortedKeys: Array<String> = data.keys.sort(<)

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
