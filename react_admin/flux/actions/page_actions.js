
import Dispatcher from '../dispatcher';
import Api from '../../services/api';
import ActionTypes from '../../constants/action_types';

const PageActions = {

    getPageList() {
        Api.getPageList().then((data, textStatus, jqXHR) => {
            Dispatcher.dispatch({
                actionType: ActionTypes.PAGE_LIST_READY,
                data: {
                    pageList: data
                }
            });
        }).catch((jqXHR, textStatus, errorThrown) => {
            console.error(jqXHR);
        });

    },

    getPage(id) {
        Api.getPage(id).then((data, textStatus, jqXHR) => {
            Dispatcher.dispatch({
                actionType: ActionTypes.PAGE_READY,
                data: {
                    page: data
                }
            });
        }).catch((jqXHR, textStatus, errorThrown) => {
            console.error(jqXHR);
        });
    },

    updatePage(id, pageData) {
        Api.updatePage(id, pageData).then((data, textStatus, jqXHR) => {
            Dispatcher.dispatch({
                actionType: ActionTypes.PAGE_UPDATED,
                data: {
                    page: data,
                    message: 'Page updated.'
                }
            });
        }).catch((jqXHR, textStatus, errorThrown) => {
            Dispatcher.dispatch({
                actionType: ActionTypes.PAGE_ERROR,
                data: {
                    jqXHR: jqXHR,
                    textStatus: textStatus,
                    errorThrown: errorThrown,
                    message: 'Page not updated.'
                }
            });
        });
    }
};

export default PageActions;