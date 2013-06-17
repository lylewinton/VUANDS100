

REQUIREMENTS
============

Make sure "Developer" tab is switched on in Excel.

    If the Developer tab is not available in the ribon, do the following:
        Click the round Microsoft Office Button (top left), and then click Excel Options.

    In the Popular category, under Top options for working with Excel, select the Show Developer tab in the Ribbon check box, and then click OK.



UPDATING ORG FILES
==================

1. Open "Externals.xlsx" in Excel.  (Note: historical names such as "school" exist due to previous "VU_Orgs.xlsx" file.

2. Find the organisation and update the details.

  To add a new entry, select row number 2, right click and "Insert".  Don't add rows at the end.

  To remove entries, select the rows, right click and "Delete".  Don't clear the contents.

  NOTE: First column for Externals is organisation name.
  NOTE: Watch out for bad Display Name.  Doesn't have to be the name in the VU form.

3. On the Developer tab (along the top ribbon), in the XML group, click "Export" then save to the corresponding XML file.




TECHNICAL NOTES
===============

The Excel files (XLSX) were modified by mapping the spreadsheets columns to the XML Schema Source "VU_Org_Template.xsd".

First column is the "ID" in XML and used to match what comes from the WordPress form.  The "Key" value is used as a suffix for the ANDS key.

Changing the Key will effect the ANDS registry URL for the organisations.

Changing the display name is fine.
