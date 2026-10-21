import ActivityKit
import SwiftUI
import WidgetKit

@main
struct CrabWidgetBundle: WidgetBundle {
    var body: some Widget {
        CrabLiveActivity()
    }
}

struct CrabLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CrabAttributes.self) { context in
            HStack(spacing: 14) {
                crab(context, box: CGSize(width: 110, height: 76), lock: true)
                VStack(alignment: .leading, spacing: 4) {
                    Text("钓鱼小螃蟹")
                        .font(.headline)
                    Text("在湖边等鱼上钩")
                        .font(.caption)
                }
                Spacer(minLength: 0)
            }
            .padding()
            .foregroundStyle(.white)
            .activityBackgroundTint(.black)
            .activitySystemActionForegroundColor(.white)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    VStack(spacing: 5) {
                        crab(context, box: CGSize(width: 150, height: 100), lock: false)
                        Text("在湖边等鱼上钩")
                            .font(.caption)
                    }
                }
            } compactLeading: {
                crab(context, box: CGSize(width: 44, height: 30), lock: false)
            } compactTrailing: {
                Text("钓鱼")
                    .font(.caption2)
            } minimal: {
                crab(context, box: CGSize(width: 28, height: 22), lock: false)
            }
            .keylineTint(Color(red: 0.87, green: 0.53, blue: 0.43))
        }
    }

    @ViewBuilder
    private func crab(
        _ context: ActivityViewContext<CrabAttributes>,
        box: CGSize,
        lock: Bool
    ) -> some View {
        if let state = CRAB_STATES_2[context.state.stateName] {
            CrabFrames2(st: state, since: context.state.since, box: box, lock: lock)
        }
    }
}
