Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7235C5208A9
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756262; cv=pass; b=FpUwbEPqo7GER/hLE0g9LKUOsklLP7wx1tXoZbi0ibADYnIBT9UOjdNxn02YwzoQC3hAsiOcZeH6pe20KQJwRLDxEuszEs8O6bGzOwamRCyPIxbMaR/wz3GnDbIgg8PuDL6Vqvwk5Oerjl39f8zzpaet9SjtDS/eaglQt968Ej4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756262; c=relaxed/simple;
	bh=Z3GCDadB22nJ3H8dlp8oFEKsrJ7JLQwFPKhgk/HwR1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amkMeSZHd0D51MIjZ1Yf86LVLq4VEuGvzSEoyUMOc152c7LU0aGbtdlkL+npm84Pcty4oGWDEL6+dITv97POall8PAav+3Jz85xi8mKCVRUW9Z7UKdIiBxeaTfE1EfELzlqZuNjw2ZbUGKDTgB3iGlO6iysV336jgophr5PaqYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7pXUP8g; arc=pass smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7pXUP8g"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5256c2a4bso751326a12.1
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 11:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756253; cv=none;
        d=google.com; s=arc-20260327;
        b=TNkEyRZ4MhypYsfY+8g8JcjGXvCtEzpFA9aTU+zGMfs2byVRjfzHZ8Ix7h12D1W5S5
         jh6nqnr0cF1k4m+dSscJykoBFXQoMvyKYb+1saJm72hEWsrbLf4B8Ls6lrBIaQ8HNEVh
         aD7GeSLwZ6WLJHyXXjoWaC6U6x9era68rlAOSCSvOdEIHlVVvJFIzP3LLT79id8bY5/A
         43gVFZGM82wBCdVnVWM8L3efGetOVnRIY+eaAH2eLlvhAmcLgeI3MOi7ko+OOjAqBu2j
         TVZlXSpZFn1SCs+4p5N6BnZIgHwk5VnSogYjl7GYuAX29H05K2cvb7xByz8AmEvWhv7W
         u3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        fh=QhiZK6kBRIeXLn/N9SqWFFNkWzMIlf1XlCJORYXuIzk=;
        b=tC4jM4+LIQZOIzCoEU7Ib28xZwKBTpNtqEonacs+eQgUs4uJd9wtgafIcNvU/E//bc
         AvtOpJMklD4hjLn6cK85AyFUfjrpbc8ksJTIK8FBwm7oGuYTi9PmtDhoz10KaOUl48ve
         uTQwBR8IrYVZFcL21BX1/P96jpfbLfX/KzOHiDwVaJ+42nI8PjkqFZyRQnIPqelJ4sUi
         O/D0QnfC0gIwS/zpH7dbhxuGvY656fnlfPH7eS5ZLRJZ5mzAacXm3kII4amImmrxWkdb
         2NRC0krs9vtZVPYvkzqtOc81H7SZ/Y1BxndzDYwrRqZ2xwTMEHIqR0O0d9cyUyMnqk/l
         FTBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756253; x=1790361053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=C7pXUP8gPhskr6JrmaOqzZbQFyo1KCY0eWKQkzc1OTFuEgVNYdOOrYRvHXw4nvnV9X
         mBJPmUNTK38gMHYRi6phSIKGl4On4aHQGIrh/tv15tmpYc/TdZdWJidlJ3FLVoSdZv3A
         FMoXWk0qCpi8QwmMIh9pp8LuAIMuI+NYcr6bn5YVg8vUm4kSXDfisDdtDWvcU+0buAPa
         GATSG9GzrWjt6/EwRXvdqd5nItW2XnjP5ciEFJ4zvwfY4YLLtuNpZ/+47iKZdFBt2F+a
         GbejvzsiPaxFvUyr4smI7t8qM4KBpFVHBG175O6AcfOs0HAmLG3eoKCS1AFnL6nqubHI
         npyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756253; x=1790361053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=LMLgNITc4lNwpDl+XXArAoR/vH+D96dWFW4/PYCvzTTdNCyNZfZIL2Dwrz0SKWMUwU
         sySRxqQDzqAQv6LALuGJ8qnsasCnTcGs770O5RK4/EU8zcjWJawOKO9+ayqhH3eKgbPI
         Bb3XbfUzCH91RQ8U29LOpCWv+XaotcjCcR1iC81eFz2YoZo+g2fgQYg7MqBkequSOap4
         GQhNwa8+d1a0LAjRv1U3t+8kiTVSWMRSPQZjscpDecir+IIPgFovZJniiQhMoaoBzBJ5
         oaUbY5rRZLXRVIrXpKB88rvW39Zidg0dwsqEFKbb9ZxdIA0dV/62sR2n/z+3oYgM+E1k
         v47Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBRQlUoUJ9u5uTXeOnrcEUrgMMduQPOAD9Ge4Dg0r+OAc3+iR0lhgDrD57EdHbkLfxiIiHPTbBFtcFfw==@vger.kernel.org
X-Gm-Message-State: AFuF++lQa68ZW07E0HfzazYT/nmVNB9F8kuZzj0vr2gg9hbC9pK6nK/4
	W7SgimStfdCztiIm/LefuKFKjLU9Il2mq8GR2XzDYtpIfyo7f7onVPqzn61Sh2jdwUyUECI9hS0
	OhAuxLUpAp0WK7GV7V15WW+tIO/Gh8Wg=
X-Gm-Gg: AYBFou2zAtetyemV3tW31cabur6yDG4wBEGwb9Lc8Mi/c2kwJyS5vGCBeLrUr62v6iH
	EZ9HC11m9FJ+gyA6iDN5NYU+txF1cAPbzvNstv7pzG3k5Q5dGxY2jIRyZnnyEJiSAOfaE9thWKI
	yx+YoAGcrSjm8vuAQ4sTEk3O49nSB4mPLJbGFwp42ncxcnpibGLRC7kcleGITDnQmkfFhzCwsX8
	axxW5H758mFsIXUqGFpEwhoHty+iFaMXkm612WAyy6YIvUum6fYgy03VZPd8lM7Q8ZsLY8gb5A+
	0Y4tDad8fkGHcDd3QwFw86sQf6QjiVQF9Szhwd5NZuLXVwNdJNzwaV3O/4IM5srDCGP7Ue3SORz
	WM4UaCmT0XSWZ
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id
 98e67ed59e1d1-39e6c69f55fmr655165a91.65.1789756253090; Fri, 18 Sep 2026
 11:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Sep 2026 21:30:41 +0300
X-Gm-Features: AcwNN1UUuDTcQsQdT6LSC3YiQR-XJenFcyp7p3MxtUdbO4cYi1dTxigUEDSEcPc
Message-ID: <CAPVz0n2pZukL2tnaJef-N=kRiudVLN7RsTjKJJkTqp9-_k7HwA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] ARM: tegra: Convert to new media orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 18 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:44 Kier=
an Bingham
<kieran.bingham@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the nvidia device trees to use the new
> definitions.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++=
-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)
>

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
