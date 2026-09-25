Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BD44C6EEE
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350214; cv=pass; b=CeUjIbJeri77sjBBCJ/535w8j2ZucbQRO6BDWe6ZMyXv4MfFWKcPKZOZwfmYgyYQ94F+7w71BpPBm82eqN7SwDziVoz6rZbZGCe3/yhCUIo/4PYQm4QtFpvLvN7E/LadhR9hksbJE9MIqqdSM+XMLGkFe6jd2XVDYO9umi3leFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350214; c=relaxed/simple;
	bh=n4954fXz02c4Oj5+YdOqhp+44wJpR+Hr4ZJmBOKkwVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYjoYTcZMz+YyJ7nA4po3lAV/HPhUNKFMtmsTh+N6yWWTFOpoBHEr9TmJZfNi2Q/or112LyMWZekVReoQkVjXYQRLNLsepCP4WLjgeihl7siikxzXhnM2cMcIrRHqyLRUm6PTwViCp7G8oFls1mbSD2r17EI5kfnQ+ekqluw47A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JfYXZeRK; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JfYXZeRK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso58135e9.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 08:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350211; cv=none;
        d=google.com; s=arc-20260327;
        b=KKbOqISlECUvkrTPuaOejSu+SRknPVyc+6YWv3ZagZ43l/1gSwrCFIygkmy1R4QJVP
         y9HpEm7sB4KDwfksMk1cCG+xSgQkwaxO8ARv0TWynhYfzes+qi3yi7TuEHLz5DlR09VV
         F+3ze0VPpAfK1p8W3ZKF46iGxwqE4uaTIU3g6U74lOSZS+LHvp3iEx3UE2QuObzf5rbe
         ndP5qogJ4CTKs/u/7ezyU46HfsgxTxxJEGT5BgufnScJIE2O02A9oobuNFoZSQEa3cqi
         JNPBodOp25Ne9awAexN0WYE/a4rk0u3d0YZyGrMensgqBtmPDYoxGUCEx9kyGeqR2i58
         DkHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ROrsOcUgsvdnaotZ8dOgUC/WrOneg/H1WIYmp3Dbi2o=;
        fh=0Rx+rxuutNFPeRnrz2nXFItNf4fgnFXdZtij8iiSSUM=;
        b=fJB/h6OJnfbvVJHsWFLAcrbSg/bnaFbvgftfECfW2j1+5uUAkKGlKLk3Hs2jHp3VUw
         zaDx0nwUMf2TRFXLX6xQBREkQY6xN4n8xxqOnDTFwQX9kEP3xrU0W42B317AuEYWUC0u
         3AH1uP9ZozJhwGOoTKoQAa6gDsc7GYF60jsx9ySTp5dCxhjmNS1lgdRFMX18i5sevzN4
         NwK9kwA1LzkY5HaAtpobtWyQ635Q+85+ESFayZloiqzI+N1WATxpPgRzlMk+CQCigH6S
         Ln2JiNYoQONUNNV60oAuHdrWWWP61ARH8yzo8bB3DIn1aYLFjf5ke920Xk2JvNGmRL9F
         C8SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790350211; x=1790955011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROrsOcUgsvdnaotZ8dOgUC/WrOneg/H1WIYmp3Dbi2o=;
        b=JfYXZeRKk+uo+6AtZ+rfAZ977i9l1p0mBf9rBbX/kWrI5TcybcuIR4Gf522f/5UTPB
         fDbzEwsEZcha+MJhIV2JKoIBFYARrvbYspiMSsa3rRKytjZs3gby81jzxx8toUGeiisF
         dGvZU+yC0u74Cv6qmCGyY7Rue4sVx9ZR0UAhj0cXyYgNGxI5r5li1AuMQq9W0dH9I2oT
         jpyXTJYC2EWY1IhacHEtrPyfTwDsZU73rjEZwnAj2asGOkVJnd6VpYcjXvxEgJ/TT0LR
         MXhacQBFV+kxg4M+YGXqE1K+NFirslVqtfMvawzo3dCRuKEteH+eT07u5hymiyxMFlRr
         AscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350211; x=1790955011;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROrsOcUgsvdnaotZ8dOgUC/WrOneg/H1WIYmp3Dbi2o=;
        b=RPNetpTOjoGevXCpqIKOAZVor31xNJIg++ekQzjyVboPZxof0509BHhDXyCGlXdaMW
         Nfow7tNVgUzfL5pmaqFeNHiH0FPgH8fUh5zq6/HbedGnbzq6Upfy2XdCUW66BLpBvm67
         DsGJ3CPa1YN3obzfTKgKn9f574dLkTxeEbYUp9INnRYIfalzmEOm9yNBozu12iGrCUqL
         DzV70engIJ0tZMWyaLPODsKvL/T4scdhnD2J+ZBzrveZxWak027diOlPuiEdsJVflgyY
         sjkCONfyfoBjE4HDPvvZ5pGWIc8CKtTzGVuobJkOpE3aGA9yXCiET7YAqTjayhDTqVoL
         93Rg==
X-Forwarded-Encrypted: i=1; AKwUvBxFTgDdy+8BUUR6hlilEip/dgNcW4NShqjLRLzitl5N7jMWf5sOFDR42varp1HZlC3BskDF3u8SEQ0SLQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nk616RBmWzddLS9lFDjnt6VNXXI6Yf8wS2ZkdWy5pY9Zry+Lg8
	mzTl+R36ZBFfRcLr3XVWQWxjeufeaDjf68jjZrj1oCOtTqi6k7Xc3FubDgSKd1ptrIkGiJZG2D6
	rMLgMNKQ/cKng33wTqarHes64jZ1Zh5QhASKIoaM/
X-Gm-Gg: AYBFou1rDcworiqu3hDhrzXgxc06OmGDJl6w34yz85od3i0zG6VQGQduOny7BQ29zyb
	xi/zVNp866RdRMP2L+Bho/9Olucv95OJqh+JQ0CRuQ6O4LkOe3jBsx10YRGMfI5KD4P5uhrvm7t
	/t3tMSmj+IdW0JqNPMdqlyzgWd97kLB37WHtipTZX2SmEBMQGLHe1YdZ19y8GRTgPI6A3Rab5L3
	vev2PSoixXHkBW0s/NzBOCrcPh9IiR9t05ZyZcwOJhWTGA1gMWRNsd/MM+MPKUgIevDFd8hZPeU
	mBWa41I7bOJkSLmn7h5sOmsRp8eu/SxC1CjsfkZIYxvMG/6+Yyk1FxrIKxn3VZiBHxbS5VZYqvL
	pEHBBNrGt34DACw==
X-Received: by 2002:a05:600c:3014:b0:49f:e12d:1a60 with SMTP id
 5b1f17b1804b1-49ff638a87fmr227415e9.4.1790350210427; Fri, 25 Sep 2026
 08:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417201913.2393655-1-jyescas@google.com> <df0a5e79-f2a2-4f74-868b-8f6291accb04@oss.qualcomm.com>
In-Reply-To: <df0a5e79-f2a2-4f74-868b-8f6291accb04@oss.qualcomm.com>
From: Juan Yescas <jyescas@google.com>
Date: Fri, 25 Sep 2026 08:29:58 -0700
X-Gm-Features: AclHuK91aA7NHqV433GteBTggY1TVKYNnE0__wEQzOG6MTG22gothUdiDWS_u9I
Message-ID: <CAJDx_rhLvcWV2-qzwVNG1DHnh2G4i26FgusebATLDj9zGg166g@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: system_heap: Set allocation orders for larger
 page sizes
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	baohua@kernel.org, dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
	surenb@google.com, kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 5:11=E2=80=AFAM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> On 4/18/2025 1:49 AM, Juan Yescas wrote:
> > This change sets the allocation orders for the different page sizes
> > (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> > for large page sizes were calculated incorrectly, this caused system
> > heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
> >
> > This change was tested on 4k/16k page size kernels.
> >
> > Signed-off-by: Juan Yescas <jyescas@google.com>
> > Acked-by: John Stultz <jstultz@google.com>
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >
> > Changes in v2:
> >   - Add John's Acked-by tag.
> >   - Add TJ's Reviewed-by tag
> >   - Use dma-buf: system_heap: in the subject since this is specific to =
the
> >     system heap, as per TJ.
> >   - Remove extra space in if statement.
> >
> > Changes in v3:
> >   - Remove defines for the orders as per Christian.
> >   - Update the order array for 64k page sizes as per TJ
> >
> >  drivers/dma-buf/heaps/system_heap.c | 21 ++++++++++++++++++---
> >  1 file changed, 18 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index 26d5dc89ea16..8c10c0f2b473 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/mm.h>
> >  #include <linux/module.h>
> >  #include <linux/scatterlist.h>
> > +#include <linux/sizes.h>
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> >
> > @@ -44,14 +45,28 @@ struct dma_heap_attachment {
> >  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
> >                               | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> >                               | __GFP_COMP)
> > -static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_OR=
DER_GFP};
> >  /*
> >   * The selection of the orders used for allocation (1MB, 64K, 4K) is d=
esigned
> >   * to match with the sizes often found in IOMMUs. Using order 4 pages =
instead
> >   * of order 0 pages can significantly improve the performance of many =
IOMMUs
> >   * by reducing TLB pressure and time spent updating page tables.
> > + *
> > + * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The=
 possible
> > + * page sizes for ARM devices could be 4K, 16K and 64K.
> > + */
> > +#if (PAGE_SIZE =3D=3D SZ_64K)
> > +static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, LOW_ORDER_GFP};
> > +/* 1MiB allocs are calculated with (2 ^ (20 - PAGE_SHIFT)) * PAGE_SIZE=
 =3D 1MiB */
> > +static const unsigned int orders[] =3D {20 - PAGE_SHIFT, 0};
> > +#else
> > +static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_OR=
DER_GFP};
> > +/*
> > + * 1MiB allocs are calculated with (2 ^ (20 - PAGE_SHIFT)) * PAGE_SIZE=
 =3D 1MiB
> > + * 64KiB allocs are calculated with (2 ^ (16 - PAGE_SHIFT)) * PAGE_SIZ=
E =3D 64KiB
> >   */
> > -static const unsigned int orders[] =3D {8, 4, 0};
> > +static const unsigned int orders[] =3D {20 - PAGE_SHIFT, 16 - PAGE_SHI=
FT, 0};
> > +#endif
> > +
> >  #define NUM_ORDERS ARRAY_SIZE(orders)
> >
> >  static struct sg_table *dup_sg_table(struct sg_table *table)
> > @@ -318,7 +333,7 @@ static struct page *alloc_largest_available(unsigne=
d long size,
> >       int i;
> >
> >       for (i =3D 0; i < NUM_ORDERS; i++) {
> > -             if (size <  (PAGE_SIZE << orders[i]))
> > +             if (size < (PAGE_SIZE << orders[i]))
> >                       continue;
> >               if (max_order < orders[i])
> >                       continue;
>
> Hello Juan,
> I've posted a respin of the patch by extending upon your work,
> Can you please review?
> Aplogies for adding signed-off by, will drop it in v2.
>
> Link -
> https://lore.kernel.org/all/20260921-dma_buf_improvement-v1-1-23d82e771de=
c@oss.qualcomm.com/
>

Hi Pankaj,

There is another change that fixes the problem and adds the 2MiB
order. It has already been
reviewed the Christian K=C3=B6nig:

https://lore.kernel.org/all/20260914212258.2657788-3-dave@stgolabs.net/

>
