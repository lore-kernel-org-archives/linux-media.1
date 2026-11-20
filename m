Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175295;
	b=k2JIvKMcQdCm8x/L2YXukQAOWcCrl+ZuXqG4qlChY3pd+gKvgAk4cpY7G+YU9gdPY1mW
	 BTXKMwa16/TvDpybNShNpmdYHJ2VCdBsjWMxyHgeaXA1oPbhl0XIcGTYX8mbukrU0wXbK
	 4AYxL9cgkBzCz2m9BvgKUDFysaDfRMmAxgthuDrFjwvZW8ht1TDP46Q0NhuP2xcCAWxDU
	 jN2QXptMilJRvKZNoj4TPrwkPasC1EHQR+S8/XeonuzkarN128tTI21nvYaKckXYBMX9R
	 UqHfJcroRtTflScse11CyiSz01VsvegpQTPlkSAQ+vKasvfa0vcct+XNxjdv8lmrXwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Sw86TAA6SyN/v/4JSFIXw0cd7MgHiDkuK2mBM34qIhw=;
	b=3aTi6pcmCHKDXBHiNw7rtiCP3TORpwjMwleMZx+cgdZxC1I1V8Zrx9E/7xux7u4BDW3z
	 XVqfXkQKIBbnJ+reRLuZrKyj2/Et5jfxm+xAHzt+JFFj0Bly8qcAOTeKUkjNnBuTaY0BD
	 5LM/3d4j6NlZRMiWOYpt5Vhws5HMzMyeZP4P88DhQZSeRaQAChj2lXP9ZrbnCgxTIHCbV
	 NX8kUI2deVKOvxRXz/mv2ur5aYo+S7tIIXYqVwmtaFDhsKniVXRNkgeiCcMzfMEt/J8IO
	 X46EAfrQdNfAs+p12HTDQbKREmZKXkfQnk8wrH/pvMqlRujq7tIduVUtsx1jZCsro/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EnQ75zMz;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0C0606A32A
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F0C0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EnQ75zMz
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a357b1c649so380492f8f.3
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 03:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795175292; x=1795780092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sw86TAA6SyN/v/4JSFIXw0cd7MgHiDkuK2mBM34qIhw=;
        b=EnQ75zMzFcsNYIhOhj5WtMC4nneDEbxdDpsvgL8astfv40uZyk67gSwidrESCxcxgZ
         6HloHebJbnU/LlJzBN01hH1ymx3dMgnJ2CpjPumtCyIwKBU1td5gFp50m1VcKYxUZ9Ev
         yfXgo5wWFe+H4adnPWg7z/9Q78U7sIOmbYUZtyDW9jl5OLW63yAqO5uSuMBDyyuXouJQ
         ZBGs5pNG4E3ulZg5uauzgiMJjwm7M+VRo2IQeRQV9rfTRaLb/p7rGUXOW2xH4Odkxpwv
         41qCvOWfsA6rk6ZJFxIt6ZuT1Y8Y76DHrhBaKeR1IrvBndYIiWgHo5Tg1COGV5tXgPJM
         ka6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175292; x=1795780092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sw86TAA6SyN/v/4JSFIXw0cd7MgHiDkuK2mBM34qIhw=;
        b=IglRmE4OXePov9DU6ckNc4ZnjiTLPRX0ZhZAclMi0eN1m9QgBya6tyqJwDIy66Nrjo
         i7OiFKo0BPTH1LFwEyvTHk4OtpmG8WeUg9v7L9557mFHLKg2a+ksiOeJyaF8zGjZjZtQ
         rzK+sZFUA884fWbqAP6k2wfDI+H4rLy5PwJAGuVEWWHSftL6fQm5EfdlISA0ETV1nn3j
         t2rTO1KWGQqM77pKw/8p51HLMrbJhYLESPf0pesgV7LyoMoRL//S3+QC02NGdSg3urTU
         r7PRw4nmtrMtTCv/J1zfXjq/BoUPjvi8gbwxLLqvNLOKbXQ+yrpd07JiHV5OHt53EaY7
         79sA==
X-Gm-Message-State: APuU4Z+hsbsrrDDQg2WE4glrrPZeX9KgWh2G0qX6cijQz1FR064aJE1Y
	EwrEJyW0WEPfhNVkqupdcdue7S9zFdkd5w0FVK2fZsMnIpKl6l0/sT+CwMM8UthxFe8=
X-Gm-Gg: AZFdTZfMQcyI2WTp+K2mSWMnl1CuQh2AUbWVy0JodgcWBC4wKyABym+2VGZ5/v2tFmK
	IcA7DoZT8PWHM3lj2JNRFxH8BTwzIldaykIiifH6Iec/MsAJfb7An8KsPH5lmd6FVmo9j+8yIGM
	ojtuM3tH0M3WC/RDAEhkEW5YS6LT2xHm2cc+whpSNqMy5lGuhmoh4rKUq1iTCgfuTIVCuPiw/yP
	XNfxXZbM+hO5Xs224IOILtKoCHE1N8PyuW6CQRioypnEhTBWYL0itHMdm7BbrWckijo9cQcrL5b
	QzHDWu3djrcE2S5oaA2MzvC44o1hZ5WLXyGQFnEI+8XsPWruw1wkDmLJ3eRluTHL0GWdtlLC5iz
	u35TaXutl2opuZqNteM+Iy2NBDFnXgM9qhwOFsKPV48k59eGtXqJ6hNVAX7LXCtxrP32Rg5Pfxd
	fyXtQP4q74DB8KTCNM/344VJ3YD0m2TuawQ8Fm90/wVVRhrMjVZRCxQGq/aQP2+wxfcxVSXTh3z
	Iw9XagZKjqOg/dekodA/37qj28iqKvGfwadX7RAoJUKg0IE8ox+mUZSx2dkQbVvp+sIX5gLW++g
	F9xVWjUTt+JGq27qkOiALuVCVkHd26PJLfCao04Yfdl+hFbReNmRt9jCmL7n5c+Iiitm3lRaH3q
	D1dKD69AfzFas9/TSk9xpxWmebgLXUNXfhgx5tQ==
X-Received: by 2002:a05:6000:1a8d:b0:4a4:6669:7f9 with SMTP id ffacd0b85a97d-4abb400bca6mr5874552f8f.49.1795175292597;
        Fri, 20 Nov 2026 03:48:12 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab658e2c8csm5394408f8f.2.2026.11.20.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:48:11 -0800 (PST)
Date: Fri, 20 Nov 2026 12:48:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Charvi Mehta <charvi.mehta@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rathinavel Sankaralingam <rath.sankaralingam@arm.com>, 
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
Message-ID: <awAzFsX_VUbzTqK4@monoceros>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
 <20261119153758.1426673-3-charvi.mehta@arm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qvydzoq4zesd354o"
Content-Disposition: inline
In-Reply-To: <20261119153758.1426673-3-charvi.mehta@arm.com>


--qvydzoq4zesd354o
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
MIME-Version: 1.0

On Thu, Nov 19, 2026 at 03:37:32PM +0000, Charvi Mehta wrote:
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>.

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id, so
<linux/mod_devicetable.h> can just be dropped.

> [...]
> +static const struct of_device_id mali_vpu_dt_match[] = {
> +	{
> +		.compatible = "arm,mali-v76",
> +		.data = &mali_vpu_v76_variant,
> +	},
> +	{},

s/{},/{ }/

> +};
> +MODULE_DEVICE_TABLE(of, mali_vpu_dt_match);

Best regards
Uwe

--qvydzoq4zesd354o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsAM3cACgkQj4D7WH0S
/k5DkQf/cgk6stCU1NBfAdhEZ+zxJ6rOBVYVdtcPuivB9POWQAiF75S+YotgohjC
s22HbJ19JiNT68r+8GqaNce4eND7JuioyoyehC4Ghmq+KPZu2sbNqvUQieLSPPcu
9jbJOJLywY7Yr1eNrw4/HciN0FUf+G6HU5caxEZsBmTqt/Q1Op1E3NKChCuNYNpE
mUjAyuwDLWFcqtLlePnqTWbzoruWjKoG7jOGNwmYyisMB6C63WD27Q+nixcbJ114
bEXA+AZ0gKnvFQ8uw31kcG9U3V+dfiQ5FDNKEATVVPW1wmEvd3v581ruaKEeUOw8
jTnn3+G6WqcROn9Q+kwxllOO/p6b8g==
=dMOh
-----END PGP SIGNATURE-----

--qvydzoq4zesd354o--
