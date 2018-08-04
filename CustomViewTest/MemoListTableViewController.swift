//
//  MemoListTableViewController.swift
//  CustomViewTest
//
//  Created by 박희태 on 2018. 7. 29..
//  Copyright © 2018년 박희태. All rights reserved.
//

import UIKit

class MemoListTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate;
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData();
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.memoList.count;
        
        return count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.appDelegate.memoList[indexPath.row];
        
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage";
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoTableViewCell;
        
        cell.subject?.text = row.title;
        cell.contents?.text = row.contents;
        cell.img?.image = row.image;
        
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
        cell.regdate?.text = formatter.string(from: row.regDate!);
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = self.appDelegate.memoList[indexPath.row];
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadViewController else {
            return;
        }
        
        vc.param = row;
        self.navigationController?.pushViewController(vc, animated: true);
    }
}
