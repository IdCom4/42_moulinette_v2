/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_param_to_tab.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: idcornua <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/07/10 03:21:38 by idcornua          #+#    #+#             */
/*   Updated: 2019/02/06 12:26:48 by idcornua         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "stock_par.h"
#include <stdlib.h>

int					ft_strlen(char *str)
{
	int					len;

	len = 0;
	while (str[len] != '\0')
		len++;
	return (len);
}

char				*ft_strcpy(char *dest, char *src)
{
	int					index;

	index = 0;
	dest = malloc((ft_strlen(src) + 1) * sizeof(char));
	while (src[index] != '\0')
	{
		dest[index] = src[index];
		index++;
	}
	dest[index] = '\0';
	return (dest);
}

struct s_stock_par	*ft_param_to_tab(int ac, char **av)
{
	int					index;
	struct s_stock_par	*s_tab;

	s_tab = malloc((ac + 1) * sizeof(struct s_stock_par));
	index = 0;
	while (index < ac)
	{
		s_tab[index].size_param = ft_strlen(av[index]);
		s_tab[index].str = &av[index][0];
		ft_strcpy(s_tab[index].copy, av[index]);
		s_tab[index].tab = ft_split_whitespaces(av[index]);
		index++;
	}
	s_tab[index].str = 0;
	return (s_tab);
}
