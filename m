Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D3E1A9F94;
	Mon, 23 Mar 2026 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271042; cv=none; b=t1qVJqkZBG1imGBUTy8e1etpoa/UFyI53AEt5ZO4S4kfNtwBPLIvJn0oOjuQUUyYcxAZxFw6tmxhLOhVAkcS02E2Q+29jgtUeFkc94KiUE7H4xfWtxy1t8aUiSX9ZzNDOrpUOuGDsU+h8DK4RfzO9YKRjRymmCxPrLVebKRqkc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271042; c=relaxed/simple;
	bh=Ylq/oZCsVDrg65eFVhoN/7nKdKKRtGGdhZAHCBAqx/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHOzEe4UYp/uwexonktMAIFX70GV9CT7uiqMoECg4plg2Cs4M3algnF/UOk65pzaLvoArG7cbSm1AXQHd5PRj78yDLEbyRoujww/imcWV6pYigXwy8yq0cpsOD6KuOw4cE/A9Anb5ba0mSTkB0sqfbKEVNLGkipY3NGDAr0xRto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHreTXkX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHreTXkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F33EC2BC9E;
	Mon, 23 Mar 2026 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774271042;
	bh=Ylq/oZCsVDrg65eFVhoN/7nKdKKRtGGdhZAHCBAqx/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eHreTXkXW9DfMnF/9LrPmt32mAf5WpI9YmX5/slokd2ikgCL64dPHYdWrEtowFYau
	 u+rd1J73PpjwwgsPCMnsD3JvgXCHicwiAa/tYg363EgD1ISE2msNupwiR5+/kjipjL
	 eGuBMZFFZqVF07tWdWQiWFlm80DMhXchenXsOj9yoKNMH06+cQgJ0TMen6tLG53auQ
	 EFyOjTIkmXM6NuqrNcuaFgiIHX+/frfd33QjV1oBAjTszHenQl/7gIVV4EK42b2kmt
	 zN4qkbFIZa8mWlDnf6CA2HB0Usc6A/0+BTpOK2ekHjoCrnLLPkHjqyoZhv4R58dPIc
	 jLTIOnQ1l8BYQ==
Message-ID: <d7775d73-b069-4f76-aa84-ee87b8c60d8d@kernel.org>
Date: Mon, 23 Mar 2026 13:03:58 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 johannes.goede@oss.qualcomm.com, mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <wo8sAGMCEdf2cJeamAj7cfOHBExdkDTGPIILp1hTSaWEDjkHurW4drGDywvFEh0jXFCRCGyYnZb8TRhNnXJAWw==@protonmail.internalid>
 <20260323125824.211615-2-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260323125824.211615-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/03/2026 12:58, Loic Poulain wrote:
> Add Devicetree binding documentation for the Qualcomm Camera Subsystem
> Offline Processing Engine (OPE) found on platforms such as Agatti.
> The OPE is a memory-to-memory image processing block which operates
> on frames read from and written back to system memory.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,camss-ope.yaml        | 86 +++++++++++++++++++
>   1 file changed, 86 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
> new file mode 100644
> index 000000000000..509b4e89a88a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,camss-ope.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Subsystem Offline Processing Engine
> +
> +maintainers:
> +  - Loic Poulain <loic.poulain@oss.qualcomm.com>
> +
> +description:
> +  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
> +  is a memory-to-memory image processing block used. It supports a
> +  range of pixel-processing operations such as scaling, cropping, gain
> +  adjustments, white-balancing, and various format conversions. The OPE
> +  does not interface directly with image sensors, instead, it processes
> +  frames sourced from and written back to system memory.
> +
> +properties:
> +  compatible:
> +    const: qcom,qcm2290-camss-ope
> +
> +  reg:
> +    maxItems: 5
> +
> +  reg-names:
> +    items:
> +      - const: top
> +      - const: bus_read
> +      - const: bus_write
> +      - const: pipeline
> +      - const: qos
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: core
> +      - const: iface
> +      - const: nrt
> +      - const: top
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: config
> +      - const: data
> +
> +  iommus:
> +    maxItems: 2

These should be described.

> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: camss
> +      - const: cx
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +
> +additionalProperties: true
> --
> 2.34.1
> 

