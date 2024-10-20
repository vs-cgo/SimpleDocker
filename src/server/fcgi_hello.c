#include <fcgi_stdio.h>
#include <fcgi_config.h>
#include <fcgiapp.h>
#include <stdlib.h>

int main() {
  int res = 0;

  FCGX_Stream *in, *out, *err;
  FCGX_ParamArray envp;
  
  if (FCGX_Init()) res = 1;
  
  if (!res) {
    while (FCGX_Accept(&in, &out, &err, &envp) >= 0) {
      FCGX_FPrintF(out, "Content-type: text/html\r\n\r\n<TITLE>FASTCGI</TITLE>\n<h1>Hello world!</h1>\n");  
    }
  }
  return res;
}
