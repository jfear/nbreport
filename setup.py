from setuptools import setup

setup(name='nbreport',
      version='0.1.1b1',
      description='Basic Jupyter Notebook HTML template for generating reports.',
      url='',
      author='Justin Fear',
      author_email='justin.m.fear@gmail.com',
      license='MIT',
      packages=['nbreport'],
      package_dir={'nbreport': 'nbreport'},
      include_package_data=True,
      zip_safe=False,
      install_requires=[
          'jinja2',
          'ipython',
          'nbconvert',
          'traitlets',
          'nbformat'
      ],
      entry_points={'nbconvert.exporters':
                    {'report = nbreport:ReportExporter'}
                   }
     )
