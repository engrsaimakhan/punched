WINDOWS
The code can be executed by cygwin terminal on windows that includes Fortran compiler in the default installation
https://www.cygwin.com/install.html
OR
With Visual Studio with Fortran Compiler installed.

MACOS
Install gcc using brew 
`brew install gfortran`

EXECUTING THE CODE
After installing the prerequisites, navigate to the code directory and execute the following command to input the data, store it in a file and then execute the code
```
gfortran PunchedIn.f90 -o punchedin.exe  && ./punchedin.exe && gfortran Punched.f90 -o punched.exe  && ./punched.exe
```

To execute the code without changing the input, use the following command
```
gfortran Punched.f90 -o punched.exe  && ./punched.exe
```
