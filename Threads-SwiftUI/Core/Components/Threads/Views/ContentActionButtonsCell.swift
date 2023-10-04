//
//  ContentActionButtonsCell.swift
//  Threads-SwiftUI
//
//  Created by Gytis Ptašinskas on 2023-08-19.
//

import SwiftUI

struct ContentActionButtonsCell: View {
    @ObservedObject var viewModel: ContentActionButtonsCellModel
    @State private var showReplySheet = false
    
    init(thread: Thread) {
        self.viewModel = ContentActionButtonsCellModel(thread: thread)
    }
    
    private var didLike: Bool {
        return viewModel.thread.didLike ?? false
    }
    
    private var thread: Thread {
        return viewModel.thread
    }
    
    func handleLikeTapped() {
        Task {
            if didLike {
                try await viewModel.unlikeThread()
            } else {
               try await viewModel.likeThread()
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                Button {
                    handleLikeTapped()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .foregroundColor(didLike ? .red : .black)
                }
                
                Button {
                    showReplySheet.toggle()
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.rectanglepath")
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                }
                
            }
            
            if thread.likes > 0 {
                Text("\(thread.likes) likes")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top)
            }
        }
        .sheet(isPresented: $showReplySheet) {
            ThreadReplyView(thread: thread)
        }
    }
}

struct ContentActionButtonsCell_Previews: PreviewProvider {
    static var previews: some View {
        ContentActionButtonsCell(thread: dev.thread)
    }
}
