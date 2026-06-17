Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9EB386554;
	Wed, 17 Jun 2026 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687032; cv=none; b=sNfdiAMS+eNkGNlaG3SNTkOgZ8sZle6iTfj89459RXJhuuLM+Cp2bYOw4I9wUfaZhvuBTJ1UqfYD208ZEhDqkcj2D9CdofNvL5kkiNuxTeETaXYhsnmSJuCK34/wm+zpHOG3bmimmd1p7EFMaewYPe3C1DB8tLUX0P5hEtRzfio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687032; c=relaxed/simple;
	bh=RuBhSUd1sPUhRS5hIhwi4P72gd0Xt2OZAblFkxTvZoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4Zzah9yis46Lq97WMn9GPqqVyQ/a9GlFxwa8/VTJ8epN894mdkI3me6xZc6vsBGdG+jR/6jFlK9UV1dm9xsN0XgokAa81w2NU+dzVW/o157HV9yDthvKeDgeMHfYFwJMrYbSah96aEhk0AxyYs9HTE1h06sI+BtZA2SiuFbLQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=ZqvTpH0x; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="ZqvTpH0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1781687022; bh=RuBhSUd1sPUhRS5hIhwi4P72gd0Xt2OZAblFkxTvZoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqvTpH0xNorYMaUDvnGbmhFX4/vu6GJttqH32x6gCqd4K5zl2807BVHYJA0JlscNV
	 k96li/l7XynKMdCpEk9R9mVli1e+9dXLCVjX3U6EH5Yl8/p+8AquRRUwLNbqZC3KGt
	 HU7twVJiq5dVbUs8hmniFRIWKFsibm+joYWYcotP4bpNTqSeplOX1Pu2kNGnBm676S
	 1lP9uQsXWORXeLZi9XahWZIFdYrVAgzClc8mf7x2xjZifi12syHZHYNd30jWSkakg/
	 sxnV9hSTWRKgkjSEqzYC+DSxsyOS/SKsokZGShMpRsNgyUO1hILioZMGzXx2h1zNa9
	 Qmh3jFHtBLQVA==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id EDB904017A; Wed, 17 Jun 2026 10:03:42 +0100 (BST)
Date: Wed, 17 Jun 2026 10:03:42 +0100
From: Sean Young <sean@mess.org>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	syzbot+2599e08a22e4565ea9f9@syzkaller.appspot.com
Subject: Re: [PATCH] media: rc: igorplugusb: Fix wrong pointer passed to
 usb_fill_control_urb()
Message-ID: <ajJi7gOLB610UYMR@extorris.mess.org>
References: <20260616214334.36525-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616214334.36525-1-mokshpanicker.7@gmail.com>

On Tue, Jun 16, 2026 at 09:43:34PM +0000, Moksh Panicker wrote:
> ir->request is already a pointer to struct usb_ctrlrequest, so passing
> &ir->request passes the address of the pointer rather than the pointer
> itself. This causes usb_submit_urb() to read garbage as the URB setup
> packet, resulting in a direction mismatch warning:
> 
>   usb 1-1: BOGUS control dir, pipe doesn't match bRequestType
> 
> Fix this by passing ir->request directly instead of &ir->request.

Already fixed and merged upstream, see commit
171022c7d594c133a45f92357a2a91475edabe20.

Thanks,

Sean

> 
> Reported-by: syzbot+2599e08a22e4565ea9f9@syzkaller.appspot.com
> Closes: https://syzkaller.appspot.com/bug?extid=2599e08a22e4565ea9f9
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> ---
>  drivers/media/rc/igorplugusb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
> index 3e10f6fe8..b5117ee9f 100644
> --- a/drivers/media/rc/igorplugusb.c
> +++ b/drivers/media/rc/igorplugusb.c
> @@ -184,7 +184,7 @@ static int igorplugusb_probe(struct usb_interface *intf,
>  	if (!ir->buf_in)
>  		goto fail;
>  	usb_fill_control_urb(ir->urb, udev,
> -		usb_rcvctrlpipe(udev, 0), (uint8_t *)&ir->request,
> +		usb_rcvctrlpipe(udev, 0), (uint8_t *)ir->request,
>  		ir->buf_in, MAX_PACKET, igorplugusb_callback, ir);
>  
>  	usb_make_path(udev, ir->phys, sizeof(ir->phys));
> -- 
> 2.34.1
> 
