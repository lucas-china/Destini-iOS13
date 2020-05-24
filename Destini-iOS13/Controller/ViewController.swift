//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var backgroundImageView: UIImageView!
    var stackView: UIStackView!
    var storyLabel: UILabel!
    var choice1Button: UIButton!
    var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension ViewController {
    
    private func setup() {
        setupBackgroundView()
        setupStackView()
        updateUI(with: storyBrain.getStory())
    }
    
    private func setupBackgroundView() {
        backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = UIImage(named: "background")
        view.insertSubview(backgroundImageView, at: 0)
    }
    
    private func setupStackView() {
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        setupStoryLabel()
        setupChoice1Button()
        setupChoice2Button()
    }
    
    private func setupStoryLabel() {
        storyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 250))
        storyLabel.text = "Story Label"
        storyLabel.textColor = .white
        storyLabel.font = UIFont.systemFont(ofSize: 28)
        storyLabel.numberOfLines = 0
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(storyLabel)
    }
    
    private func setupChoice1Button() {
        choice1Button = UIButton(type: .system)
        choice1Button.setBackgroundImage(UIImage(named: "choice1Background"), for: .normal)
        choice1Button.setTitle("Choice 1", for: .normal)
        choice1Button.setTitleColor(.white, for: .normal)
        choice1Button.titleLabel?.font = .systemFont(ofSize: 18)
        choice1Button.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        stackView.addArrangedSubview(choice1Button)
        
        NSLayoutConstraint.activate([
            choice1Button.heightAnchor.constraint(equalToConstant: 100.0)
        ])
    }
    
    private func setupChoice2Button() {
        choice2Button = UIButton(type: .system)
        choice2Button.setBackgroundImage(UIImage(named: "choice2Background"), for: .normal)
        choice2Button.setTitle("Choice 2", for: .normal)
        choice2Button.setTitleColor(.white, for: .normal)
        choice2Button.titleLabel?.font = .systemFont(ofSize: 18)
        choice2Button.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
        stackView.addArrangedSubview(choice2Button)
        
        NSLayoutConstraint.activate([
            choice2Button.heightAnchor.constraint(equalToConstant: 100.0)
        ])
    }
    
    private func updateUI(with story: Story) {
        storyLabel.text = story.title
        choice1Button.setTitle(story.choice1, for: .normal)
        choice2Button.setTitle(story.choice2, for: .normal)
    }
    
    @objc func choiceMade(sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.titleLabel?.text ?? "")
        updateUI(with: storyBrain.getStory())
    }
}

