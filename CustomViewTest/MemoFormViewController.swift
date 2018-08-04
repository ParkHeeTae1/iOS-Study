//
//  MemoFormViewController.swift
//  CustomViewTest
//
//  Created by 박희태 on 2018. 7. 29..
//  Copyright © 2018년 박희태. All rights reserved.
//

import UIKit

class MemoFormViewController: UIViewController,
                              UIImagePickerControllerDelegate,
                              UINavigationControllerDelegate,
                              UITextViewDelegate {
    var subject: String!

    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    override func viewDidLoad() {
        
        self.contents.delegate = self;
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.preview.image = info [UIImagePickerControllerEditedImage] as? UIImage;
        
        picker.dismiss(animated: false);
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString;
        let length = contents.length > 15 ? 15 : contents.length;
        self.subject = contents.substring(with: NSRange(location: 0, length: length));
        
        self.navigationItem.title = subject;
    }
    
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController();
        
        picker.delegate = self;
        picker.allowsEditing = true;
        
        self.present(picker, animated: false);
    }
    
    @IBAction func save(_ sender: Any) {
        guard self.contents.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil,
                                          message: "내용을 입력해주세요",
                                          preferredStyle: .alert);
            
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default,
                                          handler: nil));
            
            self.present(alert, animated: true);
            return;
        }
        
        let data = MemoData();
        
        data.title = self.subject;
        data.contents = self.contents.text;
        data.image = self.preview.image;
        data.regDate = Date();
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        appDelegate.memoList.append(data);
        
        _ = self.navigationController?.popViewController(animated: true);
    }
}
