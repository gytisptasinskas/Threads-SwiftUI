//
//  CircularProfileImageCell.swift
//  Threads-SwiftUI
//
//  Created by Gytis Ptašinskas on 2023-08-16.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimensions: CGFloat {
        switch self {
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 48
        case .large:
            return 64
        case .xLarge:
            return 80
        }
    }
}

struct CircularProfileImageCell: View {
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimensions, height: size.dimensions)
                .clipShape(Circle())
            
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimensions, height: size.dimensions)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

struct CircularProfileImageCell_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageCell(user: dev.user, size: .medium)
    }
}
