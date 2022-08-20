window.onload = () => {
    let data = document.querySelector("form");
    let appendedDiv = document.querySelector("div");

    let containerDiv = null;

    data.addEventListener('keyup', e => {
        fetch('http://localhost:3041/api/songs/' + document.getElementById('inputField').value)

        /* The old PHP way
        let formData = new FormData(data);
        fetch('gotten-song.php', {
            method: 'post',
            body: formData
        })
        */
        
        // Turn the data into text
        .then(data => {
            return data.text();
        })
        .then(jsonObj => {
            // Remove the old element with all search results
            if(containerDiv) {
                appendedDiv.removeChild(containerDiv);
                containerDiv = null;
            }
            
            // See if the text can be turned to json or is an 'error: Couldn't find...', return on the latter
            try {
                jsonObj = JSON.parse(jsonObj);
            } catch {
                return;
            }

            // Create the element that will hold all the results
            containerDiv = document.createElement('div');
            containerDiv.className = 'element-list';

            // For each result, create a div with the result inside the container div
            for(entry of jsonObj) {
                innerDiv = document.createElement('div');

                let title = document.createElement('h2');
                title.innerText = entry['title'];
                innerDiv.append(title);

                let releaseDate = document.createElement('div');
                releaseDate.innerHTML = '<b>Release date:</b> ' + entry['release_date'];
                innerDiv.append(releaseDate);

                if(entry['poster']) {
                    console.log(entry['poster']);
                    let image = document.createElement('img');
                    image.src = entry['poster']
                    innerDiv.append(image);
                }

                containerDiv.append(innerDiv);
            }

            appendedDiv.append(containerDiv);
        });
    });
}