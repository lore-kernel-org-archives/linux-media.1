Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E8347729B
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 16:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822843; cv=pass; b=KkisVnXxjvlmXo3OEwX5JHVBEYwUMgzW+VKT7nr/ESsNfPDBFsw15sQUqQ/mdS+DKWgZuco5ejKZEEhbr/1MIywXRu8nYle5tTAHhHH3IM0xBUuRCOFCJI4BIaIRTMTX0kLKm9FaelJthDiAAgH8qYYXp7f5HmeKIJIMChT3Kfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822843; c=relaxed/simple;
	bh=UTDry1jdeZi0acfJhI/YdJG0G3QhaI+y1iFKk3Eurwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PgZR54t+8idy8zROdn6tkP92ThL7YGSfpyVSqi4/G/W7v6sQpSHeF/gJmgMXSotu2QU6s9AKkuUuskkPf2O5at0Z+RhfZmNknVsf57k7ygKpsp0Hyprh5SsaI3ln7VHD40AVxCPHWsfLKhmt346VmALEUt3Xiq5A7iuuc05g40Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ks0L75RX; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ks0L75RX"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so10905e87.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 09:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784822837; cv=none;
        d=google.com; s=arc-20260327;
        b=cEbP9pGu4KsCkRbDIpeUlMylD8bKMQlg129WIXB6tSYRqbPE+9ho37yxAoz3ivnF4H
         RT6OQdSluQ2X42lK0P0Z9olMc7qormKVX1NcutTIs9NN0pDKvn2s9vxyhLFXkvJwlZfj
         WIPROxthhVYNfsQ3i7KxUwU6sCQkQ9lcwJwuMRNC/gyVuCpaIC3Lj4DvfahkxQNsSrxh
         XedBG0wbnoLjO3kkEPSEVDt1/kHn0rTOFjJr97tXGxvyAuVdOa1iqtchNHd9EPx70wgX
         rgeUBR5PuCAu/43f0D3YkBVjIrB7nzFZ6ZApZo9H4DzLut3iGpFbNiJD1x81NTbHrDrm
         TUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lLj8QIPDjw+wrnYmjqmWidOihzraKtluDpbS+qkgPXU=;
        fh=1TW3HsdIsW7dUg2pYvdMD7El7oOfYV1cXnnAn1+XabY=;
        b=gMeCrcnLhPCR+Ss4mSoBJexmtS3+RCbKEook+ycyufT0t/AHEWdFwei1MhrnaJuNga
         GOTHx0v5tRYNMFOs0gc7Vkq7CI7UmFaH45sglwr1AqDrDqeGP+B5QUpNNH218eXl2vZA
         jY7P6M5Xpuu8+KtTWNujRbW6+MYvCA0mR5+5pttHhizQVbo6ThNvwP+Pody5tpWk1hRO
         zYLpuHnZpdaJs4IyUFJTs2nza73iuoExMuk1vo0m03BEm8r6t3tgIWxaExJsZxMbxshz
         zS6heCuNaltOQphqzvhGe5TCNS00DYQ9+F2SsMvIJJiWzd3HBqwp+lx4StBhRWsmsvuc
         HkTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784822837; x=1785427637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lLj8QIPDjw+wrnYmjqmWidOihzraKtluDpbS+qkgPXU=;
        b=Ks0L75RXYNwqbMpypXzI8wrm7yJGNKZVMSKLdyfd5qrsYhodAJwDqkvcrjC2CUNiUT
         kJQx4ujxuSR21U0O31P53+fQkRPMUDKvs9BcYvPJL5ddOhlQUNapjM5YK99aItX5vZrE
         CTnfGss+7gkvgp8qH8rKWGeIABSP/GvbR3QjeCagn2hvlT4Y2OZxTKJbXkTI7xULTkUS
         CoyH5yYQcBaWST+bg59H67RrA7fBTK+FfKVokGdpAnheoY8o7Srd4Dq+va0xN4c34MES
         d3cwO5S87A/j27c8Lm7ftosa/fP/3faJ+NqJxDXWbZD6CKBfldrL17aHC9MoZV5jhEhk
         vczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784822837; x=1785427637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLj8QIPDjw+wrnYmjqmWidOihzraKtluDpbS+qkgPXU=;
        b=WKp+th46V01pXMWe/bL0oGldPVATAZ57tybufG3tmtzCuAE+qKrrt32NfO3BwGA7H8
         fcePhPXiXdZpCPBhbSDWUjnwHqD4RmwHOohGnZE5Xx0pUHfg4uC9Gtqq0xTYXr09P0Ot
         x/RFwcknQgc3y8ZWMFaqtKC8wWpS5cuIj+gbAg9NIpEVPHZjY9yvWiT3f0MPlZ/yRTMS
         9BG3ApYiI7ApHWhvHIN+fY7mMGwSoR1A/10aEdViLwg55fUiMq7Im39WGKCW4H0sFvjl
         xCoDQycDTvGq58u+FLG77XrbAlibzpBEmeniohgNLRsJ+gb6wWMjRSte+kYPaILO0pYN
         Sw3A==
X-Forwarded-Encrypted: i=1; AHgh+Ro/j/9KiO0s01BUSmxn7RlOY55+M7rQpZ20TQ26VDiNpVMsbP36w4wU3ePq5sHpYcjXYT7FLY+KjDmgXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqF1Xz/EiKJyBqIto9qWjd6tclALsd3VLhtJjYBpBrAzXtW3s
	JLXaT9Zmz3aERzD7G+0VRTxxn/AFfDz4an969M35tSegyHCfU9OWmyeVQS2lrjwpTZmrxufTAqO
	9aXNW/cFg2/Jlxm4aLl7Nerhq9E37K2mMW89VFQU=
X-Gm-Gg: AR+sD11FGfi6KoOCEm7LDd6b88E//VY1koAdrVn3PjECSFIl1JZkLyWs3NtZSg4Sl9/
	PShoMJGnATRSXw6gN723i2706ipzeQc7Oe5a9yc+LNL1IEFpOVYOw/ILTmrJko9h7Zf0thlj4uy
	GruIPy909WmOXeMM1wiV8EfpNgKIEGim9KKnqe5ArHfrjvqrQpYX7AwoWabKlxlo8urBt2umlhJ
	n7kiSvwNczYkq0yYwrCDFWFfIRCQTy7KqiYKxm/S5m/n0ewAPE7ldKtIQviPilQN3WWyjCLXOV3
	WRWzcRFJwoEc1Mo=
X-Received: by 2002:a05:6512:3c8f:b0:5ae:a4e8:47be with SMTP id
 2adb3069b0e04-5b2b2968164mr196065e87.7.1784822836866; Thu, 23 Jul 2026
 09:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623015459.1153884-1-xuehaohu@google.com> <20260722233932.3997681-1-dhu@x6u.co>
 <20260723094625.GE110966@unreal>
In-Reply-To: <20260723094625.GE110966@unreal>
From: David Hu <xuehaohu@google.com>
Date: Thu, 23 Jul 2026 12:07:04 -0400
X-Gm-Features: AUfX_mxZfBk3L4aJdDJNuS21FbP4tt0j-EIQJVeIi7KxTXcs6-s6PmQ53scVb6g
Message-ID: <CAPd9Lg9ZL9VwubYbn350pdUbQnnfc7FwXoPU3nPgvBHWRxLOyA@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: Split sgl by largest page-aligned chunk
To: Leon Romanovsky <leon@kernel.org>
Cc: dhu@x6u.co, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, David Laight <david.laight.linux@gmail.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Alex Williamson <alex@shazbot.org>, 
	Pranjal Shrivastava <praan@google.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, stable@vger.kernel.org, 
	jmoroni@google.com, kpberry@google.com, chriscli@google.com, 
	viursachi@google.com, sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 5:46=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Wed, Jul 22, 2026 at 11:39:32PM +0000, dhu@x6u.co wrote:
> > From: David Hu <xuehaohu@google.com>
> >
> > Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> > This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
[ ... ]
> >
> >  drivers/dma-buf/dma-buf-mapping.c | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
>
> Could you please avoid sending patches as replies? It severely disrupts
> the reading flow when using mutt's threaded view.
>
> Regarding the patch,
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
>

Hi Leon,

Understood. In the future, I'll start a new thread for new patch revisions.

Thank you for your review.

Regards,
David
