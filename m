Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962345;
	b=MQ92Xl2TGG87itPmf9HFR/mXHC2c4kyeFmJ/s8F1m0hoYcBUWYyB0esQ9a6gyBaEvl4S
	 8ir9g11+cwcecCH5b7CfuFr6y4mDmAYoxzVCEQPSACslRhzx/FJC1N2aB5gRTJypZWNm5
	 EEfatsBSEWktuNpQgjypofZQjhfIpuaSSADeXv2qfZGToT92iiEVDHZF0czxnWdo/z/9x
	 A4//1NOHBCV/ttucr33HbVEtMJosykgFoxfUHonmWg/seHCKh3wwdAzR8gM9E3iXGl8iH
	 Rb+NhKj/lpPprnF2R4pH42IQr8f2VWvWqeKWmPm8o2oAZCym7fIsozF/tyyYOFAnywg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
	b=aFUA/npQuXAGECo3HUhImMe0k8ZqC7Gg4XxMDc0ib8NvFNIxBKvmistO4uyR/691ql0u
	 3aRgGLNwoNWmPPVroUDEjo91PAELH9W3Xbh5YLU6GWYk2IxesNFVYMtbZy2irL3NiMcMR
	 kr+c1NanaOzwGW4ne/JYYLyYpEu3WZ/ajySp28rhQlwAhb5zBg2J9+cQj3v/pcH2q/8Oh
	 cllE5qyuIkH6l6GY2F0bMGmLOVsJaslK9815AUM1yuy0Lj7WSi8/SF1JMSnjz5c5azKts
	 UhU9rNdl08Z0Ks7IvtNupd8iBwB682td1W4IlmXQMh/zdggkU2ymF9HWxqa77oyifjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvN3tpWT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB37A606EE9C
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 10:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB37A606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lvN3tpWT
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3762285e9.3
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 02:52:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793962343; cv=none;
        d=google.com; s=arc-20260327;
        b=NT/2ZKXC0JhjS2NPG6lTQlfUyndU7zTeMSwFKY33PbJNhjTZFTGKp5KEV5FoJ0nyoV
         dTR0uxj56GZdJYa8EtSWv/PYhWriRqwHoVT6EOJd15Qoo9nfTO2CubUOvZQZkaRSsuri
         ZoqMFa11AhBJdRskVHrMC6zH36Pju2k5Ihou8lELP3QAvQglDOUhkXyy7118HM+0eWsB
         TMQH6gC/uvbFwFAnEXkFQ/mvqPddt3auFq2DyYAB9mErOlSHhEWSKM3FEPPf3cWy3ALQ
         JiHKZOZM3l4erSbg0hJrTkCCvCjj+kj+HHHIVVRKwyGhOySbELpEayVgnGj5IQB+68Ig
         zGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
        fh=8QKwnx2xbtvhkO8zPYkdLkyKjHdFR0+6+M7e707IoiY=;
        b=bX/HAtnoSLOFLdMBYjXd+AayuLTp+gtHpS5Stu8MJIIxaFBbV7erRkcyNn04rNeN90
         XQZXGOX7ye6s6fyZWSJlQdXXy5Gv62VNv9z/YLdV+mXJe1d+4vr+oVxGtZFuf27qN97E
         TMU3tKRlbtcdW/HTh0VAD56yxoO6mdXMGoJha+M/bCl8RWibTlMz66nnv/dTjmW0puKn
         JrVLxNdWI11Vjb+CQpWhdtKbX2s/L2cOa2sD5IUEwmIoCE6ED2h1UkcIJPFzNJD6akZR
         0zTDIYABRbQgMEmrgjdN6EFNyKXmm2BlmBjknyEoqARbjUcDgEGJqvnuDpSWPbp5QWsF
         wC2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962343; x=1794567143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
        b=lvN3tpWTeQpNWoDkbs3yHEwVfqoGP1Ll9s/HrfhG8tEDDv3PUO1hwT15EkduXS+rWm
         aKWxHsXRIUr2QeleSRc+K0NgYrShBjliU8NjORCRwkrNoin3iunoivkUiQVSnOVPn3Rx
         3bw9l9mkskwPFOKzC57OGkiAtMteSYznGOZSX7n89i8iGMDsWXZApoeXQWBtfBEuFZpy
         KcN8x+453vC/bhc1y32uowH4Ej1eJXdn8Ad0zClYJTCUv5BGywALZQmlFJ5fvNLFRNKj
         DMkqNrtPcHnNDWbKKAFD0WvieXZcGyKH6qqVqbR80niPzNimQRLquSkHFkxdOBQvYL9E
         L88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962343; x=1794567143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaiSXMdHY6dt/gJdfV7T6qu30oh9hfVCJo7KmSZyiNY=;
        b=tkTAMeIiXNSUvq1TE4KNQnBXY151G6bei98cnF08l9VGs7UldwWS1LZj2eoQlY5pS0
         BoNsubkcY8N2MgoTS+CZNB7/IlytgrIjRAuRzvVjxLpeLDVPbaqJLlcY10OPFLm556Bz
         KjPz3TIwalyI6uUDdBaoEbcvAG1tkYAkDdeWwHrACbp8qZTxivV1SQG7XgwfNWUkRvcr
         GElukN5FhPSWt1pUt7I0KKO/T1ebeSkU6+ckzsbpCZsWgRtEtrphEG4eKxdai3JFC0QY
         ORUCj+sbA5J+qrHDx4yS4zgSRBGvFQXHUG9ImCfqxla7SYNA4EUSEYBT0fURuZdA1JrH
         vR3g==
X-Forwarded-Encrypted: i=1; AKwUvBzpjf3FM2RKbWWU9xHdHxcffixx6LFCCqPDPw2KUt1amfpxFL0pyHXeaH/BuUNGvWmHnxwWdR9Wakx1cw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+l8ww4djj/E9IrVTv0JAn8/y4AbgUz/FdOBuSOBq4jpmyazdXk
	AqP7O2RngcvkQa5sdqdtcrHh44z1KwITEP6rxn30Qcyg/1VFIY76+17llUfShZkFxcSuhMELjQJ
	un0zZr8FO4tZIRmIz9C/XA+T38bOLdZI=
X-Gm-Gg: AYBFou1kFqCmVcOayh4A0or6+a+dgH9LadQI0FsGE4Bjp9TrW4TIv91c7KESOmUajQX
	MzXrJpFcKXGes2N2LJj91ETT2zKMLRge8vHRKFyZO3q0QchmLDCPso3kGvvkDrxoWjKuufLI+gZ
	3kEpY9oZIw1vP749q/DhSVf8nH8oN1DLA3vJdFkczkxqXrq9O+c9Iyx7kDinva0qNALxSe1Z9Vc
	+dU/xOSA98CNDPoor29wYWRWIOVbLe523f99iGgbbV/ctR9VQrZA20Gxu5QfePsNLaUQdYHUaQl
	xoiSnHGhyc49ipTjgWd9FwrdGntFU8ThJ1ke3rup+JQB2ZrPLkZt5nS6a6RSdpdBnwtBN1QAIGK
	qwIn+TtjRUeziJs5ZecQROB4Z6T/6O/2214qXvw7+7W/stX5p+ZaGprvIx3oTabctNSePKsTo6I
	8MBijNlrJIoYD1UsiUkw0bowud1rG+RiyNhPavLQpfpiCFR4WvmcFVnICyFA==
X-Received: by 2002:a05:600c:4e43:b0:49f:f099:6fb1 with SMTP id
 5b1f17b1804b1-4b6de0cd91dmr32855205e9.15.1793962343270; Fri, 06 Nov 2026
 02:52:23 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org> <20261105-mali-c55-renesas-dts-v6-6-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-6-7dff41bf7107@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 6 Nov 2026 10:51:57 +0000
X-Gm-Features: AclHuK84X0AV3nOTm5UaYtDdNo8XHTBLk32hG-FVymrE-EyctstaEQaOUyISrDM
Message-ID: <CA+V-a8t5BeTXN--GZUMWsoKkJ7PK8f-iFeFp+XXuKO9x2cc2fQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] media: mali-c55: Assert the ISP core reset last
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:02=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Asserting the ISP core reset before the register and AXI interface resets
> can leave the RZ/V2H ISP in a state where the first register access after
> the next power-on stalls the bus.
>
> Keep the bulk reset API and reorder the reset names so that hresetn and
> aresetn are asserted before vresetn. The bulk API asserts resets in array
> order and deasserts them in reverse order, so this also releases vresetn,
> aresetn and hresetn in that order.
>
> Suggested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/driver=
s/media/platform/arm/mali-c55/mali-c55-core.c
> index 241a625f7284..e37f87e36eab 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -70,10 +70,17 @@ static const char * const mali_c55_clk_names[MALI_C55=
_NUM_CLKS] =3D {
>         "hclk",
>  };
>
> +/*
> + * The reset bulk API asserts the resets in array order and deasserts th=
em in
> + * reverse order. The video core reset (vresetn) must be asserted last, =
after
> + * the register (hresetn) and AXI (aresetn) interface resets. Otherwise =
the
> + * ISP can be left in a state where the first register access after the =
next
> + * power-on stalls the bus.
> + */
>  static const char * const mali_c55_reset_names[MALI_C55_NUM_RESETS] =3D =
{
> -       "vresetn",
> -       "aresetn",
>         "hresetn",
> +       "aresetn",
> +       "vresetn",
>  };
>
>  /*
>
> --
> 2.56.0
>
>
