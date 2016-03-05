import Glibc
import Foundation

var data: Dictionary< String, Array<String> > = [:]

while true {
    var line = readLine()!
    var parseData = line.componentsSeparatedByString(" ")

    if ( line == "" ) {
        break
    }

    if ( data[parseData[0]] == nil ) {
        data[parseData[0]] = [String(parseData[1])]
    }

    data[parseData[0]]!.append(String(parseData[1]))
}

for (key, values) in data {
    var value = values.joinWithSeparator(" ")
    print(key, value)
}
