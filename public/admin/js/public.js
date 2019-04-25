function notify(
    type='1',
    title='Notification Title',
    message='',
    url=undefined,
    from='bottom', 
    align='center', 
    icon=undefined, 
    animIn='animated flipInX', 
    animOut='animated flipOutX'
){
    if(type=='1'){
        type='success';
    }
    if(type=='0'){
        type='danger';
    }
    if(type=='2'){
        type='info';
    }
    if(type==''){
        type='inverse';
    }
    if(!title){
        title=type;
    }
    $.notify({
        icon: icon,
        title: title,
        message: message,
        url: url
    },{
        element: 'body',
        type: type,
        allow_dismiss: true,
        placement: {
            from: from,
            align: align
        },
        offset: {
            x: 15, // Keep this as default
            y: 15  // Unless there'll be alignment issues as this value is targeted in CSS
        },
        spacing: 10,
        z_index: 1031,
        delay: 2500,
        timer: 1000,
        url_target: '_blank',
        mouse_over: false,
        animate: {
            enter: animIn,
            exit: animOut
        },
        template:   '<div data-notify="container" class="alert alert-dismissible alert-{0} alert--notify" role="alert">' +
                        '<span data-notify="icon"></span> ' +
                        '<span data-notify="title">{1}</span> ' +
                        '<span data-notify="message">{2}</span>' +
                        '<div class="progress" data-notify="progressbar">' +
                            '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
                        '</div>' +
                        '<a href="{3}" target="{4}" data-notify="url"></a>' +
                        '<button type="button" aria-hidden="true" data-notify="dismiss" class="alert--notify__close">Close</button>' +
                    '</div>'
    });
}