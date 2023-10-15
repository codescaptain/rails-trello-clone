import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
    connect() {
        const boards = [
            {
                "id": "board-id-1",
                "title": "Board Title 1",
                "class": "text-white, bg-green-500",
                "item": [
                    {
                        "id": "item-id-1",
                        "title": "Item 1",
                        "username": "username1"
                    },
                    {
                        "id": "item-id-2",
                        "title": "Item 2",
                        "username": "username2"
                    }
                ]
            },

            {
                "id": "board-id-2",
                "title": "Board Title 2",
                "class": "text-white, bg-red-500",
                "item": [
                    {
                        "id": "item-id-1",
                        "title": "Item 1",
                        "username": "username1"
                    },
                    {
                        "id": "item-id-2",
                        "title": "Item 2",
                        "username": "username2"
                    }
                ]
            }

        ]

        var kanban = new jKanban({
            element: '#myKanban',
            gutter: '15px',
            widthBoard: '250px',
            responsivePercentage: false,
            dragItems: true,
            boards: boards,
            dragBoards: true,
            itemAddOptions: {
                enabled: false,
                content: '+',
                class: 'kanban-title-button btn btn-default btn-xs',
                footer: false
            },
            itemHandleOptions: {
                enabled: false,
                handleClass: "item_handle",
                customCssHandler: "drag_handler",
                customCssIconHandler: "drag_handler_icon",
                customHandler: "<span class='item_handle'>+</span> %title% "
            },
            click: function (el) {
            },                             // callback when any board's item are clicked
            context: function (el, event) {
            },                      // callback when any board's item are right clicked
            dragEl: function (el, source) {
            },                     // callback when any board's item are dragged
            dragendEl: function (el) {
                console.log(el)
            },                             // callback when any board's item stop drag
            dropEl: function (el, target, source, sibling) {
            },    // callback when any board's item drop in a board
            dragBoard: function (el, source) {
            },                     // callback when any board stop drag
            dragendBoard: function (el) {
            },                             // callback when any board stop drag
            buttonClick: function (el, boardId) {
            },                     // callback when the board's button is clicked
            propagationHandlers: [],                                         // the specified callback does not cancel the browser event. possible values: "click", "context"
        });
    }
}
