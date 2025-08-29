include_directories(include-private)

add_library(darling-testsuite-lib
    src/darling-testsuite/unsupported.c
    src/darling-testsuite/xml.m

    src/private/DarlingTestSuite/DLTSTraverseXmlLayout.m
    src/private/DarlingTestSuite/DLTSXmlLayout.m
    src/private/DarlingTestSuite/DLTSXmlParserDelegate.m
    src/DarlingTestSuite/DLTSLogging.m
)
