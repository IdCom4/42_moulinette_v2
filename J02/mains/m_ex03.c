/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   m_ex04.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: idcornua <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/07/26 16:09:45 by idcornua          #+#    #+#             */
/*   Updated: 2018/07/26 16:09:46 by idcornua         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>

void	ft_putchar(char c);
void	ft_is_negative(int n);
void	ft_putstr(char *str);
void	ft_putnbr(int nbr);

int		main(int argc, char **argv)
{

  for (int i = 0; i < argc; i++) {
    int nbrToTest = atoi(argv[i]);
    ft_is_negative(nbrToTest);
  }

  // check from -10 to +10
	int i = -10;
	while (i <= 10)
	{
		ft_putnbr(i);
		ft_putstr(" = ");
		ft_is_negative(i);
		ft_putchar('\n');
		i++;
	}

  // check INT_MIN
	ft_putnbr(-2147483648);
	ft_putstr(" = ");
	ft_is_negative(-2147483648);
	ft_putchar('\n');

  // check INT_MAX
	ft_putnbr(2147483647);
	ft_putstr(" = ");
	ft_is_negative(2147483647);
	ft_putchar('\n');
  
	return (0);
}
