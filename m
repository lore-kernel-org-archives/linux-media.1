Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0445D199D8
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 05:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784354075; cv=pass; b=FxYnpeo38CP7KXdLqoA0IEhjnp3bG1yz1ydEXPm0iXM4hU/TUcAVSiB1fZvRfi3Bkxx6pbxi/xJI+5jxplpvwUZ5BXykfOl0pr2vm1ufva3X67IlQFSOG4ir8gSuUX8KcqTmOguwc7e8IMrTTXp+tSkvHugG94ELRJY98O2TOF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784354075; c=relaxed/simple;
	bh=lODP0UI79Z7bB4h91Mxzt0Ekb6ud009KQlgsbHV5yFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDJydsALLzI5LKiYAdjsnEqQEguGkglfaNe6atJIA0dAvEqJaqMAy9oUsplWX90s86DLs6PVbKXjIwEX4Rn6ghxcBYaBVFlzF+WVQTe0h7pkofpkkEJkz2SLbILdj9OUSiCeXUK3xwipRKv+K+YUebiHcxMMJ1f3eBkvuUvfEsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEi6p3cX; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEi6p3cX"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81eef95653fso14138207b3.2
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 22:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784354073; cv=none;
        d=google.com; s=arc-20260327;
        b=JB0qJB7Ekm1eShkwuwhuuNrCk2WJArg0OqGAt2KHakmCccmNRo05+vFdeRkOMzca2J
         UITIp2fpgy5gM1hSmPjVFccuj5bRL+c0sWxvPjUi2+RpaCbS52UwbRLSteW5gFBU874o
         wQnMUMFyZXqDMRLmhdF869gckWiRyRtBkEWc3cdHpWXUpEvvSszF7bGP7IqONE3lhsaw
         jk0MEJnMsV/Si0u9soWkj/J+Ot2l0eTixKCKxl24KIjFZFm0+QY++iobAil3CzKoOhXF
         /ixUtsRsXh1Ozgh4tMjV/FCDG7Zi6wFQHoCH0ESvYc2vXGzCPv5NrD4KlAs3Lf8tN3VQ
         Q8xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PIcv86kXofJwTKLty6J+dOPClKUDiekuhFl+MADGBKA=;
        fh=XQJAl7BDFroQi/SKo02jTUCqAJfIyMOPfOo8fn8pLb0=;
        b=MfBgGdvpCrjW2Rq3LzYDSHodfEJ6ZhWvXz0Chulb/AkbTc1kh7H+IF2rDkqSbtMfl/
         aujit1fk4vbTZtEju331MyAlyRZ26RAqOllC0LFRq5r7gkecZ/+DuP4bwBqq4esa3LOi
         Ie0jmTGpXiM3fzs8zR2j+JroiztEQTCqquTzjtGQV7HOjzHarxP4Olc2exDf4tum3/2a
         D10KrBsQGg66tXV0PXVWHeKmEBak/UY6VM/VLoXmnSOTosaDkB5fTuQglPReyX75f0ke
         bezHP5taeR59+lCVE9rpXdLIWjyxtswrX4Z3zN5wjVHoAE6OFcdsQOAASM/LPtjMGDB+
         gq1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784354073; x=1784958873; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIcv86kXofJwTKLty6J+dOPClKUDiekuhFl+MADGBKA=;
        b=UEi6p3cXvxOY2+ZCvNGuZle7iEZUksC+qXqbNpYjVTh6WruFp/yRALwWaKIjeg9lA6
         TvCRMTmSLyN9CCLPSgPwcXtwlJT5dRGfZlQ0x9eXjeVxyVG9W5f6KcVrQg3q/yvqAEqh
         HZwgNBUM6s9a4gzQvr5TXynwYUNuuL7zw8sAP1uErK/IHYQaJkYw5pq/Z+M0aw2Tf9Ko
         TQYSMlUUhwFWy6M1VBTKauwAEZ1kDPe36b0xtGimbUPQbwidY7t6ROCoQt6aGxbWuZ1u
         DetSnfE7Jr4upivNS2i3p9vH8Ll1bn4HqKaIbtMba6HNDd1zNL3sUFd3PJaOpOPgEPip
         FDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784354073; x=1784958873;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PIcv86kXofJwTKLty6J+dOPClKUDiekuhFl+MADGBKA=;
        b=q/Y6FSAH1vDwtcllKE7oxtH2cn09WY3qJ2gecjla+o/5EwaMkPs4YNFQLkhtmLi4wV
         GTlYuMiPL4ic4tnB73LFbtZ/tjW63TzxRwFh7eHeerNOirMqhC4+DlaBgYoD0AZfgDiw
         4Kcth8/bh/vN4lo7lqH9qnV+r3fkI1cFaVTyW260YciKh/i3976JEXyjzIM69N/s2Ih3
         bl0E1/0s8xMnF88XDpJLLPzPUlXQtbWNxjkHLiJ/TW9vXdQm64Znzwb9nIAcnFmS0p+f
         XuUDjbu0J8emPd30olI5LcBMAdS2GnX+V0h/Xr8+ci+vNiZPYUum13W88E4EA8G7m/1N
         wTWA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/zShCwUyTCnf6aHNaH8nJ7Wzkq0faTD2jilUe7N+EmfIYG9W0YEM2oVGCdN+msci8B9XCgyOHhqXS9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfoN1UN+Oea+AeIDzeNzkby94MsJhbXYQOwL02+Beal6AQ1BPb
	DkRYkAe4FF/syAfeNSvTcjs8rDzqO8bdyK6MYg1b39QXlBYDNp5T5RKDw9OH38rz2L7oqeKwEa1
	zjJM23ZE5VgJa9ZfORc3W0bdaaRAfjB8=
X-Gm-Gg: AfdE7ckCkuY2NlZJnEOGzo5I7vhnfYZPAjix6BOnOWg4ZtHsfm/hby0deEbxmhd6qdO
	VhzSl4Y9cT3TVZsTrMCY7wEWLJTIYfTwfKIeJZ+Z37YQ2ff6Ae2iiz8ZOl3U02wQD16PjmH41Vn
	pUnnL3qAcTQ2HYbLL2nI6xc+gPt7cnO0xE1KJ44nZSVxyjXIo1Z5Sd8KhErcwkYTxPyGZMB04qs
	qiHke4R/33ydeGVjuS11UDSMAZcRw6RWT2NIuFyI6bq5U5IfJIY0rcP5m812XUh
X-Received: by 2002:a05:690c:88d:b0:81e:cfc2:c46e with SMTP id
 00721157ae682-81ef261bdfemr19040267b3.60.1784354072916; Fri, 17 Jul 2026
 22:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708072111.723453-1-lgs201920130244@gmail.com> <44181afe-0582-4a9e-9da0-05042da7f010@kernel.org>
In-Reply-To: <44181afe-0582-4a9e-9da0-05042da7f010@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Sat, 18 Jul 2026 13:54:21 +0800
X-Gm-Features: AUfX_myWnG-FmZEkLbTKLeN0GiEQSOHb9BS-NV4_8Lrg9AW_M8-XcvavUgHsS1M
Message-ID: <CANUHTR9X1HX3H8-mhxv_RGV4DbYhFVkoPArR4jyTovxQMdkmxw@mail.gmail.com>
Subject: Re: [PATCH] media: saa7164: fix cleanup on resource allocation failure
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>, Wang Jun <1742789905@qq.com>, 
	Steven Toth <stoth@kernellabs.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

On Wed, 15 Jul 2026 at 19:40, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> On 08/07/2026 09:21, Guangshuo Li wrote:
> > saa7164_dev_setup() adds the device to the global saa7164_devlist before
> > requesting the PCI BAR memory regions.
> >
> > If get_resources() fails, saa7164_dev_setup() decrements the device count
> > and returns an error, but leaves the device on saa7164_devlist. The probe
> > error path then frees the device, leaving a dangling entry on the global
> > list.
> >
> > Remove the device from saa7164_devlist before returning from the
> > get_resources() failure path, matching the cleanup done by the ioremap
> > failure paths.
> >
> > Also release BAR0 if BAR0 was successfully requested but the BAR2
> > request fails.
> >
> > Fixes: 443c1228d505 ("V4L/DVB (12923): SAA7164: Add support for the NXP SAA7164 silicon")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/media/pci/saa7164/saa7164-core.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
> > index 6bcde506adf5..225dbd3650da 100644
> > --- a/drivers/media/pci/saa7164/saa7164-core.c
> > +++ b/drivers/media/pci/saa7164/saa7164-core.c
> > @@ -878,6 +878,9 @@ static int get_resources(struct saa7164_dev *dev)
> >               if (request_mem_region(pci_resource_start(dev->pci, 2),
> >                       pci_resource_len(dev->pci, 2), dev->name))
> >                       return 0;
> > +
> > +             release_mem_region(pci_resource_start(dev->pci, 0),
> > +                                pci_resource_len(dev->pci, 0));
> >       }
> >
> >       printk(KERN_ERR "%s: can't get MMIO memory @ 0x%llx or 0x%llx\n",
> > @@ -999,6 +1002,9 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
> >               printk(KERN_ERR "CORE %s No more PCIe resources for subsystem: %04x:%04x\n",
> >                      dev->name, dev->pci->subsystem_vendor,
> >                      dev->pci->subsystem_device);
> > +             scoped_guard(mutex, &devlist) {
> > +                     list_del(&dev->devlist);
> > +             }
> >
> >               saa7164_devcount--;
>
> This should just be a goto into the error handling. You just need to add a new goto label
> right after the 'release_resources' call.
>
> >               return -ENODEV;
>
> This patch looks good otherwise.
>
> Regards,
>
>         Hans

Thank you for reviewing the patch. I will follow your suggestion and send a v2.

Best regards,
Guangshuo
