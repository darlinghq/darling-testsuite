
# Make sure the following dependencies are installed before you run the script
# ```
# pip install cryptography
# ````

from cryptography import x509

import socket
import ssl

hostname = "pypi.org"
port = 443
context = ssl.create_default_context()
context.set_default_verify_paths()

with socket.create_connection((hostname, port)) as sock:
    with context.wrap_socket(sock, server_hostname=hostname) as sslsock:
        for index, cert_raw_data in enumerate(sslsock.get_unverified_chain()):
            cert_data = x509.load_der_x509_certificate(cert_raw_data)
            
            file_name = None
            common_name_attributes = cert_data.subject.get_attributes_for_oid(x509.NameOID.COMMON_NAME)
            if len(common_name_attributes) > 0:
                common_name = common_name_attributes[0].value.replace(".","_").replace(" ","_").lower()
                file_name = "{}.der".format(common_name)
            else:
                file_name = "certificate_{}.der".format(index)
            
            with open(file_name, "bw") as cert_file:
                cert_file.write(cert_raw_data)
