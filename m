Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A908274FE3;
	Mon,  1 Jun 2026 04:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780288027; cv=none; b=Z5dhO3aUTUrkka9rFiHd1tnDG8GErq+Gy28v0WNgvG/rTOfr24X62pCjjVqmQ45Vsa/YIBwKVlLem6TkQfZsYJJJA1uSIFGsF423938b5RyQuyzZGHwdUsAvfz9CgTESMhI5IEbxp5WK4l6/fypSEr7smgZ1W4ZzkmA+A9n/QDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780288027; c=relaxed/simple;
	bh=KZ4Ei1xUdNYa0MnzEqIxb/mkrthVEqKhnow13vDCkVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g7fwyZ8i+yQLZRdEwWAiYawFC9aM7a2XyrbELG5aCa/U8zyDHqTZBxxQcmBlDl5Vk8dhSi93q26gRU7Xccg2nDrmreJdbb5pZVGv5YwX+rY9275Efw6g64eXHiyNykfIkENmb+D19WNkiUJeMwZH9CK+yCGDK9cn2RGjsHKUOII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcaCDnFo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcaCDnFo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B24C1F00893;
	Mon,  1 Jun 2026 04:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780288025;
	bh=VdUYmYY3QWK45XuawNvBUeK0jruTjAFyFmZolk4sPmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZcaCDnFoM12N9kdhXZv4d8JNc/Uwsujg1YY1mm2Uqmh7njBBUUq51vt8mqNYbZIBu
	 pNB8OSlVLFjuPc8pUSaSQMJw8eHQq2v+AaEODLBtum1Af4KQJagGQ1U11cQXKVTCcj
	 r7TneFmbofou6Srqdy1DjkKMs4o0iPoZq53F7ZK6S9ihu2IMrbVc5Tqb/4S4DVbrUF
	 1DrWo81/tqYyS4X3RcnwtuD8DUB2HMvFSazRHoxByRQ6FIlbwX6gaiE3fcBG1Pr+kY
	 uYBj8ZI28kXOHyyZJZZjTAdrC65tG92Jd19qUmZ8dpBPfGHeaRl1lHH5l8+ktdTGqr
	 AdWgieh1YA+zQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA
 reservation memory-region
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel J Blueman" <daniel@quora.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601041336.9497-1-daniel@quora.org>
References: <20260601041336.9497-1-daniel@quora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 04:27:04 +0000
Message-Id: <20260601042705.6B24C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding schema fails to enforce the second `memory-region` i=
tem (IOVA reservation) for the `qcom,x1e80100-iris` compatible, which stric=
tly requires it to prevent system reboots.
--

commit c0ad29924b6618f643fc065b86b7d5896e42b2ff
Author: Daniel J Blueman <daniel@quora.org>

dt-bindings: media: qcom,sm8550-iris: Allow IOVA reservation memory-region

In addition to the firmware-loaded codec carveout, some Iris platforms
need to declare an IOMMU IOVA reservation (a reserved-memory node with
iommu-addresses) to keep DMA away from IOVA ranges that earlier
firmware stages have already mapped through the SMMU.

> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yam=
l b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index 9c4b760508b50..0d83bb86c6c3f 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -80,7 +80,11 @@ properties:
>    dma-coherent: true
> =20
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: Firmware-loaded codec carveout
> +      - description: IOMMU IOVA reservation region

[Severity: Medium]
Should the schema also enforce minItems: 2 for the qcom,x1e80100-iris
compatible in an allOf conditional block?

The commit message for the subsequent patch ("arm64: dts: qcom: hamoa: Rese=
rve
low IOVA range for Iris") explicitly states that on X1-family hamoa platfor=
ms
(which use the qcom,x1e80100-iris compatible), missing the IOVA reservation
causes unhandled SMMU page faults and spontaneous device reboots.

Without an allOf constraint enforcing the second memory region item for this
compatible, incomplete device trees missing the mandatory reservation will =
pass
schema validation but cause runtime failures.

> =20
>    operating-points-v2: true
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601041336.9497=
-1-daniel@quora.org?part=3D1
