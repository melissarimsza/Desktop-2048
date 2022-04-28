//
//  Grid.swift
//  Desktop2048
//
//  Created by Melissa Rimsza on 11/22/21.
//

import Foundation
import Cocoa
import SpriteKit

class Grid {
    
    var grid = [[Int]]()
    
    //creating the 2D array
    init() {
        grid = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
        
        //grid[0][2] = 2
        //grid[1][3] = 2

    }
    
    //simple print to console for debugging
    func printGrid() {
        for array in grid {
            for value in array {
                print(value, terminator: " ")
            }
            print(" ")
        }
    }
    
    //up arrow
    func upArrow() {
        for _ in stride(from: 3, through: 0, by: -1) {
            for j in stride(from: 0, through: 3, by: 1) {
                for k in stride(from: 1, through: 3, by: 1) {
                    //checks if box below is empty
                    if grid[k - 1][j] == 0 {
                        grid[k - 1][j] = grid[k][j]
                        grid[k][j] = 0
                    }
                    //checks if box is the same
                    if grid[k][j] == grid[k - 1][j] {
                        grid[k - 1][j] = grid[k][j] * 2
                        grid[k][j] = 0
                    }
                }
            }
        }
    }
    
    //down arrow
    func downArrow() {
        for _ in stride(from: 3, through: 0, by: -1) {
            for j in stride(from: 3, through: 0, by: -1) {
                for k in stride(from: 2, through: 0, by: -1) {
                    //checks if box below is empty
                    if grid[k + 1][j] == 0 {
                        grid[k + 1][j] = grid[k][j]
                        grid[k][j] = 0
                    }
                    //checks if box is the same
                    if grid[k][j] == grid[k + 1][j] {
                        grid[k + 1][j] = grid[k][j] * 2
                        grid[k][j] = 0
                    }
                }
            }
        }
    }
    
    //right arrow
    func rightArrow() {
        for i in stride(from: 3, through: 0, by: -1) {
            for _ in stride(from: 3, through: 0, by: -1) {
                for k in stride(from: 2, through: 0, by: -1) {
                    //checks if box to the right is empty
                    if grid[i][k+1] == 0 {
                        grid[i][k+1] = grid[i][k]
                        grid[i][k] = 0
                    }
                    //check if box is the same
                    if grid[i][k+1] == grid[i][k] {
                        grid[i][k+1] = grid[i][k] * 2
                        grid[i][k] = 0
                    }
                }
            }
        }
    }

    
    //left arrow
    func leftArrow() {
        for i in stride(from: 0, through: 3, by: 1) {
            for _ in stride(from: 3, through: 0, by: -1) {
                for k in stride(from: 1, through: 3, by: 1) {
                    //checks if box to the left is empty
                    if grid[i][k-1] == 0 {
                        grid[i][k-1] = grid[i][k]
                        grid[i][k] = 0
                    }
                    //check if box is the same
                    if grid[i][k-1] == grid[i][k] {
                        grid[i][k-1] = grid[i][k] * 2
                        grid[i][k] = 0
                    }
                }
            }
        }
    }
    
    //check if the player has won
    func checkWin() -> Bool {
        for i in 0...3 {
            for j in 0...3 {
                if (grid[i][j] == 2048) {
                    return true
                }
            }
        }
        return false
    }
    
    //check if the player has lost
    func checkLoss() -> Bool {
        
        //check if any spaced are empty
        for i in 0...3 {
            for j in 0...3 {
                if (grid[i][j] == 0) {
                    return false
                }
            }
        }
        
        //check if there are moves in the middle section
        for i in 1...2 {
            for j in 1...2 {
                if (grid[i][j] == 0) {
                    return false
                }
                else if (grid[i][j] == grid[i + 1][j]) {
                    return false
                }
                else if (grid[i][j] == grid[i-1][j]) {
                    return false
                }
                else if (grid[i][j] == grid[i][j+1]) {
                    return false
                }
                else if (grid[i][j] == grid[i][j-1]) {
                    return false
                }
            }
        }
        
        //checking if there are moves from the corners
        if ((grid[0][0] == grid[0][1]) || (grid[0][0] == grid[1][0])) {
            return false
        }
        if ((grid[0][3] == grid[0][2]) || (grid[0][3] == grid[1][3])) {
            return false
        }
        if ((grid[3][0] == grid[2][0]) || (grid[3][0] == grid[3][1])) {
            return false
        }
        if ((grid[3][3] == grid[3][2]) || (grid[3][3] == grid[2][3])) {
            return false
        }
        
        //check if there are moves on the sides
        if (grid[0][1] == grid[0][2]) {
            return false
        }
        if (grid[1][0] == grid[2][0]) {
            return false
        }
        if (grid[3][1] == grid[3][2]) {
            return false
        }
        if (grid[1][3] == grid[2][3]) {
            return false
        }
        
        //if there are no moves return true 
        return true
    }
    
    //general random number generator
    //not currently being used for anything
    func generateRandom() {
        for i in 0...3 {
            for j in 0...3 {
                if grid[i][j] == 0 {
                    let randomNum = Int.random(in: 0...4)
                    if randomNum == 0 {
                        //print("random num generated at", i, j)
                        grid[i][j] = 2
                        return
                    }
                }
            }
        }
    }
    
    //generating new tile if they press up arrow
    func randomUp() {
        for i in stride(from: 3, through: 0, by: -1) {
            for j in stride(from: 0, through: 3, by: 1) {
                if grid[i][j] == 0 {
                    grid[i][j] = 2
                    return
                }
            }
        }
    }
    
    //generating new tile if they press the down arrow
    func randomDown() {
        for i in stride(from: 3, through: 0, by: -1) {
            for j in stride(from: 3, through: 0, by: -1) {
                if grid[i][j] == 0 {
                    grid[i][j] = 2
                    return
                }
            }
        }
    }
    
    //generating new tile if they press the right arrow
    func randomRight() {
        for i in stride(from: 3, through: 0, by: -1) {
            for j in stride(from: 3, through: 0, by: -1) {
                if grid[i][j] == 0 {
                    grid[i][j] = 2
                    return
                }
            }
        }
    }
    
    //generating new tile if they press the left arrow
    func randomLeft() {
        for i in stride(from: 0, through: 3, by: 1) {
            for j in stride(from: 3, through: 0, by: -1) {
                if grid[i][j] == 0 {
                    grid[i][j] = 2
                    return
                }
            }
        }
    }
    
    //gets the value from a specific point in the grid
    func getValue(x: Int, y: Int) -> Int{
        return grid[x][y]
    }
    
    //gets the score value
    func getScore() -> Int {
        var score = 0
        for i in stride(from: 3, through: 0, by: -1) {
            for j in stride(from: 0, through: 3, by: 1) {
                score = score + grid[i][j]
            }
        }
        return score
    }
    
    func reset() {
        for i in 0...3 {
            for j in 0...3 {
                grid[i][j] = 0
            }
        }
        
        grid[0][2] = 2
        grid[1][3] = 2
    }
    
}
