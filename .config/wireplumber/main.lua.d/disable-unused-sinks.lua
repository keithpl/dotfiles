local function disable_node(node_name)
    local rule = {
        matches = {
            {
                {
                    "node.name",
                    "equals",
                    node_name
                }
            }
        },
        apply_properties = {
            ["node.disabled"] = true
        }
    }

    table.insert(alsa_monitor.rules, rule)
end

-- S/PDIF
disable_node("alsa_output.usb-Generic_USB_Audio-00.HiFi__hw_Audio_3__sink")

-- Front panel audio
disable_node("alsa_output.usb-Generic_USB_Audio-00.HiFi__hw_Audio_1__sink")
