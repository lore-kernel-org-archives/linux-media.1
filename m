Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFEC367B9D;
	Mon,  1 Jun 2026 20:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347147; cv=none; b=tDFomFmFhwPw3A3MMdCUkcEjgDBhr5mPBe5WZR1p5IFupm99MuCze3qMPhg1tuvxaSfOQanPdm5CF7K4JmpFC/wSYygKPNSrS1G2dCWtPAef3PBuXI405foM9m/vGOn/MLxvCkvdIeuutIFi7TvNgZHwqejBFfYd71d6sLwVhEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347147; c=relaxed/simple;
	bh=I705dylY35MxKeizsajtXy4srBJWJrFurXUT/EwVMQY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hFTghz39RXy+uCSHLqFgfANFSDQWZC8pcDM3pzwTC34asetsZfScORE6r+1IxoOqzzqNAN8Uakz/QEDPpMsUxNo47eOfRXgKPX3pSG88yV3EHGA/mfH09ivqwOLPqcR2e2IZXho6cmnmY+MRsMvHXdnbYKWFQQWXOD6eWemS3n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbaSCAm4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbaSCAm4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049BA1F00893;
	Mon,  1 Jun 2026 20:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780347146;
	bh=ZuvCiP5PaeoUjYAC7X+rXL0KsNzopeMuNsrHG+vNZRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BbaSCAm426vsMqQpf2dQERPMMWAgQntH9E0rV5raR7j1jT0TpQRZ0BULB4+p7gLfh
	 88Pa29k7Ra57u0go4UKq7HfKIAJ8CAfKz/MWvrTf45cUbTSZgXKZbQEclFuj58IJqh
	 CvH6CKHwpa4yEUnQn5DKKV8of7q/8K90XM/dOmiJrHiYeuplH+ru8OoaFXGOJ0aopG
	 V4t/OANfxaRuWdRrpnv6d2k1jIHY+TtXUd1xza2u9QyxgBjczzADI9cJFiBEBbh/4j
	 7BZgYBhpAOF2Q3+dWFaEAWDyQhyFXjb7wzj/BvCBkXlGYvGlrfrC3cHJp2+UwTwxGg
	 +rX9K0bSdivOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: Pinefeat cef168 lens control board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aliaksandr Smirnou" <asmirnou@pinefeat.co.uk>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601204814.19148-2-asmirnou@pinefeat.co.uk>
References: <20260601204814.19148-2-asmirnou@pinefeat.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 20:52:25 +0000
Message-Id: <20260601205226.049BA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Device Tree schema describes software rather than the physical =
hardware, violating Device Tree design principles. The title explicitly cal=
ls the binding a 'driver' instead of the hardware device, and the commit me=
ssage intentionally omits power supply definitions because 'the driver does=
 not manage any regulator', which couples the hardware description to curre=
nt software limitations.
--

commit 5752dd4b724a501f53ddad43b87fa9c0328d6fb5
Author: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>

dt-bindings: Pinefeat cef168 lens control board

This commit adds the Device Tree schema and examples for the Pinefeat
cef168 lens control board. It supports controlling Canon EF and EF-S
lenses via V4L2.

> Power supply is derived from fixed supplies via connector or GPIO
> header. Therefore, the driver does not manage any regulator, so
> representing any supply in the binding is redundant.

[Severity: Low]
Device tree is intended to describe the physical hardware independent of
the operating system or current driver features. Shouldn't the physical
power rails be described in the binding, even if the current driver does
not actively manage them?

> diff --git a/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.=
yaml b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
> new file mode 100644
> index 0000000000000..1295b1f4edebc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
> @@ -0,0 +1,47 @@
[ ... ]
> +$id: http://devicetree.org/schemas/media/i2c/pinefeat,cef168.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Pinefeat cef168 lens driver

[Severity: Low]
Does this title reflect a conceptual mismatch by referring to a software
driver rather than the hardware device? Would it be better to title this
"Pinefeat cef168 lens control board" to match standard device tree naming
practices?

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: Low]
Because physical power supplies are omitted from the schema, does setting
additionalProperties to false prevent creating a complete, hardware-accurate
device tree? If someone describes the board's actual power rails in their
device tree, it will fail schema validation. Should the physical supply
properties be added here to allow accurate hardware descriptions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601204814.1914=
8-1-asmirnou@pinefeat.co.uk?part=3D1
