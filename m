Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924785;
	b=ks/22xTBTJHGnC5S3AkOidBEJHwXGaw6OP3Or2T7uOehpgUOF/HyiDrFP2gUiQQXxctw
	 q9iC0skoI7b2/om8uEQtUgxIh3FW7+FxS6r+4VB5F3DteQnl6vxoqr3813qPgF1YGxv0W
	 ksdZ888VPZdsQ19xYzswvyPwSuKhBx+GqF50ZdE0YSYLHu7rAn+97D542S4CU6q/yGW9o
	 iIJKNyf2YLWRQWwsToCGnQLUFICI/Z/6FC9XUM8KfBwmnBuhKCRS9dez9BvK3Cl8zMAGn
	 6XipNkE8NuURmghKTsyzfh7Fqhty3Kkrj7XoqCbsaWZpBka2fUFfhPTkOGBxQQd1Pzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pwhU5roSaHFRmTkL8SmPuGAOJLZHFE5ayvEMpfmDJ1M=;
	b=nhfP2STJCCgSJ/P+vqmS9U2Ey0XbAtUbL7dfpDob2xFhvs2pcKOXjWvsLMSSgdpyQlR5
	 Y3LtimOzEkzcX7KaqnF9261IQELSrwhhnR9Xq4b2E9E82jLuDdDzBm4KWaDtqXuJlszTo
	 jHhnAxZ7FsT02AlmxNIiXeeYxAdAJwp5r8i2j7BXiRJutgABxirX03i8kXzab8LHMWe08
	 VRE9mAkUaUgQ2NiOc4hlj+SHXhLLV7MdR7Nv5RU0ww6mRa7riELa/1RLsP/oriju0BlXp
	 9EgE1pzHxy8U65aM4CQhuXnFnE70a9aR7ujIcBHHksvuX6AuPPx1c53yYJ3gfnmLgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HXeYRNQw;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E3A606A8A7
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 14:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E3A606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HXeYRNQw
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so762401866b.2
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794924784; x=1795529584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pwhU5roSaHFRmTkL8SmPuGAOJLZHFE5ayvEMpfmDJ1M=;
        b=HXeYRNQw68A5m+f5HpqGcQM3nAkmR9hnryA8VAbmixTeGh9edGpmfwOQzc0deaxigm
         FPVXoqNC8PWGV3gEgev/bcDGK3Q5TEawzcufRBXkEF2CfXiFZAATW8fu9IQT0Ic8R08l
         duHh+jtkiYZWEN8k3P4LeNEVN9o/lThzLMDKFS36GxE6ECIVs856snuJsXNrOkdxcmas
         1g3MS5Lyvrf+FowPlUlXXVziopujPSn0scOL4YGrc4Xd5luF+C8IEgYpMo3zlLx63fOx
         en8yw2iYcdIcV3PRniQ+8E1k5ao7aCUKuhvM86/RF0WFUXyQtMJh8LLB6PguOsaVAyvk
         Xm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924784; x=1795529584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwhU5roSaHFRmTkL8SmPuGAOJLZHFE5ayvEMpfmDJ1M=;
        b=hxQZ5tFFD9yzz3ehdQPLIBNWUKfAu4ySlhdvacBmOhFilEI/5HdT8WDqbuk05SPsJm
         idDKgasOD6HwmgI5KacPEdIsrjK/eREd2SkhhzAU4dbRtiD9xT7Iuh88LCipGe51pVb6
         yXjhay15zLT0YtopUVTDduj7XI9DgF28D334t8GJUWtCNEdiDsZdShHConGuojzE0vj5
         ADANLA+Q7fmWBxPIR9CoazdWkxQBO86zV2lKYJXt05tlgw0XL5HJoQsigMv6h7cW9W0G
         f6tBY1G8r1Wcl05SALrFco/YL64DvJWqfnnPjvZ32TBwg49H6QbQWrKD+ZPTyt2E6b9E
         xxIg==
X-Forwarded-Encrypted: i=1; AL+hErGcbqmBHr0d02Jfbep765NG0cKcB0mWqFsN60CPTMfytVySrA5ssmF9K5Ln22O9oh5QjOeZiHHZj8uOUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cj624Qx1XVFTXEk31KUqxzOzpI8r9QeH6i0JC43XvbR+lOmPF
	Ox6zuq0Wh9jr7sKD90Zx9QvSn8pu/kzQLhvab71hbfhZ3tjajPFGzXmMroueEdos0Mw=
X-Gm-Gg: AYBFou1iKaL6zE+edd5TlbhabPcQWX85IHZ965IMwQw698L6/u3n6aL3yvw4bansQ97
	AVDc7bMqHBZrjfuHWXQS/08vH3ZyhR9ZqnMc+sKdoFPkLzw2nuZVBPJx5yBRoubr0NFN5LSh8PF
	8R28zx7Ocq6PyHUUXIKCLPsjchS/BLbGmSwR8ja9mKr62EiyMJSwmH64RdOUkc7lzDCr05pEch2
	dU3sLoSLGrdMUSOSLxzMXJ0+eARRzdyDghNVyQulM5O0tUIW+tXnkF2lWYbZ0iUtqFnoRgOgHJ+
	j3McK7e8OgDcuDWaTf3MSe3Ullf/Nkh3MLL0TcIoEQ6ehSt1A4gbfJsAkJ2UGLqIel6pedrg5eg
	iX3j+OMkzWXtvbNeWLgT8iorRDW9rIrMh3ssG4eFncGpY4O7bjkujR+bRPGfwqPEHSEfJ82akWb
	4zjouEk8E7dqwxDIwisyV5KRkIp/0AnPp7Vwz9wROofLyAtl1GwhGM6a5bpV3rlKksqXjp+iM/s
	XLMDExPjPLH9uvm+fS6K0UlxKaY2TcJ8mCcVFhxAGyfPog3jiIF9xE4hL3UimvGsbtgxj3a0wLQ
	rEUu3BawMxH8b8mn8KzePvI+ghXiASCxLq7syI8Pb0fyVq96iFCadLcEEIXCL8oaNy9l6ia5edn
	PrFqad1lb8JLDLiodarFFn2gJGP3b5+lqOqW1
X-Received: by 2002:a17:907:6d08:b0:c34:e9fe:82ed with SMTP id a640c23a62f3a-c50963d803amr1154764166b.28.1794924783580;
        Tue, 17 Nov 2026 06:13:03 -0800 (PST)
Received: from localhost (p200300f65f19a904a5ac91f50e61369e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:a5ac:91f5:e61:369e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c5095b42480sm554754666b.36.2026.11.17.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:13:02 -0800 (PST)
Date: Tue, 17 Nov 2026 15:13:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: i2c: Add Sony IMX175 sensor driver
Message-ID: <avxghetYnw4cMzDQ@monoceros>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
 <20261116175151.20150-2-volodymyrchapman@gmail.com>
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
	protocol="application/pgp-signature"; boundary="yk5ynk2fbcq67ijt"
Content-Disposition: inline
In-Reply-To: <20261116175151.20150-2-volodymyrchapman@gmail.com>


--yk5ynk2fbcq67ijt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 1/3] media: i2c: Add Sony IMX175 sensor driver
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 05:51:49PM +0000, Volodymyr Chapman wrote:
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. <linux/i2c.h> already
provides i2c_device_id, so you can just drop it.

> [...]
> +static const struct acpi_device_id imx175_acpi_ids[] = {
> +	{ "INTCF1A" },

Please make this:

	{ .id = "INTCF1A" },


> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, imx175_acpi_ids);

Best regards
Uwe

--yk5ynk2fbcq67ijt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr8YOkACgkQj4D7WH0S
/k5y1Qf+OUVwH0rsGj/2gGo5J7ZQAl3fbtha40ZCFyB6EPF33IgI6wEfhKe/QjCv
jxF/n/mCkvgddsUdiFRG76OMPUyguHq3EVTzK8ULs9ZzcjLEYLt4vI87yAcgkISM
flKuKZh9rZ9Xyk/Zwy36taNqMbjB6lK8zpx1zLop5FthwvDvpYhiLeiyc64XXgCd
hNLM4MTT4s6E8/syfX7XYyZcgW7i5DieZDEKE0YFUD74MacPeGa2bbXTMeti2FoM
M8jBI1CHmGcyPJEgoFN2c0sy18MzqVs+yqM/PEyr6+oN54Q1NA1/22Mx6zV6Wi06
uiYps95UlTprmxCHkXhX7uVYug+nBQ==
=mGJq
-----END PGP SIGNATURE-----

--yk5ynk2fbcq67ijt--
