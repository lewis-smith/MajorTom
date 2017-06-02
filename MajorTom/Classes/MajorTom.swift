//
//  MajorTom.swift
//  
//
//  Created by Lewis Smith on 26/05/2017.
//
//

import Foundation

public extension UserDefaults {
    
    func registerDefaultsWithURL(url: URL) {
        self.registerDefaultsWithURL(url: url, success: nil, failure: nil)
    }
    
    func registerDefaultsWithURL(url: URL, success: ((URLResponse?, Dictionary<String, Any>) -> Void)?,
                                 failure: ((URLResponse?) -> Void)?) {
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let downloadTask = session.downloadTask(with: url) { (url: URL?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                guard failure != nil && response != nil else {
                    return
                }
                failure!(response!)
                return
            }
            
            guard response != nil && response?.url != nil else {
                guard failure != nil else {
                    return
                }
                failure!(response!)
                return
            }
            
            let dict = NSDictionary(contentsOf: (response?.url)!)
            
            if (dict == nil) {
                failure!(response)
                return
            }
            self.setValuesForKeys(dict as! [String : Any])
            self.synchronize()
            
            guard success != nil else {
                return
            }
            success!(response, dict as! Dictionary<String, Any>)
        }
        
        downloadTask.resume()
    }

}
