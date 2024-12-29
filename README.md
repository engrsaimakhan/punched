The code can be executed by cygwin terminal on windows that includes Fortran compiler in the default installation
https://www.cygwin.com/install.html
OR
With Visual Studio with Fortran Compiler installed.

After installing cygwin open cygwin terminal, navigate to the code directory and execute the following command
gfortran Punched.f90 -o punched.exe  && ./punched.exe

Running the above will create an executable `punched.exe` in the same directory. 
