void	ft_putchar(char c);

void	ft_putnbr(int nbr)
{
	unsigned int number;

	number = nbr;
	if (nbr < 0)
	{
		ft_putchar('-');
		number = nbr * -1;
	}
	if (number >= 10)
	{
		ft_putnbr(number / 10);
		ft_putnbr(number % 10);
	}
	else
	{
		ft_putchar(number + 48);
	}
}
