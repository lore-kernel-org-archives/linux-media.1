Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84653F8EAB
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244514; cv=pass; b=d4M7C3dEoo7v0k9D7emH4YatWlREs0JsF1kqzTlr/v/kXEJuCEr9P6aZrAPSS71AMg5QOBKxDawcY9ouEwI4saszp06uP8ae35MxONMwHVXARwjzWi3DH0Pe2JlV6GiYwLifU9TVvgLg0F3Keu8q8ajx0cYj4QVIOJseYM9mtow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244514; c=relaxed/simple;
	bh=drqwbU9iPlyLSkEGZwyH6iZOuCOK+lzLafD2rb0ygpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UeM+tmIwes4AIaSAmdaGN58Rsz7/NPdBKG8X0LTNrq6hM05OXx6kHFQt/SsEc+6lhSn6/8PKP4sH1vhAD3/gh+xiyOoUSMFVSbIHR9wRzq1fcKSOBXdclYcucRsyhOun3voNFLBuFB++54IV8XyuL+gZCiCENiJUXWSrp7rUYVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EO93fXJh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dr0+QCPE; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EO93fXJh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dr0+QCPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785244511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xR128h8yYMlJVgFoHvR/QRxqxT9TqI+H8pfRgc6ihPQ=;
	b=EO93fXJhxO4kKc7dC3/ByJ1Q1uXQUYNf/2VYPJ2PeTjW9CkIMb8L0iBgTpSH5R6PmCZZc1
	1w3ofrAcmK/7gwKBFAkb7XfopcvVfSAPybHaqvFVSBXSqpZg6Nu9NBKvWL0D0cb73WuLjt
	PPB/oRGgcrcOFFbKRyO4b1RynpEDz7g=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-Jxizij7rMIe5ds60qYWVRQ-1; Tue, 28 Jul 2026 09:15:09 -0400
X-MC-Unique: Jxizij7rMIe5ds60qYWVRQ-1
X-Mimecast-MFC-AGG-ID: Jxizij7rMIe5ds60qYWVRQ_1785244509
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7eb6a8c61deso2650654a34.3
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 06:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785244509; cv=none;
        d=google.com; s=arc-20260327;
        b=QOY9/DmNoKqC3xsqHrsHjfisebhxdRunP6X8giyYR3YKuY1sGsbyKiWDSzFPGqoDUD
         OhwYcD8637ncyiJjjJBI1nQ2heyHGOAavTTgJH0CdJd+sidijQFu9gNa6Ey2gsH6VKxp
         M9S+484Pwn8p5OHxXE5wlulRwl0zNk4cLKeWip+90f2eqRynRScJYs0ynfUzRmrBQfEK
         sNLzQRf6yjkX06K/KCIPGjVTpsTgJ3DMRMCauFp6FmPOgJ679m3NxdQkQE9ZBZ3rbdTo
         9Kiw4S5iyRs5fdZg3NJDgITWhJ+89c46b3ZHwQnjSc98X7BSRh2udzzRqhwRuHEcefON
         2fKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xR128h8yYMlJVgFoHvR/QRxqxT9TqI+H8pfRgc6ihPQ=;
        fh=omRbsgpbZ4xOraGueQeYcimuTurhOj+CgqauojD7QiI=;
        b=hOj31e/QpLmpMO3no7HRLRyLTWybTj9Lfw5w9DFydzX+mpxX/ix36bC6xVw4bKpY7I
         BOW6jI914d6FQJc1KI4vbzKBlI6idIS72kgbOOIBL3WM4t6sgjqIhNTl9jAnhMGtW51x
         VETFr7r21BflcmWMMftv8BM41WdHcw6Ibr1IFVR8/gME3YWo1qDQIZT+xgl2zT5Hf7g2
         OW/6ViT/9r7bmfHbO55Z31iKbq0Ul8WgvAjQsgEwgVMckdy/5qN13FkcC4pwOkriRDoP
         HXl1pH5emnTdBobhkFgtX8NJqrtYn9NySlGCocgoXijabxGYT4Y7pAdfuQsTtn1w4pGJ
         GJ4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785244509; x=1785849309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xR128h8yYMlJVgFoHvR/QRxqxT9TqI+H8pfRgc6ihPQ=;
        b=Dr0+QCPEu4wD1lfcI6LIVxR8qmzKOREtlPOTerdFU6MH0B7M/Qv1VS3Zrtwpf+cWKs
         i6GH0bcUgLR1rlAsg6l4Q45trGzA9azyLmxPvh5iKJw5aYnOIchAc317CYqQ4cq5E2od
         NlJijNVtoeDnosZeKXv/mOSn3XUpp1lS75Zs+RpNjAqrbUzrtsxPnwhg64Q3YLnuLM8J
         9aCE4mwj5bWbfBf6phHieIVbtYaPbHTQfdrLVzsIqBylUE0IZzDgjl85VBFq8s0hknkH
         De3yukZqnvqk0386tM+RO1+xX/fcskoZDTqjOOcQmlLsULMzNrbXO8+RvNG5BrnBdOJd
         Q+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244509; x=1785849309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xR128h8yYMlJVgFoHvR/QRxqxT9TqI+H8pfRgc6ihPQ=;
        b=esB32E/FpnZmGld6mICCoCvNSwGpZu5gaRJUtMkC3fwB7zUGHeKyStQcw207xu1Ps4
         hAkTfGOA+vXV8SAnYnaScegl377sa5CBBZPcHjQj491QMuktkm3JRA4ZAe6Yas4GNl9t
         BJxsAE/yh7IQA2HxPq32D4F4TQdWN9ahnNPRi5yxm/UUJqlJ3bMPcu850GOJHlNxcB9L
         u8KkPWn/ZEG1zFbMmtLL15KHK0i2FjkxBXD1QJL7kdr3wQs/bmKydG/YUooHsxtTYGpF
         J3UYmcHZpW6U91y24RR/0jOT4Nt5fK15l4lzJ8DvQLT+MR66yNi43AQ1S/tTes6nYxna
         tVTw==
X-Forwarded-Encrypted: i=1; AHgh+RqRknjKcd7XHT58Qpk/olapyMA9bXt8fhEPTTb39OKFXEDxWV7vBJviK8C/+NJmuCEnNRst4KYRsa46GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNk+trgraYEwTU0bMEPrcQM4Nbgh/vz8ixasL+olkwoPtDRrov
	4i5l9ak1afhhFpmgHPNSRLhRsW0XELF0Dlc2TIgOyIDTNIXI40g6q4sRzXZdm7UcXHWMi7R3Lv4
	R3OmyTJ1KHVOWAYz8hhPYLKPA6pD7Wi73QP6yrEt/sMUD4CESPpE8PilexZZR2K8KWthQz1JczN
	/ibz5d2uNyERyy2mWdDqDPiWnBFRKNXr4v5EqGlJ4=
X-Gm-Gg: AR+sD127ansaVq5+Ovvbo02Ki0yw99ILKnLJ5chM8+tvpK5Bexb1CTpI0+r1QJkZzev
	GlDsXIstkBfoHTZU1w/69uFfm4SGNEYwdOlqBglMjshmYM6bQgKyKACH3BSRL7pbL9br46F4I4m
	H9upyI7SJDfq5yT74lbVpUyrzQsEICRKOUw44DAQscvK+n6R6tiK17v9o8
X-Received: by 2002:a05:6820:2088:b0:6ab:12c1:9900 with SMTP id 006d021491bc7-6ac96bde29amr1229788eaf.35.1785244508645;
        Tue, 28 Jul 2026 06:15:08 -0700 (PDT)
X-Received: by 2002:a05:6820:2088:b0:6ab:12c1:9900 with SMTP id
 006d021491bc7-6ac96bde29amr1229758eaf.35.1785244508039; Tue, 28 Jul 2026
 06:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724041417.9921-1-devnexen@gmail.com> <20260728092430.12491-1-devnexen@gmail.com>
In-Reply-To: <20260728092430.12491-1-devnexen@gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 28 Jul 2026 21:14:56 +0800
X-Gm-Features: AUfX_mzcX4jiSvrjgQJyzFnQyQivu-tOwOXRIZxgBrQs7ib9gGfFag7Nj0x2asA
Message-ID: <CAEth8oHmyo=ty7MQpOuWZ9gLguTj2Pp9F+4v1dsqnj2vj9CVRw@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: imx471: Fix uninitialized error value in imx471_set_ctrl()
To: David Carlier <devnexen@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tarang Raval <tarang.raval@siliconsignals.io>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

Thank you for your work.

On Tue, Jul 28, 2026 at 5:24=E2=80=AFPM David Carlier <devnexen@gmail.com> =
wrote:
>
> The exposure and vertical blanking writes pass the address of the local
> ret variable to cci_write() as its error pointer, but there is no earlier
> error to propagate: each case is a single standalone write, like the othe=
r
> controls in the same switch that already pass NULL. In the exposure case
> ret is still uninitialized, so a non-zero stack value makes cci_write()
> return early without programming the register, and the control write
> reports a bogus status. The vertical blanking case is benign today becaus=
e
> ret is zero there, but the construct is equally wrong.
>
> Pass NULL as the error pointer in both cases.
>
> Fixes: be1589e567ae ("media: i2c: imx471: Add Sony IMX471 image sensor dr=
iver")
> Suggested-by: Kate Hsuan <hpa@redhat.com>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
> Changes in v2:
> - Fix the root cause by passing NULL as the cci_write() error pointer for
>   the exposure and vertical blanking writes, instead of initializing ret
>   to zero (Kate Hsuan).
>
> v1: https://lore.kernel.org/linux-media/20260724041417.9921-1-devnexen@gm=
ail.com/
>
>  drivers/media/i2c/imx471.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index 6d358b11e96d..4053aed84340 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -334,12 +334,12 @@ static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_EXPOSURE:
>                 ret =3D cci_write(sensor->regmap, IMX471_REG_EXPOSURE,
> -                               ctrl->val, &ret);
> +                               ctrl->val, NULL);
>                 break;
>         case V4L2_CID_VBLANK:
>                 /* Update FLL that meets expected vertical blanking */
>                 ret =3D cci_write(sensor->regmap, IMX471_REG_FLL,
> -                               format->height + ctrl->val, &ret);
> +                               format->height + ctrl->val, NULL);
>                 break;
>         case V4L2_CID_TEST_PATTERN:
>                 ret =3D cci_write(sensor->regmap, IMX471_REG_TEST_PATTERN=
,
> --
> 2.53.0
>

It is good for me.

Reviewed-by: Kate Hsuan <hpa@redhat.com>

--=20
BR,
Kate

