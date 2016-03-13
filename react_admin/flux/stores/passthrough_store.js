

import { EventEmitter } from 'events';
import StoreDeco from '../../decorators/store_deco';


class PassthroughStore extends EventEmitter {

    // passthrough
    _onAction(action) {
        this.emitChange(action.actionType, action.data);
    }

}

PassthroughStore = StoreDeco(PassthroughStore);

export default new PassthroughStore();
