//
//  ViewController.swift
//  Project6b
//  Day 30
//  Created by Igor Polousov on 07.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Создали label
        let label1 = UILabel()
        // Сделали чтобы небыло autoresizing for constraints
        label1.translatesAutoresizingMaskIntoConstraints = false
        // Задали цвет фона
        label1.backgroundColor = UIColor.red
        // Задали текст
        label1.text = "THESE"
        // Задали расположение view inside super view
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = UIColor.cyan
        label2.text = "ARE"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = UIColor.yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = UIColor.green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = UIColor.orange
        label5.text = "LABELS"
        label5.sizeToFit()
        
        // Добавили view on superview
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        
//
//        // Создали словарь чтобы упростить работу в дальнейшем
//        let viewsDictionary = ["label1": label1,"label2": label2,"label3": label3,"label4": label4,"label5": label5]
//        // Ограничения по горизонтали для каждой view
//        for label in viewsDictionary.keys {
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
//        }
//        // Словарь для работ с горизонтальными constraints
//        let metrics = ["lableHight": 88]
//        // Ограничения по вертикали для каждой view. Размер и приоритет @999 установлено для первой view остальные сделаны по образцу первой
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(lableHight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
//
        
        // Setting constraints using anchors
        
        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.heightAnchor.constraint(equalToConstant: 88).isActive = true
            
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            previous = label
            
        }
        
    }
    


}

