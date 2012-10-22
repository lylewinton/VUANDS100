#!/bin/sh
echo "#### Starting XML transform..."
java -jar saxon9he.jar -s:wp_frm_fields.xml -xsl:transform.xsl -o:rifcs.xml
echo "#### Done."
