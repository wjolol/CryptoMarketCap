#  CRYPTO MARKET CAP README

This project is built for iOS 16, it uses SPM to manage dependencies.

Dependencies used:
Expandable Text --> https://github.com/NuPlay/ExpandableText

It is written in Swift and uses SwiftUI for the UI and Combine to manage the various states of the app

It uses an MVVM (Model-View-ViewModel) like architecture:
- Model: we have a structure that represents the data that should be put on the screen (name, price of the coin...) which could for example be retrieved from an API 
- View: UI that observes changes in the state and is eventually updated by the viewmodel
- ViewModel: Incapsulates the business logic and allows the view to observe changes of the state

For example we have ContentView.swift in which we have all the components (app header, crypto list) and the possible states that could appear on screen (creation, dataFetched, errors), at the creation of the view the state is set to "Creation" in CryptoListViewModel.swift telling the view to show a loading screen while it is being performed a network request to get the the list of cryptos, then after we receive the results of the request we send it back to the view from the viewModel so that they can be displayed on the screen. 

