void ft_putchar(char c);

void	ft_putstr(char *str)
{
	int index;

	index = 0;
	while (str[index] != '\0')
	{
		ft_putchar(str[index]);
		index++;
	}
}

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

void  ft_print_current_comb(int *arr, int size) {
  int i = 0;
  while (i < size)
    ft_putnbr(arr[i++]);
  
  if (arr[0] != 9 - (size - 1))
    ft_putstr(", ");
}

void	ft_print_combn(int n)
{
	int		i;
	int		arr[9];


	if (n <= 0 || n >= 10)
		return ;

  i = 0;
  while (i++ < n)
    arr[i - 1] = i - 1;

  i = n - 1;
  while (1) {

    while (arr[i] <= 9) {
      ft_print_current_comb(arr, n);
      arr[i] += 1;
    }
    arr[i] -= 1;


    if (arr[0] == 9 - (n - 1))
      return ;

    while (i > 0 && arr[i] >= 9)
      arr[--i] += 1;
      
    while (++i < n - 1)
      arr[i] = arr[i - 1] + 1;
  }
}