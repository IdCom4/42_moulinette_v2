/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   m_ex07.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: idcornua <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/07/26 16:13:31 by idcornua          #+#    #+#             */
/*   Updated: 2018/07/26 16:13:32 by idcornua         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

void	ft_putchar(char c);
void	ft_print_combn(int n);

int		main()
{
  for (int i = 1; i < 10; i++) {
    ft_print_combn(i);
    ft_putchar('\n');
  }
	
	return (0);
}
