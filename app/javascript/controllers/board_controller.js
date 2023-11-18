import {Controller} from '@hotwired/stimulus'
import axios from 'axios'
import {map, get, isNull} from 'lodash-es'

export default class extends Controller {

    isEmpty(data) {
        if (isNull(data)) {
            return 'text-white, bg-red-500'
        }
        return data
    }

    buildBoards(boardsData) {
        return map(boardsData, (board) => {
            return {
                'id': get(board, 'id'),
                'title': get(board, 'attributes.title'),
                'class': this.isEmpty(get(board, 'attributes.class_list')) + ",edit-page",
                'item': get(board, 'attributes.items')
            }
        });
    }

    createJkanban(boards) {
        new jKanban({
            element: '#myKanban',
            gutter: '15px',
            widthBoard: '250px',
            responsivePercentage: false,
            dragItems: true,
            boards: boards,
            dragBoards: true,
            itemAddOptions: {
                enabled: true,
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
            },
            context: function (el, event) {
            },
            dragEl: function (el, source) {
            },
            dragendEl: function (el) {
                console.log(el)
            },
            dropEl: function (el, target, source, sibling) {
            },
            dragBoard: function (el, source) {
            },
            dragendBoard: function (el) {
            },
            buttonClick: function (el, boardId) {
            },
            propagationHandlers: [],
        });
    }

    addEditLinkToList(board_url) {
        let lists = document.getElementsByClassName("edit-page")
        let listsArray = Array.from(lists)
        listsArray.forEach(function (list) {
            list.addEventListener("click", (e) => {
                const list_id = list.parentElement.dataset.id
                Turbo.visit(`${board_url}/lists/${list_id}/edit`)
            })
        })
    }


    connect() {
        axios.get(this.element.dataset.apiUrl)
            .then((response) => {
                const boards = this.buildBoards(response['data']['data']);
                this.createJkanban(boards)
                this.addEditLinkToList(this.element.dataset.ctUrl)
            });
    }
}
