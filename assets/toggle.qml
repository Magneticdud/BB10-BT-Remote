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
            onClicked: {
<<<<<<< .merge_file_fmyu8K
                _btController.chatManager.sendIntSPP(79);
=======
                _btController.chatManager.sendSPPMessage(2);
>>>>>>> .merge_file_KyfuDW
            }
        }

    }
}
