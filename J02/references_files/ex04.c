void	ft_putchar(char c);
void	ft_putstr(char *str);

void	ft_print_comb(void)
{
	int		i;
	int		j;
	int		k;

	i = 0;
	while (i++ <= 9 && ((j = i) || 1))
		while (j++ <= 9 && ((k = j) || 1))
			while (k++ <= 9)
			{
				if (!(i == 1 && j == 2 && k == 3))
					ft_putstr(", ");
				ft_putchar('0' + (i - 1));
				ft_putchar('0' + (j - 1));
				ft_putchar('0' + (k - 1));
			}
}