module Dataton2019
using DataDeps

function __init__()

    register(DataDep("icijbahamas2017",
        """
        Dataset: ICIJBahamasLeaks2017CSV
        Author: ICIJ 2017
        License: Open
        Website: https://offshoreleaks.icij.org/


        Notice: this file is over 100MB
        """,
        "https://offshoreleaks-data.icij.org/offshoreleaks/csv/csv_bahamas_leaks.2017-12-19.zip",
        "",
    ));

    # Para usar estos datos, descomentar estas lineas.
    #
    # register(DataDep("icijoffshore2018",
    #     """
    #     Dataset: ICIJ Offshore Leaks 2018 CSV
    #     Author: ICIJ
    #     License: Open
    #     Website: https://offshoreleaks.icij.org/
    #
    #
    #     Notice: this file is over 100MB
    #     """,
    #     "https://offshoreleaks-data.icij.org/offshoreleaks/csv/csv_offshore_leaks.2018-02-14.zip",
    #     "05e7a0382ce9e0b9fe17b20d332e84f33fcf8c381a86e116de00bafbe5036043",
    # ));
    #
    # register(DataDep("icijpanamapapers2018",
    #     """
    #     Dataset: ICIJ Offshore Leaks CSV
    #     Author: ICIJ
    #     License: Open
    #     Website: https://offshoreleaks.icij.org/
    #
    #
    #     Notice: this file is over 100MB
    #     """,
    #     "https://offshoreleaks-data.icij.org/offshoreleaks/csv/csv_panama_papers.2018-02-14.zip",
    #     "",
    # ));

    # register(DataDep("icijparadise2018",
    #     """
    #     Dataset: ICIJ Offshore Leaks CSV
    #     Author: ICIJ
    #     License: Open
    #     Website: https://offshoreleaks.icij.org/
    #
    #
    #     Notice: this file is over 100MB
    #     """,
    #     "https://offshoreleaks-data.icij.org/offshoreleaks/csv/csv_paradise_papers.2018-02-14.zip",
    #     "",
    # ));
    #
    register(DataDep("s6mini",
         """
         Dataset: s6contratacionesmini
         Author: GOBMEX, modified by Miguel Raz
         License: Open
         Website:

         Notice: this file is over 20MB
         """,
         "https://raw.githubusercontent.com/miguelraz/Dataton2019.jl/master/test/mini.json",
         "",
    ));



end

end # module
