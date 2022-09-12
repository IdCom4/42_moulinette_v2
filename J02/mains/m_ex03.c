/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   m_ex04.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: idcornua <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/26 16:09:45 by idcornua          #+#    #+#             */
/*   Updated: 2018/07/26 16:09:46 by idcornua         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>

void	ft_is_negative(int n);

int		main(int argc, char **argv)
{

  for (int i = 0; i < argc; i++) {
    int nbrToTest = atoi(argv[i]);
    ft_is_negative(nbrToTest);
  }
  
	return (0);
}
