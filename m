Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547BB47A0C3;
	Thu,  4 Jun 2026 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583352; cv=none; b=uVPyTODU3XGrlovfaImwZdGqTWW0F2kw+AOlWsNFslt0fEmVrTfJXR+LF57CjsNQROSg6GTotiGm1tMW401fSPobdEd/Zr/RyJ/pQKMKMr6vQe4klpgvuNKg6G80xJwxxhP+THBmKZSNqVwHW0Xoz/RGXkLfrjtE68fmBawMmCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583352; c=relaxed/simple;
	bh=GH1fCoZ9fbddCbyH92JelWG4VR5W2Oyj9hXZ56gshOc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WMJHXjS1nSSBdUZK43sO5FZkaRQuTR2/TI9KJPi8pnqUdOF9wo3jt1w1b2d6u+7T6+ozfkA/HzqnjA9hBhxIlz02QdynNVosCUzwVNzkqLEzaC9ZTo5jxHklIF4WNjPSDBiUecaASq2mNjIJTVMGeW9zB8u6NdHm3bkeKJVkdpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FiVPF73P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FiVPF73P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCF91F00893;
	Thu,  4 Jun 2026 14:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780583351;
	bh=T1GrC1wMqqHqAlV/b8gUL73uF0FLAQPi6FqJAYie9f4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FiVPF73Pfw3VTpLEW4Dg4dQ77/VYjvrzgzVqnfgYZkSCdPra+S/qJQVsNatuUjENo
	 WaC0U80UnFmvOmJKLEKU+nSnZXdvQxVWRtzd0AReG8JaoBI9X2GOl7IgzLWVXSkHKv
	 FoWNriOY1BlADteh5YXjLwn557xQ/x2XuzyWFt4tQVjMsGvHWWgBXndnGyCfP2+68X
	 ZDUEHKuQV9+aBDsIEY7M5jf28fCMSYfE8R54Gz/ne7zgNNA9zgiMF9Ytb3m1ZHv2KZ
	 Ec+Ny3IWIa5rTygkhV4lwzej2M3nE3G2lB6LlLUvJxSEBLReIXw4lHL1jbu4Z4FQNd
	 c61scQHZdXTHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 10/22] dt-bindings: media: i2c: max96712: add
 control-channel-port property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: robh@kernel.org, linux-media@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-gmsl2-3_serdes-v13-10-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-10-9d8a4919983b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:29:10 +0000
Message-Id: <20260604142910.CCCF91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema definition for `maxim,control-channel-port` is missing t=
he `default: 0` attribute, despite the description claiming it defaults to =
0.
--

commit b689fa03621039bc6085fead24c8d25685588cc6
Author: Dumitru Ceclan <dumitru.ceclan@analog.com>

dt-bindings: media: i2c: max96712: add control-channel-port property

This commit adds the maxim,control-channel-port property to the MAX96712
device tree binding. It allows platforms to specify which deserializer
control-channel port connects to the upstream I2C host.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 161d40acdd28f..538b639d4f542 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -41,6 +41,14 @@ properties:
> =20
>    enable-gpios: true
> =20
> +  maxim,control-channel-port:
> +    description:
> +      Selects which deserializer control-channel port is connected to the
> +      upstream I2C segment when the device resets. 0 selects port 0, 1 s=
elects
> +      port 1. Defaults to 0 when omitted.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]

[Severity: Low]
The property description states it defaults to 0 when omitted. Should the
schema explicitly include a default: 0 attribute alongside the $ref and
enum keywords? Adding the explicit default would ensure that dt-schema
validators and other device tree tooling can formalize and properly validate
this behavior.

> +
>    i2c-alias-pool:
>      maxItems: 4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-gmsl2-3_se=
rdes-v13-0-9d8a4919983b@analog.com?part=3D10
