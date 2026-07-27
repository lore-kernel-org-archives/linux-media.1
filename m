Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304483BED33
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 08:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139832; cv=pass; b=EzCy0No1PeG2ardu+KwrtQH6nBaPLhPTeFhDzHsIqjO8Cau656xtCaxco+9u+Qwazr4MfF3uzqBKboaCKQd8BTmXzyLPpkwgLVI1ewS7IJDQWyGiEE4g8IEw+uaOzNe5cQJ2byju8Dz7ascDVcKzzLyP3vKl3/jUVzhf7KawN2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139832; c=relaxed/simple;
	bh=u1SOk4ZoDfRov22oP6IGlVlZUwuxcDk3g0Ri71MIV/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4dUA2ebzxTUGuPE5fk9IIz/sxBmJaSln+9ihORDRNfZFLmKntkCgMitX1k8AZiVOFed4wW8oZk6K1tCdyIFsSGqRlFPzTJczKvJSXEaRVBCOdgKwNcLL7M7a+MSmAMoBLJTxQW3npo5jPKJBWgyNUNKTtbc70EaEnKj+Vgd/YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ftg7j8yE; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ftg7j8yE"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8423f236418so1677277b3a.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 01:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785139830; cv=none;
        d=google.com; s=arc-20260327;
        b=a9YSUXwakAwVt+tUJPI1J7e9AJuhxdIG0TapyZzw8emGEcuQg9IZKDw0zL6lwskGC4
         4Vy3d6gOLWSebeqts6ZgYKbjVcgT46kwYicBDIlRK4puwP6/b6XGHfON+MvbJVb+Y0yO
         gpGWR1eyvQ0gP6tZR5WylTrwWQ2SgiFhj1PmDoVHyOWMP6SUe6qg7/QZBF89kpFLhSKi
         /qJzmO1o3P1swxPYu9OwtAMQtyc1nws2yiJ/xQbsTEOSQ2hmq9c58BK3gaJPTUV8G2hn
         kUoD0qNeQjwscDH6qfcZa9bmdYzkkRe79NuXqUX+YOlRfisWd9AIb4SXsSj4B6YTiX4L
         VUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VS9Sv2uRCMr+rPQQXbQu6E9yLaoGt+Tbq2NKp6TSeZc=;
        fh=t5gd9+Ygz2RbmJ+ngcBNrnm3BsQZl4Uq1IvoVhXuSrw=;
        b=bl0O0DwVdE7fEK68yXlR9OWsg2e6FHpV+i9SAFTt4IyQBEmULOYEsEew5IvVzOPF6L
         cGhkvnm3q52l2us01DLz+Jj+hb4EzoHME5G+17pBWwsbxRE/Y7CwJlOj4RwCliB3vD/T
         6O5M5tTbnivFbKJ4YTARqEqwIJGsPSc29a/4SulDWIyrR1amgBMBJbATV28+tqqIbfvh
         oyGzQ4iYNOzyVHcdEKAnyc3TUS4rQfaFjl7+3Oso4CCckYr6H9Ba3UeDmuZFnFs0D+DK
         oM6vMZyLZR+7PfkrAc83yNCasc1fdG5EixfIqHQFJMnRtx03sqUr2pgcUPAFPCzY7vaV
         fHBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785139830; x=1785744630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VS9Sv2uRCMr+rPQQXbQu6E9yLaoGt+Tbq2NKp6TSeZc=;
        b=Ftg7j8yE5443E0+1kOkxdGJ0Dwk+/h3CbggpNCxjE/GViSPtj2JRVuVJZDDfoxSmpW
         1Ksv7V3ZgJSkWRXCOtlmSTd0h1/+DFJz0tXn3nhaRi2/7QkhnuICTmWT/nGaQ+HRIs4Y
         eavz0w2LeQ5tnIxbuJ8pfId4KB77n20aFyd9lelBJjmYYsKscl678vpVU/hg+M98WNfI
         alBcsbPiAXmu5ghuZ765zaXwhtVXw5oRlo7D9BXFu1Kos17zn2GQw9ie5BQD/X0UXINV
         RRwSLDAyeaqBVmk2iA/2G1VsiquNDEaCUoHfM/+i5NDcsEwX1jrIoE5BlLRlCv/f6q0I
         al9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139830; x=1785744630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VS9Sv2uRCMr+rPQQXbQu6E9yLaoGt+Tbq2NKp6TSeZc=;
        b=Xn3EliIDl3Ek4XjM8QcOoQ3C2zzQ/hy9RUjbpgB3gUUGFQ402B+U10hDjZexpgU6sx
         UDgcBZ69mwIVGvFU+UFqQHi092L5RQR0ppTz10Bk8AXd1qbOJCT+y/dPuMHdQfVbMNny
         tzak9uRkjVP95YOUCBIaiKYkbPVnpisafOSFmpQ89Ipemt+eziX1+l4SY3O9EM4emEh9
         e1oYwU5WthDb9eSnK2vyJTr/Vlm5eSaFNfARoruq7v35ObTKewWXd3SiYmTaStMuArUA
         4KpoxrBDuMDScr02rGS2KcK/dCzsq05UrRXH/RVdYFoXABJl9jSBWGeQokeX43aweCEG
         8QJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzncMzbKVs9jsZFPP9BhxrvcjSC12bVbb54FBhBbGyE1aU+swicRTMbGvPvHcjDLQDO+8I0hMV3PWw8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA5L+YSVRUzTtb3Hm0Y/gG5PnfgP9BKemcgCQ6up3qWBkvl2Hu
	OFdrt21jnzTFeDKjbbN0P8ifxKYJhih5E0JvsHBEjw5WDkir4/Vi6zfUMHwW5lX6sgNpgFB12gp
	BE+B2jFI3hPfwRZv2iBaIoRBW+01g4WM=
X-Gm-Gg: AR+sD11ItQWKnrNoQAPJQqsEB+EfbS528yrS8GjsvJUYWc/ogQLGY7hwwMCeA3b+Qbp
	aoikU6btLiKmq3UzYsJ/ZMWsNNGo8AUx9gY0nRFkzKlI2UWJUDCztLZmQnhRBtF8qODrND2iT6d
	0Fjmt4r7PNZzLdSA5ppTi97oP+Z9Xq2hs++jtzj+UmN3s1ktu0D8hkYl+8p0Zm0vdLO7Spy6vfm
	4VzhB0vLV/O5CfNtIuDDUjv2ekAMTBNPkvsPq3wNBL0oVMON3Qo9HwIOJP2xDFRWUlbrC1Bl/0h
	Ep9PdqGnYytZ2t/0loM=
X-Received: by 2002:a05:6a21:110:b0:3c0:9c19:b274 with SMTP id
 adf61e73a8af0-3c67dffb181mr6607471637.66.1785139830433; Mon, 27 Jul 2026
 01:10:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726100408.3262831-1-congnt264@gmail.com>
In-Reply-To: <20260726100408.3262831-1-congnt264@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Jul 2026 11:10:17 +0300
X-Gm-Features: AUfX_mxifE27HgmqQfF8z8SxvpEZvclmuq7ha6af2z_fycdCEGZFG-xRFnzkrOA
Message-ID: <CAPVz0n1V1YJsEJ3+SbkMnTzCbhyx3vJP2OuCPe1Ft1+ukynxHg@mail.gmail.com>
Subject: Re: [PATCH] staging: media: tegra-video: fix syncpoint leak in
 tegra20 channel init
To: Cong Nguyen <congnt264@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 26 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 13:04 Cong=
 Nguyen <congnt264@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> tegra20_channel_host1x_syncpt_init() requests two host1x syncpoints. It
> stored the first one (mw ack) into chan->mw_ack_sp[0] and only then
> requested the second one (frame start). If the second request failed the
> function returned without releasing the first syncpoint, leaking it: the
> caller tegra_channel_init() bails out with a bare "return ret" on a
> syncpt init failure and does not run its free_syncpts error path (that
> path only covers failures after syncpoint init has fully succeeded), and
> the channel is subsequently torn down via the kfree()-only path, so
> nothing ever releases the orphaned syncpoint.
>
> Release the already-acquired syncpoint on the error path, and only
> publish the syncpoints into the channel once both have been successfully
> requested, so chan->mw_ack_sp[0] never holds a released handle. This
> matches the handling in tegra210_channel_host1x_syncpt_init().
>
> Fixes: 0e2c4117c351 ("staging: media: tegra-video: add CSI support for Te=
gra20 and Tegra30")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>

Very nice, thank you!

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
