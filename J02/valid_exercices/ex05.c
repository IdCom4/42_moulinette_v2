void	ft_putchar(char c);
void	ft_putstr(char *str);

void	ft_print_comb2(void)
{
	int i;
	int j;

	i = 0;
	while (i++ <= 99 && ((j = i) || 1))
		while (j++ <= 99)
		{
			if ((j - 1) > 1)
				ft_putstr(", ");
			ft_putchar(((i - 1) / 10) + '0');
			ft_putchar(((i - 1) % 10) + '0');
			ft_putchar(' ');
			ft_putchar(((j - 1) / 10) + '0');
			ft_putchar(((j - 1) % 10) + '0');
		}
}