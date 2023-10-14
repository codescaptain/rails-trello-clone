import {Controller} from '@hotwired/stimulus'

export default class extends Controller {
    connect() {
        var kanban = new jKanban({
            element: '#myKanban',
            gutter: '10px',
            widthBoard: '250px',
            boards: [
                {
                    'id': '_todo',
                    'title': 'To Do',
                    'item': [
                        {
                            'title': 'Task 1',
                        },
                        {
                            'title': 'Task 2',
                        }
                    ]
                },
                {
                    'id': '_doing',
                    'title': 'Doing',
                    'item': [
                        {
                            'title': 'Task 3',
                        }
                    ]
                },
                {
                    'id': '_done',
                    'title': 'Done',
                    'item': []
                }
            ]
        });
    }
}
