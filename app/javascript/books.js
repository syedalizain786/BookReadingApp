document.addEventListener('DOMContentLoaded', function() {
  const searchInput = document.getElementById('search-input');
  const searchResults = document.getElementById('search-results');

  searchInput.addEventListener('input', function() {
    const query = searchInput.value.trim();

    if (query.length > 0) {
      fetch(`/search?query=${encodeURIComponent(query)}`, { method: 'GET' })
        .then(response => response.json())
        .then(data => {
          searchResults.innerHTML = '';
          if (data.length > 0) {
            const dropdownList = document.createElement('ul');
            dropdownList.className = 'dropdown-list';
            data.forEach(book => {
              const listItem = document.createElement('li');
              const resultItem = document.createElement('a');
              resultItem.href = `/books/${book.id}`;
              resultItem.textContent = `${book.title}`;
              listItem.appendChild(resultItem);
              dropdownList.appendChild(listItem);
            });
            searchResults.appendChild(dropdownList);
            searchResults.style.display = 'block';
          } else {
            const resultItem = document.createElement('div');
            resultItem.textContent = 'No books found.';
            searchResults.appendChild(resultItem);
          }
        });
    } else {
      searchResults.innerHTML = '';
      searchResults.style.display = 'none';
    }
  });

  // Hide dropdown menu when clicking outside of it
  document.addEventListener('click', function(event) {
    if (!event.target.closest('#search-form')) {
      searchResults.style.display = 'none';
    }
  });
});