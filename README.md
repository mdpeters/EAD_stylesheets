## XSLT stylesheets for transforming EAD XML files

### ead_to_csv.xsl:
Transforms the container list of an EAD finding aid into a csv file for
editing. It creates the following columns:

* LEVEL TYPE (ead:c @level=collection, series, subseries, etc.)
* LEVEL (depth of c: 1, 2, 3, etc.)
* REFID (ead:c @id)
* TITLE (ead:unittitle)
* DATE (ead:unitdate)
* DATE BEGIN (ead:unitdate @normal before the /)
* DATE END (ead:unitdate @normal after the /)
* BULK DATE BEGIN (not implemented)
* BULK DATE END (not implemented)
* BOX VAL (value of ead:container with type=Box)
* FOLDER VAL (value of ead:container with type=Folder)
* DIGITAL FILE VAL (value of ead:container with type=Digital_file)
* OVSIZE VAL (value of ead:container with type=Oversize)
* INSTANCE TYPE
* GENERAL NOTE (ead:odd)
* RESTRICTIONS NOTE (ead:accessrestrict)
* EXPECTED FILENAME (guesses at possible filename based on local file naming conventions, used for digitization projects)

### oacscrub.xsl:
Does some housekeeping to EAD files exported from ArchivesSpace before uploading to OAC.
* Removes `dao` tags that point to restricted arks listed in a separate xml file named `restrictedarks.xml`
* Adds `xlink:role="http://oac.cdlib.org/arcrole/link/"` to `dao`
* Adds the OAC ark to the finding aid if it's been uploaded before, pulled from a separate xml file `oacarks.xml`
* Many small tweaks to individual tags, but for the most part, tags and attributes are just copied. All tags are listed for making future edits easier.
