import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import Qt.labs.folderlistmodel 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("QML File Explorer")

    Rectangle {
        id: mainRect
        x: 20
        y: 20
        width: 300
        height: 450
        border.color: "black"
        radius: 30
        ListView {
            y: 30
            width: parent.width
            height: parent.height - 60
            clip: true
            model: FolderListModel {
                id: folderListModel
                showDirsFirst: true
                nameFilters: ["*.ghsm"]
                rootFolder: "file:///home/rhampton/GreenHouseWorkspace"
                folder: "file:///home/rhampton/GreenHouseWorkspace"
            }

            delegate: Button {
                width: parent.width
                height: 50
                text: fileName
                onClicked: {
                    if (fileIsDir) {
                        folderListModel.folder = fileURL
                    }
                }
                background: Rectangle {
                    color: fileIsDir ? "orange" : "gray"
                    border.color: "black"
                }
            }
        }
    }
    Button {
        anchors.left: mainRect.right
        anchors.leftMargin: 5
        text: "back"
        onClicked: {
            if(folderListModel.folder.toString() !== "file:///home/rhampton/GreenHouseWorkspace")
            folderListModel.folder = folderListModel.parentFolder
        }
    }
}
