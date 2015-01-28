/* Copyright (c) 2012, 2013  BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.0

// A page that lists all services of a remote bluetooth device
Page {
    //! [0]
    actions: [
        ActionItem {
            title: qsTr("Device Info")
            imageSource: "asset:///images/local_device.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                qsDeviceInfo.open();
            }
        },
        ActionItem {
            title: qsTr("Connect SPP")
            imageSource: "asset:///images/broadcasts.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                _btController.chatManager.connectToSPPService();
                navigationPane.push(chatPage.createObject())
            }
        }
    ]
    //! [0]

    Container {
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom

            }
            horizontalAlignment: HorizontalAlignment.Center
            topPadding: 50.0
            Button {
                text: qsTr("Toggle mode")
                onClicked: {
                    _btController.chatManager.connectToSPPService();
                    navigationPane.push(togglePage.createObject())
                }
            }
            Button {
                text: qsTr("Slider mode")
                topMargin: 50.0
                onClicked: {
                    navigationPane.push(slidePage.createObject())
                }
            }
        }

        //! [2]
        attachedObjects: [
            RemoteDeviceInfoSheet {
                id: qsDeviceInfo
            },
            ComponentDefinition {
                id: chatPage
                source: "SPPChat.qml"
            },
            ComponentDefinition {
                id: togglePage
                source: "toggle.qml"
            },
            ComponentDefinition {
                id: slidePage
                source: "slider.qml"
            }
        ]
        //! [2]
    }
}
