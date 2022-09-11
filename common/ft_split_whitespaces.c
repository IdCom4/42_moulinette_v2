/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split_whitespaces.c                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: idcornua <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/07/09 22:05:46 by idcornua          #+#    #+#             */
/*   Updated: 2019/01/22 12:27:49 by idcornua         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

int		ft_nbr_tab(char *str)
{
	int nbr_tab;
	int index;

	nbr_tab = 0;
	index = 0;
	while (str[index] != '\0')
	{
		while (str[index] == '\t' || str[index] == '\n' || str[index] == ' ')
			index++;
		if (str[index] != '\0')
			nbr_tab++;
		while (str[index] != '\t' && str[index] != '\n' &&
			str[index] != ' ' && str[index] != '\0')
			index++;
	}
	return (nbr_tab);
}

void	ft_new_tab(char **dest, int index_dest, char *src)
{
	int len;

	len = 0;
	while (src[len] != '\t' && src[len] != '\n' &&
			src[len] != ' ' && src[len] != '\0')
		len++;
	dest[index_dest] = malloc((len + 2) * sizeof(char));
	len = 0;
	while (src[len] != '\t' && src[len] != '\n' &&
			src[len] != ' ' && src[len] != '\0')
	{
		dest[index_dest][len] = src[len];
		len++;
	}
	dest[index_dest][len] = '\0';
}

char	**ft_split_whitespaces(char *str)
{
	char	**dests;
	int		index_dest;
	int		index;

	dests = malloc((ft_nbr_tab(str) + 1) * sizeof(char*));
	index_dest = 0;
	index = 0;
	while (str[index] != '\0')
	{
		while (str[index] == '\t' || str[index] == '\n' || str[index] == ' ')
			index++;
		if (str[index] != '\0')
		{
			ft_new_tab(dests, index_dest, &str[index]);
			index_dest++;
		}
		while (str[index] != '\t' && str[index] != '\n' &&
			str[index] != ' ' && str[index] != '\0')
			index++;
	}
	dests[index_dest] = 0;
	return (dests);
}
