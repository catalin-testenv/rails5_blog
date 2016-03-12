
'use strict';

const Api = {

    getPageList() {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: Routes.admin_pages_path({format: 'json'}),
                method: 'GET',
                dataType: 'json',
            }).done((data, textStatus, jqXHR) => {
                resolve(data, textStatus, jqXHR);
            }).fail((jqXHR, textStatus, errorThrown) => {
                reject(jqXHR, textStatus, errorThrown);
            });
        });
    },

    getPage(id) {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: Routes.edit_admin_page_path(id, {format: 'json'}),
                method: 'GET',
                dataType: 'json',
            }).done((data, textStatus, jqXHR) => {
                resolve(data, textStatus, jqXHR);
            }).fail((jqXHR, textStatus, errorThrown) => {
                reject(jqXHR, textStatus, errorThrown);
            });
        });
    },

    updatePage(id, pageData) {
        return new Promise((resolve, reject) => {
            $.ajax({
                headers: {
                    'X-CSRF-Token': Cookies.get('X-CSRF-Token').replace(/xxx-/, '')
                },
                url: Routes.admin_page_path(id, {format: 'json'}),
                method: 'PATCH',
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                data: pageData,
            }).done((data, textStatus, jqXHR) => {
                resolve(data, textStatus, jqXHR);
            }).fail((jqXHR, textStatus, errorThrown) => {
                reject(jqXHR, textStatus, errorThrown);
            });
        });
    }

};

export default Api;
