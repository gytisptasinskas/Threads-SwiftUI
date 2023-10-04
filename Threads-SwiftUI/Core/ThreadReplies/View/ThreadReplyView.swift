//
//  ThreadReplyView.swift
//  Threads-SwiftUI
//
//  Created by Gytis Ptašinskas on 2023-08-20.
//

import SwiftUI

struct ThreadReplyView: View {
    let thread: Thread
    @State private var replyText = ""
    @Environment(\.dismiss) var dismiss
    @State private var threadViewHeight: CGFloat = 24
    private var currentUser: User? {
        return UserService.shared.currentUser
    }
    
    func setThreadViewHeight() {
        let imageDimension: CGFloat = ProfileImageSize.small.dimensions
        let padding: CGFloat = 16
        let width = UIScreen.main.bounds.width - imageDimension - padding
        let font = UIFont.systemFont(ofSize: 12)
        
        let captionSize = thread.caption.heightWithContrainedWidth(width, font: font)
        
        threadViewHeight = captionSize + imageDimension - 16
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .top) {
                        VStack {
                            CircularProfileImageCell(user: thread.user, size: .small)
                            
                            Rectangle()
                                .frame(width: 2, height: threadViewHeight)
                                .foregroundColor(Color(.systemGray4))
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(thread.user?.username ?? "")
                                .fontWeight(.semibold)
                            
                            Text(thread.caption)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                        
                        Spacer()
                    }
                    
                    HStack(alignment: .top) {
                        CircularProfileImageCell(user: currentUser, size: .small)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(currentUser?.username ?? "")
                            
                            TextField("Add your reply...", text: $replyText, axis: .vertical)
                                .multilineTextAlignment(.leading)
                        }
                        .font(.footnote)
                    }
                }
                .padding()
                
                Spacer()
            }
//            .onAppear { setThreadViewHeight() }
            .navigationTitle("Reply")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Post") {
                        Task {
                            dismiss()
                        }
                    }
                    .opacity(replyText.isEmpty ? 0.5 : 1.0)
                    .disabled(replyText.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct ThreadReplyView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadReplyView(thread: dev.thread)
    }
}
