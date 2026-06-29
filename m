Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428FC1F4C8E
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741836; cv=none; b=nm/x5MFyq230PwqQQqNqOPOgDW0D0aaFfsJhaFzAS13IoGKm8DHid2uFohk5MXaH3vTP7h81zs7kfDiAU7EMfGk/LG6ZbnrnEwM1dgLKgOexf/24E+UrlTDd5eg/0qEt+OwyOS8MTvWhWWeRRBrsI2Cdrhl1ilK2hkMTVSAFdjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741836; c=relaxed/simple;
	bh=eUQy5dIVkGOPF7LgCqRM5et4TAg7d4dNO2DfxVAJKVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fALpAaP0Lx/5SFBxWaAhcPK/TPnNrh0ixHaaua1Vc4xbvdcrOEfLTRhXnw9HIaikq4xhpBdq3c0dqo9sqWYdvPkOAr62hP1tOFiMocqwuxubBPIkpcP5gqo066cQJJN6g2RGzcH2rQYmlz6Zz26gGNi3eXAv/4Ejr7aGKsDpFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XForSyUP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XForSyUP"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A25608D4;
	Mon, 29 Jun 2026 16:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782741790;
	bh=eUQy5dIVkGOPF7LgCqRM5et4TAg7d4dNO2DfxVAJKVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XForSyUPGMN7+8DNu55RkCE0JcWjnalqc6ia/H3Tj9L9tP3q521MY5v5fpA54S8VK
	 D/bYPSuJYJfqYwEhr7yDfhFFPUXzgH4NHXFNc6gxvZ7h/LuRQOMy/VKV1msLY7RW/t
	 x5ix2CPC88K4MngLOLziMYXWqHh3ZTub4/ROruKU=
Date: Mon, 29 Jun 2026 17:03:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: cec: extron-da-hd-4k-plus: add sanity check
Message-ID: <20260629140352.GA3102371@killaraus.ideasonboard.com>
References: <362ab4a1-6591-4715-ad1e-956a65ec322c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <362ab4a1-6591-4715-ad1e-956a65ec322c@kernel.org>

Hi Hans,

Thank you for the patch.

On Thu, Jun 18, 2026 at 01:03:19PM +0200, Hans Verkuil wrote:
> Add check to prevent overflowing msg.msg[] in case the incoming data
> is malformed.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> index 3381d86096a1..3c6ce6f3d93e 100644
> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> @@ -657,7 +657,8 @@ static void extron_process_received(struct extron_port *port, const char *data)
>  	if (!port || port->disconnected)
>  		return;
> 
> -	if (len < 5 || (len - 2) % 3 || data[len - 2] != '*')
> +	if (len < 5 || ((len - 2) / 3 > sizeof(msg.msg)) ||

I think you should use ARRAY_SIZE

> +	    (len - 2) % 3 || data[len - 2] != '*')

This seems correct, but I think the code would be easier to read and
maintain if you wrote

	int len;

	/* The last two bytes are ignored because ... */
	len = strlen(data) - 2;

	/*
	 * Ensure the data has at least one message, at most the number
	 * of messages that fit in msg.msg, and no extra bytes.
	 */
	if (len < 3 || len / 3 > ARRAY_SIZE(msg.msg) || len % 3)
  		goto malformed;

	if (data[len] != '*')
  		goto malformed;

>  		goto malformed;
> 
>  	while (*data != '*') {
> 

-- 
Regards,

Laurent Pinchart
