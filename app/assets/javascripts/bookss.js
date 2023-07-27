// app/assets/javascripts/books.js
console.log('In bookss files')


$(document).on('turbolinks:load', function() {
  const searchInput = $('#search-input');
  const searchResults = $('#search-results');

  searchInput.on('input', function() {
    const query = $(this).val().trim();

    if (query.length > 0) {
      $.ajax({
        url: searchInput.closest('form').attr('action'),
        type: 'GET',
        data: { query: query },
        dataType: 'json',
        success: function(data) {
          searchResults.empty();
          if (data.length > 0) {
            $.each(data, function(index, book) {
              const resultItem = $('<div>').text(`${book.title} by ${book.author_name}`);
              searchResults.append(resultItem);
            });
            searchResults.show();
          } else {
            const resultItem = $('<div>').text('No books found.');
            searchResults.append(resultItem);
          }
        }
      });
    } else {
      searchResults.empty().hide();
    }
  });

  // Hide dropdown menu when clicking outside of it
  $(document).on('click', function(event) {
    if (!$(event.target).closest('#search-form').length) {
      searchResults.hide();
    }
  });
});