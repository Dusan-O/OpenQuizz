//
//  Game.swift
//  OpenQuizz
//
//  Created by Dusan Orescanin on 36/01/2021.
//

import Foundation

final class Game {

    // MARK: - Properties

    var score = 0
    var state: State = .ongoing

    enum State {
        case ongoing, over
    }

    private var questions = [Question]()
    private var currentIndex = 0

    var currentQuestion: Question {
        return questions[currentIndex]
    }

    // MARK: - Game

    func refresh() {
        score = 0
        currentIndex = 0
        state = .over

        QuestionManager.shared.get { [weak self] questions in
            guard let self = self else { return }
            self.questions = questions
            self.state = .ongoing
            let name = Notification.Name(rawValue: "QuestionsLoaded")
            let notification = Notification(name: name)
            NotificationCenter.default.post(notification)
        }
    }

    func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
        }
        goToNextQuestion()
    }

    // MARK: - Privates

    private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finishGame()
        }
    }

    private func finishGame() {
        state = .over
    }
}
