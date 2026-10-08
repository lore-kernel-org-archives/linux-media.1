Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37CC3AE6FB
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 06:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442064; cv=none; b=m/b3+7EvvQ/gZmJujdmS2Gdw4cXyXLdM0soPaWSMDBMWivBNkQ+4QXZEh0Cova4+lWtXncOAPgnLC6kMrASnLjGgsKAdjfbXc99/TnGdjmrt42jMtjuN3jfmPQVt9BfLk8oHewrrP4/OHvaa1nWKhc/357FpgoNMsn0YVH3ObEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442064; c=relaxed/simple;
	bh=aSPhb7m37JJIpoDkFdsuy/s8Yx6Y8o2Wuc+YdzLkbDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FHdmOk1zL97DbZerB5uwNcAAPfsLXdLQT6fzlJb6vzLm0gZwdeSluqe4o48z8C56ovzTL5tFuCRT5LxYNMqCdU1cNqDkwF6K1G2N7zsfcc3qgkCU91akxmVdCas0lGO/9Z6PoXaicbHTC3EA2FOwxQjhox6m7YTKFoExU8rQxYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CUKGpUl1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CUKGpUl1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e2de97b4d2so21096685ad.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 23:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791442062; x=1792046862; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSjhmKDAna0MFV1NJVV8j+rU8jCUwUZHyKcOgZTfTBo=;
        b=CUKGpUl1Zqcy6Ia35PQskFQCzOxWjd3JntCL7h+h5eoQrR4Wc6syTUzQxgM7sNeDy+
         jD6GEyL9CcvG8QpTBgHEx25l01BWccqMW6wx5qthdy4Itjl/V+21nvTdA4dcwDYOShty
         Xx6xY1SwlH0XGDzKZhQxxX15QTWh/FmogRZu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442062; x=1792046862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qSjhmKDAna0MFV1NJVV8j+rU8jCUwUZHyKcOgZTfTBo=;
        b=2e87wgqgas4ikF8TLs+v1Xiy/PS6ExW7k+24rlcLAFg9dtpX/HNJvNGruMbHaPOxpt
         oBLsca/3kkxDNsQmw6HwJ6UkG8B5k4E/phzUn1TYLvYmjq0LJbH4lVkej7QC0Oolqkvs
         I6lREEDm4UM+hdV6/cujHmbS/UDTS7fbsq3TcgcVObFs1XoRsbXBk7l0qnNE4/Dl8e7s
         zWVRxySCUm/WoIou3NW9UOpQGXFpva70KoFT1kMYlOGFnKNfUY8PKmXb4P2V66AI9BZz
         cyejOpc+C380KXZc9Qd/NoDf8wxzpMNzN1I3JFL37EF3vErfyFj3P9MKLa9mEaMNrDDT
         xHcg==
X-Forwarded-Encrypted: i=1; AKwUvBx6H1gYX/QRWIf0SeQ81H01jNdPDS+F4UUQqqI8KFYgqbRrAfFOgMlw+XdImalV13r/d7BAJdbYVKYu6Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPU8Wk/JxC1GsC0deBw7yKRCl6jh00jrqvRTMWfrwygl73hgXE
	G2nTBeu6GavZCjAauaKaFksjDE3cYkgH9l4PiMDzdZ4zp1Qn5+AgA2Tt9KSfjhDAT/4Av2XXj8v
	Yf/Vppg==
X-Gm-Gg: AYBFou1tP3/M085XOB5JT08tFI/1jNV4vYpmfbsHrhfG43znEtMSOU7RQlHKwGactKV
	iGmFXG3vMi4PSdmfugG4OKWQgER72YDio3IPPyZyHfUnXGJjuY3L3IoVmjfPps4ihNZmG5z+dNN
	j1gN6tGRgw3kpXHUZweKJcciYkazF/zTDS7Ym2nJVhHN9jI4zsBhx/9FOyr6LDigGUSlXpDhDR4
	yCR5OknNg0iBrspekoUZ7TAvEHHhCMVlbW8lndbTCQypRnbdvmSBTtKL6OYhvzKYRV2IJR0Rvqc
	3T0lpWCsUBnnj2XHJ3DRJeJnYuVpl8lxH1eqjnjJg7KSDXBwDnIJ8gUIguRNicBpnPXLYsMjz9h
	4kbg5IMSC++FuVBB2YW7Lfm0H3GRSqn8N1pfiVl1S+zD3TxW4QgurdK6gR6P0JnIfElpRtTuH1U
	3Bku1Xbajw2dMCs5IwxV4EacCrlxVndzPx+LIW6DzVJL3MIiaj/7813AfR229lJADE7eIcmZxR8
	EMMPc2SIgYHMHbixux9ZvmwK4PP8gueI5Y=
X-Received: by 2002:a17:903:1ac8:b0:2e2:c602:2072 with SMTP id d9443c01a7336-2e6004ecef0mr39976775ad.36.1791442062114;
        Wed, 07 Oct 2026 23:47:42 -0700 (PDT)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com. [74.125.82.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60483067bsm20825045ad.53.2026.10.07.23.47.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:47:41 -0700 (PDT)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-141395927feso4178057c88.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 23:47:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxljrJkMADR+ecAXg7exo/b+nsK0kia4pzOMyH2r3KbCZC8RZk+ZFiAVz5TVNWaVh/4PCObDbN+5nau7Q==@vger.kernel.org
X-Received: by 2002:a05:701b:241a:b0:141:52e3:8607 with SMTP id
 a92af1059eb24-162044c0816mr5535095c88.11.1791442058711; Wed, 07 Oct 2026
 23:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aq0siVcghDe6x9cs@stanley.mountain> <20260928203105.GJ4406@killaraus.ideasonboard.com>
 <artM1Kqi41JfNSGg@stanley.mountain>
In-Reply-To: <artM1Kqi41JfNSGg@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 8 Oct 2026 08:47:26 +0200
X-Gmail-Original-Message-ID: <CANiDSCu_RCHXU+0PuELbGci7EKoxGQgwTGVyw7W_KVjv+Pr0sA@mail.gmail.com>
X-Gm-Features: AclHuK-6lBsfZibyY1EbZnPcvBxs95w1QCFOQo0ockAUH-Ktg6072cpe96FFZXQ
Message-ID: <CANiDSCu_RCHXU+0PuELbGci7EKoxGQgwTGVyw7W_KVjv+Pr0sA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in uvc_mapping_get_menu_value()
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all



On Tue, 29 Sept 2026 at 07:30, Dan Carpenter <error27@gmail.com> wrote:
>
> On Mon, Sep 28, 2026 at 11:31:05PM +0300, Laurent Pinchart wrote:
> > On Fri, Sep 18, 2026 at 03:20:25PM +0300, Dan Carpenter wrote:
> > > The "idx" value is a user controlled u32 so we have to bounds check it
> > > before calling test_bit() to avoid reading beyond the end of the bitmap.
> > >
> > > Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> >
> > What's the status of this patch ? The issue is a false positive, do you
> > still think there's value in this redundant test ?
> >
>
> No, it's a false positive.
>
> With how Smatch works, I don't have an easy way to silence it in Smatch,
> but I'm going to publish my AI skills file for reviewing static checker
> warnings.  Also I've started writing a new tool to help filter false
> positives.

Even if it is a false positive, I think it is a good addition, it
makes the code more robust.

Do you mind if I make a respin of it with my comments (keeping you as author)?
(Or if you want to send a v2 that would be awesome as well :) )

Thanks!

>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda
