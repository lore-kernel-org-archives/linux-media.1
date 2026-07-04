Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B460397323
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150259; cv=pass; b=EMVqbaSLdFx8kJU2GNVb9r/shsAXzgojQxerbMrMW6oPokdUIbgXikOmmOxMvH9hNQUyZkF2GaOAA+f7NfeRz9t2Ut0g7YB9HAkSLcqu0CaSpYgX6Uja+NSg1WNsfPrn5mDwp37fzNhyzANywY6VAxTElo07Wb0Y7PKf8XnTGXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150259; c=relaxed/simple;
	bh=TaI834qg6vT1ShXfJtq7GyeHB6LbsfVddYwRPQFFqBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+QlcHWgg+yKq1Wi2eC7juL7LWAvtR16G+AcDsPO7vKT6amalROdDj39khDf3jNhqD9iViyecXVyc11CwQieFFAdMe83aVdm8rTFO0uP1nY9/JDWh1MYZgzg0px45R1ErrgoaV5m3mTVTvOaNz47dxmdSkHE2/DFtPSZlUwVf40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=O+UBR+n1; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="O+UBR+n1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ca70925c25so14540215ad.1
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 00:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783150243; cv=none;
        d=google.com; s=arc-20260327;
        b=gR3WbgrceBZAqWgqXy0JyPLBp0rBanmiYYjdiFft9homsATwVYl9CJYLqasOttSwnX
         37/7I1hOaamstPTyc1BJvINEZxq+b/cOcqGrb1Cf90Y7ZT+65Fg2i20yM4W24WJn7yXj
         b8iEAzKEYNKZ530c4kKsQJsX2GunD9XIurPXEIxsgpxM2otiKhQsWH9QGlwdE3DHmQGF
         1uAj8el+AiIsLgSD2iWrJ2IbKMAhkaAfEgHDbIi5aXPosJv316ZTmEc8ZzkMM6H4e7dz
         uQjW/lSGSkQx8hdMcBDPrVkx6N2rYCx3pdN3VTQ9W0CFDeJDAQ7zaLdo1UvLE86Tft4c
         OTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TaI834qg6vT1ShXfJtq7GyeHB6LbsfVddYwRPQFFqBo=;
        fh=lVAUDrkaMBlPV63kKFh6q2HfptBUAURqTFzF/dJfw58=;
        b=baPimVtJqthM1ZQNCSHmlSL33KHLdb0qE2sse6Gu9dO+rsCL3fQIYcSa+dk3HnzfxR
         nqxyeSyz5PgslcJe6bLkL93tmH1U0vsuhyycPYwxmH2sWXbG65Lz+Nx7lN1JMG3TJ+18
         73ZJrtjyCDdbWAaKrg9pkhEe3ydIezkR7cp/57q2MjcldCLJ+25Lux6SbgMdjArL8+iH
         Su3j0+Hre8SwXWVo6mKq5HeWUgUQtw/9oEj8yOg6sl6mKrY3cnx/HFSTjEFI9fD8YbB9
         tdNQUj35ZrZ2GWGhMGPTVTEeHHHCFiQxeZFVqSnbA2RHmR4K/NF0JAvwg86v83+Sgd4Q
         k5wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783150242; x=1783755042; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TaI834qg6vT1ShXfJtq7GyeHB6LbsfVddYwRPQFFqBo=;
        b=O+UBR+n1LD8ziknnHF85th+r7WPRM6jvM6HjDEPIPPu0XmmsHuNHO5fHrSYSOXJwfR
         mR9yqKDXipxTRwhcKOCYwPjBICq53gGKwP2jMaqesxt+HGyV2yvRnmw2uxysxtSDKqUr
         7zgQjdjwJiJGbozAXU5o1qxusOH6Cn9Hux/RopCUvYW3pYJSLkaW+yYMY/Fz2cz+BKas
         ZFsJS2RVJFZ4EBopyPtUEmRFM+qCADWv63zZnWH1nz2RBWXP08kVDA+y6A0D5BeefTzh
         J3R/TVoNvgn8eL/q3Kci03+jsp3lCl3JmVgYqSXmVAfMYT4ObWcpb1DTnuGXllXNYYl5
         YrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783150242; x=1783755042;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TaI834qg6vT1ShXfJtq7GyeHB6LbsfVddYwRPQFFqBo=;
        b=AFaMUedAs5Cn2IWP3fPnMGmUnAWdoA5XjFVOfB+zwme3Zt5LSW6x8YIgxTWaJ/ZFXk
         7o11GbWBPhnZmFdNDsa68zT4cyDH8aK4jtYqw5quCoxqH42Ll6SC2iveTrcqP7MARzAP
         Y+vUzs9pCvJ1ome2rpbVWHJi47aJcVVtQKih/QN/Sh+UgEm/d2hsrPtRUEuyh7O5c4HD
         PIDzLlHipZJMPHgsxsk9UNyhHUEgkuxEACnqcq0Ilt7xNLFLhJhGP8Qtrz+Ba1W90wix
         8XpQcMmAgKOSfGZOdMX6/JZieLbX6TgO5FNpzLhDWOlsD2bFuD9AWnr0HgXcYu+zJ5u4
         UwKw==
X-Forwarded-Encrypted: i=1; AHgh+RoyuPKpP4O/y02I/5TxrZZ3D3QnX6e5rxcJTMl5w41RNVCfpmlMW86hdKbDA/pXfw1vdZ5jz8pbcpic1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy352721N0UNe4rvDm1n8WzSK40qryEgz7WPuY0mn1ehBzq4o0L
	qmk5KXbPZjAAiiVy0Jw6pEN8WSK+aeBbnEqoXL9AWgMmOpWz8ZgK3jSoTzIOofMcynkOoJ41rbk
	0S6r543y7H1WWA6NlLi/AuL1hn7alLO93MwrEsZOw9Z0=
X-Gm-Gg: AfdE7cmH91ms6zJsS9XVHlDTESm2Z87dVWnMQS37AUfB/SqEvr1uUmkt+nBcMNwvGvL
	HK9UvQSonRIS+i3zPb0ltEwUjOasxOC3MNXOUIDSFo5+kED6+LGEZRDWPvyBkZoGcjO3ljJ0gat
	vClyiBa/8O+akpmeaGVH91S/9vb6e2khrWY28kZt3ncE6LygAQvXgLvjCd+qAcdetIWMAiBpf4k
	9VjwLnH9TQiPhikXwqig1lUkdowMJgfh+bKefmsSIQrOmRnO5I6VMvg2+z+QNnlAb4SL7oqeJ9M
	maZ0ODRGIYIW/v+/dv9bZJwwtMBNBlTXf8y4jYXhkj7mJxR2aF9XN+tl
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2098 with SMTP id
 d9443c01a7336-2cbb9f008dcmr25071165ad.44.1783150242558; Sat, 04 Jul 2026
 00:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627100119.97650-1-doruk@0sec.ai> <akKdPGsvsMRqE1Hy@ashevche-desk.local>
In-Reply-To: <akKdPGsvsMRqE1Hy@ashevche-desk.local>
From: "Doruk (0sec)" <doruk@0sec.ai>
Date: Sat, 4 Jul 2026 09:30:31 +0200
X-Gm-Features: AVVi8CfO6oXWzOfpwRE_kh_3BfW4G37b8_Hvk6wT7-UtjQBZMaAtl0wGMrjyt-s
Message-ID: <CAPdMp1pipVZqU2RkBWA0E_h4tESOzdHeC1Bc6zeTEo3vzY9j5A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] media: atomisp: validate user-supplied buffer
 sizes in two ioctl paths
To: andriy.shevchenko@intel.com
Cc: hansg@kernel.org, andy@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, error27@gmail.com, sakari.ailus@linux.intel.com, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 29, 2026 at 06:28:44PM +0200, Andy Shevchenko wrote:
> This makes these patches low priority. Why do we need to spend time on
> them at all? Nobody knows right now how the revival of the mentioned
> private IOCTLs will look like. I'm pretty sure it will be some generic
> ones that this code should morph to. Since it looks like your tool is
> useful, can you check the rest and reachable parts of the driver first?

Fair point, I'll drop this series and point it to the
reachable parts of the driver (and the wider media stack) instead.

Appreciate the review.
Doruk




On Mon, 29 Jun 2026 at 18:28, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Sat, Jun 27, 2026 at 12:01:17PM +0200, Doruk Tan Ozturk wrote:
> > Two ioctl paths in the Intel AtomISP staging driver share the same
> > defect class: one user-controlled field sizes the destination buffer
> > while a separate user-controlled field sizes the copy/store, with no
> > cross-validation between them, so the store can overflow the allocation
> > with attacker-controlled length (and contents).
> >
> > Patch 1 (framebuffer-to-CSS, FPN / S_ISP_FPN_TABLE path) bounds
> > arg->fmt.sizeimage to the frame allocated from width/height/format.
> >
> > Patch 2 (S_DIS_VECTOR DVS 6-axis config) bounds the user-supplied
> > width/height dimensions to the stream-grid-sized destination config in
> > both the ISP2401 and ISP2400 branches.
>
> > Reachability caveat: both paths are private ioctls, and private ioctls
> > are currently disabled by 2b7eb2c5dc72 ("staging: media: atomisp:
> > Disallow all private IOCTLs") -- atomisp_vidioc_default() returns
> > -EINVAL for any non-zero cmd before the dispatch switch -- so neither is
> > reachable from userspace today. These are hardening of the
> > disabled-but-revivable private-ioctl paths rather than a live overflow.
>
> This makes these patches low priority. Why do we need to spend time on them
> at all? Nobody knows right now how the revival of the mentioned private IOCTLs
> will look like. I'm pretty sure it will be some generic ones that this code
> should morph to. Since it looks like your tool is useful, can you check the
> rest and reachable parts of the driver first?
>
> > Both were found by 0sec's autonomous vulnerability analysis
> > (https://0sec.ai) via static analysis; neither is runtime-reproduced
> > (Intel Baytrail/Cherrytrail ISP hardware required).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
