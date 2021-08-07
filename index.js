const friends = document.querySelector('#friends');

const friendList = [
    {
        name: "Ray",
        favColor: 'red',
        background: 'rgb(190, 190, 190)'
    },
    {
        name: "Oscar",
        favColor: 'orange',
        background: 'rgb(150, 150, 150)'
    },
    {
        name: "Gwen",
        favColor: 'green',
        background: 'rgb(190, 190, 190)'
    },
    {
        name: "Bob",
        favColor: 'blue',
        background: 'rgb(190, 190, 190)'
    },
    {
        name: "Marie",
        favColor: 'magenta',
        background: 'rgb(190, 190, 190)'
    },
]

function createFriendList(friends) {
    let str = '';
    randomizeFriends = generateRandomList(friends);
    friends.forEach(f => {
        str += `<li class="list-style" style="color:${f.favColor}; background-color:${f.background}">Hi, ${f.name}!</li>`
    })
    return str;
}

// https://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array (Fisher-Yates)
function generateRandomList(list) {
    const rand = Math.random();
    let currentIndex = list.length - 1,  randomIndex;
    
    while (currentIndex !== 0) {
        randomIndex = Math.floor(Math.random() * currentIndex);
        [list[currentIndex], list[randomIndex]] = [list[randomIndex], list[currentIndex]];
        currentIndex--;
    }

    return list;

}

const friendListRendered = createFriendList(friendList);
friends.insertAdjacentHTML('beforeend', friendListRendered)