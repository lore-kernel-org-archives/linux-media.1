Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2114B3DEFFA
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215333; cv=pass; b=MQMak+cM/RiUt9FrfVdNDgwYJmHqXaDXEuTafxvv5z4W17e2i45+5s0QcWJmxwfL+8/rJUDEacCRgQExv0BGzZEqDH6l8qIZlGVsGlqSm2puRdCBk1XW6yQZuVjqBL+JgQ+4+okMF3WrK3edF3Y+z6zNVYKL0+xi+0XlaaaCbZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215333; c=relaxed/simple;
	bh=SSKSnNK72yAHHpvxHbN76LZgXagsVuidWHkXdpQYMwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oplw3T5mfSkAxS48KyRm9YATeBOIZ877nplmhdR22QQ0imf+qoZjmhxUTSzXHtkBGURC8hmzslht93Q58qH7XS/PbDfZyIMQ3qPHAUvNFTeVs1aasWaj49lmHom3+FQC1/8pWooBm+vDKnhkMpNV7FjEAn/ifUnVdekkOZycH5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFH9PtkT; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFH9PtkT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so22965e9.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 01:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787215330; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+SX7JoTFDRWEhMMZzgDbK1raBfIDImYJeaJ01povwYaq3KMqme2jLxkLpts5llCqn
         HpTjwlGfC6/7fmjb2Pkhi1nkERSwImqTfaP87gl4SlHk3/OmjKR63EQkGNrsrZZgSUtt
         vZS9+OTWYOf/7flpP3ZYvxDZ0E1Bwe6R5+5y+lnceZ6KSaOToGFmT0Q0kGTYUOnASWlf
         5/Q93DRzfMhHH9rwz0ERl1mAyBsjodEetWTLQgxIBIMAd8ZRuDnW3wxL4gh3Mk2UDN7j
         IuX5mGI2GfMPx0XJyQw/JykAYV09c/fZj4jzhXbTBdYJ/hdg3ZCF0C5l4u/DbX6ZeHJ6
         VBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8IAh25Y6gpDB3AIPvbgjXar+PmqNUm2Qfk3Q5Mu44RQ=;
        fh=ERI1QLusCENHwEYUIIkoBAeNceCSRBggpdQB1Z4D8m8=;
        b=J8/grj65+8Lbg0IE0lLWlsZYdSIg/uFOmFmuz2LR8bWyFn6aDWGFu9gWxvAO4nsceT
         xcJql+sFcynSWOXhbiWDu9kdXSUvAa3QSXipYdnIZhN7kOQF8r1ex/8QhZUenQsm28mk
         rWDucxeHoR7davDwJyi2bAil5waU1Pz0JjrA5JTsVgCkht8PxzKAPM75Fj/Pao68kT8Z
         VUPmyip3ZbLHiR7CpBwQSY7ubNk4QoRkaQrwljA/lxdcOruNufwxOpOBGgG++ZD5D6An
         KStKp9fjf/kmCe8AnoOzuW30KAbe6DTSmI31ayDiHEWmlwCVxJfanacBSYtgBCtWoity
         PoBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215330; x=1787820130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8IAh25Y6gpDB3AIPvbgjXar+PmqNUm2Qfk3Q5Mu44RQ=;
        b=hFH9PtkT4TG5fXM7j+yH7sk+OTTcilMpfZt0R/yZDlEQddBMI1RYJhu3zKFvZnLjR+
         7y+RfL/OwyYmLbclJUq5M6FSl18Wi67RXPRjMSknS5JkrljdGWWB4v0qQvTrxNZh1i+H
         RZEV/fxMLpqoKoE/vd6Oibvj2koBgBRrEnlfuvUYHGaHYcMEmKhuojyo7ZSTJXYSKXWQ
         qCWQpTLlYgRAIX1wZ0P4PqXdYYCQdOeWe362kbXSBknGMl1PZoLeShrFE+vL5onwhNlO
         VBeWlkjO1SVKVVlZYrMnVrOUhK3pLlFeoVa4IuhH6dj3byANfJ1noAQ6e+SnW3PgDG4u
         t1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215330; x=1787820130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8IAh25Y6gpDB3AIPvbgjXar+PmqNUm2Qfk3Q5Mu44RQ=;
        b=pVC8Lieav8dW+UoZqGffRFIOd5/yB0Psl4hK5xxhx6k4gBiPPoB3f6CqhcVfcVk+z1
         egG6ZWT7EnTtDEAN7i/OejfnWm1YT9zM8AMgVbkH1nvCaWwg4UVx+0yvG5hYkDdIDHZs
         Uxxg7jL5zmnIobXYrdSANsPRc48vKp93thh8UOCI6IGTC65NRTRVdgD0cliG92iY/U55
         NTl6rMcUgmuRd2jN7D7QS5gs1K2n2XQxNstJCaygQEVoNAxNnIGiDZANUHUBoBWJexNF
         IfYWGRVf7066gjT1TMmALzdK3PX/K1NqFD1JgrUt6OnZJmzbJab+TVkEBLGIpXFgAxEc
         Qz4g==
X-Forwarded-Encrypted: i=1; AHgh+RoZVvyl4qrqXurADUbAGknAPkM1vJ41oVVGUL0QDRVLwPpcRPEdke+b7GMnTrg1TZZ2gQkq1ZdcHQsoJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztAkJx1+tW9bO9WXxgTzxPAKlqANH9Cc9XeicBRNRVFm78Tb3l
	6EnzgrgreGC8llIVf8dbqGtgTUE4OcuUY/DhgykaMLzoWWWHalnA1zFpO90aUQdxBTyK7+HrSL6
	RupLomxa4x+ctTQOZN1Sue/XUBvP9bNE=
X-Gm-Gg: AR+sD12TDlurrbfMyuQX9B8eA58IrfUzCJklXPcvkzTfSYdUWmuHHSooAffUjTr5QVi
	x/1KWLo/w4WZSMQSGnkRcoHChA06gMo74hPkYiMttVEnx+g1xndst/ytcrwYpLJrYsdhymPgXuh
	dfb3upwK4YeCqZZtCDMcB9B+LN/P63XoR6SQ+sd4RNaIyuI8wLi7+JhKxgzNj+r48FhmZ7LdeS5
	7DQ89W45VVEHV+RfI4yLoDpVUokX5QUTMUX8GEaCFuaDl6Sv5/4VN4s+aSjMVBL5gCTSXPPcN+U
	0hhsZGvPyv9nCJEc7brzLYtEtmlEWlztyPGk1Z6TzHgljytWAYkWkNqMZux1tcqW10qhOofwrGw
	K9oClJPzPTOaqT1YWsNnjD+irs5oBnRY=
X-Received: by 2002:a05:600c:810a:b0:499:59fd:dbfc with SMTP id
 5b1f17b1804b1-499b06a5900mr41867195e9.1.1787215330179; Thu, 20 Aug 2026
 01:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com> <20260819102812.2592880-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260819102812.2592880-2-tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 09:41:43 +0100
X-Gm-Features: AcwNN1UHM6d78eJknN2umOmtPFMrbyKPFHdLr4AFH0nosOnIzKcRLcSXje17w5M
Message-ID: <CA+V-a8vfSTAi+fy3ngTxVGfXmbpXCabGmuRzf1XCv-gF5i=bmw@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] media: v4l2-common: Convert v4l2_fill_pixfmt_mp()
 to static inline wrapper
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: jacopo.mondi@ideasonboard.com, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 11:31=E2=80=AFAM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Convert v4l2_fill_pixfmt_mp() to static inline wrapper: drop the exported
> v4l2_fill_pixfmt_mp() function from v4l2-common.c and replace it with
> an equivalent static inline in the header that delegates to
> v4l2_fill_pixfmt_mp_aligned() with stride_alignment=3D1.
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - No changes.
>
> v4->v5:
>  - No changes.
>
> v3->v4:
>  - Collected tag.
>  - Removed "." at the end of the function's brief description
>  - Removed "component" from @pixfmt->sizeimage line
>  - Removed wrong tab
>  - Fixed example (e.g NV12) -> (e.g. YUV420) into function description
>
> v2->v3:
>  - No changes, just moved to from PATCH 3/4 to PATCH 2/4
>
> v1->v2:
>  - Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
>  - Add v4l2_fill_pixfmt_aligned() helper documentation.
>
>  drivers/media/v4l2-core/v4l2-common.c | 8 --------
>  include/media/v4l2-common.h           | 9 +++++++--
>  2 files changed, 7 insertions(+), 10 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 65db7340ad38..54995ba8c20d 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -537,14 +537,6 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_form=
at_mplane *pixfmt,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
>
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> -                       u32 pixelformat, u32 width, u32 height)
> -{
> -       return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
> -                                          width, height, 1);
> -}
> -EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
> -
>  int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>                      u32 width, u32 height)
>  {
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index edd416178c33..749fe38c134e 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -556,13 +556,18 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32=
 *height,
>                                     const struct v4l2_frmsize_stepwise *f=
rmsize);
>  int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
>                      u32 width, u32 height);
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixel=
format,
> -                       u32 width, u32 height);
> +
>  /* @stride_alignment is a power of 2 value in bytes */
>  int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
>                                 u32 pixelformat, u32 width, u32 height,
>                                 u8 stride_alignment);
>
> +static inline int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pix=
fmt,
> +                                     u32 pixelformat, u32 width, u32 hei=
ght)
> +{
> +       return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width, he=
ight, 1);
> +}
> +
>  /**
>   * v4l2_get_link_freq - Get link rate from transmitter
>   *
> --
> 2.54.0
>
>
