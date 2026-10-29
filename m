Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286627;
	b=kGyI4F4DaZ95VmiLA5PaNHcn1ZWdmsBDtZpWFcNMvnG283+vEqaSwgFozxNjsoWGHjHd
	 h27pKYjTNJ6Jwcyz3Gu8tOmiIuYtuXAht3RKmeKmABRddOjhpG0Ljs4zG4ksi78U1gxsI
	 JUSZQM3ErMrrEiRpq3GEFWd+bO0jiSwAErptpGlb2iCzyoxyVVDaZAA3j6TOpkYzonunt
	 9tZmvBpSFKpr2Rqikpy4nGF7BytQbko71otJZApQcIF+2/7WK2jmXGidJHvyW2/Ws/8wa
	 fKRgMyu4x479/JA4gAYDcODzP/yReE7Oni6UAJjVoYdkgbrRRbvYvGS32MSEpaSJZgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2b3vVP1vEHIm/JW4JfzuulbZR3cusd4/fTQxKoNUz94=;
	b=KV3oMwMGtqxoOLS04maZi50jqu/mD075Kctr+5JglMqEaM1gbXXT5P8diJKV39jkeXk0
	 CdQK+EF900+DN2z9Ql4zuBbvMZqfE9KXx/fxu56QLIOsXXLFvhKiOiHuB7ZOEOt9CaXdE
	 2XFksZCUZKLuvmJ0GXJZcn4qHfwofCHcHUwWX3aIh7CGle3w4Bl6VhmNmhAQfCwd1rHTZ
	 wIMimiV5eVl57+tTIOyy7xA1Mv5ZBIIxhMEeW3Uzkqh6bXSh0nkKqK9hcqZaU+JOt/9GO
	 Em/PNbbwdzJuh1oVbdkzAwFRFW2OrB4+fkrv5YJ4LGndP1DPqbX9gkVJWqcl2fIxsvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=t0HEKi3J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2E606A31D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 15:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A2E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=t0HEKi3J
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a89b4a59a1so700876fac.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 08:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793286625; cv=none;
        d=google.com; s=arc-20260327;
        b=Rh16t82VCXEslrUUp9pcT/IKM4MQX8cak6YZ/scLjLYo6i38eXk0ffCFRrylV8PPyq
         +DRf9XpptZuEd28RREIm5lLmXNDe0CTljyZBouTZ7shtWOYtyNP5euyHAF6Y4np1AZCd
         9baYdI5qCUSUMY+4P0ZEy7XuVBFqrWSZUVq50U7Q9AFajAXGOTzb0Cl56CObdA95nQc/
         Mv8Tx6jy6xGYJPAr1qr+qA0cQANicQ+9RQnluNc0/RuVJl5y/WpTPeB0mKLD9YgDHKz+
         iCNmd3ZxYOFW246K0p0G5kFM5xWHdFV2S3z/5u5DQDVEKdLKKKviCTFC7tm49XAHksX7
         VBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2b3vVP1vEHIm/JW4JfzuulbZR3cusd4/fTQxKoNUz94=;
        fh=OdMQmljo3uaSIgQ7CC6jUw/RWPzSa43bsXe+7AUI8Zg=;
        b=p8LDMstYej5p/N4NY3V5psgH3rpDrSxqArfhQgp4xuzPMebye0trhOZTi1RvZ9fQKk
         H8fFV3CfuwRnfFaPBlNelCVoCNkN5stQsRCTL6j4Nx7H1b2zwoXWe6oiK7Qf1AcVKnTe
         NwmsTobt9SARoMe+NywwkLaZ7cTyLmsrewU+bsL+ztpYaSn1xpqKVmyynXFT8wyQgYF2
         +0opR5onTkWFRPYZwU+XvI+hdtUQXGJdRUnuvZyo+TJHjSkXlg5P9Xxeuw6OFv565nFZ
         ++PLJmWsyIaacrbJdsCJOKyw43dcuQ2HLVP3cHdiM9ncrFSNYtm+7H2867GlcPywKyx9
         aQAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793286625; x=1793891425; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2b3vVP1vEHIm/JW4JfzuulbZR3cusd4/fTQxKoNUz94=;
        b=t0HEKi3JEuYusOJQ2BlME+lteEzd9dpBkx0PYrvDTF6m0Gk0Q+n2i1EUE9nTUzuobE
         jgmDRB3BuFqDIcfk3pKSMf2ZVBNUYhnBJi4AQOlRU1v3BE8YfrL4dMUtUtwXzB/LkkKh
         W7hTXlaauGp2j3cYctzuHfnaObEhfhmydvxsoNvTEELOKG/xAuPZi8zu3cSrRxrthG9T
         avMlZ8RsvJk4iVIODKrTJFIFU/7bXBHJevI9/zHVtmfcpFhc6TuQMMeYsurZ/VZCOEbo
         gau2V+U2q/NGCK5o+dlwIHFTFBtIjsuOXnSt/D3Csq8dhKQoq2F4U0glozDN4haqHNSm
         PwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286625; x=1793891425;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2b3vVP1vEHIm/JW4JfzuulbZR3cusd4/fTQxKoNUz94=;
        b=JOWgXhekz2Eh5VwfViVPMCSh7JvqhgfQyxF1qNSp/XWdK8cQtf+1GB0fBMDObUm9nr
         gVCIGlYWqMkfUMP2p74vtKBmJoO1EJtA9BCfiomAYUtGybQGo0KpbyBeDvLT+fqo06oO
         tkOxgEFzoWLLZHtlUtPVfDahnAkvNoNQfKjc0i8TRf500FaleJrl6SeDvGs0y/N0/nxD
         CE2dz/4xdnHF58R8P2hoXOlLaN6HZqKH5YH7TFBkGxE8arfOwACKn/eDwEuHrajcqQHP
         cqfHeYOO7hCFTe8y8dfxof0Jvze+0mHss3s0xnwe5ZlIW3LqZwPFwk6W7Rm7+RTJg1Nn
         0+Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxhhryA6p/iSMCUpEHrwkT3KVzUUuzxemdKDz91lPQGIZ6sSq/YqhWEKi4kkgaWXbIKQG83WRqk2Lk+DA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0J690dkADo7hZr7PIeeETkaNWyPmjzpLtao594wdVFZlRxZbL
	ZzaeIcUMeYtaXNEVUVJlJZWMjj8GllnN2LEBq1rbeNg7TsusiED3Wtd0hRTr2W5iuYMTbwPuL8U
	ul7DRSlk2jh0AZSig83FXjHPbpYN257+LRj19ytBplw==
X-Gm-Gg: AYBFou3jz5GNLtD879XGW9jQmq9oC32vOmATx9MPv/8Skomey394n8E4SNYlTr9zj8w
	wQNQkenvLpmN1ameQfXjWYDE5Wa5OOQwYACGDCxNn3Rei4lT4SvTfWwwjuR1D/9EK5mPsgL9A4y
	RywXlEI8WmVO3KpkI6LUfni6G579vZs0Qp1gHIaCVUrTPdpUpVe/f935VPlNYPcWGI2Eqb1khzx
	KxzK8qdIRV5BkkColI/uPfHQZLnfJvd0P7uc6u4cbAXDGwCEWhYU/zNifBQJABBcqgHN8mdQLXD
	bezm4KC0ewmtxGOL8IBf8DPMmDDh0F+hbAzaxhEgCuG87Wki0vPkbGTRFFKY69J8cax0oWDSxEz
	QT59NNU6M7HoGE0RYq3ykXRAGdPO13sPvpM0ztZYqAavkyrFZ0i5214jCaS1/UxRJpHPE5mCLdY
	gd01PV9O1htV51/myiTk3Dtj0xFtO0FNOTsdiyoq7Yye791Bnm5ySGVA==
X-Received: by 2002:a05:6871:2102:b0:49e:33ff:6bda with SMTP id
 586e51a60fabf-4a8e06a7791mr1577014fac.16.1793286625298; Thu, 29 Oct 2026
 08:10:25 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-ov9282-fixes-v2-0-3bb376d8b1a9@linux.dev> <20261014-ov9282-fixes-v2-6-3bb376d8b1a9@linux.dev>
In-Reply-To: <20261014-ov9282-fixes-v2-6-3bb376d8b1a9@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 15:10:09 +0000
X-Gm-Features: AclHuK-NCoRP1AFBwcEcpT9lZOpueGQS9GFk1YygW8gcMAFUBjXyhMvfoBBBJz0
Message-ID: <CAPY8ntC1G0Q=MFGkLNSC+bCq-iJh+estq1FeDgE7aV4UksyuyQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] media: i2c: ov9282: recalculate strobe span on
 HBLANK change
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Martina Krasteva <martinax.krasteva@intel.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Gyula Kelemen <gyula.kelemen@advasolutions.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 07:49, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> When HBLANK changes the line time changes. This means the time base for
> the strobe duration calculation changed. This results in the v4l2
> strobe_duration control value and the strobe_span register value being
> out of sync.
>
> Fix this by recalculating the strobe_span register value on HBLANK
> writes using the currently configured strobe_duration. This results in
> the strobe_duration configured by userspace being kept, but the
> underlying register value being changed. To ensure the values are
> applied on the same frame guard the writes with OV9282_REG_HOLD.

Group hold will do what is intended, but if control updates from
userspace for eg gain and exposure generally get too widely spread
then, we've got much bigger problems.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Fixes: 84ec7597ae1af ("media: i2c: ov9282: add strobe_duration v4l2 control")
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index b48c959b9c908..5114fbf28a26c 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -625,6 +625,7 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>         u32 exposure;
>         u32 lpfr;
>         int ret;
> +       int ret_hold;
>
>         switch (ctrl->id) {
>         case V4L2_CID_VBLANK:
> @@ -677,8 +678,14 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                                       OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
>                 break;
>         case V4L2_CID_HBLANK:
> -               ret = cci_write(ov9282->regmap, OV9282_REG_TIMING_HTS,
> -                               (ctrl->val + ov9282->cur_mode->width) >> 1, NULL);
> +               ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
> +               cci_write(ov9282->regmap, OV9282_REG_TIMING_HTS,
> +                         (ctrl->val + ov9282->cur_mode->width) >> 1, &ret);
> +               cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN,
> +                         ov9282_us_to_lines(ov9282, ov9282->flash_duration->cur.val),
> +                         &ret);
> +               ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
> +               ret = ret ? ret : ret_hold;
>                 break;
>         case V4L2_CID_FLASH_STROBE_OE:
>                 ret = cci_update_bits(ov9282->regmap, OV9282_REG_OUTPUT_ENABLE6,
>
> --
> 2.53.0
>
>
