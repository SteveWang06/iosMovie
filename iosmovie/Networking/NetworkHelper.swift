//
//  NetworkHelper.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/9.
//

// NetworkHelper.swift

import Foundation

struct NetworkHelper {
    
    // Tạo URLRequest chuẩn cho GET
    static func makeAuthorizedGETRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        addCommonHeaders(to: &request)
        return request
    }
    
    // URLRequest for POST, PUT, DELETE
    static func makeAuthorizedRequest(
        url: URL,
        method: String,
        jsonBody: [String: Any]? = nil
    ) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        addCommonHeaders(to: &request)
        
        if let jsonBody = jsonBody {
            do {
                let data = try JSONSerialization.data(withJSONObject: jsonBody)
                request.httpBody = data
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                print("Failed to serialize JSON body: \(error.localizedDescription)")
            }
        }
        
        return request
    }
    
   
    private static func addCommonHeaders(to request: inout URLRequest) {
        request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue(APIConstants.bearerToken, forHTTPHeaderField: "Authorization")
    }
}


// How to use
// GET request
//let getRequest = NetworkHelper.makeAuthorizedGETRequest(url: someURL)
//
//POST request with JSON body
//let postRequest = NetworkHelper.makeAuthorizedRequest(
//    url: someURL,
//    method: "POST",
//    jsonBody: [
//        "title": "Example",
//        "description": "Some description"
//    ]
//)
//
//PUT request no body
//let putRequest = NetworkHelper.makeAuthorizedRequest(
//    url: someURL,
//    method: "PUT"
//)
//
// DELETE request
//let deleteRequest = NetworkHelper.makeAuthorizedRequest(
//    url: someURL,
//    method: "DELETE"
//)

