Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD464456292
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 22:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791500298; cv=none; b=D/1vhddRovtWEFv4td73cf2pVhxxDxXFjRZc9Xp0U9TP4Yq6PLqxLntUOwx69ZQppwxMYOcgCYrmvrI92fefQm5pJ3GoR/tdKsQTptWxZ5Vz0uxfr6MYdF+xY3lWY+F8ZQ92lebId2LauGobeq8T0V/zymwo6zCW/XebmiWvG8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791500298; c=relaxed/simple;
	bh=0Vjg6EBigpEticIXsGtOabqNyL7EWzHSiVKHnaUPLwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYL+oqgZ1deMJkRjdXDste2ysFqVP3TzoO6FZ7JEJ7wgmuYd/Kxso0yPlw40qg3+CJRMPOzkQv2E/kPec2y+bRMAWvvB+Chsh+kcyg+vD2Bm3J/yrDz8cc376HstEjBpcixzE0nS089Cnas/UjypIGbzsvyGSAjniKMCgrOuudQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASaEn4Hd; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASaEn4Hd"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so8246777a12.3
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791500294; x=1792105094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zFx1lfnIWF5hRoeOi+LYMylQLVmz8uaGy+M0D+8XfQ=;
        b=ASaEn4HdiI4QqikhX0RBWkL8/fDBGXM9EaQYh9decgqngnsZ6dfOOBd6AQk62HQ5l+
         NP7v6zRrriQrin2nuhuN3glyjZDLReoYVDpMs1UYW/QsqUj1BlyojJwAZBUQ0iyi6JvY
         RHfo7S7BiWj5twg18G7ufPkavzyxEvuG+wGimNTdvroI/dDOIBcy0/tJEaRTHvgVdN/x
         pfghltdF6xiHuaUZZP3TGPBwXEAKral1fLAp2ElWrXz7HNcyJFr9PiyfoXeLHm5Za/dF
         /kwBcDjSFtYkfc4exy5bTiRswFfIY72uF6oZ5w1r+s8zNKJ5pJZyWTdMUwOseYElouMM
         VByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500294; x=1792105094;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zFx1lfnIWF5hRoeOi+LYMylQLVmz8uaGy+M0D+8XfQ=;
        b=lrFZbG1B43Gtmnbd62NmwWCsQmxWOBEdGES4p9pXqwTOk81OpTxd57z2KdbuDF0z5c
         H5pOKdBZxGTwR4DfN280vED7drty+WbUkJJgsF06nOwFyYPhjWmMcfUHnKxHOXlb3y44
         qQ2WuX6/PK7pOOMbfuMeGS9+2/IKZCdlUxyJ1Lt6pwYxomgr3LxRAdlOwK47TxWmJT8Z
         zWCWpN9Gy3TUXOfWg5AFE7MITjDxxuEK9NvLldbYcdoawS5onIXGt/Wgv5izhmW53Ec4
         HooAq8fkcE0ACmCQhsYGcdyCaOT99qjhJPQJC5ZMxarX9/fk+/rvyHzpOQD41dHCz/mO
         p4Jw==
X-Gm-Message-State: AFq9FYI7tzSbNjVvibPZNrufNnApF7Vjk1nvss2eyB3mqguytGbHqKKo
	i+VRwR5/0iEjscD+E7FFCheh/iFTRzG4lvgDTEgKsCfGc6iq7G/z6uy5G51dEvRVenI=
X-Gm-Gg: AYBFou16vMFP63Gix4mQXu/zUtZ2vC4w4GsgNZ1+hzaIUMF2gO6TGHQswSx9Jw6kS0R
	Izb2/027gKfF8rWXGCCoZjbVIufVzEG7XN0GQSgxI9RPewPXrjcLqK0VgqTDVvuKbSVB/zF7pNt
	xWH1ejG7fJp3RQxQSoW3tjIH6pcQ675VGYy0qkQio0t2VnXMYukbAy+MBhxq2jK5ZBFNl9Lfw0d
	qSb8k+jHbROthQEHrECpwaKIEMx+OiP+uhx8D+cGNSG50C9mDmw3HFLM1m+9vF1ejVWAkWnq3Bo
	GUKmoVToG7Uz/4WOf8Hpzq8Nfr5DvdBVo0ULvOnLaaZGn3lWpd5GIqYSLPKdEb01cr/DDuMrtH0
	H4lvrUYuZqw5Mz0/AMdHTthXLHPiPpskz365D+c47elH6MuUMttQTHcOi63mb2HM8YBrKzb7due
	GBk1k7yOHDc1NS+5cWCfyi6itNuZAVQJAs4+aUmkLGSsqmFCfnD1SdCeFkaPywl5jnBonWnuHxb
	T35txmWYLoF
X-Received: by 2002:a05:6402:23c9:b0:6a5:f202:c1c7 with SMTP id 4fb4d7f45d1cf-6aff377c995mr5693532a12.8.1791500293961;
        Thu, 08 Oct 2026 15:58:13 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.203.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e012a7sm181609a12.36.2026.10.08.15.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 15:58:12 -0700 (PDT)
Message-ID: <1e736d77-6bd9-4a16-af62-82b11c7e5681@linaro.org>
Date: Thu, 8 Oct 2026 23:58:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <zC3sJZSv9CSB2RI5UATAf3fT-MZvHb8XVvKBu7steGEH0xl4ADC7TW-h47VyQw1v75g93ppW4jYx0X45XHLtPQ==@protonmail.internalid>
 <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 07:34, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>      +-----------------------------------------------------------+
>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>      | 0x25800000 - 0xe0000000                                   |
>      +-----------------------------------------------------------+
>      | pixel stream addressable range (0 - 3.5 GB)               |
>      | 0x00000000 - 0xe0000000                                   |
>      +-----------------------------------------------------------+
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Given that the address range restriction is for specific VPU stream, it
> should be ideally be moved to that stream. To achieve the same, a subset
> of streams is now represented as subnodes, so that each can be
> associated with its respective addressable range. The design was
> discussed and agreed by mainatiners here
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
> 
> In the past, this limitation was addressed with an iommu-map approach,
> with the iris driver dynamically creating the devices. That approach was
> later concluded to be a hack to avoid having subnodes, and was NAKed by
> the iommu maintainers. It was discussed in detail here:
> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
> 
> "iommu-ranges" on the subnode describes the *allowed* IOVA range that
> stream is allowed to use, so the IOVA is allocated from the specified
> range only. Define all the possible subnodes so as to describe all the
> VPU hardware iommu interfaces, both secure as well as non secure.
> 
> address-cells, size-cells and dma-ranges declares the 1:1 DMA
> translation into the parent.
> 
> The parent "iommus" is kept as an alternative via "oneOf", so platforms
> that have not been converted to subnodes still validate. New platforms
> should use the subnode form.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
>   .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
>   2 files changed, 97 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> @@ -91,21 +91,6 @@ properties:
>       deprecated: true
>       additionalProperties: false
> 
> -  video-firmware:
> -    type: object
> -    additionalProperties: false
> -
> -    description: |
> -      Firmware subnode is needed when the platform does not
> -      have TrustZone.
> -
> -    properties:
> -      iommus:
> -        maxItems: 1
> -
> -    required:
> -      - iommus
> -
>   required:
>     - compatible
>     - power-domain-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> index 59a3fde846d2196ab1e4588eb396012ba6860712..68d5e592a028c5eecde04ce72cd5ae6815ba5c82 100644
> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> @@ -47,6 +47,93 @@ properties:
>       minItems: 1
>       maxItems: 4
> 
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  dma-ranges:
> +    maxItems: 1
> +
> +  non-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +      iommu-ranges:
> +        maxItems: 1
> +    required:
> +      - iommus
> +      - iommu-ranges
> +
> +  pixel:
> +    type: object
> +    description:
> +      Context bank for VPU pixel buffers containing uncompressed video data.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  video-firmware:
> +    type: object
> +    description:
> +      Context bank for the VPU firmware processing domain.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  secure-non-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU secure non-pixel buffers.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +      iommu-ranges:
> +        maxItems: 1
> +    required:
> +      - iommus
> +      - iommu-ranges
> +
> +  secure-pixel:
> +    type: object
> +    description:
> +      Context bank for VPU secure pixel buffers containing uncompressed video data.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
> +  secure-bitstream:
> +    type: object
> +    description:
> +      Context bank for VPU secure bitstream buffers containing compressed video data.
> +    additionalProperties: false
> +
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +
>   required:
>     - reg
>     - clocks
> @@ -55,4 +142,14 @@ required:
>     - memory-region
>     - power-domains
> 
> +oneOf:
> +  - required:
> +      - iommus
> +  - required:
> +      - '#address-cells'
> +      - '#size-cells'
> +      - dma-ranges
> +      - non-pixel
> +      - pixel
> +
>   additionalProperties: true
> 
> --
> 2.34.1
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
