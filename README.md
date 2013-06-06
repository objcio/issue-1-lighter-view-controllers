objc.io sample project for issue #1: lighter view controllers
===

This project serves as an example for the topics discussed in the inaugural edition of [objc.io](http://objc.io). This app is a very simple and contrived example, which only serves the purpose of showing the discussed techniques in context.

This app comes with a predownloaded archive of photo records from 500px, and displays them with some additional details. We only show the metadata of the photos and the pictures itself, because we didn't want to add networking and the complexity of presenting downloaded photos in table view cells in a good way, so that we can concentrate on the techniques discussed in this edition.

Cloning this project
===

To get the tests to run, you need to install the OCMock dependency by running the following commands:

    git submodule init
    git submodule update
