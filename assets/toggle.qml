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
        Button {
            id: togglebutton
            text: qsTr("Toggle")
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            property bool toggle : false
            onClicked: {
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
        }
        ImageView {
            id: lighton
            imageSource: "asset:///images/LightON.png"
            horizontalAlignment: HorizontalAlignment.Center
            topMargin: 100.0
            visible: togglebutton.toggle
            accessibility.name: qsTr("Light On")

        }
        ImageView {
            id: lightoff
            imageSource: "asset:///images/LightOFF.png"
            horizontalAlignment: HorizontalAlignment.Center
            topMargin: 100.0
            visible: !togglebutton.toggle
            accessibility.name: qsTr("Light Off")
        
        }

    }
}
