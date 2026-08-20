Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AAC415B62
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221895; cv=none; b=tbyEQtNJ8O2HreeVG3+IfgacJaaQcSS4EvHu62x+e02LnEkjulF5oECy/8dEQOJUhNFs2miMi1HqUThxkOirjHApIt3vGa3VwVWKu3JPbfFS4+jPxoIgcC4WrE+Hgfq2Jia++yRhC805Tbi+EG+sYtwFM+I9S6oeTUilkAUO/CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221895; c=relaxed/simple;
	bh=C6fK7LBKbrFygwVhO/77jAB48+YWk938Y0HiYcbWDRU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDrEEcc3jpfhcIcJ8ypCwyfJZiFk7Fk1WJ120zqZzDZ8FmS9L6yXGoZTUYKwUY3c5sb+WjhYqkvyvn+rbc7SDrGPNpxdWNuGRaet31UnofwYjS3xUJpbmeAjPCIKB2exjkArvbz7tmmuCFJvTKm45XPigBc9kLtq7PAPodShLPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alw7CU7d; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alw7CU7d"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4998590d392so18464655e9.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 03:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787221892; x=1787826692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JmNPY02cVo/U0I4x7MQpmeXuTddemXfkDW0UPzRYQpE=;
        b=alw7CU7dSQaG02fI722eA6mEMOx0R4bwdOz32+hSs/u9pNTRUEu13QrgI+gA0OJ4Ot
         poMCViCSs7rZeybe8vnzVREeO1ZbcVFnPraJtS/zmD6tXzz4PtGPcea9qZflXCFeCh/q
         v9B8O/LevqdD5vqD2H6Dp+yBgeVuRs3AFXVZLSnJ8R0AjPwQTPbcRHR7jUxCJ1alFK3b
         nZ7oamALGY1mEC2sgdmSlEhG1g+uvdgvLyE4o1ebWUTZduSpVJ2dXPkHpcH03iOp8s8m
         /xgDlx0kwfhu1qoiCmkv+bI//+UXPFjZVZeru20F8prDb2mX42ynP5nITrkItaaED/o5
         GOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221892; x=1787826692;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmNPY02cVo/U0I4x7MQpmeXuTddemXfkDW0UPzRYQpE=;
        b=pp9EDUjlV1IO7v80kjQuMfk2n10Xdn5UgdbqUsG/9lK40h3hjQMixtTeiE64Silsli
         4AqQPSdEvcvH/R8LEJ8z89HC88d+5ERMaiKHgJvlMolMnyv9y0MEeQSWH4zQoPv8D77+
         0jkFGuy32mNmSrO4awg5CUt/Drhi3P0VI9JFbl04HErrki9o0RiCtgZfIkxtaCqezKgq
         aqyZ8mQh8Pg1mxFx+efaYr7Jpn3t5M4h6UrSmC3Y6FVLURBCz7PDxrcF/T3gaT+SPr/Q
         lu/LMkGZ0pdWE5h3Z95AElO64GH7p+m7TreP3MngWzFJocis15A09hZEnqTRk+XdjTdB
         6UsQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVO0UdRsdyjm6G8USGfoO5zr3+PwrqRJ854g0RI3gMIbHImntnZ/B29DclNthrH3NFnz9K/ln1DMsEKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaNODt/UCkJklQVDkjLgRJtd9wlrK6M8qj0p35BOAlI0+8oMga
	JhfDM0WXHiUNtU94eAz6nSZzkYMlyxqPtV6hZXcAIMF7RKQeexAM0qeV
X-Gm-Gg: AR+sD13UdDtSa9huLwxc5gF+BXkZSyGLxOMJHqb+SycOJDXC19+yWHaEVcgC8jtQ4Yq
	z8ycnYWmmgx4xZIwU5bX6AwP7mytrc945BmexwkO6uuQrqJVP11B8Zqxcy1o8yBWa2paF3IJr2r
	GYqyVDUQh/dKiLcgqiyERGOgdATV6CWs0JLX3LK1yd1Pf9pASd/naVDF8dp4IrtWIhqYROUz3W1
	xPjx/hqcKED53bSnPDiPfTzfhYUWNjpkYpDwIYjV5J/VovFE9BVODBOpW/pVH1tsQ+g3m49a67w
	Q9rSKNOlNaO18LKoc9/oIcm25EdFSVwaHcIHT5PNfy61pS1K4lP1hWZ4Y6Z4qjZrxQIHS/u5Sx6
	XdekyEvL5yEPoetilfwRcYwoTuCjD3dCPtAdsegwxlmKoNBll04tJllrJ+40rF3gRoJlZxbMps0
	WD7UJm0BgGidGSnUR1uGneOQ+BRdpTHID0Ikvgm4aTaFwjH3R27ojCtsZjfKJwvibopPUWLDE5s
	CJZF95PJkTKG0lA3vEDVkkOoQ==
X-Received: by 2002:a05:600c:5291:b0:495:4fd4:619b with SMTP id 5b1f17b1804b1-499aa189357mr212082575e9.1.1787221892198;
        Thu, 20 Aug 2026 03:31:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e78496sm148819115e9.2.2026.08.20.03.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:31:31 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:31:29 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: noambs2999@gmail.com, ribalda@chromium.org,
 laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix integer overflow in frame buffer
 size calculation
Message-ID: <20260820113129.299aa918@pumpkin>
In-Reply-To: <20260820091339.42288-1-natalie.klaus@runtimeverification.com>
References: <20260818092803.4f51e6dc@pumpkin>
	<20260820091339.42288-1-natalie.klaus@runtimeverification.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Aug 2026 12:13:39 +0300
Natasha Klaus <natalie.klaus@runtimeverification.com> wrote:

> On Tue, 18 Aug 2026, David Laight wrote:
> > I'd bet there is a requirement that width*bpp is a multiple of 8 (or even 32)?
> > You definitely don't want the divide rounding down!  
> 
> There is no such check. bpp is a raw descriptor byte at uvc_driver.c:405, and
> wWidth is unvalidated. The rounding is pre-existing, c0efd232929c has the same
> /8, so it is not a regression, but it should be DIV_ROUND_UP. uvc_driver.c:431
> already uses it thirty lines below.

I'd guess that the only values of bpp that have ever been used are 1, 2, 4, 8,
16, 24?, 32 and maybe 64 (for 16bit colour).
Anything else won't go through a hardware FIFO.
Similarly the hardware wants to do a whole number of memory reads for each
video line - otherwise it all gets hard to get the porches right.

> 
> > > +		if (bufsize > U32_MAX) {  
> > Should that be >= ?  
> 
> No, U32_MAX itself fits.

Brain fade :-)

David

> > I'd include the bpp, width and height values in the trace.  
> 
> Agreed, will do.
> 
> I am carrying this as part of a three-patch series at Ricardo's request. Will
> fold in the rounding and the trace values.
> 
> Natasha

