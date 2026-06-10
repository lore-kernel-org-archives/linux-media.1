Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB002D5937;
	Wed, 10 Jun 2026 09:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781083062; cv=none; b=tTw8tqrBbTQWcemc27U5jcG8nLMvbEg5SkeP7TSKNi2wtO0dOhh0yTXvNqGehGtrEn4az2CN7T8wh4VsY+LhR0HwFADDi2DdXT9w0BEyLvU+V4zuIZ4Yflp1WpUCpMp2Bw3E/9nGXMWGaew6wAg15nINo2aZQnCL0uib6jghRgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781083062; c=relaxed/simple;
	bh=s3BGg5H4qOtIBSP4loSijk7jTVwRZIwC9k8zTxvGI6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvWCe7f4VobiyMXbTqisYoJNb9jOfjN3ApOWkgkt8V6crF9+qbkJ04ASJsdiVzrWNEbfMhSsI3XElOShNLw/kjJQULHVGo78R9gVhsuMPKVWsYo2kMQaalfhRHP3En1UAXTxG8OS+r0y/kmcoX1UucBhay5k1u7KHd2he9iYiJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXEwanwW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXEwanwW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112B81F00893;
	Wed, 10 Jun 2026 09:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781083059;
	bh=7aJdhg+QdjogYbSMMYhotm9atH+QTdiuJQlrdUEJBv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nXEwanwW217/vGyCgv6G4WuevKw8w3n78LRHtXi6XioxXnrT13KoMX+loJJeXibRw
	 irpiAV5TDktSo6mFEQiGA/uDOh/gZLSzRWyuCMP953Z7/8AUQk13babSTNSyabqKmM
	 vwsIqystFeZCEQhcsAe7YxEzffpCD39y2q5swKl+ctnfceN/uigiPUkhVjWvuDe476
	 XfmzazZ8MCxxIk7ihaYlPBnYXs1X46irQ48ms8nJen7MWEp6sYTraO9rVqXhw01/RM
	 MTTNQxPujjoReXqpIZXa1NmBEcZ7ETJ8TVoP3DcymPv8XciwDDo1vQHFZuueeYt1QD
	 SblFsa50UGLYA==
Date: Wed, 10 Jun 2026 11:17:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <20260610-flexible-badger-of-dignity-bbaea0@quoll>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260609-shikra_vpu-v1-1-3a32bb38b080@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 09:45:40PM +0530, Vikash Garodia wrote:
> Document the iris video accelerator used on shikra platforms by adding
> the qcom,shikra-iris compatible.
>=20
> Although QCM2290 and shikra share the same video hardware and overall
> integration, their SMMU programming differs. QCM2290 exposes separate
> stream IDs for the video hardware and the Xtensa path, requiring two
> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> equivalent stream IDs into a single mapping. Due to QCM2290=E2=80=99s SID=
 layout
> and Xtensa isolation requirements, such SMR masking is not applicable on
> QCM2290 platforms.
> Since shikra uses the same video hardware as QCM2290 and shares the same
> programming model and capabilities, it is added as a fallback compatible
> to qcom,qcm2290-venus, with conditional handling to allow either one or
> two IOMMU entries.
>=20
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,qcm2290-venus.yaml           | 20 ++++++++++++++=
++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.y=
aml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> index 5977e7d0a71b4fb5681f1c2094439c251366f01f..895533b9756690d075fd7729e=
3f805c8e72ff0df 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -15,12 +15,27 @@ description:
> =20
>  allOf:
>    - $ref: qcom,venus-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-iris
> +    then:
> +      properties:
> +        iommus:
> +          maxItems: 1
> +    else:
> +      properties:
> +        iommus:
> +          maxItems: 2

allOf goes to the end, after required: block. See example-schema.


> =20
>  properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: qcom,sm6115-venus
> +          - enum:
> +              - qcom,sm6115-venus
> +              - qcom,shikra-iris

Messed order.

>            - const: qcom,qcm2290-venus
>        - const: qcom,qcm2290-venus

Best regards,
Krzysztof

