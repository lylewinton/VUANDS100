

REQUIREMENTS
============

Make sure "Developer" tab is switched on in Excel.

    If the Developer tab is not available in the ribon, do the following:
        Click the round Microsoft Office Button (top left), and then click Excel Options.

    In the Popular category, under Top options for working with Excel, select the Show Developer tab in the Ribbon check box, and then click OK.



UPDATING ORG FILES
==================

1. Open "VU_Orgs.xlsx" and "Externals.xlsx" in Excel.

2. Find the organisation/orgunit and update the details.
(WARNING: changing the faculty/department name will require the form and all related entries to be updated.)

  To add a new entry, select row number 2, right click and "Insert".  Don't add rows at the end.

  To remove entries, select the rows, right click and "Delete".  Don't clear the contents.

  NOTE: First column for VU_Orgs is the Faculty or Institute.  Second column is school or centre.
  NOTE: First column for Externals is organisation name.  Leave second column blank as only first column matches.
  NOTE: Watch out for bad Display Name.  The calculation is just a guess, so you can modifying the field value.

3. On the Developer tab (along the top ribbon), in the XML group, click "Export" then save to the corresponding XML file.




TECHNICAL NOTES
===============

The Excel files (XLSX) were modified by mapping the spreadsheets columns to the XML Schema Source "VU_Org_Template.xsd".

The linking key for each entry is the ID, calculated on faculty and department name, so changing these will require the form and all related entries to be updated.  (VU doesn't have department codes and Formidable doesn't appear to handle codes with separate display names.)

Changing the ID will effect the ANDS registry URL for the organisations.

Changing the display name is fine.
