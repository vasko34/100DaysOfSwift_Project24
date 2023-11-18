import UIKit

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
    
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        
        return String(self.dropFirst(prefix.count))
    }
    
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        
        return String(self.dropLast(suffix.count))
    }
    
    func containsAny(of array: [String]) -> Bool {
        for element in array {
            if self.contains(element) {
                return true
            }
        }
        return false
    }
    
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) {
            return self
        } else {
            return prefix + self
        }
    }
    
    var capitalizedFirst: String {
        guard let firstLetter = self.first else { return "" }
        
        return firstLetter.uppercased() + self.dropFirst()
    }
    
    var lines: [String] {
        return self.components(separatedBy: "\n")
    }
    
    var isNumeric: Bool {
        if Int(self) != nil || Double(self) != nil {
            return true
        } else {
            return false
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet var label2: UILabel!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = "Taylor"
        for letter in name {
            print("Give me a \(letter)!")
        }
        
        print(name[3]) //Can not use indexes with strings unless we add an extension
        
        let letter = name[name.index(name.startIndex, offsetBy: 3)] // = name[3]
        print(letter)
        
        //someString.isEmpty is faster than someString.count == 0
        
        let password = "12345"
        print(password.hasPrefix("123"))
        print(password.hasSuffix("456"))
        print(password.deletingPrefix("123"))
        print(password.deletingSuffix("456"))
        
        let weather = "it's going to rain"
        print(weather.capitalized)
        print(weather.capitalizedFirst)
        
        let input = "Swift is like Objective-C without the C"
        print(input.contains("Swift"))
        
        let languages = ["Python", "Ruby", "Swift"]
        print(languages.contains("Swift"))
        
        for language in languages {
            print(input.contains(language))
        }
        
        print(input.containsAny(of: languages))
        
        print(languages.contains(where: input.contains)) // = input.contains(languages[0..<end])
        
        let string = "This is a test string"
        let attributes: [NSAttributedString.Key: Any] =  [
            .foregroundColor: UIColor.white,
            .backgroundColor: UIColor.red,
            .font: UIFont.boldSystemFont(ofSize: 36)
        ]
        
        let attributedString1 = NSAttributedString(string: string, attributes: attributes)
        label.attributedText = attributedString1
        
        let attributedString2 = NSMutableAttributedString(string: string)
        attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
        attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
        attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
        attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
        attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))
        label2.attributedText = attributedString2
        
        let testingStr = "Holly"
        print(testingStr.withPrefix("Ho"))
        print(testingStr.withPrefix("ho"))
        
        let emptyTest = ""
        let linesTest = "JM\nSwift"
        print(emptyTest.lines)
        print(linesTest.lines)
        print(testingStr.lines)
        
        let int = "-5"
        let uint = "-5"
        let double = "5.123456789"
        let float = "5.123456"
        print(int.isNumeric)
        print(uint.isNumeric)
        print(double.isNumeric)
        print(float.isNumeric)
        print(linesTest.isNumeric)
    }
}

