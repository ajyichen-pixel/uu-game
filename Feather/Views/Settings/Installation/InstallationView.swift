//
//  InstallationView.swift
//  Feather
//
//  Created by samara on 3.06.2025.
//

import SwiftUI
import NimbleViews

// MARK: - View
struct InstallationView: View {
	var body: some View {
		NBList(.localized("Installation")) {
			Section {
				Text("UU遊戲不使用外部伺服器或共用憑證。請使用 IDevice 配對方式，或在簽名後分享 IPA 到 AltStore 安裝。")
					.font(.subheadline)
					.foregroundStyle(.secondary)
				TunnelView()
			} footer: {
				Text("IDevice 會使用你自己的配對檔與裝置連線；它不會上傳你的簽章憑證。")
			}
		}
	}
}

