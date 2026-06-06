Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145F44C81;
	Sat,  6 Jun 2026 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749771; cv=none; b=Rrn77WDxz6/FdhoGySlVBnQD80/c27LCMJ0T4orZAdfzcX4GBdvkKb0ApfGu1lV1BlLdQE5Ir7zU4lP+JZLjsfl6nPH3w39xzVu5lLH4lon4NYDnTzmPtaqL/MCgnl9aRecyCyss2HEGjzjF8Z1fLaJsBPckooenDYWvKSAnhjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749771; c=relaxed/simple;
	bh=7RsOpDmxKWnkMQcWXMbFpf34xrJzbd4E8CSdEajis1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=baB137t/G5ykYxAaumdpAjP+eaw6cWt5tMLh/owW/Ha9ioJJCA3UcZAgdxxi30GWpAgHWW29xPdLl1YjE5tLWcAKObX4IaD32wx8l4pCjCERpUkqPtLFdJUm4ikmSOVdX+9/MWVj62DQXIVsg+i8u+JISM4LN5SHvmORcoepM2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hh7M+Mhk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hh7M+Mhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79B71F00898;
	Sat,  6 Jun 2026 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780749769;
	bh=y2lR0tg2DloQKXJEIQ+ZTOeNYj5Yn1yjM0AX3488hO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hh7M+MhkNWd9vXY/3gYKxoDxy31eGCra2wUYP5AmvWM09QN7sWGaaoCsr9jaRvOjX
	 bw/IhMqVbQ6rOrMaORSvHEJp989Wv92qpxfnBirVvNvZyliAM4sVZLmEyjWtWqgXQy
	 UpzIBGl72Kz3TzivvzQXy3r1/eZM3Kuqg6HN2BSEBbZaffyUZNhWFcOJACblwCa5aM
	 +wJLhyQmc5HldJbACo+prVt6kGTLtLxipXMrESadiuFIuVEwMYYtbZkhOp9MJlMm8M
	 spBBPbPkDRr1FA/lIMEsc/UU+gr5kY7QKFDD5UgVyDQEOb3rQAlcMkHJmj7ulnac+B
	 WxZCL3LqxY8og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: media: i2c: add aptina,mt9m113
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk via B4 Relay" <devnull+github.com.herrie.org@kernel.org>
Cc: robh@kernel.org, linux-media@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260606-submit-media-mt9m113-v5-1-2088c7358e11@herrie.org>
References: <20260606-submit-media-mt9m113-v5-1-2088c7358e11@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 12:42:49 +0000
Message-Id: <20260606124249.B79B71F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema lacks a `data-lanes` constraint, allowing invalid config=
urations to pass validation.
--

commit 79e83e3556be09a3d2a83b67549cbb782161a0a4
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: media: i2c: add aptina,mt9m113

This commit adds the device tree binding schema for the Aptina MT9M113
1.3 megapixel CMOS digital image sensor. It describes I2C addressing,
regulators, clocks, GPIOs, and the MIPI CSI-2 connection port.

> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.y=
aml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> new file mode 100644
> index 0000000000000..72b827c47b1d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml

[ ... ]

> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          bus-type:
> +            const: 4
> +            description: MIPI CSI-2 D-PHY

[Severity: Low]
The commit message mentions that the sensor outputs image data over a
1-lane MIPI CSI-2 connection. Should this endpoint block include a
constraint for the data-lanes property to restrict it to a single lane?

Since video-interfaces.yaml permits up to 8 data lanes, omitting a
data-lanes restriction here (such as maxItems: 1) would allow invalid
multi-lane device tree configurations to silently pass schema validation.

> +
> +        required:
> +          - bus-type
> +          - link-frequencies

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-submit-med=
ia-mt9m113-v5-0-2088c7358e11@herrie.org?part=3D1
