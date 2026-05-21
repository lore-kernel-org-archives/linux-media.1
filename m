Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B4B3D5C10
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367041; cv=none; b=E5YRUYPKXOM2XlsXd3f7BoRKq6OtJBK/ZmJBjOWslbp7LFXXqVmzs2Ahjn7E0nN24VozlO5FFmYcyHqKT5/aHms4zeNvVBb5aEL7SCfedcRk3jqv/16sitowijElnwKW9nxu1RPHzgy+mrp5PE0RsskuHoYwaYsUgFKW++xtYOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367041; c=relaxed/simple;
	bh=4ADfTGnQPzPw9uYjiUKJ76GqQkL3OcJYZUPppA4KL3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKmQvURiLJuysJg2W17CKyimsTgzcRQ7aBH+C0r/S7RlYlhBzpiTXluNUN58LDUAHkjPwG5Sr6pFI463dbNlACA+vWmNvQwlfEsva5Wa6mfOra4sclcGirdJ/ie3y1rkEM2epllXmVJzKmtkljMleq0S5BbNcv6rw1267+gRTBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMl4kEpZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMl4kEpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2031F00A3B
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779367038;
	bh=3dAfBojcBjvH63IBG4+flCX7uLeePJ4fQH3Id5o7fqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZMl4kEpZ8KbsFfpBgzq/HfVK3SIYOmxFASvFg3Jo36oa/CsWilsVf03Niy20vZx/e
	 7tTaX5ZM//qmDMeAuU2e/KPkt26ayl/iDJU/iSLt/Iua1h/ongGIxf044e0H7kKJPS
	 QhOZ4VYmSpmhM8K6AaQ8CF2NfhqStaSQrt0qkUrdbpH68ngy9KQcNXeKN76EoEsuAZ
	 DsCyabIWWSjf+X2fbwfxooJDQfiuiKLEQRWctWJ+oXWtmVQyUg2zARiR0Ltq+BLT6I
	 +jgbdJJ9t1zPIng8vtfPrX+dRmjEteiuAS/4iDBv8cYXL6zyPEBUverjLIedn90g+t
	 /lTa2DUxvfEyQ==
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-132d1b2519eso13402349c88.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 05:37:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ99lvDgrfclirX5WPrQX0pRgdbJHu/YkmyNooqbXVP93EsKIea1UGlvyQKAO++se1fU8IEiGHb+Ogn9RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+fozwFUvVhM1D0nulFjsTx/LoYfjQRVORC8QtOn+jCPrBuYZ2
	V2RyHfPu9y0qjI2GSB3R0oyKqTiXWbUuZNWjLLby46dkvNxvVdifkilSAg6gnotks1ARnPQ+uL0
	TwMv445sfA43QgAByxR7TIt0QlogNk5AFlWLeXY+keA==
X-Received: by 2002:a05:7022:384c:b0:134:df4a:2824 with SMTP id
 a92af1059eb24-13632a03d9amr1511158c88.10.1779367037834; Thu, 21 May 2026
 05:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506082211.5624-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260506082211.5624-1-bartosz.golaszewski@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 21 May 2026 14:37:03 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeD3rDyGqqYC36FChx=SgDikPAXTr1i7-zMWnOnaK+xyg@mail.gmail.com>
X-Gm-Features: AVHnY4J-OlJBt2pglPwgLkcqcj6pFaaKzjNAVop3xKEam6mdnYcWxnhzJlyG9zE
Message-ID: <CAMRc=MeD3rDyGqqYC36FChx=SgDikPAXTr1i7-zMWnOnaK+xyg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: max96712: drop unneeded dependency on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 10:22=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs and are private to GPIOLIB anyway so there's
> really no reason to select it explicitly.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v3:
> - Send the staging patch separately so that it can be picked up for v7.2
> - Link to v2: https://patch.msgid.link/20260316-gpio-of-kconfig-v2-0-de2f=
4b00a0e4@oss.qualcomm.com
>
> Changes in v2:
> - Make gpio-watchdog depend on OF && GPIOLIB
> - Drop picked up patches
> - Link to v1: https://patch.msgid.link/20260304-gpio-of-kconfig-v1-0-d597=
916e79e7@oss.qualcomm.com
>
>  drivers/staging/media/max96712/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/med=
ia/max96712/Kconfig
> index 117fadf81bd0..93a2d583e90d 100644
> --- a/drivers/staging/media/max96712/Kconfig
> +++ b/drivers/staging/media/max96712/Kconfig
> @@ -2,7 +2,6 @@
>  config VIDEO_MAX96712
>         tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
>         depends on I2C
> -       depends on OF_GPIO
>         depends on VIDEO_DEV
>         select V4L2_FWNODE
>         select VIDEO_V4L2_SUBDEV_API
> --
> 2.47.3
>

Gentle ping.

Bart
