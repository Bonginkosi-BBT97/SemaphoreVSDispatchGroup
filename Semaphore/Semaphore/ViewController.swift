//
//  ViewController.swift
//  Semaphore
//
//  Created by Bonginkosi Tshabalala on 2023/03/21.
//

import UIKit

class ViewController: UIViewController {
    var movies: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        let semaphore = DispatchSemaphore(value: 1)
        let queue = DispatchQueue.global()

        queue.async {
            semaphore.wait() //0
            self.movies.append(self.downloadMovie("Avengers"))
            semaphore.signal() // 1
        }

        queue.async {
            semaphore.wait() // 0
            self.saveMovie()
            self.movies.remove(at: 0)
            semaphore.signal() // 1
        }




//        let group = DispatchGroup()
//        let queue = DispatchQueue.global()
//
//        queue.async(group: group) {
//            let movieName = self.downloadMovie("Avengers")
//            self.movies.append(movieName)
//        }
//        queue.async(group: group) {
//            self.saveMovie()
//            self.movies.remove(at: 0)
//        }
//
//        group.notify(queue: .main) {
//            print("All downloads have been completed")
//        }

        print("I aint wwaiting for no computer")
    }
    func downloadMovie(_ name: String) -> String {
        sleep(4)
        print("\(name) has been downloaded")
        return name
    }

    func saveMovie() {
        sleep(2)
        print("Movies have been saved")

    }
}

