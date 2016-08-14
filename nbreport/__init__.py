import os
import os.path

from traitlets.config import Config
from nbconvert.exporters.html import HTMLExporter

#-----------------------------------------------------------------------------
# Classes
#-----------------------------------------------------------------------------

class ReportExporter(HTMLExporter):
    """
    My custom report htmlexporter
    """

    def _file_extension_default(self):
        """
        The new file extension is `.html`
        """
        return '.html'

    @property
    def template_path(self):
        """
        We want to inherit from HTML template, and have template under
        `./templates/` so append it to the search path. (see next section)
        """
        return super().template_path+[os.path.join(os.path.dirname(__file__), "templates")]

    def _template_file_default(self):
        """
        We want to use the new template we ship with our library.
        """
        return 'report.tpl' # full
