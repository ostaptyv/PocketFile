# PocketFile

Any file — in your pocket!

## Description

This is a test project for the Readdle (Fluix) Internship 2022.

## Table of contents

- [Description](#description)
- [Table of contents](#table-of-contents)
- [Installation](#installation)
- [Usage](#usage)
- [Help](#help)
- [Version History](#version-history)
- [Todo list](#todo-list)
- [Authors](#authors)
- [License](#license)

## Installation

In Google Cloud Platform:

1. Create product.
2. Enable [Google Sheets API](https://console.cloud.google.com/apis/library/sheets.googleapis.com).
3. In the "[Credentials](https://console.cloud.google.com/apis/credentials)" section of the "APIs & Services" page, go to Create credentials > API key.
4. Copy and save the API key somewhere, we'll need it later.

In Terminal:

5. Checkout the directory you want the project to be cloned to:
```
cd <your-directory-full-path>
```
6. Clone the project:
```
git clone https://github.com/ostaptyv/PocketFile
```
7. After that, go to your directory and open the "PocketFile.xcodeproj" file.

In Xcode:

8. Go to Product > Scheme > Edit scheme... > (in the side bar) Run > Arguments > Environment Variables, and enter your API key you got earlier.
9. Build and run.

## Usage

Currently, this product is on the developer stage, so it's recommended to run it only in a debug mode from the Xcode. Otherwise, the behavior is unexpected.

## Help

If you're experiencing any problems with the project, file a respective [issue](https://github.com/ostaptyv/PocketFile/issues/new/choose).

## Version History  

- 1.0.0 (developing):
  - Initial Release.

## Todo list

- Implement error handling;
- Implement parsers;
- Resolving table to file tree optimisation;
- "Add new entries" feature;
- "Delete entries" deature.

## Authors

**Ostap Tyvonovych:**
- Telegram: [@ostaptyv_work](https://t.me/ostaptyv_work)
- Email: <ostaptyv@gmail.com>

## License

This project is licensed under the MIT License - see the LICENSE file for details.
