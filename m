Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FE6225A38
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021335; cv=none; b=DpJkWTvKfxlo3mBK+o/mYikQfde8ST1IXNsQQaVj8GUtgm5tNOukwG+12Tr5ShGLtbex+l1HMkllmQaVZhynoVdJNRDiOOALCot5Wnb0j1wfCobDyjvK6P9+vZYvCq8HQmXmUoyZOAjVQUT7/XzN/zD33bst6EvWHy1wPixUl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021335; c=relaxed/simple;
	bh=JTfVOL8sd8GuTCzt9WIblWrUZmMAbBDIt8f8xlWbOS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtqPhdmi574iuN+NLNe44lW/vxFow45YruJ4PZPjkcgiVcI8SA8PfLJN6f1gLkNqLJ1PfTy1/367HeFrirm0qPPBt3+3ivAtki7nQ8tW9lTOhZvj68Vg7XaBkpdplghrPFNsopBXJg2wrT/aiBbtSZDEbPf6cwEHQjldFk1OL74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=NYgaTQTP; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="NYgaTQTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1786020913; bh=JTfVOL8sd8GuTCzt9WIblWrUZmMAbBDIt8f8xlWbOS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYgaTQTPoSJcIOu+MbkkYbsP4rK5Uz6dGMUk8x4DdG3M+6xTKyjiYPRXBbTGjLp/5
	 BYBeFr5C9TRVNw4h3sT4X8m/w/M2qDOyR0W9fFz7KCeuUuQTZwiWIfJy97XI+BAI8W
	 4Iol9l+WyzYEIsrBrqWKNBun8uJc04AVBZAMxaCa4pPAsTjHSO7liH5a2KeInbbF46
	 qbR93WMCcPWFlBoomj7zJee2A4ZVBvFBSRJ2xHA3XK39K7R4ln85+Ps6hOY1hRwK8G
	 wT3b2XD8PWzBFU6nWtxAmGVXoS/VCdQLdsFdohzfWF8kbuhw3uZ25uNptIjPks+gkJ
	 WsqNphh4WcKzw==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id CE3D740A39; Thu, 06 Aug 2026 13:55:13 +0100 (BST)
Date: Thu, 6 Aug 2026 13:55:13 +0100
From: Sean Young <sean@mess.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Johan Hovold <johan@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, lvc-project@linuxtesting.org,
	syzbot+237c754233330b2bf565@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: redrat3: fix use-after-free in rc_dev_uevent()
Message-ID: <anSEMRFIW1LGz5mC@extorris.mess.org>
References: <20260806121021.25156-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806121021.25156-1-dmantipov@yandex.ru>

On Thu, Aug 06, 2026 at 03:10:21PM +0300, Dmitry Antipov wrote:
> In 'redrat3_dev_probe()', it makes no sense to register the device
> in rc subsystem until it is completely initialized (i.e. passes
> 'redrat3_enable_detector()' successfully). Otherwise the device
> may be announced as ready to receive events even if was freed
> by 'redrat3_delete()' during error recovery after probing.

I don't think this fixes the problem properly. First of all, you enabled
the IR detector before rr3->rc is allocated, you will get null deferences
in ir_raw_event_store() in the usb callbacks. So you need to call
rc_allocate_device() before you call redrat3_enable_detector().

Secondly you need to explain better how this patch solves the problem,
because I don't understand why it would fix anything at all.

Sena


> 
> Reported-by: syzbot+237c754233330b2bf565@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=237c754233330b2bf565
> Fixes: 8a21ec9bb3ec ("[media] redrat3: fix error paths in probe")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/media/rc/redrat3.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
> index 3f828a564e19..34ea8fe9aa18 100644
> --- a/drivers/media/rc/redrat3.c
> +++ b/drivers/media/rc/redrat3.c
> @@ -1102,18 +1102,17 @@ static int redrat3_dev_probe(struct usb_interface *intf,
>  	if (retval)
>  		goto redrat_free;
>  
> -	rr3->rc = redrat3_init_rc_dev(rr3);
> -	if (!rr3->rc) {
> -		retval = -ENOMEM;
> -		goto led_free;
> -	}
> -
>  	/* might be all we need to do? */
>  	retval = redrat3_enable_detector(rr3);
>  	if (retval < 0)
>  		goto led_free;
>  
>  	/* we can register the device now, as it is ready */
> +	rr3->rc = redrat3_init_rc_dev(rr3);
> +	if (!rr3->rc) {
> +		retval = -ENOMEM;
> +		goto led_free;
> +	}
>  	usb_set_intfdata(intf, rr3);
>  
>  	return 0;
> -- 
> 2.55.0
