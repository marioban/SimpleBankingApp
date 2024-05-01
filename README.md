# Simple Banking App

Simple Banking App is a lightweight iOS application designed to manage personal banking transactions. It features a clean interface for logging in, viewing accounts, and managing transactions.

## Features

- **Login System**: Securely log in with predefined credentials.
- **Account Overview**: View a list of all accounts with their details.
- **Transaction Management**: Browse through transactions for selected accounts.
- **Logout Functionality**: Safely log out with a confirmation dialog.

## Project Structure

- `LoginViewController`
- `TransactionsViewController`
- `SBAlert`: Custom alert view used for logging in and other alerts throughout the app.
- `Models`: Includes `Results`, `Acount`, and `Transaction` models to structure the banking data.

## Setup

To run this project, clone the repo, and open the project in Xcode.

```bash
git clone https://github.com/yourusername/simplebankingapp.git
cd simplebankingapp
open SimpleBankingApp.xcodeproj
```

## Usage

1. **Start the Application**: Launch the app from Xcode on a simulator or a connected iOS device.
2. **Log In**: Use the predefined credentials (e.g., username: admin, password: 1234) to log in through the custom SBAlert.
3. **View Accounts**: Tap on the 'Select Account' button to choose an account and view its transactions.
4. **Log Out**: Use the logout button located in the navigation bar to safely end your session.

## Dependencies

- `UIKit`
- `SnapKit`: Used for programmatic UI layout to simplify constraint management.
