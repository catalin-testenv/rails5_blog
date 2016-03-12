
import Dispatcher from '../dispatcher';
import Api from '../../services/api';

const PageActions = {

    getPageList() {
        Api.getPageList().then((data, textStatus, jqXHR) => {
            Dispatcher.dispatch({
                actionType: 'PAGE_LIST_READY',
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
                actionType: 'PAGE_READY',
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
                actionType: 'PAGE_READY',
                data: {
                    page: data
                }
            });
        }).catch((jqXHR, textStatus, errorThrown) => {
            console.error(jqXHR);
        });
    }
};

export default PageActions;