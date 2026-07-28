Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EE3390228
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785257593; cv=none; b=FXS4qw4SNlrDwZnh+LeQQlXvBvDw7AE+Rw1/nimu/pji1YK9l8/eSukK/eu4GJDt/5Z17X8+YY7zABNArtPWEb/4i0Zj5YrybL7vFRljd14M7U9e6p6RBr0tM95pn3JX88v4yVhf/RExusUqrUxQzl7Nmu4h3h/+qjF+0R8cmk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785257593; c=relaxed/simple;
	bh=7R2WhbE5ZPA5Tz1lCp2qkd0MoEbs+Rw5eQCpJ9fBNuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3YrrQ5VhSjr0ucxn3tUpiAtibPPr7gaT/4VN3gDBiFgh6kSC2MFtQPUZfYV5lq4gyKRdN4wi6kPNWfQat2tL6Qyc36IMfjE/dJQB6n0oqbPI2jSGIYSzfSoUKoDZ7yQmsx50YrOKVC309sAPB3AOVKlmcgBfiLG2h4+XnT3YBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwoULGwU; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwoULGwU"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso61392b3a.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785257590; x=1785862390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcI5M5aVct51iF3mXu2zx6X2XeT1EVhCg461eA+j5Qs=;
        b=RwoULGwU+DAm0Ag1H54NenLL2iSW2YaPftvqkS7UaDAb9JTnymimZKlVhi8yDzoVQG
         nzpy89J59WHN7kNlMHmqDK6wTVpA+CIbt+niCfu1A+cZ+y4lTd8ZoM98CnoyyP3DeQ92
         FK3j+3Knse+7g9evO/ul+0Bi9c12ZorcIVN7icykAhWxfi5aA53IPFrTm5hFTy6fHSqL
         SgR3SSS67Mnmi8kx6L4jlMjzsrcG9iXuQnrwnX5KAi6aqzidUj6IDi+VZ1rAhS/v4z83
         grLr+J7wH1bT83q1pINLRiFG10fapbFJsBYYbUvd8hQzOdxw03aAFKboZdnorYaLKzLA
         yvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785257590; x=1785862390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GcI5M5aVct51iF3mXu2zx6X2XeT1EVhCg461eA+j5Qs=;
        b=MMqNszFBaXTX06Y2llRWT4z1kNCggObOyyTrPfNJkVeR+CuqDBiiuCyDPIvc+J94xm
         vF5uIKTojouEDeOP141wGrOmqq4UkLup5+ChHaihLpvnbpXB3sqTCCRWvIXpb9covlT6
         XBqXYsDv2x/+ZvYE7w7TJVP6i4TOIcP/93Si0/PHlLNOplQ3GcDOGiUgkdb6DLDhteSQ
         aC3urK1vF4g0XiB655uzfLXoIr4UxOQSJtmw8B0pVLY/xhThPX0OmRO4jkzgebqSdNur
         KHYplDpr4BDsaZJs/5TD9Zkw4KRIHLx0YKGTPxu3B3hWKnk9knpuJmulOWk3qeB+oQjb
         DcNA==
X-Forwarded-Encrypted: i=1; AHgh+Rr916vZFV0MuVKVkN3xECkOTLqQijA4FVTv1hv7kl0BqGYtW6QtdH595SCQmmcZTzXZnM6KkJQ9QCqMnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YywoTVdEUAqlSh9rbpBqldfldlS2ztW5mmdUcda8yui27KxroEv
	OphTZWWIIRyG1+Zk/D2Mc0LedtLH7jPWsnVYXQQqPv7YCI+U7XLEl+FB
X-Gm-Gg: AR+sD10bqtZ4/pLg81TC3b27Qw2HfsKTDhLtPau3unYZGvZ6Za/XSNgMzXWMlDwEGk+
	v0iJpstAULbu5dBZu+LhUA0p5nCN3TRJpuJdafa1XygO4yYgn/oX6xO2daatOP1wLLzvHTtPBFW
	KFk9wjR2K1FbTEhSuwVGJdBcWtiTy9KpZ7DBpvXt2sbNUF2jOIlOeGpe+KQrQQbhHioXwFV/5ms
	z9o8UmbqDc3N6DasxGmzuXvaQMGawgpNrictMD8qQ3wIfodlucBNwWx7l9lcjuiL/wGGzlWEmTC
	RIy5Gd9kUuHiYOdfxTe5Kciw4liX89SjI5xemQszTedLXEc3GCRMxfBFYbSINNDqK+rm1V0wFKS
	DV6heQ72c9OFujcgw3Czhy19gO1XunDNbRMT4ouJEFsM4UgvQQ+h2ugams0e/Xxh+tjw0/BSPlJ
	9kVzZ6
X-Received: by 2002:a05:6a00:c8e:b0:84e:89a:b8ed with SMTP id d2e1a72fcca58-84e93345dfemr3425490b3a.70.1785257590271;
        Tue, 28 Jul 2026 09:53:10 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d3182sm197408b3a.54.2026.07.28.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:53:09 -0700 (PDT)
Date: Tue, 28 Jul 2026 22:23:08 +0530
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: media: fix spelling errors
Message-ID: <amjedHeBeC-eNINK@acer-nitro-anv15-41>
References: <20260726065407.20766-1-shaikhkamal2012@gmail.com>
 <amivy2PF7EXVXglr@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amivy2PF7EXVXglr@kekkonen.localdomain>

On Tue, Jul 28, 2026 at 04:34:03PM +0300, Sakari Ailus wrote:
> Hi,
> 
> Please use Documentation: prefix for patches under Documentation/.
> 
> On Sun, Jul 26, 2026 at 12:24:07PM +0530, shaikh.kamal wrote:
> > Fix spelling errors reported by codespell:
> > 
> >   thare -> there  (vidioc-subdev-g-routing.rst)
> >   stuct -> struct (legacy_dvb_video.rst)
> > 
> > No functional change.
> > 
> > Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
> 
> Does this conform to the spelling of your name? Just confirming.
> 
> It needs to match From: nonetheless.
> 
> > ---
> >  Documentation/userspace-api/media/dvb/legacy_dvb_video.rst      | 2 +-
> >  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> > index b9fd5cadae24..71d044605315 100644
> > --- a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> > +++ b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> > @@ -344,7 +344,7 @@ Variables
> >  
> >      -  ..
> >  
> > -       -  :rspan:`5` ``stuct play``
> > +       -  :rspan:`5` ``struct play``
> >  
> >         -  :rspan:`4` ``__s32 speed``
> >  
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index 6f66ca38589e..164cf0ad3593 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -67,7 +67,7 @@ subdevice routing table. This may be smaller or larger than the value of
> >  drivers may adjust the requested routing table.
> >  
> >  The kernel can return a ``num_routes`` value larger than ``len_routes`` from
> > -both ioctls. This indicates thare are more routes in the routing table than fits
> > +both ioctls. This indicates there are more routes in the routing table than fits
> >  the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
> >  with the first ``len_routes`` entries of the subdevice routing table. This is
> >  not considered to be an error, and the ioctl call succeeds. If the applications
> 
> -- 
> Regards,
> 
> Sakari Ailus

Thanks for the review — sent v2 [1] with the Documentation: prefix and my
full name in From/Signed-off-by:
[1] https://lore.kernel.org/all/20260728145252.9326-1-shaikhkamal2012@gmail.com/

Shaikh Kamaluddin
