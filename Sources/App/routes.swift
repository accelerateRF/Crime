import Fluent
import Vapor

func routes(_ app: Application) throws {
    
//    app.get("filereport") { req -> CrimeReportResponse in
//        let data = try req.content.decode(CrimeReport.self)
//        return CrimeReportResponse(request: data)
//    }

    app.post("crimereport", "add") { req -> EventLoopFuture<Crime> in
        let crime = try req.content.decode(Crime.self)
        return crime.save(on: req.db).map { crime }
    }
   
    app.get("crimereport", "query") { req -> EventLoopFuture<[Crime]> in
        
        guard let searchTerm =
                req.query[String.self, at: "caseid"] else {
            throw Abort(.badRequest) }
        
        return Crime.query(on: req.db)
              .filter(\.$caseId == searchTerm)
              .all()
    }

    app.get("hello", "you") { req -> String in
        return "How are you?"
    }

}

struct CrimeReport: Content {
    let dateOfCrime: Date
    let user: String
    let name: String
    let phone: String
    let latitude: String
    let longitude: String
    let mediaUrl: String
    let message: String
}

struct CrimeReportResponse: Content {
    let request: CrimeReport
}
