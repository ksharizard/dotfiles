import webbrowser
import sys

def open_urls_in_browser(urls, browser):
    # Map browser names to their executable paths
    browser_paths = {
        'firefox': 'C:\\Program Files\\Mozilla Firefox\\firefox.exe',
        'zen': 'C:\\Program Files\\Zen Browser\\zen.exe'  # Update this path if Zen browser is installed in a different location
    }

    # Check if the specified browser is supported
    if browser not in browser_paths:
        print(f"Error: Browser '{browser}' is not supported.")
        return

    # Register the browser with webbrowser
    webbrowser.register(browser, None, webbrowser.BackgroundBrowser(browser_paths[browser]))

    # Open each URL in the specified browser
    for url in urls:
        webbrowser.get(browser).open(url)
        print(f"Opening {url} in {browser}...")

if __name__ == "__main__":
    # Ask the user for the browser
    browser = input("Enter the browser (firefox or zen): ").strip().lower()

    # Ask the user for the URLs
    print("Enter the URLs one per line (press Enter on an empty line to finish):")
    urls = []
    while True:
        url = input().strip()
        if url == "":
            break
        urls.append(url)

    # Open the URLs in the specified browser
    open_urls_in_browser(urls, browser)
