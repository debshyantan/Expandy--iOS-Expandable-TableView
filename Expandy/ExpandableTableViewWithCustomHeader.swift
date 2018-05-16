import UIKit

class ExpandableTableViewWithCustomHeader: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sectionName = ["First Name", "Second Name", "3 Name", "4 Name", "5 Name", "6 Name", "7 Name"]
    
    var rowDataDict = ["First Name": ["row 1", "row 2" , "row 3", "row 4", "row 5", "row 6", "row 7"],
                       "Second Name": ["row 11", "row 12" , "row 13", "row 14", "row 15", "row 16", "row 17"],
                       "3 Name": ["row 21", "row 22" , "row 23", "row 24", "row 25", "row 26", "row 27"],
                       "4 Name": ["row 31", "row 32" , "row 33", "row 34", "row 35", "row 36", "row 37"],
                       "5 Name": ["row 41", "row 42" , "row 43", "row 44", "row 45", "row 46", "row 47"],
                       "6 Name": ["row 51", "row 52" , "row 53", "row  54", "row 55", "row 56", "row 57"],
                       "7 Name": ["row 61", "row 62" , "row 63", "row 64", "row 65", "row 66", "row 67"]]
    var collapsed = [true, true, true, true, true, true, true]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionName.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collapsed[section] ? 0 : rowDataDict[sectionName[section]]!.count
    }
    
    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        cell.label.text = rowDataDict[sectionName[indexPath.section]]?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    // Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let headerView = UIView()
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! CustomCell1
        headerCell.label.text = sectionName[section]
        headerView.addSubview(headerCell)
        headerView.tag = section

        headerCell.imageVie.tag = section+1000
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapHeader(_:)))
        headerView.addGestureRecognizer(tapGesture)
        
        return headerView
    }
    
    
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {

        let section  = gestureRecognizer.view?.tag
        var flag = false
        if  collapsed[section!] {
            collapsed[section!] =  false
     
            flag =  false
            

        } else {
            collapsed[section!] =  true
            flag = true
            

        }
        tableView.reloadSections(NSIndexSet(index: section!) as IndexSet, with: .fade)

        let tempview = self.view.viewWithTag(section!+1000)
 
        if flag {
            
            UIView.animate(withDuration: 0.3) {
                tempview?.transform = CGAffineTransform.identity
            }
        } else {

            UIView.animate(withDuration: 0.3) {
                tempview?.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2.0)
            }
        }

    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 71.5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath--->\(indexPath)")
    }
}
