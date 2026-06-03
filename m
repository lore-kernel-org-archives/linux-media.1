Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E73D1AB5
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 11:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486539; cv=none; b=Q6GM+YwklfnI87yVAB4h6YIcbXRu54zzwdUlJUhglwyQs7uXHJBMZelY71tmOh6Vz62ub7keoY27JkyL3i5GJEBDfQS56ONq+WgokvRYxya62pO52+p3FGzZPF1DxlR0NR1eD8bLRi86z4906UnvHteTGRgvdloH8sBR+KJycP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486539; c=relaxed/simple;
	bh=dqoUuAUHHJ2yi8xmGg6Rt9Sqb9bqRyS+h9+osSqltcc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rfQdXMYFbIEIHEaymbCbLgjG75yyzAlBCa8Sf8TtGoVe3dbz45BejkdPrqVpIi7jN264cp1rNdIQi9XAmFiTnDJQU2gerHH8XA4vOz4vT728BkcRY94iszZJd11GDsWylhpFCLGHWE8D3kFWpA7MO3Aw58Gm8w5racmFJTFR6b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Argometm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Argometm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2772E1F00893;
	Wed,  3 Jun 2026 11:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780486538;
	bh=dviXRYD2gwVfhhf2S18wMm7E9LIEeOH4Qhi53i1J8Jc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ArgometmnsYlAfIaOoMM7peSA7VzDur/RbpKHWo2mcHODASJs7H5KXaZkq6IrSrvp
	 dMniOCWIUackgKZ4nw2YwcGiosFWqJyU2a5/hVtITBSgzvzyna2HY9opUMoORrfV6H
	 0Nfmt2kJVAB8OSaH2nAX2BUdku5VQcCiVeC813Yy8ZgY8jppJYnv/AoGokXGb05Zq1
	 KXGi6SvbwHq3yUx7q8ELz/nFMyHdjtR5eKDTMvwx21976SfcUaSlzz2orNu7SLfD0G
	 YilKym/xV9JhqkT0jUxb5UUB19kxQjARt7jOHCKQVjlBjeiQkm8QlLSZZMbeGw9Nxr
	 C6oTtv2J0eUEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] media: tda18250: Use %*ph to print small buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603111724.230522-1-andriy.shevchenko@linux.intel.com>
References: <20260603111724.230522-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 11:35:37 +0000
Message-Id: <20260603113538.2772E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but an unconditional=
 dereference of `client->dev.platform_data` can cause a kernel Oops.
--

commit 1ea3356f8c26d9844c17f495f65f794b5140a6ef
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

media: tda18250: Use %*ph to print small buffer

This commit updates the driver to use the %*ph format specifier for
printing a small buffer as a hex string.

> diff --git a/drivers/media/tuners/tda18250.c b/drivers/media/tuners/tda18=
250.c
> --- a/drivers/media/tuners/tda18250.c
> +++ b/drivers/media/tuners/tda18250.c
> @@ -804,8 +804,7 @@ static int tda18250_probe(struct i2c_client *client)

[Severity: High]
This is a pre-existing issue, but can an unconditional dereference of
client->dev.platform_data cause a kernel oops?

In tda18250_probe(), cfg is initialized from platform_data and immediately
dereferenced without a prior null check:

static int tda18250_probe(struct i2c_client *client)
{
        struct tda18250_config *cfg =3D client->dev.platform_data;
        struct dvb_frontend *fe =3D cfg->fe;

If the device is instantiated without platform data, such as when a root
user manually creates the device via the i2c new_device sysfs interface or
if bound via an incomplete device tree node, cfg will be null.

Does reading the fe member from a null cfg pointer result in a concrete
null pointer dereference bringing the system down?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603111724.2305=
22-1-andriy.shevchenko@linux.intel.com?part=3D1
