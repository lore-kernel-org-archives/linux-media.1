Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49C2376BEF
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 07:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124693; cv=none; b=G3o9SoL68Zif4lnqKN0M0TWuYlmzy4l5pCmgL425SJimPOYBjoVok98W/2HSrZ/egS8uaTgsKPIOz44AMLbDMQRMbBwvavMMGoh+8MT5QMunmKY0yKvJFopww9EABuQTn5C37SCh60O/ghgKmFez1eMj7H5vFnPW+xbJ2TxQbmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124693; c=relaxed/simple;
	bh=QW5hx3/agEXiOLQdfq+fLrEgpdD4UZdxo+hRkmcG2zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFXpyKEzma9Q13Vo+wD/vPhzIPsCs7CPydJBkY5iEPnx3SSUvN46UraWtyPBQVKmm4uw4/c/H0/xLJf7O91aAnjhpAoYJ9gO4CUo9W7cY8z9bVDQbUQp4vPJcJEhqq7SbgOPT0Uog8G7UlAllglIwaPtHOBhLDVm89R3itwSwtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=jb91zmcU; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="jb91zmcU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1787124686; bh=QW5hx3/agEXiOLQdfq+fLrEgpdD4UZdxo+hRkmcG2zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jb91zmcUQhD9E9hMx9gHYW9gk5vaUjErbyDA3mknmeojiX4pZQSLzOGB34fQb7hag
	 /oW5As1fSA7BOtPyjlFXZRZW5mlbbuZYNNmlFjcoBEbtenWwDtn/Qoi5G1lM6menJ9
	 9X+Rf2pWGzmZrE1WFq+BaA1HN3AVnK7JWnVltjEZ5w8yBvJykqRsl65+UKzraw1diG
	 1bsHSS8C/Fxob+hFLVo7OLZK7gR5vWUFuJFNf6EIYc3GvkImMngOaO/7vJh9mjrOsP
	 mo8WFmFGchPpPUvaERQfnPGH/rHp7UECp3tV5RTlxqFWBIwCzRzaZSyBI4mRvFaAE0
	 6yVrLAKOzs8SQ==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id 8EC2F408BB; Wed, 19 Aug 2026 08:31:26 +0100 (BST)
Date: Wed, 19 Aug 2026 08:31:26 +0100
From: Sean Young <sean@mess.org>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: rc: rc-ir-raw: drop useless decrements in
 ir_raw_gen_{manchester,pl}()
Message-ID: <aoVbzp0cn1euNa_h@extorris.mess.org>
References: <20260818203832.46030-1-s.shtylyov@auroraos.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818203832.46030-1-s.shtylyov@auroraos.dev>

On Tue, Aug 18, 2026 at 11:38:30PM +0300, Sergey Shtylyov wrote:
> In ir_raw_gen_{manchester,pl}(), the paremeter max is usually decremented
> while checking it for 0 but sometimes that action seems fruitless as max
> isn't used afterwards -- drop the useless decrement operators...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
> ---
> The patch is against the next branch of the linuxtv.org/media.git repo...
> 
>  drivers/media/rc/rc-ir-raw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
> index ba24c2f22d39..ed494be8896f 100644
> --- a/drivers/media/rc/rc-ir-raw.c
> +++ b/drivers/media/rc/rc-ir-raw.c
> @@ -362,7 +362,7 @@ int ir_raw_gen_manchester(struct ir_raw_event **ev, unsigned int max,
>  	if (timings->trailer_space) {
>  		if (!(*ev)->pulse)
>  			(*ev)->duration += timings->trailer_space;
> -		else if (!max--)
> +		else if (!max)
>  			goto nobufs;
>  		else
>  			init_ir_raw_event_duration(++(*ev), 0,
> @@ -491,7 +491,7 @@ int ir_raw_gen_pl(struct ir_raw_event **ev, unsigned int max,
>  		}
>  	}
>  
> -	if (!max--)
> +	if (!max)

This patch is technically correct, but won't make any difference to
generated code. The decremented value of max will have zero users in the
SSA tree, and will be droppped.

Changing this is purely cosmetic change to the code.

Sean

>  		return ret;
>  
>  	init_ir_raw_event_duration((*ev)++, 0, timings->trailer_space);
> -- 
> 2.55.0
> 
