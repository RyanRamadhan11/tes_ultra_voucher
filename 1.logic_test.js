function checkAnagram(word1, word2) {
    if (word1.length !== word2.length) {
        return false;
    }

    const characterFrequency = {};

    for (let i = 0; i < word1.length; i++) {
        const character = word1[i];
        characterFrequency[character] = (characterFrequency[character] || 0) + 1;
    }

    for (let i = 0; i < word2.length; i++) {
        const character = word2[i];
        if (!characterFrequency[character]) {
            return false;
        }

        characterFrequency[character] -= 1;
    }

    return true;
}

function groupAnagrams(words) {
    const anagramGroups = [];

    for (let i = 0; i < words.length; i++) {
        const inputWord = words[i];
        let addedToGroup = false;

        for (let j = 0; j < anagramGroups.length; j++) {
            const anagramGroup = anagramGroups[j];
            if (checkAnagram(anagramGroup[0], inputWord)) {
                anagramGroup.push(inputWord);
                addedToGroup = true;
                break;
            }
        }

        if (!addedToGroup) {
            anagramGroups.push([inputWord]);
        }
    }

    return anagramGroups;
}


const inputArray = ['cook', 'save', 'taste', 'aves', 'vase', 'state', 'map'];
const result = groupAnagrams(inputArray);
console.log(result);
