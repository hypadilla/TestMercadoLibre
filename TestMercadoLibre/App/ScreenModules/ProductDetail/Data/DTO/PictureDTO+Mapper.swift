//
//  PictureDTO+Mapper.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

/// Extension to convert PictureDTO to Picture domain model.
extension PictureDTO {
    /// Converts the PictureDTO object to a Picture domain model object.
    /// - Returns: A Picture object with the secure URL.
    func toDomain() -> Picture {
        return Picture(secure_url: self.secure_url)
    }
}
