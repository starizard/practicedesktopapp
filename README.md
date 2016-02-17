# GUI app to the latest scrape VTU results
My first time making a cross platform desktop application using the **Shoes GUI toollkit**.

This application prompts the user for a student id number and returns the result which can be saved to a text file.

The application crawls the University website , inputting and submitting the form, and returning the result.

I have used the **Mechanize** library for web interactions and **Nokogiri** for parsing the scraped data.

As the University  website has no API , web scraping is the only viable option.
