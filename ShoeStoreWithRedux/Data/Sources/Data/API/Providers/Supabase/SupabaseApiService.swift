//
//  SupabaseApiService.swift
//  Data
//
//  Created by Max Ward on 05/07/2025.
//

import Foundation
import Supabase

public class SupabaseApiService: ProductApiService {
    
    private let supabaseUrl = URL(string: "https://bjzcxtottwohpmsrxmqt.supabase.co")!
    private let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJqemN4dG90dHdvaHBtc3J4bXF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE2OTAzMDksImV4cCI6MjA2NzI2NjMwOX0.L_4ohPhBZyPPXYa0xzaEDLSJMOTvZ9NG6Z78SXc6jjI"

    private let client: SupabaseClient
    
    public init() {
        client = SupabaseClient(supabaseURL: supabaseUrl, supabaseKey: supabaseKey)
    }
    
    public func getAll() async throws -> [ProductScheme] {
        do {
            let products: [ProductScheme] = try await client
                .from("products")
                .select()
                .execute()
                .value

            return products
        } catch {
            print("Error obteniendo productos: \(error)")
            throw error
        }
    }
}
