Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A125B2D77E5;
	Sun,  7 Jun 2026 05:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810860; cv=none; b=J/QFgThzX9EZzsDzPPJSNATjLdUlo+zdNs5zfl8Y8qQPJsWS9GJ1YFgzKk6KiDurhrNk3vHpMAMrPRVocLTQQbEDJK8e6b4mvavExuxGXXl1c4BfoG1yfRvoMCRqy7xHeKwrkqw3UqNkEfKQnzPgLpYWwa2fTHXD5GVEwP+Xd8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810860; c=relaxed/simple;
	bh=SsxxEOZRbnw9tVTApObvqv1SI/Xi/1SxQqplSP9U1u4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nf4GGw1NdJD14o2MMrroTC/AHDeDkp2tnm0Qkvn3aQuC6IubbhPXx8xzfvelIfOhi1tDwdIbG8ZGzdRanvc+cyvsDjgd6Ku3UVD/IdVZpH1xvmBPF4dul73+pDK5LoNdbspOXmP7J38EEk8QFr0YemUNceEVssP6kZw1A9CHVkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aO4Q6hPq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aO4Q6hPq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097F71F00893;
	Sun,  7 Jun 2026 05:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810859;
	bh=6hVtFtAzVAweZq1gtP/8A1KtoTOQnpZ76RU18xOwaCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aO4Q6hPqOPkKOWpyAiCYrqJHPJKR+5QeK5+8WJtbGenq2ykJzh/q4mLV7DX6ay1n7
	 dfUhSBUry+hs6ZrS9VUh3ImZM/m0xHyO2vw7Hj6Bsmx9qNS665y5mfWOTyy9J32g2T
	 hDnH0A2j8U0r3aGb0U6VK450e/IuvZjk6OxnWgeDBN18IkmqXkVH9yBuEi+Swftd2g
	 jP/Mi3avvC2/bqc6NnRmUHrLnjYAOYntPcXJvHtVEUt57N0KXo0PivjKG1Rgx1rB5y
	 HqY+lWBjqxFscPgk3WjdnB93nr8ZM8vMt4kze+PAlCX/YAOhSe0mdPeb3SHfZYox42
	 Fnk9fgJGbhwgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: media: i2c: add aptina,mt9m113
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk via B4 Relay" <devnull+github.com.herrie.org@kernel.org>
Cc: conor+dt@kernel.org, linux-media@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260607-submit-media-mt9m113-v7-1-5da397a3d2a5@herrie.org>
References: <20260607-submit-media-mt9m113-v7-1-5da397a3d2a5@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:40:58 +0000
Message-Id: <20260607054059.097F71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing schema reference to video-interface-devices.yaml, preven=
ting the use of standard camera properties.
--

commit b027ca2312842a35bda1f84dd148c51033735826
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: media: i2c: add aptina,mt9m113

This commit adds the device tree binding for the Aptina MT9M113 1.3
megapixel CMOS digital image sensor. It describes the I2C address,
power supplies, clocks, optional GPIOs, and the CSI-2 endpoint.

> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.y=
aml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> new file mode 100644
> index 0000000000000..72b827c47b1d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vdd-supply
> +  - vddio-supply
> +  - vaa-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:

[Severity: Medium]
Since this sensor is used as a front-facing tablet camera, will hardware
integrators need to specify mounting properties like rotation or orientatio=
n?

With additionalProperties set to false at the top level and no reference to
the common video interface schema, standard camera properties will be
rejected by dt_binding_check.

Would it make sense to include a reference to video-interface-devices.yaml
using an allOf block to allow these standard properties?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607-submit-med=
ia-mt9m113-v7-0-5da397a3d2a5@herrie.org?part=3D1
