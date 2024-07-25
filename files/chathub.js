self.addEventListener('fetch', function(event) {
    const url = new URL(event.request.url);
    if (url.href === 'https://app.chathub.gg/api/user') {
        event.respondWith(
            fetch(event.request).then(function(response) {
                return response.text().then(function(text) {
                    console.log(text);
                    const modifiedText = text.replace(/free/g, 'premium_cloud');
                    return new Response(modifiedText, {
                        status: response.status,
                        statusText: response.statusText,
                        headers: response.headers
                    });
                });
            })
        );
    } else {
        event.respondWith(fetch(event.request));
    }
});
