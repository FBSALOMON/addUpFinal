//=================================
import UIKit
import Foundation
//=================================
class TableController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    //# MARK: - IBOutlets
    @IBOutlet weak var simplePicker: UIPickerView!
    
    //# MARK: - Properties
    var data = ["10"]
    var budget: Int = 0
    
    //# MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 2...30 {
            data.append(String(x * 10))
        }
        
        let theRow: Int = Singleton.sharedInstance.theBudget / 10 - 1
        self.simplePicker.selectRow(theRow, inComponent: 0, animated: true)
    }

    //# MARK: - didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //# MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return Singleton.sharedInstance.arrayOfItems.count
        
    }
    
    //# MARK: - tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"cell")
        cell.textLabel!.text = String(format: "$%.2f", Singleton.sharedInstance.arrayOfItems[indexPath.row])
        cell.textLabel?.textColor = UIColor(red: 0.51, green: 0, blue: 0, alpha: 1.0)// Colleur da FONT
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Angeline Vintage_Demo.ttf", size: 32)
        //tableView.separatorStyle = .none // Remove the lines from table view
        return cell
    }
    
    //# MARK: - tableView
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            Singleton.sharedInstance.arrayOfItems.remove(at: indexPath.row)
            Singleton.sharedInstance.saveArray()
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    //# MARK: - numberOfComponents
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //# MARK: - pickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return data.count
    }
    
    //# MARK: - pickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    //# MARK: - pickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.budget = Int(self.data[row])!
    }
    
    //# MARK: - pickerView
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor(red: 0.51, green: 0, blue: 0, alpha: 1.0)
        pickerLabel.text = data[row]
        pickerLabel.font = UIFont(name: "Angeline Vintage_Demo.otf", size: 24)
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }

    //# MARK: - settingBudget
    @IBAction func settingBudget(_ sender: UIButton) {
        Singleton.sharedInstance.setBudget(aBudget: self.budget)
    }
}
//=================================









