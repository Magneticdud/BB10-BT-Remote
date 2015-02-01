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
        ImageToggleButton {
            id: togglebutton
            property bool toggle : false
            imageSourceChecked: "asset:///images/LightON.png"
            imageSourceDefault: "asset:///images/LightOFF.png"
            horizontalAlignment: HorizontalAlignment.Center
            topMargin: 100.0
            checked: togglebutton.toggle
            onCheckedChanged: {
                var acceso = String.fromCharCode(255);
                var spento = String.fromCharCode(0);
                if (!togglebutton.toggle){
                    _btController.chatManager.sendSPPMessage(acceso);
                    togglebutton.toggle=true;
                }
                else {
                    _btController.chatManager.sendSPPMessage(spento);
                    togglebutton.toggle=false;
                }
            }
            accessibility.name: qsTr("Toggle")
        }
    }
}
