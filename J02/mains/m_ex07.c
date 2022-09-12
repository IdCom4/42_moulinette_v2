/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   m_ex07.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: idcornua <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/26 16:13:31 by idcornua          #+#    #+#             */
/*   Updated: 2018/07/26 16:13:32 by idcornua         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

void	ft_print_combn(int n);

int		main(int argc, char **argv)
{

  for (int i = 0; i < argc; i++) {
    int nbrToTest = atoi(argv[i]);
    ft_print_combn(nbrToTest);
  }
  
	return (0);
}
