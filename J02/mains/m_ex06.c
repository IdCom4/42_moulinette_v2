/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   m_ex06.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: idcornua <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/26 16:12:48 by idcornua          #+#    #+#             */
/*   Updated: 2018/07/26 16:12:51 by idcornua         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

void	ft_putnbr(int nb);

int		main(int argc, char **argv)
{

  for (int i = 0; i < argc; i++) {
    int nbrToTest = atoi(argv[i]);
    ft_putnbr(nbrToTest);
  }
  
	return (0);
}