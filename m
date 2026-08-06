Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45B830E0E4
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021998; cv=none; b=cbODOLOTzaEFYy7ufXa0eEZ8M1u4yO9cZvUZjR/pyB5iNDf69QC4XI79MrUzemJel+uVyzEeB1KUeWm6KOjCjaBEoZ/irT/1sYKQktltRB758seP/bj1084YQ4QK2715Jigf68ak+osAtoqartOfr8OWjfiXRLgfukRnDvGYhZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021998; c=relaxed/simple;
	bh=ea/l9qaCxmktI4GUQ+iKzm+ys/VHdmmQkt6JhV6x93I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2MIw16ODQ1niSyxOb88dxS9WNCY+cxqrkftmeCjEiNDmA+0Z6BnYsWuM01OIPRYtdzcXZCbNkR8Dajm8jEg0CDVrxGDIJaX20rAKspMBB/0t76+/cmiUFLWe9WIlv1RpkNe3AC9tzwLV3wIqHTCWPhMUbvODQCNeWfIwCTCMA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=PV/jUhcz; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="PV/jUhcz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1786021992; bh=ea/l9qaCxmktI4GUQ+iKzm+ys/VHdmmQkt6JhV6x93I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PV/jUhcz8Uka8Aih06l0gcLsS5NvUdTL/yS69ApvpETEoWAsL5WvRem0nrJs7lHxP
	 vwBTjsX3yGxYXvZsckyIvuE/4EOu1irf358YOLTVfaxPIvGC5iZ/vBYCofQWPmENhn
	 wsfdSToQ4af1nYZvYBiQCoLQmAg/RryTrPh0g9bzCNZINE/RgaWzOSc3iiocdQOB5k
	 00YMvJJysfN2+DLfeugttvVP9mn6J1dPMRAXZT4krg37qI4RRwHFbpMzl5SFnuQKuq
	 qlbeDt6ge7LBD2TI3fXyc88UXoHzEgTjNnjK1a+vWrkJjJGbWv616hLejuMW4ez/kl
	 2F4cBsj73iicg==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id CF96A40A39; Thu, 06 Aug 2026 14:13:12 +0100 (BST)
Date: Thu, 6 Aug 2026 14:13:12 +0100
From: Sean Young <sean@mess.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Johan Hovold <johan@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, lvc-project@linuxtesting.org,
	syzbot+237c754233330b2bf565@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: redrat3: fix use-after-free in rc_dev_uevent()
Message-ID: <anSIaB1bLk_2jFOJ@extorris.mess.org>
References: <20260806121021.25156-1-dmantipov@yandex.ru>
 <anSEMRFIW1LGz5mC@extorris.mess.org>
 <a78eff76-dccd-4f3a-9487-abb511bd44f3@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a78eff76-dccd-4f3a-9487-abb511bd44f3@yandex.ru>

On Thu, Aug 06, 2026 at 04:05:25PM +0300, Dmitry Antipov wrote:
> On 8/6/26 3:55 PM, Sean Young wrote:
> 
> > you need to call rc_allocate_device() before you call redrat3_enable_detector()
> 
> If so, 'rc_unregister_device()' should be called immediately after
> 'redrat3_enable_detector()' has detected an error. That is,

So this problem is already solved in a better way by a patch I wrote which
is already out for review:

https://lkml.org/lkml/2026/7/29/1730

Sean

> 
> diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
> index 3f828a564e19..d2a805dbd3f3 100644
> --- a/drivers/media/rc/redrat3.c
> +++ b/drivers/media/rc/redrat3.c
> @@ -1111,13 +1111,16 @@ static int redrat3_dev_probe(struct usb_interface *intf,
>         /* might be all we need to do? */
>         retval = redrat3_enable_detector(rr3);
>         if (retval < 0)
> -               goto led_free;
> +               goto rc_free;
> 
>         /* we can register the device now, as it is ready */
>         usb_set_intfdata(intf, rr3);
> 
>         return 0;
> 
> +rc_free:
> +       rc_unregister_device(rr3->rc);
> +       rc_free_device(rr3->rc);
>  led_free:
>         led_classdev_unregister(&rr3->led);
>  redrat_free:
> 
> Dmitry
