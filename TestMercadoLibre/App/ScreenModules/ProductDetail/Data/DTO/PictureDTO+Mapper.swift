//
//  PictureDTO+Mapper.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

extension PictureDTO {
    func toDomain() -> Picture {
        return Picture(secure_url: self.secure_url)
    }
}
