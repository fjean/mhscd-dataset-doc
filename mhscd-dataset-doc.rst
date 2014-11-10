===============================================================
The Mountain Habitats Segmentation and Change Detection Dataset
===============================================================

-----------------------------------------------
Documentation and Information about the Dataset
-----------------------------------------------

 F. Jean, A. Branzan Albu, D. Capson, E. Higgs, J. T. Fisher, B. M. Starzomski

.. sectnum::
.. contents:: :depth: 2

Introduction
============

This is the documentation for the dataset presented in the paper *The Mountain
Habitats Segmentation and Change Detection Dataset* accepted for publication in
the *IEEE Winter Conference on Applications of Computer Vision* (WACV 2015).
The full-sized images and masks along with the accompanying files and results
are hosted on ZENODO: `<http://dx.doi.org/10.5281/zenodo.12590>`_. The size of
the dataset is about 2.1 GB.

Dataset
=======

The dataset consists of the following files:

================================ ===============================================
File                             Description
================================ ===============================================
repeat-images.zip                The 60 *repeat* images in TIFF format.
historic-images.zip              The 60 *historic* images in TIFF format.
repeat-segmentations-color.zip   The 60 *repeat* color masks obtained from
                                 manual segmentation; PNG format.
historic-segmentations-color.zip The 60 *historic* color masks obtained from
                                 manual segmentation; PNG format.
repeat-segmentations.zip         The 60 *repeat* ID masks obtained from
                                 manual segmentation; PNG format.
historic-segmentations.zip       The 60 *historic* ID masks obtained from
                                 manual segmentation; PNG format.
dataset-info.zip                 Information on each image pair, including
                                 acquisition year, image size, survey,
                                 surveyor, station name, location, and
                                 latitude/longitude.
habitats-all.zip                 Information on the 8 categories, including
                                 name, description, ID, and color.
habitats-forest.zip              Information on the *forest* and *non-forest*
                                 meta-categories, including name, description,
                                 ID, and color.
results-best-experiments.zip     Per image pair results for the best
                                 experiments desbribed in the paper.
results-overall.zip              Overall results for each of the 42
                                 experiments described in the paper.
CHECKSUM.sha256                  SHA256SUM to verify the integrity of each
                                 ZIP file.
LICENSE.txt                      Information on the dataset license.
================================ ===============================================

File Name Notation
------------------

Each image pair in the dataset has been assigned a number from ``0001`` to
``0060``. The file name notation is described below, with ``XXXX`` denoting
the image pair number:

===================  ===============================================
File name            Description
===================  ===============================================
``hi-XXXX.tif``      Historic image
``ri-XXXX.tif``      Repeat image
``hs-XXXX.png``      Historic manual segmentation (category ID)
``rs-XXXX.png``      Repeat manual segmentation (category ID)
``hsc-XXXX.png``     Historic manual segmentation (category color)
``rsc-XXXX.png``     Repeat manual segmentation (category color)
===================  ===============================================

Segmentation Masks
------------------

For each repeat and historic image, the manual segmentation is provided as two
masks: a color mask and a ID mask. The color masks are mostly useful for
display purposes. The pixel format for the color masks is RGBA
(Red-Green-Blue-Alpha, 32 bits per pixel), where the alpha channel is equal to
0 (transparent) for pixels that have not been categorized in the image (e.g.
sky), and to 255 (opaque) otherwise. The uncategorized pixels have
been assigned the color *black*, so these pixels will be black if the color
mask is stripped off of its alpha channel.

The ID mask is an 8 bits per pixel image where the value of a pixel corresponds
to the ID of the habitat category. The ID 0 is used for uncategorized pixels.
The ID mask is useful for selecting the pixel for a specific category or group
of categories. Here are some examples that show how to obtain a binary mask for
a category or a group of categories:

* **Example in Python**

  .. code:: python

    import numpy as np
    from PIL import Image

    # Load ID mask
    id_mask = np.array(Image.open("mask.png"))

    # Get binary mask for category ID 2
    id2_mask = np.bitwise_and(id_mask, 2).astype(bool)

    # Get binary mask for group of category IDs: 1, 8, and 32
    # 1 + 8 + 32 = 41
    id_group_mask = np.bitwise_and(id_mask, 41).astype(bool)

* **Example in MATLAB:**

  .. code:: matlab

    % Load ID mask
    id_mask = imread('mask.png');

    % Get binary mask for category ID 2
    id2_mask = logical(bitand(id_mask, 2));

    % Get binary mask for group of category IDs: 1, 8, and 32
    % 1 + 8 + 32 = 41
    id_group_mask = logical(bitand(id_mask, 41));

For more information about the categories, see the section
`Habitat Categories`_.

Dataset Information
-------------------

Information about each image pair, including acquisition year, image size,
survey, surveyor, station name, location, and latitude/longitude is available
in the file ``dataset-info.zip``. The dataset information is provided in CSV
(comma separated values), YAML [#yaml]_, and JSON [#json]_ file formats for
easy manipulation in computer programs. The same information is also provided
in Open Document Spreadsheet (ODS), Microsoft Excel (XLS, XLSX), and PDF file
formats for easy reading.

.. [#yaml] http://www.yaml.org
.. [#json] http://www.json.org

Habitat Categories
------------------

The files ``habitats-all.zip`` and ``habitats-forest.zip`` provide information
about the 8 habitat categories and the *forest* and *non-forest*
meta-categories, respectively. Available information includes category name,
description, ID, and color. This information is provided in CSV (comma
separated values), YAML, and JSON file formats for easy manipulation in
computer programs. The same information is also provided in Open Document
Spreadsheet (ODS), Microsoft Excel (XLS, XLSX), and PDF file formats for easy
reading.

Baseline Algorithm Results
--------------------------

The file ``overall-results.zip`` provides a complete table with the results for
all of the 42 experiments. This table is related to Table 2 in the paper, which
only presents the results of the first best 20 experiments. The table contains
the Matthews Correlation Coefficient (MCC) and the :math:`F_1`-score of the
*forest* and *non-forest* meta-categories computed for each experiment over all
the test images. The table is available in Open Document Spreadsheet (ODS),
Microsoft Excel(XLS, XLSX), and PDF file formats.

The file ``best-experiments-results.zip`` contains a table with the MCC value
and the :math:`F_1`-scores computed for each of the 47 test image pairs in the
case of the repeat and historic experiments with the highest overall MCC value
(see Table 2 in the paper). The table is available in Open Document Spreadsheet
(ODS), Microsoft Excel (XLS, XLSX), and PDF file formats.

License and Citation
====================

The dataset is released under the *Creative Commons Attribution-Non
Commercial 4.0 International License* [#lic]_. If you intend to use this
dataset for your own research and publications, please cite the dataset paper
as follows:

  F. Jean, A. Branzan Albu, D. Capson, E. Higgs, J. T. Fisher, B. M.
  Starzomski. "The Mountain Habitats Segmentation and Change Detection
  Dataset", In *Proceedings of the IEEE Winter Conference on Applications of
  Computer Vision* (WACV), Waikoloa Beach, HI, USA, January 6-9, 2015.

The dataset has been assigned its own DOI [#doi]_: ``10.5281/zenodo.12590``.
Note that this DOI is different from the paper's DOI. The dataset can be
accessed at the following address: `<http://dx.doi.org/10.5281/zenodo.12590>`_.

.. [#lic] http://creativecommons.org/licenses/by-nc/4.0/legalcode
.. [#doi] http://en.wikipedia.org/wiki/Digital_object_identifier

Contact
=======

For any question about the dataset, please contact Dr Frédéric Jean:
``fjean AT uvic.ca``.

| **Document revision**: 1
| **Modification date**: 2014-11-10
| **Document copyright**: Creative Commons BY-NC 4.0

