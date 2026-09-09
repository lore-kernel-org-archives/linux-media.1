Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6710456C627
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964322; cv=none; b=haTWf0BWHyZPsLFDNWN1adVZkK/1k7kRjnnCSR/2SPCrLBOfswtFThZ1CQJdJlInQd0QbFoIKI2AySkSqQkMAsYgHXjh6kPtFbmP2NW+3rUux/iStJacV+ITkNw0J4X2VEMPnGMGvlRiZ9gGgpD83q2xFj5IvRvlc+aExmO4V9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964322; c=relaxed/simple;
	bh=H0H1hw8SsRDMvHudTg+3z2gk2jUTP/bh++42ISR0rpg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=flShozOocR0FJCTOnasYexTiUGBygPrbipLE30Xdy55BLu2kA/CDVIXYjmP69ITDyROwZEWzjuxk56xEO5+g6mm3VLl5xQIeDMqY6pMx/yZcx6DXbuhRzojl30CbJWxMrqDDKkxOgQyGVMAJTt5wwXI9jqGwRQz2yDnrsQYQbmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Szk09mm6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Szk09mm6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9345E1F00A3D;
	Wed,  9 Sep 2026 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788964321;
	bh=i8yehjBTBQgPsP0Z6viHo6j26lBO3149zHczoaQyDSQ=;
	h=Date:From:Subject:To:References:In-Reply-To;
	b=Szk09mm6t5l4UmHBQnocBk7ophBH24sXS0cuziSVFjvkJCYOES8LblpF9myeMSfGm
	 eBMRrr3eDZWkrX8ZzLLjhZ0GatJvlXYCyvK8jU6pkBLsqnTDo3Marb1ptk6/COKtOE
	 mb88EX9q3uuG9+aHkktp5gpGvJuHVXTEttoozWvWlIVXj1YdE3jWwG88L/EGLuvOn9
	 eJ03ixTv/4fxlw1lPpNyOxXBoljOIPEET6+VTcsir8EIUbr8Qjz8I/dzmiQXzlHn5Y
	 o3Dq4VIbwYU7E4GfDwBjAtT2kQl5Mnl5taQvVNLV7d6/DKdltTLkXJRj6hGHoTJQoz
	 wYc1NfBFFT0Zw==
Message-ID: <7c414e45-315a-4ed5-ac08-373f137a8c0f@kernel.org>
Date: Wed, 9 Sep 2026 16:31:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4l-utils] Add missing allocation failure check
To: Sai Vishnu M <saivishnu725@gmail.com>, linux-media@vger.kernel.org
References: <20260717165445.46734-1-saivishnu725@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260717165445.46734-1-saivishnu725@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

No commit message, improper indentation, and not really worth the effort for
a simple userspace utility.

Sorry, I'm rejecting this patch.

Regards,

	Hans

On 17/07/2026 18:54, Sai Vishnu M wrote:
> Signed-off-by: Sai Vishnu <saivishnu725@gmail.com>
> ---
>  utils/common/keymap.c | 11 ++++++++++-
>  1 file change
>  d, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/common/keymap.c b/utils/common/keymap.c
> index 21c1c0b5..b881187a 100644
> --- a/utils/common/keymap.c
> +++ b/utils/common/keymap.c
> @@ -124,7 +124,11 @@ static error_t parse_plain_keymap(char *fname, struct keymap **keymap, bool verb
>  							struct keymap *k;
>  
>  							k = calloc(1, sizeof(*k));
> -							k->protocol = strdup(p);
> +                            if (!k) {
> +								perror("parse_keymap");
> +								return ENOMEM;
> +							}
> +                            k->protocol = strdup(p);
>  							k->next = map->next;
>  							map->next = k;
>  						}
> @@ -399,6 +403,11 @@ static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot
>  			struct protocol_param *param;
>  
>  			param = malloc(sizeof(*param));
> +			if (!param) {
> +				perror("parse_toml_protocol");
> +				free_keymap(map);
> +				return ENOMEM;
> +			}
>  			param->name = strdup(key);
>  			param->value = value;
>  			param->next = map->param;

