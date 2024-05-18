const battery = await Service.import("battery")
const audio = await Service.import("audio")
const systemtray = await Service.import("systemtray")
const network = await Service.import('network')
const hyprland = await Service.import("hyprland")

const date = Variable("", {
    poll: [1000, 'date "+%H:%M:%S  %b %e"'],
})

const Clock = () => {
    return Widget.Label({
        class_name: "clock",
        label: date.bind()
    })
}

const batteryPrecentige = Variable("", {
    poll: [1000, () => {return `${battery.percent}%`}]
})

const Battery = () => {
    const icon = battery.bind("percent").as(p =>
        `battery-level-${Math.floor(p / 10) * 10}-symbolic`)

    return Widget.Box({
        class_name: "battery",
        visible: battery.bind("available"),
        spacing: 4,
        children: [
            Widget.Button({
                child: Widget.Icon({ icon }),
            }),
            Widget.Label({
                label: batteryPrecentige.bind()
            })
        ],
    })
}

const Volume  = () => {
    const icons = {
        101: "overamplified",
        67: "high",
        34: "medium",
        1: "low",
        0: "muted",
    }

    const getIcon = () => {
        const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
        threshold => threshold <= audio.speaker.volume * 100)

        return `audio-volume-${icons[icon]}-symbolic`
    }

    const volumeIcon = Widget.Button({
        child: Widget.Icon({
            icon: Utils.watch(getIcon(), audio.speaker, getIcon),
        }),
        on_clicked: () => audio.speaker.is_muted = !audio.speaker.is_muted,
    })

    const getVolume = () => {
        return `${Math.floor(audio.speaker.volume * 100)}%`
    }

    let volumeLabel = Widget.Label({
        label: Utils.watch(getVolume(), audio.speaker, getVolume)
    });

    return Widget.Box({
        class_name: "volume",
        spacing: 4,
        children: [volumeIcon, volumeLabel],
    })
}

const SysTray = () => {
    const items = systemtray.bind("items")
        .as(items => items.map(item => Widget.Button({
            class_name: "sys_tray_button",
            child: Widget.Icon({ icon: item.bind("icon") }),
            on_primary_click: (_, event) => item.activate(event),
            on_secondary_click: (_, event) => item.openMenu(event),
            tooltip_markup: item.bind("tooltip_markup"),
        })))

    return Widget.Box({
        class_name: "tray",
        children: items,
    })
}

const WifiIndicator = () => Widget.Box({
    children: [
        Widget.Button({
            child: Widget.Icon({
                icon: network.wifi.bind('icon_name'),
            }),
            tooltip_markup: network.wifi.bind('ssid').as(ssid => ssid || 'Unknown'),
            on_clicked: () => {
                return Utils.exec("iwgtk")
            }
        })
    ],
})

const WiredIndicator = () => Widget.Button({
    child: Widget.Icon({
        icon: network.wired.bind('icon_name'),
    })
})

const NetworkIndicator = () => Widget.Stack({
    class_name: "network",
    children: {
        wifi: WifiIndicator(),
        wired: WiredIndicator(),
    },
    shown: network.bind('primary').as(p => p || 'wifi'),
})

const Workspces = () => {
    const activeId = hyprland.active.workspace.bind("id")

    const workspaces = hyprland.bind("workspaces")
        .as(ws => ws.map(({ id }) => Widget.Button({
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
            child: Widget.Label(`${id}`),
            class_name: activeId.as(i => `${i === id ? "focused ws_button" : "ws_button"}`),
        })))

    return Widget.Box({
        class_name: "workspaces",
        children: workspaces,
    })
}

const Center = () => {
    return Widget.Box({
        hpack: "center",
        class_name: "center",
        spacing: 10,
        children: [
            Clock()
        ]
    })
}

const Left = () => {
    return Widget.Box({
        hpack: "start",
        class_name: "star",
        spacing: 10,
        children: [
            Workspces(),
        ]
    })
}

const Right = () => {
    return Widget.Box({
        hpack: "end",
        class_name: "end",
        spacing: 10,
        children: [
            SysTray(),
            NetworkIndicator(),
            Volume(),
            Battery()
        ]
    })
}

export const Bar = (monitor = 0) => {
    return Widget.Window({
        name: `bar - ${monitor}`,
        monitor,
        class_name: 'bar',
        anchor: ['top', 'left', 'right'],   
        exclusivity: "exclusive",
        child: Widget.CenterBox({
            css: "padding: 1px",
            start_widget: Left(),
            center_widget: Center(),
            end_widget: Right(),
        })
    })
}
