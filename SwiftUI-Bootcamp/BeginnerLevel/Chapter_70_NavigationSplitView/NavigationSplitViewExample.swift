//
//  NavigationSplitViewExample.swift
//  SwiftUI-Bootcamp
//
//  Created by Govind on 29/09/24.
//

import SwiftUI

struct Email: Identifiable, Hashable {
    let id = UUID()
    let subject: String
    let body: String
}

struct Folder: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let emails: [Email]
}

struct NavigationSplitViewExample: View {
    private let folders: [Folder] = [
        Folder(name: "Inbox", emails: [
            Email(subject: "Meeting Reminder", body: "Don't forget about the meeting tomorrow at 10 AM."),
            Email(subject: "Lunch Plans", body: "Let's grab lunch at 1 PM.")
        ]),
        Folder(name: "Sent", emails: [
            Email(subject: "Project Update", body: "Here is the latest update on the project."),
            Email(subject: "Follow-up", body: "Just wanted to follow up on our previous discussion.")
        ]),
        Folder(name: "Drafts", emails: [
            Email(subject: "Holiday Plans", body: "Planning to visit the mountains this holiday season."),
        ])
    ]

    @State private var selectedFolder: Folder? = nil
    @State private var selectedEmail: Email? = nil
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    @State private var searchFolderText: String = ""

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            // Sidebar view
            List(folders, selection: $selectedFolder) { folder in
                NavigationLink(folder.name, value: folder)
            }
            .searchable(text: $searchFolderText)
            .navigationTitle("Groups")
        } content: {
            // Content view
            Group {
                if let selectedFolder = selectedFolder {
                    List(selectedFolder.emails, selection: $selectedEmail) { email in
                        NavigationLink(email.subject, value: email)
                    }
                } else {
                    ContentUnavailableView("Select a folder", systemImage: "folder")
                }
            } .navigationTitle("Email")
        } detail: {
            // Detail view
            Group {
                if let selectedEmail = selectedEmail {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(selectedEmail.subject)
                            .font(.title)
                        Text(selectedEmail.body)
                            .font(.body)
                    }
                    .padding()
                    .navigationTitle(selectedEmail.subject)
                } else {
                    ContentUnavailableView("Select an email", systemImage: "tray")
                }
            }
        }
        .onChange(of: selectedFolder, { oldValue, newValue in
            columnVisibility = .doubleColumn
        })
//        .onChange(of: selectedEmail, { oldValue, newValue in
//            columnVisibility = .detailOnly
//        })
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    NavigationSplitViewExample()
}
