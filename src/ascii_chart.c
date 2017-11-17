#include <stdio.h>
main()
{
  int i;
  char *ctl = "NULSOHSTXETXEOTENQACKBELBS TABLF VT FF CR SO SI DLEDC1DC2DC3DC4NAKSYNETBCANEM SUBESCFS GS RS US ";
  for (i=0;i<32;i++) printf("%2d %2x %2o  %.3s     %d %x %o  %c     %d %x %o  %c     %3d %x %o  %c  \n",
      i,i,i,ctl+i*3, i+32,i+32,i+32,(char)(i+32), i+64,i+64,i+64,(char)(i+64), i+96,i+96,i+96,(char)(i+96));
}
