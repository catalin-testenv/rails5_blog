
import Dispatcher from '../dispatcher';
import EventEmitter from 'events';
import { clone } from '../../helpers/helpers';

export default new (class PageStore extends EventEmitter {

    constructor() {
        super();
        this._pageList = [];
        this._page = undefined;
        this._onAction = this._onAction.bind(this);
        Dispatcher.register(this._onAction);
    }

    // FLUX boilerplate
    addChangeListener(callback) {
        this.on('change', callback);
    }

    // FLUX boilerplate
    removeChangeListener(callback) {
        this.removeListener('change', callback);
    }

    // FLUX boilerplate
    emitChange() {
        this.emit('change');
    }

    _onAction(action) {
        switch(action.actionType) {
            case 'PAGE_LIST_READY':
                this._pageList = action.data.pageList;
                this.emitChange();
                break;
            case 'PAGE_READY':
                this._page = action.data.page;
                this.emitChange();
                break;
            default:
            // no op
        }
    }

    // GETTERS

    getPageList() {
        return clone(this._pageList);
    }

    getPage() {
        return this._page && clone(this._page);
    }

})();
