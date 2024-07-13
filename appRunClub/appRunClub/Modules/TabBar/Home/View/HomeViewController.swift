//
//  HomeViewController.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 16.05.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var athleteLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var stopwatchView: UIView!
    @IBOutlet weak var clockImage: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timeControlButton: UIButton!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var viewModel: HomeViewModel = HomeViewModel()
    var timer: Timer?
    var startTime: Date?
    var isRunning: Bool = false
    var distance: Double = 0.0
        
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImages()
        configButton(button: timeControlButton, title: "Iniciar", color: UIColor(red: 27/255, green: 67/255, blue: 50/255, alpha: 1.0))
        configView(view: stopwatchView)
        configLabels(label: helloLabel, text: "Olá,", font: .systemFont(ofSize: 25, weight: .regular), color: .systemGray, alignment: .left)
        configLabels(label: athleteLabel, text: "Atleta!", font: .systemFont(ofSize: 35, weight: .semibold), color: UIColor(red: 27/255, green: 67/255, blue: 50/255, alpha: 1.0), alignment: .left)
        configLabels(label: instructionLabel, text: "Cronometre sua atividade 🏃🏻‍♂️‍➡️", font: .systemFont(ofSize: 20, weight: .medium), color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), alignment: .left)
        configLabels(label: timerLabel, text: "Timer", font: .systemFont(ofSize: 45, weight: .semibold), color: .black, alignment: .center)
        configLabels(label: distanceLabel, text: "Km", font: .systemFont(ofSize: 20, weight: .medium), color: .black, alignment: .center)
                
    }
    
    func configLabels(label: UILabel, text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment) {
        label.text = text
        label.font = font
        label.textColor = color
        label.textAlignment = alignment
    }
        
    func configImages(){
        logoImage.image = UIImage(named: "logo.home")
        clockImage.image = UIImage(systemName: "clock")
        clockImage.tintColor = UIColor(red: 27/255, green: 67/255, blue: 50/255, alpha: 1.0)
    }
    
    func configView(view: UIView) {
        view.backgroundColor = UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.45)
        view.layer.cornerRadius = 28
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0).cgColor
        view.layer.shadowOpacity = 0.5
    }
    
    func configButton(button: UIButton, title: String, color: UIColor) {
        button.setTitle( title, for: .normal)
        button.tintColor = color
    }
    
    func startTimer() {
        startTime = Date()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isRunning = true
        timeControlButton.setTitle("Parar", for: .normal)
        timeControlButton.tintColor =  UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
        timeControlButton.setTitle("Iniciar", for: .normal)
        timeControlButton.tintColor =  UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
    }
    
    @IBAction func tappedStartOrStopButton(_ sender: Any) {
        if isRunning {
            stopTimer()
        } else {
            startTimer()
        }
    }
    
    @objc func updateTimer() {
        guard let startTime = startTime else { return }
        let elapsedTime = Date().timeIntervalSince(startTime)
        timerLabel.text = formatTime(elapsedTime)
        timerLabel.font = .systemFont(ofSize: 45, weight: .semibold)
        updateDistance(elapsedTime: elapsedTime)
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) % 3600 / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    func updateDistance(elapsedTime: TimeInterval) {
        let speed = 10.0 / 3600
        distance = speed * elapsedTime
        distanceLabel.text = String(format: "%.2f km", distance)
        distanceLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
    }
    
}


