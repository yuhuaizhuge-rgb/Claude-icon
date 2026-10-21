import ActivityKit
import SwiftUI

struct ContentView: View {
    @State private var isActive = !Activity<CrabAttributes>.activities.isEmpty
    @State private var message: String?

    var body: some View {
        VStack(spacing: 24) {
            Text("🦀")
                .font(.system(size: 72))
            Text("钓鱼小螃蟹")
                .font(.title.bold())
            Text("点一下，让它出现在灵动岛和锁屏。")
                .foregroundStyle(.secondary)

            Button(isActive ? "收回小螃蟹" : "让螃蟹上岛") {
                if isActive {
                    Task { await stopCrab() }
                } else {
                    startCrab()
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)

            if let message {
                Text(message)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(28)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .preferredColorScheme(.dark)
        .onAppear { isActive = !Activity<CrabAttributes>.activities.isEmpty }
    }

    private func startCrab() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            message = "请在 iPhone 设置中允许此 App 使用实时活动。"
            return
        }
        guard Activity<CrabAttributes>.activities.isEmpty else {
            isActive = true
            message = "小螃蟹已经在岛上了。"
            return
        }

        // Round to a whole second so the timer glyphs begin at frame zero.
        let since = Date(timeIntervalSince1970: floor(Date().timeIntervalSince1970))
        let state = CrabAttributes.ContentState(stateName: "在钓鱼", since: since)
        do {
            _ = try Activity<CrabAttributes>.request(
                attributes: CrabAttributes(),
                content: ActivityContent(state: state, staleDate: nil),
                pushType: nil
            )
            isActive = true
            message = "小螃蟹已出发。"
        } catch {
            isActive = false
            message = "启动失败：\(error.localizedDescription)"
        }
    }

    private func stopCrab() async {
        for activity in Activity<CrabAttributes>.activities {
            await activity.end(nil, dismissalPolicy: .immediate)
        }
        isActive = false
        message = "小螃蟹已收回。"
    }
}
