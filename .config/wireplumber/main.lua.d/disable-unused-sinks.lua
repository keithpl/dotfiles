local disable_spdif = {
    matches = {
        {
            {
                "node.name",
                "equals",
                "alsa_output.usb-Generic_USB_Audio-00.HiFi__hw_Audio_3__sink"
            }
        }
    },
    apply_properties = {
        ["node.disabled"] = true
    }
}

local disable_fpaudio = {
    matches = {
        {
            {
                "node.name",
                "equals",
                "alsa_output.usb-Generic_USB_Audio-00.HiFi__hw_Audio_1__sink"
            }
        }
    },
    apply_properties = {
        ["node.disabled"] = true
    }
}

table.insert(alsa_monitor.rules, disable_spdif)
table.insert(alsa_monitor.rules, disable_fpaudio)
