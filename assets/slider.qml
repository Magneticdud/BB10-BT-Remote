import bb.cascades 1.4

Page {
    //! [0]
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            onTriggered: {
                _btController.chatManager.closeSPPConnection()
                navigationPane.pop();
            }
        }
    }
    //! [0]
    
    Container {
        topPadding: 100.0
        Label {
            id: labelslide
            text: qsTr("Value:")+" "+(slider.percValue)+"%";
            horizontalAlignment: HorizontalAlignment.Center
            topMargin: 100.0
            textFormat: TextFormat.Plain
            textStyle.fontWeight: FontWeight.W400
            textStyle.fontSize: FontSize.XLarge

        }
        Slider {
            id: slider
            horizontalAlignment: HorizontalAlignment.Center
            topMargin: 50.0
            fromValue: 0.0
            value: 0.0
            toValue: 255.0
            property int percValue : (slider.immediateValue/slider.toValue*100)
            property int intValue : slider.immediateValue
            onValueChanged: {
                var chr = String.fromCharCode(slider.intValue); 
                _btController.chatManager.sendSPPMessage(chr);
            }

        }

    }
}
