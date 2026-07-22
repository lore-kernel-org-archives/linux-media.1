Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC5F38757D;
	Wed, 22 Jul 2026 07:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704506; cv=none; b=b8i+HiY6ZBUYXu3SzN/IgOl4dtXupGNKuQ0S/9cepXV5jz5EWy22bH42wjJq+eJ8ZC/KPuCMFxJ/Kiw0gPV0yYXGNcjV1qccGXLDaUtn+TYgHt4878xvmB6m0QkthKwbG9X13z1aS6TywexsH0yv0Ql+T7hNkI6U5YuLXr8559g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704506; c=relaxed/simple;
	bh=wv4Lse19EaxJY7Atkp49N/xkYPp76AteA++W/5M80z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEL455FSsy8ESsyoyITmQcVS6BmnmXnG78XnygPiYyZYxHrUZ/RTDunIhK2h+zfGp5sEXeOVNCp7iUNkV7vEkI7Svdj4JUzC9fhSR47xgS9zl2tPu21Rg/lUqj1GWdCIqVhLltBKGwGlQfiiBsu4XpYAG7r3BQr829RB/2yFPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iADYjQ1r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iADYjQ1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07241F000E9;
	Wed, 22 Jul 2026 07:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784704505;
	bh=b5wuDAxROYjCNIEsNKcKMFaycsum1stobyHgc5L4PL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iADYjQ1raFdQv8UJLvapRoTcPJSxvgJqyeqz8Hb+2ONVqDhvUrpxbWrz0mYWd7oHm
	 xB7zrxgSPTaaLMxKbbFc1z59E8DBwbjlXJlmMujwOFCoQhswOLncV+k00vldGmAAl9
	 GhJsaxFUTdexmCXXxZmNBeMvLdeMUFcVJlFTH8QFMIvr+s2xk9gLVTlrimqQRVpoV1
	 1GnM9NPGPqFT5sRrgy3mck+oL1DJbdTdxjS1oL5+yVh694hXYrLd1wVMq41QjBfYP4
	 M6/SIe0nXi+yjIUwUne+W8nBhGpKcr3YwOC0p/UHjiqSv+QRkDDIw2aFIwdQGee+5b
	 NjMefhGL54kLw==
Date: Wed, 22 Jul 2026 09:15:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <20260722-rainbow-sapphire-leech-e3debe@quoll>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
 <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 11:02:25PM +0530, Vikash Garodia wrote:
> Document the iris video accelerator used on shikra platforms by adding
> the qcom,shikra-iris compatible.

iris here, venus in the compatible. Please decide which one.

>=20
> Although QCM2290 and shikra share the same video hardware and overall
> integration, their SMMU programming differs. QCM2290 exposes separate
> stream IDs for the video hardware and the Xtensa path, requiring two
> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> equivalent stream IDs into a single mapping. Due to QCM2290=E2=80=99s SID=
 layout
> and Xtensa isolation requirements, such SMR masking is not applicable on
> QCM2290 platforms.

This paragraph suggests devices are not compatible. Will Shikra Iris
work fine when driver matches with qcom,qcm2290-venus?

> Since shikra uses the same video hardware as QCM2290 and shares the same
> programming model and capabilities, it is added as a fallback compatible
> to qcom,qcm2290-venus, with conditional handling to allow either one or
> two IOMMU entries.
> Common schema is updated to accommodate the iova restriction of 600MB.
> VPU restricts usage of 600MB for specific streams, which could otherwise
> lead to device crash.
>=20
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++=
------
>  .../bindings/media/qcom,venus-common.yaml          |  5 ++++-
>  2 files changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.y=
aml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..b27899ebf164229ceff1ca5cd=
a50ee30d875e953 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -13,14 +13,13 @@ description:
>    The Venus AR50_LITE IP is a video encode and decode accelerator present
>    on Qualcomm platforms.
> =20
> -allOf:
> -  - $ref: qcom,venus-common.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: qcom,sm6115-venus
> +          - enum:
> +              - qcom,shikra-venus
> +              - qcom,sm6115-venus
>            - const: qcom,qcm2290-venus
>        - const: qcom,qcm2290-venus
> =20
> @@ -45,9 +44,6 @@ properties:
>        - const: vcodec0_core
>        - const: vcodec0_bus
> =20
> -  iommus:
> -    maxItems: 2
> -
>    interconnects:
>      maxItems: 2
> =20
> @@ -65,6 +61,22 @@ required:
>    - power-domain-names
>    - iommus
> =20
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-venus
> +    then:
> +      properties:
> +        iommus:
> +          maxItems: 1
> +    else:
> +      properties:
> +        iommus:
> +          maxItems: 2
> +
>  unevaluatedProperties: false
> =20
>  examples:
> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.ya=
ml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> index 59a3fde846d2196ab1e4588eb396012ba6860712..0be2f9119e78233928d23af86=
836ac294aa769ee 100644
> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> @@ -37,7 +37,10 @@ properties:
>      maxItems: 20
> =20
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Firmware-loaded codec carveout
> +      - description: IOMMU IOVA reservation region

This adds second region to several other devices using
qcom,venus-common.yaml, thus should be its own commit with its own
rationale why all devices take the IOMMU IOVA region now.

> =20
>    power-domains:
>      minItems: 1
>=20
> --=20
> 2.34.1
>=20
