Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BE04503B
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784373159; cv=pass; b=qDAnUov4su6o9UFrpach3QnXJvnt2g/31sZ00D/iKXaQPOcFgyn7lzpW8E9IVXwBQHTYBv83OLGVe0woW6AFP+S+Xkb1znn4A0J+9iYt0TL8QCwOp3QeMmdGag61sR9gpZyvj5hSqAKOVoqIUOOQ7P9/7owRNK9R2ekGaEjb14c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784373159; c=relaxed/simple;
	bh=42EScjtq6o/oAWzBz1Fwn/meWWn2fcAqwFTx8DgQZ1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VNXGWhKHV045ZkAC48FDhXrE2JcTrPxH6qWEnVis3LqKJ4uzTAJf9t3XefgZQAl7FIwupI9UDvVe2fuGxdVRgi0vTLXY34ddYRzdh1OF/7DywIEGq56moeiu2WYor4iZ/PG2s6EbGjWNIO+Si7j7cUCpOmd3qdDvv95fRak+zmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/tqm1YL; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/tqm1YL"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-667b9bee563so1049181d50.3
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 04:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784373157; cv=none;
        d=google.com; s=arc-20260327;
        b=dVc5kqlFK7r/DflNJXfIP+5BdDou8QG9elDTUdrdwzykXCm7P/xb4jnP72M7p+TSSA
         e/egr9OeqXDJMRH9d/0DUxh93UloqKd6MtFS9KLvMzKbjlZTlbcaR40OnYx3L0z26hoh
         iG+Lls4aF3+IcJ5ROk3QjvSLrZBesu/H9x9yX65BkO+Wm9Q+RuWY+FinMQ/++6C7VaSx
         ofOEcUMn64x71qMai+dVormavkRYL/jsQgAVzbSG7r5JFdN1EosWBXotVvuoSc5AJXLF
         aIyF5wsz2NJKRH5RihS3Flv3AFvWaDk9uJi6oRzP65nq9Tg7OM50xDIeR6i3tf6338fK
         PPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jA614hcDkr1x/8k5i0HFdOVHmUkiD3T4/89ZLATA1s=;
        fh=kPl+pf3UKhxzWUKYOYJJLr0+OUwrAr1nuW+no37rOjs=;
        b=mcP3MfDGj6tSLCSLcW4zXMt9BrlKOkGz29WAG9HYiw+24Ysb7xuKMJpqDS8KwWFTMt
         /NTa9JFe5h93TQVy4kUMdR+luXIDTjEGEwndsbQ3G+/EhQ5dAsYTHKMzYE3LSS6VVPHk
         U0QDbJaxY/8pEnxYfuvuP7hkLQQhJueBsxbUa9b1iMsrmg3olUl0bATtpOrxAoSuAdqZ
         kPvZ0PG+/fmckCIKpcQFksJ3WwcmsHhwNyvWREqUEAkDYsBBBR4m6O4Q5Nfiu/k+Xp+J
         r1OrEFPVoT4GEY5DAkPfbh3QjGPYd6DQJ0oD7fxR/ZKrYX+kmdSHBjB6qadovvefkRYW
         jVdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784373157; x=1784977957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jA614hcDkr1x/8k5i0HFdOVHmUkiD3T4/89ZLATA1s=;
        b=C/tqm1YLT1/YSklSnnLyodcfgsHy6RJAMRyzxLkIU5Bdj8KtfLRcvjCA/F0VGnI7Cf
         Wpx/bda4arGhWeaV8uaJokcCAe259g0xGXkJ0hoSghU+BVSKRjmV72MS5b/SwirIxlHE
         smCFLdeNU06ExwlOQzaGlueJ5pIwOK2/wUXyK8xR+HdPn12Wh0ZzhX8RUwY/yhrLhQY+
         bBj8jMv9f9+HHry56JlE+iAj0S4Y+5a+bv25m88QTwNQPw0BLsS/x8FVr4j+L0IPc1JX
         2AcM5uYbEl/83hACqr7BHTdTGOwl/FxaFK6E8mnh/1JAhqKExKGpMoPtO9rftWxG8OfV
         cAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784373157; x=1784977957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jA614hcDkr1x/8k5i0HFdOVHmUkiD3T4/89ZLATA1s=;
        b=Npy9Oksod/yKS600cSLXHMHYaOAg8dCIaJUbeZvOH2Xm6xFYulNN+mLEHyQluzvU2s
         bNyq77JboeCzBW7H+E4p4XiZdPaQYyw7LOCVCfd7YTLehvYu8UWMM4xQS/EUV8l4xtW9
         T0UZdQMVKs40gv4yjHCE+duzuk3QGdGSR+bzRjXKf61b8O5wYbklpWlTyB4xz0M74yps
         XKsgEDkE908ZEP79P555AZ6YLf+O+7nify0u4ZYUpJTjZlTSRPDtQvRqxJ4EeaoA4hZe
         QWCmEAxSYw5F3wS4JUFuKiHccz9hCiXS9a9M+lsFR+Xp2v86TzEQhmsLPsBzXQy2MLH5
         emXQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Qz1GEFIYpyh48og6xmqiy95PP+8yPaAsf1NddVNBiI7OqKleOuSMzDUpyLX/TlYH0gzEUOpo6OOinw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/W5OojT3vZsTsDQSXmk7gmT/Aftgk6oysnnMat3DYXVrAAIQ0
	dV6ytWhSwJIl4gkmtWX8kyeaKgiFsp6gapkSTAbz0TQ32aOb5HaLfC21pRtJIRLNExu33jq4pu/
	PYUnMpWFQgGOKo8BLixolD5mMkMixzkw=
X-Gm-Gg: AfdE7cmVsQkcZeT4XUPBFnjvHg0mnyR6JbAwQWRK89Zczvy1Y39L/tLDWLFwtrhCW92
	I8CTMlnqeh6180BJFo73nbQcy2TG8Kq9vdXDu96XGy5H/ZpEI+ECTNpDxyiLem+tIIs11LB4sdI
	TPH2laIYidHgJRrFsiH4Ha174MW5BuaFNB4pzFm7ThxR2cflPMGNKExFp+wYFkUo4bwCzBOmTTx
	OLw0yYSsTlh1H2wruNIWH9eRRHRO42FBECOWYHF6XLltP2qylAbOcoLOBvXhxo3ND5FcONtdiKw
	YhSGxuqL4w2gplRPtSA=
X-Received: by 2002:a05:690e:4009:b0:668:3d3e:17ce with SMTP id
 956f58d0204a3-6683d3e1caamr1668547d50.4.1784373157564; Sat, 18 Jul 2026
 04:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-4-royalnet026@gmail.com>
In-Reply-To: <20260718085728.6797-4-royalnet026@gmail.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sat, 18 Jul 2026 13:12:26 +0200
X-Gm-Features: AUfX_mwGRLq_cQ_8jKTIfqRv7vemDXFXO-Pu9-yMhP9fEm6AWXK5YDte3V2WYyo
Message-ID: <CAEWPSH7b=KaVhz_Vhyrbj4mM2KANYSEzXPPqNSj1bW0xPLLRGw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: rockchip: add #sound-dai-cells to the
 RK3588 HDMI receiver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A testing note for anyone trying this out, found while exercising
the series today:

after (re)connecting a source, audio capture currently requires the
video capture path to have been started once -- a cold
`arecord -D hw:...` right after plug-in fails with EIO (the I2S
interface gets no bit clock), while the same command succeeds after
one video STREAMON/STREAMOFF cycle, and keeps working from then on
until the source is re-plugged.

Setting DV timings alone is not sufficient; it does take a real
streaming cycle. So for testing audio, either run a video pipeline
first (e.g. v4l2src ! fakesink for a second) or capture both, which
is the normal use case anyway.

I'm investigating which part of the streaming path opens the audio
packet flow, and will either fix it in v4 (if it turns out to be a
missing enable in the audio path) or send it as a follow-up with a
proper analysis.

Igor

On Sat, Jul 18, 2026 at 10:57=E2=80=AFAM Igor Paunovic <royalnet026@gmail.c=
om> wrote:
>
> The Synopsys HDMI RX controller exposes two digital audio interfaces,
> one for I2S (0) and one for S/PDIF (1). Add the #sound-dai-cells
> property so audio cards can reference them as a codec, as documented
> by the snps,dw-hdmi-rx binding.
>
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> New in v3.
>
>  arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3588-extra.dtsi
> index a264001..fa100e3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -338,6 +338,7 @@
>                 reset-names =3D "axi", "apb", "ref", "biu";
>                 rockchip,grf =3D <&sys_grf>;
>                 rockchip,vo1-grf =3D <&vo1_grf>;
> +               #sound-dai-cells =3D <1>;
>                 status =3D "disabled";
>         };
>
> --
> 2.53.0
>
