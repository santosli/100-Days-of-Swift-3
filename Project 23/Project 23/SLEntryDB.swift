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

    private let entrys = Table("entrys")
    private let id = Expression<Int64>("id")
    private let text = Expression<String>("text")
    private let imagePath = Expression<String>("imagePath")
    private let location = Expression<String>("location")
    private let date = Expression<Date>("date")
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/SLEntry.sqlite3")
            print("bbb: \(path)")
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
                table.column(imagePath)
                table.column(location)
                table.column(date)
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addEntry(ctext: String, cimagePath: String, clocation: String, cdate: Date) -> SLEntry! {
        do {
            let insert = entrys.insert(text <- ctext, imagePath <- cimagePath, location <- clocation, date <- cdate)
            let id = try db?.run(insert)
            
            return getEntry(by: id!)
        } catch {
            print("Insert error")
            return nil
        }
    }
    
    func getEntry(by Id: Int64) -> SLEntry {
        var entrys = [SLEntry]()
        
        do {
            for entry in try db!.prepare(self.entrys.select(*).filter(id == Id)){
                entrys.append(SLEntry(
                    id: entry[id],
                    text: entry[text],
                    imagePath: entry[imagePath],
                    location: entry[location],
                    date: entry[date]))
            }
        } catch {
            print("Select error")
        }
        
        return entrys[0]
    }
    
    func getEntrys() -> [SLEntry] {
        var entrys = [SLEntry]()
        
        do {
            for entry in try db!.prepare(self.entrys.select(*).order(id.desc)){
                entrys.append(SLEntry(
                    id: entry[id],
                    text: entry[text],
                    imagePath: entry[imagePath],
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
                imagePath <- newEntry.imagePath,
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
