//
//  FilesNetworkLayer.swift
//  PocketFile
//
//  Created by Ostap Tyvonovych on 09.06.2022.
//

import Foundation

class FilesNetworkLayer {
    private let session: URLSession
    private weak var delegate: FilesNetworkLayerDelegate?
    
    private struct EightBallAPI {
        static let scheme = "https"
        static let host = "sheets.googleapis.com"
        static let path = "/v4/spreadsheets/"
        static let spreadsheetID = "1W7fqtrUowW1ZtX88aQFPMdlUa5SJvoevFIPb7JQ8kG0"
        static let method = "/values:batchGet"
    }
    
    // MARK: - Public interface
    
    /// Method to trigger cloud file tree loading.
    ///
    /// - Note: After completing this method invokes delegate method `networkRequestDidCompleteSuccessfully(with:)` at non-main queue. If you do any UI-related work, make sure you're switched to the main queue.
    public func loadFileData() {
        let request = constructURLRequest()
        let dataTask = session.dataTask(with: request) { [weak self] data, urlResponse, error in
            if let error = error {
                print("ERROR: \((error as NSError).code == URLError.notConnectedToInternet.rawValue)")
            }
            guard let httpResponse = urlResponse as? HTTPURLResponse, (200...209).contains(httpResponse.statusCode) else {
                fatalError("Bad request from the server side. Contact the backend team")
            }
            guard let mimeType = httpResponse.mimeType else {
                fatalError("Couldn't retrieve MIME type")
            }
            guard mimeType == "application/json" else {
                fatalError("The data server sent doesn't contain JSON")
            }
            
            var sheetEntity: SheetEntity!
            do {
                sheetEntity = try JSONDecoder().decode(SheetEntity.self, from: data!)
            } catch {
                print("Error when decoding data received from server: \(error)")
            }
            
            self?.delegate?.networkRequestDidCompleteSuccessfully(with: sheetEntity)
            
        }
        dataTask.resume()
    }
    
    // MARK: - Private methods
    
    private func constructURLRequest() -> URLRequest {
        var components = URLComponents()
        components.scheme = EightBallAPI.scheme
        components.host = EightBallAPI.host
        components.path = EightBallAPI.path + EightBallAPI.spreadsheetID + EightBallAPI.method
        components.queryItems = constructQueryItems()
        
        if let url = components.url {
            return URLRequest(url: url)
        } else {
            fatalError("Couldn't create request URL. URLComponents' debug description: \(components.debugDescription)")
        }
    }
    
    private func constructQueryItems() -> [URLQueryItem] {
        // FIXME: FIXME: Develop the mechanism of the secure storing of the API key in the release package.
        let apiKey = ProcessInfo.processInfo.environment["googleSheetsAPIKey"]!
        
        let arguments: [String: String] = [
            "ranges": "Sheet1",
            "key": apiKey
        ]
        
        return arguments.map { (key: String, value: String) in
            return URLQueryItem(name: key, value: value)
        }
    }
    
    // MARK: - Initializers
    
    public init(delegate: FilesNetworkLayerDelegate) {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.waitsForConnectivity = true
        
        let session = URLSession(configuration: sessionConfiguration)
        self.session = session
        
        self.delegate = delegate
    }
}
