Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E36A4399CB
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757235; cv=pass; b=gueoc1MdmCwNmQGLozXhziZ7mP9SC+hc0w63UXpy7mGCAIaNA1pRW3lMOLfPfBtQfDObLRZXvBJ866xZlDNaKQLihOGnMEn9GXrKFtDSx4NLo8fR53say1JaqoR8v+jPSvgmFYJF2DJ6Dh1lVZ5+ld0/dsd2VWnRplj1OmbTqNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757235; c=relaxed/simple;
	bh=qEjagWBTwfkSAxoL6vSmSzsmFrQjMPNq1akoI4Tt7+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGMhfMhjoC/o8IPajA62D+44oNDmJj2yN3UPJRZZfyVobT6FddVmcPMww7y4tkRypzDVgIpZCJfkpMwk4X5v2sUzh00W3JXha1rf88iCKSuI4nKhjXL//cxw0ncbQRtE8ICRAPsCwmEwdkiqzHhaXz+Vqexbo8VPEqkHTMGYaBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aoYwlF3s; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aoYwlF3s"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso1909e87.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 14:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784757231; cv=none;
        d=google.com; s=arc-20260327;
        b=Bvq6mGdm+2lEuB18OHhXz2UTU1IyBTQT1gx4/BNWDn/ahTD9r7Nct22f2laygM+IZf
         AbN6MJc3/3gH4Hpe3SzFXRPSWYhR5M4jCmajZfhCWPWdhliz3My+k+n6zjuvtdm6/35Y
         RhWJvFuTVWcSx6cgGW1Pr/JeY9ewlU58OWiQCOHMK8IGLI6qtuHxuoJXfhyquvWM9xKz
         IiCWDwhisCmILiRGBNwfOO37CbkcNVJwr3iOe/Cj4rfYQcK9NYID4/ysuc7oBBKB4wUC
         8rAiC6gVtsNfnX6OP6HWTcLs+8nSkhWkj3iUWjoX1ch58aIPM5eG4LR+q0xrRsMTI0je
         wZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3UirpLV1ZtIxhwqN9P10MkPtE1lhmhI/AHpOOHSx3qE=;
        fh=+IQ6LX/U9o+FvKSsP08+PCT8w6gjrV5Qnoh6XqQS4Xo=;
        b=T+OatTWec9ACoqfPnoVlJDaHzB4Ms8aQplgSvVQXSchSRV4j7LEAMmMj24SdClEMsd
         v0FXDFQ4fO+dxTUj1Fp/JjGVDfUPSvp2zudZfqG8LJYtkjrNl2ipZbjFXGpydpUPByDR
         +omFOz/tmxHqrxKmDkyPSLTFLgLMJ8IcQDLb5oG0wsmd7+0GXEah9+BRfpEyF06VC6TX
         QEWvNQHSZa406pkDANFWM2YFns9A3bLEEG2Hz7mOs7o0x8zSbSZofH0aLr3f+lvhqdZh
         q9CIuC1E18z3ChcNY3iBKRGKztp4UPX5KLO/yMhaYDbmiyeK7SZ+4h7q6P/7ybygbhBs
         I8mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784757231; x=1785362031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3UirpLV1ZtIxhwqN9P10MkPtE1lhmhI/AHpOOHSx3qE=;
        b=aoYwlF3sdaQNJPjvwXYlEpbIy9Cd6d9hKJDlrZic69XsxKmb67rn5e2lhCOnPo2cUY
         o7mTp10nZF/NsHKMS1Wxrnh/iCB5gjwTnEEf1rgu1a4R9y3uLyBp6UTbtMbfv1fGkz4/
         B0yh5j6dJ7TwHA/oRJdPzM65gym3dTelZN73kUZjLHGLM7ht/v+w1IiT13XPLzNo5lrv
         mUSQWxrIXtbg1xgDCenlLRx4Efz9C2XFvJeFrpjViQyIznJVQU/6Jp4ntVzYEJaoKk1r
         l7e8ZytIDYD+6gMb+mqewgr5XRYMa3MwTLCvjaeeur0ZAZMeoKlzG6SiPVj8740wMuCv
         Fd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757231; x=1785362031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3UirpLV1ZtIxhwqN9P10MkPtE1lhmhI/AHpOOHSx3qE=;
        b=Kmsj2ZHyJSwPeNJXzfdpu6uzoB5V1I13DPoFBeW/98/cwNldgR25NTJ5d24zy4PxaI
         G7YMG35lTEC64gSdup93T2DOpCDj39IzXDAYljmKvVHZUxW8f3ZsUxAiaSZj5JOOJUxX
         vhY4tFRyax9nJorRdgjpNv7Lx86MnW202tB0CGm9y45z9hEW56oIRJPlSY3SWhnBRx+7
         02UIIdqssiYadYHtVAraX6AHYuIC6xhRf2rLBktS36kfHKjb3Ndh43Lf9+fsmGbYTlxk
         MepE+3OWfiPTEZWb5Qy4VtkdOeOwqCcJpFWNEz39IQA8BPGNNIo2Rbqt8xT04yoo0m9w
         HJnA==
X-Forwarded-Encrypted: i=1; AHgh+RqIkV6UpIohv/LatEq0yPItm0LJ7m8bzo8GW44wrBoUY5NFqdPObjIAsgDx9E+40zXQKnhMiEBhbTGk3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYycgfIShc6USDDKIAkYmFnU+ak1ys6P3zpOErqSIAuJHjwesz
	COZRlwA0tSz+oKZnmqcgJGdvYKugTXPAfX1xgaQ9xnQ5OQ9671byskoNsMU44M1VncLkIyn9sSA
	i8E1+JwOYBWWDs6mYIl4vRDFBdbyDnUrRTvUadlY=
X-Gm-Gg: AR+sD11iFLrnY/tb6dyVHWIwzu8lUSCP1kT9QoHnHF9W7It7mPqB9dcHEc8k0e61VLu
	82cQaflJ/smmd94/rMJJM9i8ywE9ceePsUStccvzKnaFVU0D90pmIUSkChYIMwg6hepca4xIUeA
	a02tZZ7jAj8JO3AMJJanRrFlOuJ6w+37rzfGZZOO1ZGqMUjHacySd28w4DaQUMReM0kMFE5WjcW
	ribU2UBKXk10qN6Qw2ziDXBxx43QEPi1ZAFWYuKCC9URLR0musgK2aDfnk=
X-Received: by 2002:a05:6512:3e07:b0:5ae:ae6f:8b09 with SMTP id
 2adb3069b0e04-5b2b0e25fcdmr55344e87.10.1784757230622; Wed, 22 Jul 2026
 14:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609164047.486227-1-xuehaohu@google.com>
In-Reply-To: <20260609164047.486227-1-xuehaohu@google.com>
From: David Hu <xuehaohu@google.com>
Date: Wed, 22 Jul 2026 17:53:37 -0400
X-Gm-Features: AUfX_mx6lXFHuf0Wgd2wPQM1BjAzgoxGSU-8B31GXW_8srvK8ZED4wSLL-WfrUA
Message-ID: <CAPd9Lg_30aqB6x342xLeFAc4exgXwWzwBc4KWh6+3p-N=yAwsw@mail.gmail.com>
Subject: Re: [PATCH v7] dma-buf: Fix silent overflow for phys vec to sgt
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com, 
	praan@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 12:40=E2=80=AFPM David Hu <xuehaohu@google.com> wrot=
e:
>
> In case MMIO size is bigger than 4G and peer2peer DMA goes
> through host bridge, we trigger a code path that assigns the
> total linked IOVA (which is greater than 4G) to mapped_len.
>
> Previously, `mapped_len` was declared as 32-bit `unsigned int`.
> When accumulating `size_t` lengths, this leads to a silent wrap-around.
> This truncation causes truncated lengths to be passed to functions
> like `fill_sg_entry()`.
>
> Fix this by changing `mapped_len` to `size_t` (64-bit). While
> at it, fix similar potential overflow issues in `calc_sg_nents`
> by using `check_add_overflow()` for `nents` and using
> `unsigned int` for the loop iterator in `fill_sg_entry` to match.
>
> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping=
 routine")
> Cc: stable@vger.kernel.org
> Cc: iommu@lists.linux.dev
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: David Hu <xuehaohu@google.com>
> ---
> Changes in v7:
>  - Added a missing blank line after local variable declaration in
>    `calc_sg_nents()` (Leon).
>  - Collected Reviewed-by from Leon Romanovsky.
>
> Changes in v6:
>  - Used `check_add_overflow()` in `calc_sg_nents()` for safer
>    accumulation (Leon).
>  - Dropped explicit `!nents` check and added a comment noting that
>    `sg_alloc_table` handles `nents =3D=3D 0` (Leon).
>  - Collected Reviewed-by from Kevin Tian.
>
> Changes in v5:
>  - Removed WARN_ON_ONCE from calc_sg_nents() to avoid log noise (Jason).
>  - Added explicit check for `!nents` in dma_buf_phys_vec_to_sgt() to
>    cleanly return -EINVAL on overflow (Jason).
>
> Changes in v4:
>  - Added WARN_ON_ONCE() to the nents overflow check to prevent silent
>    failures (Claude Bot).
>
> Changes in v3:
>  - Removed leftover sentence fragment from the commit message.
>  - Kept `nents =3D 0` initialization (previously stated as removed in the
>    v2 changelog) as it is strictly required for the `+=3D` accumulation
>    loop in `calc_sg_nents()`.
>
> Changes in v2:
>  - Fixed 'IVOA' -> 'IOVA' typo and expanded commit message (Claude Bot).
>  - Added Reverse Xmas tree formatting (Pranjal).
>  - Folded in extra bounds checking for calc_sg_nents() (Pranjal).
>  - Folded in type consistency fix for fill_sg_entry() (Pranjal).
>  - Collected Reviewed-by from Pranjal Shrivastava.
>
>  drivers/dma-buf/dma-buf-mapping.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-=
mapping.c
> index 794acff2546a..80f6ab2f4809 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -5,12 +5,13 @@
>   */
>  #include <linux/dma-buf-mapping.h>
>  #include <linux/dma-resv.h>
> +#include <linux/overflow.h>
>
>  static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t=
 length,
>                                          dma_addr_t addr)
>  {
>         unsigned int len, nents;
> -       int i;
> +       unsigned int i;
>
>         nents =3D DIV_ROUND_UP(length, UINT_MAX);
>         for (i =3D 0; i < nents; i++) {
> @@ -40,8 +41,12 @@ static unsigned int calc_sg_nents(struct dma_iova_stat=
e *state,
>         size_t i;
>
>         if (!state || !dma_use_iova(state)) {
> -               for (i =3D 0; i < nr_ranges; i++)
> -                       nents +=3D DIV_ROUND_UP(phys_vec[i].len, UINT_MAX=
);
> +               for (i =3D 0; i < nr_ranges; i++) {
> +                       unsigned int added =3D DIV_ROUND_UP(phys_vec[i].l=
en, UINT_MAX);
> +
> +                       if (check_add_overflow(nents, added, &nents))
> +                               return 0;
> +               }
>         } else {
>                 /*
>                  * In IOVA case, there is only one SG entry which spans
> @@ -95,9 +100,10 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_b=
uf_attachment *attach,
>                                          size_t nr_ranges, size_t size,
>                                          enum dma_data_direction dir)
>  {
> -       unsigned int nents, mapped_len =3D 0;
>         struct dma_buf_dma *dma;
>         struct scatterlist *sgl;
> +       size_t mapped_len =3D 0;
> +       unsigned int nents;
>         dma_addr_t addr;
>         size_t i;
>         int ret;
> @@ -133,6 +139,8 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_b=
uf_attachment *attach,
>         }
>
>         nents =3D calc_sg_nents(dma->state, phys_vec, nr_ranges, size);
> +
> +       /* sg_alloc_table will cleanly fail and return -EINVAL if nents =
=3D=3D 0 */
>         ret =3D sg_alloc_table(&dma->sgt, nents, GFP_KERNEL | __GFP_ZERO)=
;
>         if (ret)
>                 goto err_free_state;
> --
> 2.54.0.1064.gd145956f57-goog
>

Hi Christian et al,

Gentle nudge on this. LMK if there is anything else needed.

Regards,
David
