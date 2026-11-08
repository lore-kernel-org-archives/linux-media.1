Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168483;
	b=ZFB5fPT3d4vQeWnTO+SencsPHE0Aq6ZoaFgBG9wx3V/7F+CFn8CiAEegVEnt7QM7SkXv
	 yAfAIteZycXRiQHASow8Nx00A6CieVv/GDxdLgSWUdm70MOLGIXr3r1Ds2/fm/V1ikGld
	 qxRS8PvBopKkakZIQ3aamR0uHTm6IjiRmF0oUR6SeckHdzy3avQE/fIT4TGNtCjfPuiS6
	 Bjp3pIaqLg4Zl2bAgNkIqdCYeYuB6oG/MJlX+PReMf/JMDMFXnYa+46mH/u538BJa17+e
	 D99fF6VGg4PdXbp9yKqPB1i4DVwqRap6/0oMXOwsscNvqVhKFTyChpTYNROD8uv7ZUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AKFhX2kTzcPr0xphsyszWaihfxahRuh70nv/fwZfZKU=;
	b=Zq0emwV0HbBiH73dFbvGIyPS/WzDKPJCVqpugM8lzea7zED1+ESkvESnkhF7tdmzdewY
	 rGlxUii2kwFua83sHEG1eWT3l2AYmCPB+2GwxkQK7WzrVqMV9pnYBd5rzd89vw4SmfEQm
	 66y9bmn2/EQ9qQPrdd5MP3uUnohb0xne6XizrsniPChfyDAVJMGsdgVF2hK1NKASetjeu
	 sXFgwzO1J2xrJZHBX3zI4GBjIGhvRTn8HxJvQ1wXA92SELg2H7MjTyZe1YshF/+/opDf1
	 jKhSfAsnSuPl+gWQJN3V+StCBaG/z8nRsMGu4ZWVNZzd3XAlk5CpJJy7IqNdPE0vGBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBRcKNqS;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7418F606A33A
	for <linux-media@vger.kernel.org>; Sun,  8 Nov 2026 20:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7418F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBRcKNqS
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so1954955e9.3
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 12:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794168482; x=1794773282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKFhX2kTzcPr0xphsyszWaihfxahRuh70nv/fwZfZKU=;
        b=wBRcKNqSAz36TTDwUf5ZOcSL8WudVNLCqD5t/lH5GhVDm7QF/V0exVUJWErSCrGj1H
         n0jS4cebVkJfkAGphSRhqB/HxUANeaTIdWx5U2qA561nZzkVLx7TKz87KhbFWubHF8S0
         N+ovVfagIlEM3o8xlH6/uvaSCHBQeHbEYYbKl27dtqeBvxauUuOAVZiJ5UEejGJoaMeG
         zxXKPRx3KTdKCB2ArgW8xu+Pqh0SLBHhpvCk4VtkmSP+UWANVq264VihJNHRp8jdW+kY
         5VhmcTiONg4v2h3Pb2l7pTMnwIPxmD0pXTUyt55F1/qQ0uoetVTnnrnNrJ7xdtMjYwOe
         dXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794168482; x=1794773282;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKFhX2kTzcPr0xphsyszWaihfxahRuh70nv/fwZfZKU=;
        b=DXfj5FPvV03TkL8W3U68Vfu0Zod0EFZ16si9/Z+WpGkAeuIF8sceMOHQN8trYBTrxq
         56FIdbvKDa/v56NusqpJMzzax2lrYaKEhPjF76YVuYlpf85cdyqEthH0UE4PrLAfCZjR
         /CvGA/QGNc3uuDoUoO2MUVNRt/xnorMIVJZfF4NNbkATTwprCg1jqb7R3TGyTZ7AZotx
         YEzDbSrGF8tGRwLxVPFOhVYo3xWY2x4XLQUwlRFBupvjT6pQnX+SP/dgSmG1uM4UF2MK
         SNUvc4h5u8DvSreheBXLfTN9yZLXjWPxQpYaxeQWcUIObcll/t7kryuA8HUc2GUXTtvU
         wsFw==
X-Forwarded-Encrypted: i=1; AL+hErGSOdbk4NwfOz+IohaJR00BJGzgxlUa2o0twCLuKXoGzNywG6W/fHYbAHOdVEMCkEQ1E+77txQyVV2HEQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/KwMHheCxfeJrqKpa534Lkrx4eMrRIfRL5zOfWFo5zllNj+U2D
	G5si9UAqdZrJ4C6qn/JjcTFQ/YZGGJIe9kyhfokA4KqMet/Apc39NCo8
X-Gm-Gg: AYBFou3c1dm+FQKeqhfvdWc4bYZjIWGVQtxDcR0i01S3S9RrPLJOYp/4ECChfG/tzcL
	uf3cSZ6Alx1YYjcfyzkh7MYLnHd4j/8NM6tVMFPLudZiw/N4W0qiNZLSn8eXSx2szbjYRJzq9U2
	SBMhGi/vBVB1baN9vdE+F2xjn+lO2GqS1SsxsuEUe+edsaQDenvw7gNupL+klcrEaxKPWfuHUvA
	K1JW7ObqHMxs/Xektz7yPdU+rqzILK3+2swhqwUQGMf9m9zOE7YxMCqv3nI1VQWS+48/N+h1YTl
	RCCyXFCw6X8fPav1Uim7YBn68SspE2FOIUuN7AKLk7y/gJIGFoN9/Cz3ihkHwO8hELhQQ5uCspl
	ELRRCTKQDRCaJD06aXkSRv+Ik6e51d8URsxRrOZpjAf3lnWo2PZXHuTImMvNj/Se+PSxp0GRjjx
	F31x5jp6ZidCPb/1ZiEu4932yzgZTPvGhKQuJNdUCTux5/Vuecy5M3YVEBU6jS0WMlyNFlpRh23
	4lij8L64QAO7TJIC7QvfCnsw6kG24nhLLuJr+UYjL8uALv49UMqoZLoU70CPXg+bPHUDoBcIffS
	VAOf8ynMDbTf1BIUNcOnyCILshCGQEgTKlKgrswezvkZxlPuDWFA1X1vmZhK3KAg
X-Received: by 2002:a05:600c:8b6f:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4b9633cddd6mr40682765e9.16.1794168481504;
        Sun, 08 Nov 2026 12:08:01 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee249d3sm87320515e9.7.2026.11.08.12.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:08:01 -0800 (PST)
Date: Sun, 8 Nov 2026 20:08:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com,
 morbo@google.com
Subject: Re: [PATCH] media: verisilicon: Replace strlcat() with seq_buf
Message-ID: <20261108200800.2b3b15cf@pumpkin>
In-Reply-To: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
References: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Nov 2026 00:45:18 -0800
Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:

> In preparation for removing the deprecated strlcat() API[1], replace
> the strscpy() and strlcat() calls with seq_buf operations when
> constructing Hantro video device names.
> 
> This preserves the resulting strings, including truncation
> when the compatible string and suffix exceed the destination
> buffer's capacity.

This is just stupid...

David

> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> ---
>  drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 26e5d5547466..2bfcd45cc55e 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -17,6 +17,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/seq_buf.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
>  #include <linux/workqueue.h>
> @@ -883,6 +884,7 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
>  	const struct of_device_id *match;
>  	struct hantro_func *func;
>  	struct video_device *vfd;
> +	struct seq_buf s;
>  	int ret;
>  
>  	match = of_match_node(of_hantro_match, vpu->dev->of_node);
> @@ -902,9 +904,12 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
>  	vfd->vfl_dir = VFL_DIR_M2M;
>  	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
>  	vfd->ioctl_ops = &hantro_ioctl_ops;
> -	strscpy(vfd->name, match->compatible, sizeof(vfd->name));
> -	strlcat(vfd->name, funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
> -		"-enc" : "-dec", sizeof(vfd->name));
> +
> +	seq_buf_init(&s, vfd->name, sizeof(vfd->name));
> +	seq_buf_puts(&s, match->compatible);
> +	seq_buf_puts(&s, funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
> +			"-enc" : "-dec");
> +	seq_buf_terminate(&s);
>  
>  	if (funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
>  		vpu->encoder = func;

