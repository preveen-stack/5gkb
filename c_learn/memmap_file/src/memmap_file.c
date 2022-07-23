#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <assert.h>


int main(){
/* Code Listing 3.6:
   Read the first bytes of the bash executable to confirm it is ELF format
 */

/* Open the bash ELF executable file on Linux */
int fd = open ("/bin/bash", O_RDONLY);
assert (fd != -1);

/* Get information about the file, including size */
struct stat file_info;
assert (fstat (fd, &file_info) != -1);

/* Create a private, read-only memory mapping */
char *mmap_addr = mmap (NULL, file_info.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
assert (mmap_addr != MAP_FAILED);

/* ELF specification:
   Bytes 1 - 3 of the file must be 'E', 'L', 'F' */
assert (mmap_addr[1] == 'E');
assert (mmap_addr[2] == 'L');
assert (mmap_addr[3] == 'f');

/* Unmap the file and close it */
munmap (mmap_addr, file_info.st_size);
close (fd);

}
