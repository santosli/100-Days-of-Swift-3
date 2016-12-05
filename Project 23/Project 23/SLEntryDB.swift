//
//  SLEntryDB.swift
//  Project 23
//
//  Created by Santos on 05/12/2016.
//  Copyright © 2016 santos. All rights reserved.
//

import SQLite

class SLEntryDB {
    static let sharedInstance = SLEntryDB()
    private let db : Connection?
    
//    let id : Int64!
//    var text : String!
//    var image : String!
//    var location : String!
//    var date : Date!

    private let entrys = Table("entrys")
    private let id = Expression<Int64>("id")
    private let text = Expression<String>("text")
    private let image = Expression<String>("image")
    private let location = Expression<String>("location")
    private let date = Expression<Date>("date")
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/SLEntry.sqlite3")
        } catch {
            db = nil
            print ("Unable to open database")
        }
        
        createTable()
    }
    
    func createTable() {
        do {
            try db!.run(entrys.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(text)
                table.column(image)
                table.column(location)
                table.column(date)
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addEntry(ctext: String, cimage: String, clocation: String, cdate: Date) -> Int64? {
        do {
            let insert = entrys.insert(text <- ctext, image <- cimage, location <- clocation, date <- cdate)
            let id = try db?.run(insert)
            
            return id!
        } catch {
            print("Insert error")
            return -1
        }
    }
    
    func getEntrys() -> [SLEntry] {
        var entrys = [SLEntry]()
        
        do {
            for entry in try db!.prepare(self.entrys.select(*).order(id.desc)){
                entrys.append(SLEntry(
                    id: entry[id],
                    text: entry[text],
                    image: entry[image],
                    location: entry[location],
                    date: entry[date]))
            }
        } catch {
            print("Select error")
        }
        
        return entrys
    }
    
    func updateEntry(newEntry: SLEntry) -> Bool {
        let entry = entrys.filter(id == newEntry.id)
        do {
            let update = entry.update([
                text <- newEntry.text,
                image <- newEntry.image,
                location <- newEntry.location,
                date <- newEntry.date
                ])
            if try (db?.run(update))! > 0 {
                return true
            }
        } catch {
            print("Update error: \(error)")
        }
        
        return false
    }
}
