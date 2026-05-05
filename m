Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C35A347BBD
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997895; cv=none; b=QeXZ8idkZxJ6aQl5SuVf0qF8gInrJpbANeI49olhKondfzQjkLVBUmK89aDmWvtstvEi60sQgCNWm4MILwf0lypzq8+7tsSmQBHy07odUItd/tsu+fJeVqxPW71RhbhDwVMKInNRcv6eSkhooea3oNJvhTydoC1+td95/gmUN/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997895; c=relaxed/simple;
	bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=USBmaWDWN+Ltl5tD+r7HJNCFrfqRc0qxrrz+4vBPLKLgfa3KLEgMMpGCeigbwNHtoOFl/chZeTKczHryh5OhMOsB/9ke5HeIojkB91oybVlTtHnS12BcMcJgPk748sXNXOWVLIT+xyWtvE2jTnvxY83OkAF0BptQZPfdoR4F60Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoMIb/Oe; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoMIb/Oe"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d73352cf2so4980364f8f.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997891; x=1778602691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=;
        b=eoMIb/OeO6TFJwJdLyVtcwcSYffLECdl6hSGZwLiKr0wDLVndIvTlyD0cfpka92dti
         ULlNMLjc5FLrmU8zx7fJePiYzc3Y0G1raFas5RJrn240VPJ1v/0FCsvuiN5o0PJ6Mj5h
         CE5r4JrRp5w14Y5UVkIq5N55OLmKuG+Ki1GR/gFJswv5Cj5jQNavVI8MtQECWcB8sahB
         WocbfoteeI+UdN/beuZDGHQVIahpGQCQSSddaRT2JAjyunMTvHH4naCBcCg9f9qAE+ZX
         Qpewzo4jQ5PXQ/i3eHL0MpCEp657B5DI5xm0d+E1RNrJ6ZzLJlVQy5nZPhD/aUIUxfsz
         borg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997891; x=1778602691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=;
        b=mZAcvQvPZV4VjTf4GMqOAg0v6y8ETwEdU9wa22QvicRlS2C3y1TI1F/pI8rDODTZHA
         Cu7xF1+GH0j9FeiBxedtsFpOsQkTJX6hJ8p9u1Yj916xQ3Caa2X3eADRiEs4JJROv1t6
         yyHohagMys9PiibXY2xlivLbXcV8fCMxaeWeH6cVR4LkztrWq7Pkyf9s/0YP1n7Raz3Y
         gv63m68vX0gA/PPbbxqroXwwYWxREME9b5VP+hWanmWfIRz3SCcpjY3YjfDLmQaDr02Y
         9bMWJ4f7vcvVOJoHTM6+51bJKo3NrnvKx0ndtJHxIQRK82l9zVyal9kbBZUqPRMHfJ5v
         D5SQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Wi4/OZOiWI0jrI+X28Tzb3oZJorkJwqoKwj0L4MPkOfdYDKozRn6RWBblJeibjnbGV6o1yAfelDUg4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Upz7KVyxaxYSHTdWxTMhnDQWvpbIFjRESWE+FE0YxI8tqc+Z
	uBsJt7eivOazazLdH7WF6+gJ2gPWNpNmyaRP5BuWTVfDSim9ah7l4b/2
X-Gm-Gg: AeBDievSD25UcAXC/R5fJCqpKdQKX+nhZMPm4ctvJG6UUvnnW50quu8UX9p1J56ngFW
	EitXcY+2FgxSkFLNNtAHwdhqhgGrKyJdc6N7mlMK6QxLBD+hxZGD3eTjIL54rG0WXnlFTyVHjR4
	9+NmRdo/XAYy2lUIz9rhkoL4E30doeXfrmMpLKGxXf2+wOHBb2f4nRdJuKIqUDi/FeIhvufpPaT
	zmzUwPa2r6UEGh6a7Dp3LATt2owm9xMY38J+uQN0GTMrb8QUIoqG9jwNEq+CEvl9z/YpCr8KI7M
	zpdG+1wUw8qXpzrfMybttuKwhSLoUX/9lQbL+FBL1xGefSHJitMmPbDim9qUPDVJaB5W/2a5DjR
	m3duPuy61N+z0ZQR/RORfhv+t8kuwSMRxcy1BRQ/+mLWS/TFjm1lHIwooFQp8OpMW7xP1/Wbsz5
	oofH5Y3WG7zavzhPYiIJuceozNorDMA7BRK4LknNU/DmGFtrJnwN0jyZhkzi5Y0IQpj+YFbXvZN
	HcapPMgwD2X0cjOc045PKeRYX8t
X-Received: by 2002:a05:6000:2dc8:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-44bb2f282f4mr25038895f8f.9.1777997890976;
        Tue, 05 May 2026 09:18:10 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505558e213sm5821604f8f.25.2026.05.05.09.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:10 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Tue, 05 May 2026 18:18:08 +0200
Message-ID: <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
In-Reply-To: <20260505134812.408316-5-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The Allwinner H616 SoC has a video engine hardware block like the one
> found on previous generations such as the H6. In addition to the
> currently supported features of the H6, it is also supposed to include

Remove "supposed".

> a VP9 decoder. However software support for this is currently missing
> and still needs to be reverse engineered from the vendor BSP.
>=20
> Add the compatible for the H616 variant, using the H6 variant data.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

With that:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


