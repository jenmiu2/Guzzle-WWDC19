//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

public var mapToEvaluate = Map(col: 5, row: 5)

public class BoardView: UIView {
    let rows: Int
    let columns: Int
    let mapToShow: Map
    
    public init(rows: Int, columns: Int, frame: CGRect = .zero) {
        self.rows = rows
        self.columns = columns
        self.mapToShow = mapToEvaluate
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData(_ rect: CGRect, mapa: Map) {
        let rowHeight: CGFloat = rect.height / CGFloat(rows)
        let columnWidth: CGFloat = rect.width / CGFloat(columns)
        
        
        UIColor(red: 0/255, green: 66/255, blue: 0/255, alpha: 1).setFill()
        for row in 0..<rows {
            for column in 0..<columns {
                let squareRect = CGRect(
                    x: columnWidth*CGFloat(column)+2,
                    y: rowHeight*CGFloat(row)+2,
                    width: columnWidth-4, height: rowHeight-4)
                let squarePath = UIBezierPath(rect: squareRect)
                squarePath.fill()
            }
        }
        
        UIColor(red: 0/255, green: 66/255, blue: 125/255, alpha: 1).setFill()
        for row in 0..<rows {
            for column in 0..<columns {
                if mapa[row, column] == .food {
                    let circleRect = CGRect(
                        x: columnWidth*CGFloat(column)+2,
                        y: rowHeight*CGFloat(row)+2,
                        width: columnWidth-4, height: rowHeight-4)
                    let circlePath = UIBezierPath(ovalIn: circleRect)
                    circlePath.fill()
                }
            }
        }
        
        self.setNeedsDisplay()
    }
    
    func didLoad() {
        isOpaque = false
    }
    
    override public func draw(_ rect: CGRect) {
        let rowHeight: CGFloat = rect.height / CGFloat(rows)
        let columnWidth: CGFloat = rect.width / CGFloat(columns)
        
        
        UIColor(red: 0/255, green: 66/255, blue: 0/255, alpha: 1).setFill()
        for row in 0..<rows {
            for column in 0..<columns {
                let squareRect = CGRect(
                    x: columnWidth*CGFloat(column)+2,
                    y: rowHeight*CGFloat(row)+2,
                    width: columnWidth-4, height: rowHeight-4)
                let squarePath = UIBezierPath(rect: squareRect)
                squarePath.fill()
            }
        }
        
        UIColor(red: 0/255, green: 66/255, blue: 125/255, alpha: 1).setFill()
        for row in 0..<rows {
            for column in 0..<columns {
                if mapToShow[row, column] == .food {
                    let circleRect = CGRect(
                        x: columnWidth*CGFloat(column)+2,
                        y: rowHeight*CGFloat(row)+2,
                        width: columnWidth-4, height: rowHeight-4)
                    let circlePath = UIBezierPath(ovalIn: circleRect)
                    circlePath.fill()
                }
            }
        }
    }
}

class MyViewController : UIViewController {
    var map = mapToEvaluate
    
    /*This function is responsible for performing the genetic algorithm: generate population,
     evaluate each individuals of the population, select the best ones, cross each individuals
     of the population and mutate
     */
    override func loadView() {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0/255, green: 51/255, blue: 0/255, alpha: 1)
        let board = BoardView(rows: mapToEvaluate.row, columns: mapToEvaluate.col, frame: view.bounds)
        board.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(board)
        
        let numOfGeneration = 10
        var population = generatePopulation(numberOfElement: 4,  maxDepth: 2)
        
        for _ in 0..<numOfGeneration {
            //Evaluate each individual of the population
            for individual in population {
                map = evaluation(individual: individual,mapToEvaluate: mapToEvaluate)
                board.reloadData(<#T##rect: CGRect##CGRect#>, mapa: map)
            }
            
            //Select the best population
            population = selectionByTruncation(population: &population)
            //Cross individuals of the population
            cross(population: population)
            //Mutate some individuals of the population
            mutate(population: population)
        }
        
        self.view = view
    }
}
/* This function generate a random population for that insert a random tree on an array
 - Warning: numberOfElement and maxDepth more than 1
 
 - Usage:
 generatePopulation(numberOfElement: 2, maxDepth: 5)
 
 - Parameter:
 - numberOfElement: The size of the array
 - maxDepth: The depth of each tree
 
 - Returns: Array of Tree
 */

public func generatePopulation(numberOfElement: Int, maxDepth: Int) -> [Tree] {
    return (0..<numberOfElement).map { _ in Tree(root: TreeNode(maxDepth: maxDepth)) }
}

PlaygroundPage.current.liveView = MyViewController()
