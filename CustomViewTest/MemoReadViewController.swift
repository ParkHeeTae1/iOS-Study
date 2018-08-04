//
//  MemoReadViewController.swift
//  CustomViewTest
//
//  Created by 박희태 on 2018. 7. 29..
//  Copyright © 2018년 박희태. All rights reserved.
//

import UIKit

class MemoReadViewController: UIViewController {

    var param : MemoData?
    
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        self.subject.text = param?.title;
        self.contents.text = param?.contents;
        self.img.image = param?.image;
        
        let formatter = DateFormatter();
        formatter.dateFormat = "dd일 HH:mm분에 작성됨.";
        let dateString = formatter.string(from: (param?.regDate)!);
        
        self.navigationItem.title = dateString;
    }
}
