Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6B42DECDF;
	Thu,  4 Jun 2026 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583487; cv=none; b=PZ4SY1uPlFPHE+txRlCaF3krGpzZHir/Pm+rFxgXFchIu0t5z1Kgpl/KWYprTKYnj8mD2hkxCKgtsfx9H1En+YIP6lUHNoQQuRDS6907ALjm/mAvUHbbpUOTr3lvfwGGneWcc/N6EtARfgC/cVgGNDRfXVeNXoXtlQvsQjI0Blc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583487; c=relaxed/simple;
	bh=vdqCPMsfk6VMhS3Kw51jUq9KVBlolRkr3oAkXhEZoOY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ov89LMBNwZqW2DHuzn/LzE+hCrpcKLBhZbU4WICH5GcCqU5cdXVRpSfZW3tHagT/p0/5LKLp5pAr4io+iGbc/K4AoFiLA9y69dtWihRtpNqUs8/iwNiMsxasL45Y+7nScYTWYJehrxtqzfQT4CXLF209t8Av3pe/UgKxKycJ9Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVeKnTyV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVeKnTyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207491F00893;
	Thu,  4 Jun 2026 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780583485;
	bh=VHuK8ekaPrSgCX880FM/DAKYuDyx4cHnsY8r4Dbloiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JVeKnTyVpKcfO5ACIxUK7dTAnqjtXjDMhTyG8KewiLMXi/RW8JX4PHHt8UmE3Ju3I
	 aD2iaNEygRZPz+5gfc/puMczhqmq1OsHxXjz8WWqZzMbDUL6phmS8oXNUWhbixAzxJ
	 yZ9woGEwcid+shPostHWu4xWy47LM4XnT2TNRq+G8r5eO6eQoIE2A3g5GCBj7NXfcg
	 WsLWZNiXjGdZhkVLfJK2/uasW5xOwNo7uVZZwQtm/VaNtXTbhbNZfMlj12cG9Sz24E
	 IO1KgaUCkDI3A1qz+HuGKTfQxiSshzXtAqBqjZxH2MdWGgv7/wwcZz0p1b2+DOzAe9
	 GuL7cCrhRECOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 02/22] dt-bindings: media: i2c: max96717: add
 support for I2C ATR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-media@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604-gmsl2-3_serdes-v13-2-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-2-9d8a4919983b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:31:24 +0000
Message-Id: <20260604143125.207491F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `i2c-atr` node and its child nodes omit mandatory properties=
 from their `required` lists and lack appropriate array constraints in the =
device tree bindings.
--

commit 92e28a019c543a99bd1f06cdc7c8d1709ad721cf
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: max96717: add support for I2C ATR

This commit adds support for I2C Address Translation (ATR) to the MAX96717
bindings, maintaining I2C gate support for compatibility.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index d1e8ba6e368ec..976f6dd2c164c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -91,6 +91,30 @@ properties:
>        incoming GMSL2 link. Therefore, it supports an i2c-gate
>        subnode to configure a sensor.
> =20
> +  i2c-alias-pool:
> +    maxItems: 2
> +
> +  i2c-atr:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +

[Severity: Medium]
Since the i2c-atr node acts as a bus container for child nodes with unit
addresses, should #address-cells and #size-cells be included in a required
list here to ensure they are always present?

> +    patternProperties:
> +      '^i2c@[01]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1

[Severity: Medium]
The child nodes define a reg property for their unit addresses, but they do
not specify it as mandatory.

Should there be a required list containing reg for the ^i2c@[01]$ nodes to
prevent them from silently passing validation without a unit address?

Additionally, the reg property applies items constraints but lacks a maxIte=
ms
limit.=20

Could this technically allow malformed arrays with multiple valid items=20
(like reg =3D <0 1>) to pass schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-gmsl2-3_se=
rdes-v13-0-9d8a4919983b@analog.com?part=3D2
