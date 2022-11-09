# Delphi

A simple collection of source code snippets for Delphi.
Feel free to download, modify - even sell ;)

## EWriterHelpViewer.pas

It's a very basic implementation of EWriter (created by Help & Manual) support for Delphi.

Just compile your help project with Help & Manual into an exe file in EWriter format and assign the exe's file name to the HelpFile property of your application or forms.
The current implementation only supports showing help content via a context ID. So, assigning a value to the HelpContext property of a control or form and pressing F1 at runtime will bring up the related page in the EWriter ebook.

## RetypeHelpViewer.pas

![WARNING]
So far this is a first step based on EWriterHelpViewer.pas that will be transformed into a working library.

A basic implentation for a viewer of documents created with ReType (or with similar authoring systems).

The viewer is in fact an internal http server that serves the HTML files created with ReType.

It also includes a HelpCpntextID to URL mapper that allows the mapping of numerical help context IDs to URLs pointing to documents within the ReType generated pages.
