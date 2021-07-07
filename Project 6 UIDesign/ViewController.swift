//
//  ViewController.swift
//  Project 6 UIDesign
//
//  Created by Igor Polousov on 07.07.2021.
//

import UIKit

class ViewController: UIViewController {
    // Сделал outlet для кнопок
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    // Создал необходимые переменные
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var attemptsCounter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // Наполнил массив названиями стран
        countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        // Сделал границу и цвет краницы для картинки флага чтобы небыло слития с фоном
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        // Функция askQuestion()
        askQuestion()
        
        // Кнопка в navigation bar справа
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(showScore))
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        // Поскольку для выбора флагов для размещения на кнопках выбраны названия стран с индексами от 0 до 2, делаем генерацию случайного числа от 0 до 2
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        // Покажет название одного из выбранного случайных образом флагов в заголовке таблицы
        title = "\(countries[correctAnswer].uppercased()) Score = \(score)"
        print(attemptsCounter)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        attemptsCounter += 1
        
        let ac = UIAlertController(title: title , message: "Your score is \(score)", preferredStyle: .alert)
        
        if attemptsCounter < 10 {
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        } else {
            ac.title = "Game over"
            ac.message = "Number of attempts is maximum(10). Your score is \(score)"
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            attemptsCounter = 0
            score = 0
            
        }
        present(ac, animated: true)
    }
   
    // Функция которая показывает alert controller
    @objc func showScore() {
        
        // Задаём контроллёр alert controller - ac
        let ac = UIAlertController(title: "Your current score:", message: "\(score)", preferredStyle: .alert)
        
        // Задаем что будет на кнопке alert controller - ac
        ac.addAction(UIAlertAction(title: "Done", style: .default))
        
        // Указываем что надо показать ac
        present(ac, animated: true)
    }
    


}

