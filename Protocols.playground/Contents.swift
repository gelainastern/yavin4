import Cocoa

func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    func itemForRow(row: Int, column: Int) -> String
}

func printTable(dataSource: protocol<TabularDataSource, CustomStringConvertible>) {
    print("Table: \(dataSource.description)")
    let rowLabels = (0 ..< dataSource.numberOfRows).map { dataSource.labelForRow($0) }
    let columnLabels = (0 ..< dataSource.numberOfColumns).map {
        dataSource.labelForColumn($0)
    }
    let rowLabelWidths = rowLabels.map { $0.characters.count }
    guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
        return
    }
    
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    var columnWidths = [Int]()
    
    for (column, columnLabel) in columnLabels.enumerate() {
        let columnHeader = " \(columnLabel) |"
        columnWidths.append(columnHeader.characters.count)
        
        for row in 0 ..< dataSource.numberOfRows {
            let itemString = " \(dataSource.itemForRow(row, column: column)) |"
            columnWidths[column] = max(columnWidths[column], itemString.characters.count)
        }
        
        firstRow += padding(columnWidths[column] - columnHeader.characters.count) + "\(columnHeader)"
    }
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
        
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Book {
    let title: String
    let author: String
    let reviews: String
}



struct BookCollection: TabularDataSource, CustomStringConvertible {
    let name: String
    var books = [Book]()
    
    var description: String {
        return "(\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addBook(book: Book) {
        books.append(book)
    }
    
    var numberOfRows: Int {
        return books.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return books[row].title
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Author"
        case 1: return "Average Reviews"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> String {
        let book = books[row]
        switch column {
        case 0: return book.author
        case 1: return book.reviews
        default: fatalError("Invalid column!")
        }
    }
}

var bookCollection = BookCollection(name: "Amazon Books")
bookCollection.addBook(Book(title: "Joe's Book", author: "Joe", reviews: "Great"))
bookCollection.addBook(Book(title: "Karen's Book", author: "Karen", reviews: "So-So"))
bookCollection.addBook(Book(title: "Fred's Book", author: "Fred", reviews: "Poor"))

printTable(bookCollection)