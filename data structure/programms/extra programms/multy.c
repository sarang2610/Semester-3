#include<stdio.h>
void main(){
	int a[3][2],b[2][3],c[3][3];
	for(int i=0;i<3;i++)
	{
		for(int j=0;j<2;j++)
		{
			scanf("%d",&a[i][j]);
		}
		printf("\n");
	}

for(int k=0;k<2;k++)
	{
		for(int l=0;l<3;l++)
		{
			scanf("%d",&b[k][l]);
		}
		printf("\n");
	}

	
	for(int s=0;s<3;s++)
	{
		for(int m=0;m<3;m++)
		{
			c[s][m]=a[s][m]*b[s][m]+a[s][m+1]*b[s+1][m];
		}
	}

	for(int x=0;x<3;x++)
	{
		for(int y=0;y<3;y++)
		{
			printf("%d",c[x][y]);
		}
	}

}	
