
'use strict';

const Api = {

    getAllPages() {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: Routes.admin_pages_path({format: 'json'}),
                method: 'GET',
                dataType: 'json',
            }).done((data) => {
                resolve(data);
            }).fail((jqXHR, textStatus, errorThrown) => {
                reject(jqXHR, textStatus, errorThrown);
            });
        });
    },

};

export default Api;
