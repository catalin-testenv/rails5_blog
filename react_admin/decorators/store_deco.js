
import Dispatcher from '../flux/dispatcher';

/*
 requires StoreClass to define _onAction method
*/

export default function StoreDeco(StoreClass) {
    class Decorated extends StoreClass {
        constructor(...args) {
            super(...args);
            this._onAction = this._onAction.bind(this);
            Dispatcher.register(this._onAction);
        }

        addChangeListener(callback) {
            this.on('change', callback);
            super.addChangeListener && super.addChangeListener(callback);
        }

        removeChangeListener(callback) {
            this.removeListener('change', callback);
            super.removeChangeListener && super.removeChangeListener(callback);
        }

        emitChange(...args) {
            this.emit('change', ...args);
            super.emitChange && super.emitChange(...args);
        }

    }
    return Decorated;
}