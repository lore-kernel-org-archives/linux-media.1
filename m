Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794570069;
	b=hLCpSKUPz07Ta3YEOAx/Jw+4xNdNjoQGfLNKuKbFYvK6zmJtclZkCx73gvjlitooUcDr
	 YeaOq4HikPPsF+REkAftRrF+WNG+bESEy5nX3ui3QZmE1or6crNBzsq/H1JPG1rjrL8Fr
	 vqI5hEFfyACtdXiNwIus3uUO2P9gLqiQCxtpo/3qjPgTYCIDH+JvdOpVqRIUO6ySlKIZu
	 Ikcoq+0CIP2JuUhkah+9szRDNxd3WS9zkQicrKw9hkMaZJnc8+zZ+VppuaCN4NNGgRxDj
	 J9fn0FIyAuiFRC4RYBf0H14y58J1NbLZvVIqYVB+BM3guFTet8p5ZqQe6kauk2cEJJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4FI56beRHbK9i6nJyITWzaNhiudDKkQnOlYwDX15vvg=;
	b=TLL9WrJKwy4HmunQc3KdGyTlhjGUnie7u5jfnpuA//0Oadzmh94woQRdyI9DW/bLfKzo
	 BbbKtGn7Z9zXCKsGf29kfCcDD7jC63eZefU2tf4n2sVxJaWezwtZjvMOQdUEBb7knpFQw
	 J21quhNhp0T095zK1M4mTxNaD7nztn3Ok4yNx7vrz3c8q11rzGR0unlmFgmEmAADWY3Gr
	 p7AKEfJPQXrSGGKIHZsQPuljvUPWOEs53TUtOquz94wo/EnPLTkxdweHGv5/wlTebsqKn
	 2pHAtdrCRAqQ4piPX8lPCI/YyF86HHN+iBNA+wpQj++rPlMrRum+pbp8opJX5smDOKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7oeKOC+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C895D606A334
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 11:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C895D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7oeKOC+
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8253bc5a613so1039511a34.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 03:41:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794570068; cv=none;
        d=google.com; s=arc-20260327;
        b=VIXs+6ATGknk2FuJdwvqIFyxsWG0hEMLCkTE3T/b3ZYiUH/2dLAHW4I/0496EyxtPD
         97zrkeJ6VU0riKk+XB6L8ZMFdVC27Adr8TJCEDmtUxsRFRRP46lRgGZ5bedaEPsEelY6
         GFvAT9CFsc4C8e115hS2QoPcJFmUlZkBqkI5RsDBLGaX2C8m7Snwm1t1AKdAUOSIbb1W
         6d7jgr1a1RRzgWNetsUnUSAnsEQj/T9Pf49m9aLwvYdSkAUcBoHyy+8JkDVGqYU3KvOh
         LAYTygAz77cy58ULybPVw8XoevBwCIW/b87ANNL7T0clc79HxKYMazBWt35gnRVTQCRW
         +jGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4FI56beRHbK9i6nJyITWzaNhiudDKkQnOlYwDX15vvg=;
        fh=Tq/dE1gYfFm23Xv2OMtNvdwGXv6NrEW+2+E+LUQnB7A=;
        b=VuKHpucHDXX+NpByKHIj21YbMZk4fJKfac+A+RCgMlTWq04uOnpdsCbEQSXpSmHgOM
         ztOQ9chzSn5haqgNwFmI9mXmLdZ0fxJGgJFUUU5vfsTu6Zwxm4WLHwg7Eei8q8MsZt6M
         ZTvZTkOm5p6uEyYm6HAQMxJpXww+v0aNbHQhOCSjvLbM6hr2Hvnz502+eheSNdINRrpa
         DViIH88K6cNj2biglIlGvmieHICSkGp9hqYcAIxsWfvdXvWQ4iizfEt3Q4yxkQbGR7fo
         j86S6TmGbgx6YWdQ0dPRdAaSiD9ktDzL8TVb/pC2oATX+SdnX2lauu79jEMnSj6BbHv2
         5oUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794570068; x=1795174868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FI56beRHbK9i6nJyITWzaNhiudDKkQnOlYwDX15vvg=;
        b=K7oeKOC+Laqa469Gd16DBwDdTyJSjZNWZ8ZFzfV+DbKmgGXOoo+khnI6nSOCB1q8A1
         AWgSdaZhBYG+eztBJ6k8TE55g/mY5iLLfT9crGt6+sLfDnHdJWf2dek5e47tjzqTzkqe
         zRXx8/QqhFKNSEryXFemB8Gcn4stCqs54LWcF/7rCmceOfMLlfWvbZsFd6ZrwOTbB7fW
         LQGHuF2YozBTQB8/fi+jWLf6HY/WnyRc10cA2zYYPqoXU5xwAMadR2E1fN9us1+hklM6
         je0+MEHwz8siKjFC55kBVvNOU9lJ2t1+82BrWpIWAow5vvEi4iyzGVgafaSzkeI5hOVW
         HSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570068; x=1795174868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FI56beRHbK9i6nJyITWzaNhiudDKkQnOlYwDX15vvg=;
        b=KqaMbGWCCNZf7OGH3zbJRq9A0VP4y1dPlxqJ/uDAKu6Uprp52PFslAq/tNOAIjoe0A
         LDGyL496y6iO2I3+gMF+Hb6AfES7tio2l+7pPYzjDJy3+OvlAWbSE5d97lOVTtl9g5OA
         g9p/6qclEx3rWB+hM7PXiZBuCLbu23P/Ga4aeQ9SO/zB2w7ovbaOwcOrzzF+z2d0mvaK
         Cg7x6t+NuzwagOHZdSr9EN1lvZ1fY7yRZQOsnr4Hy8ccQGtNDpOrur9lv8h5uNjOEjjn
         3k0st+QXwd+I4blZs/n2XtK1YgDxLWlAPnvyD8m/USU9WlGOAHuPHW9WBrzrcFiKJsMz
         zeww==
X-Forwarded-Encrypted: i=1; AL+hErEzYQCeEjIUVzFJfIbSlaWNjV4Lbl29fC53qchNCYsflrFFagFrJ7FjNXHEl+xQBlrQB806NT7/pcSAxQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9V2bOCPwlPrVbBsTItbSI/n1/JRJ8bYSVxz/PoM47ekk+9zrMZ
	ok6RP/2y36jb+Va+b98y8hFVk6lkmOsYBpjL7HHm9PQD20s4gyZTtBwufxh+jdFKGVV2H4q2v2Z
	NyFc3IR2cUqnV4AUwBhgcTksFfNRe9Ws=
X-Gm-Gg: AYBFou3I9o9r0V44jYE7Stw2cvW1Iio0to79yymK2sYtmXvzJ8IBlPN8b4WHEgywHEj
	Y9p0YQGLCCMRJ3xMfQryQSO02/iKvMeXYPpzmxrDfWmB61OZtfjQZGNKnI5Ah3i58GfGg3Z6HGb
	xxhwZ/QGEyotNBiug7bAPI8rVME2SMWjD7nMFb5g7VZ5yS2wxmkRGy2WiOxiBLP7dDR0m4ZQCkv
	fNIfqZ7Pk67BVehL4Tp3ZhKBQCPsfZQ25Z87CGJA8nMRbv1HXKhK9ajS2wuz0DIPlaaPhv0+UmH
	PTFOvECipJGaGawQoK61I58bnf9ivQ9wGrHOYb98dqy2/la0Tcz40FwAmqPoWwySkOnUpXVCtp0
	AmiLgzDwSTWK8oCDMJPZd1YlXJMBg1sJZJUV22k2ZOuNXclf4Z3tWeYA2wnJ3OrrnZu7ugNqf7D
	RSIMRG1HdBgHRioNgm
X-Received: by 2002:a05:6808:1a0d:b0:4bc:336d:7494 with SMTP id
 5614622812f47-56e63489ed0mr1659739b6e.30.1794570067734; Fri, 13 Nov 2026
 03:41:07 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com> <9accec98-c16e-4815-a479-b84fc39e4580@gmail.com>
In-Reply-To: <9accec98-c16e-4815-a479-b84fc39e4580@gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Fri, 13 Nov 2026 20:40:55 +0900
X-Gm-Features: AclHuK_Sb8EucpQ_1kcbihJ9nEtIMxpgWourPainPCnNSFmKltS9fjavm89w8gE
Message-ID: <CA+m4KrDA9rx9YB4pPMdZ+Qg-GbGyYb2Mnfbb7NdgrwGWduEuYw@mail.gmail.com>
Subject: Re: [PATCH RFC v3] media: mediatek: mdp: Keep component suppliers
 powered while streaming
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: devnull+getfeus.gmail.com@kernel.org, Xiandong.Wang@mediatek.com, 
	andrew-ct.chen@mediatek.com, houlong.wei@mediatek.com, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	mchehab@kernel.org, minghsiu.tsai@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

Thank you for testing this on another MT8173 device and sharing such
detailed results. It=E2=80=99s great to see the fix working on the Fire HD =
10
as well. The broader codec coverage and suspend/resume test are
especially helpful, since I hadn=E2=80=99t covered those on my Elm.

I=E2=80=99ll include your Tested-by tag in the next revision if one is need=
ed.

Out of curiosity, are you working on mainline Linux support for the
Fire HD 10? Your mention of the board DTS being under review caught my
eye. I=E2=80=99d be interested to hear how you=E2=80=99re booting and runni=
ng Linux on
it.

Thanks again,
Youngjoon Lee

2026=E5=B9=B411=E6=9C=8813=E6=97=A5(=E9=87=91) 15:46 Ryan Brue <ryanbrue.de=
v@gmail.com>:
>
> Hi Youngjoon,
>
> I hit the same thing on another MT8173 device, an Amazon Fire HD 10
> (2017) tablet (board DTS still under review), on v7.4-rc2 with VPU
> firmware 1.2.0, every job took about 1.9 s, the firmware reported
> success and the CAPTURE planes stayed zero, for MT21 input and for plain
> NV12 -> YV12. LARB4 was off during the job.
>
> With v3 applied (one context fixup for devm_kzalloc_obj() on rc2), all
> seven sibling blocks bind, and MT21 -> NV12M at 1280x736 from the
> decoder matches a software decode byte for byte for H.264 Baseline, Main
> and High, VP8 and VP9 (30 frames each). LARB4 suspends again after
> streaming, there were no IOMMU faults, and a system suspend/resume with
> the driver loaded left conversion byte-exact afterwards.
>
> Tested-by: Ryan Brue <ryanbrue.dev@gmail.com>
>
> Best Regards,
> Ryan Brue
