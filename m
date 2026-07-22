Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F5933B6F9;
	Wed, 22 Jul 2026 06:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703474; cv=none; b=ubBncnBLW4tuQVn4vnpJWonTHwVJ4h4xGDXXcfWoOjdB5jx8MBOCzW448+xZcp5Ks4xYoOkqGIiw20Cs3si+pCPqaX+KhtMQqoeDuUppwiYN1+28jdMZi7OmybBREzDnVIHxvQImugrv3mqIwmsBW52gJ9Yh4QvSGMf28IS6N4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703474; c=relaxed/simple;
	bh=kuEmGi3KRFD9PpKtcyooZ/uj6vWmMH5n8dVU38F4sR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flMiiRq2vn5aEICNa23qBhYOe/yQF3yUuvYyIcdw4YjY68UcLQUCXkeOg9UNPhByOCesanqkyds+SON03EJI7Fd7wyYTOYN9dsFt2lP7cSCw84oCzAYnsw5lTmx4dN8yFEFdfwffNjqjgSpIkQR1DfhOBnGzt22HP8LIt4oUMsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOEHauXR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOEHauXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AF61F00A3A;
	Wed, 22 Jul 2026 06:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784703473;
	bh=06XF7zpSnsetbA0eus7tkijIniC80Q0nSuvoNAK5KGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lOEHauXRUNHaWZHe8+W3+FJCQ/xB4iOyemVEL8HToPwnAa7M5biAhvlq4PWtClWk7
	 o3J4tvqZuh4vzLuzgaVqfPHWWnQhBrx5U9zUz9BIHnFkQtR/j8Fn8vR8d7fhRPYzvm
	 7v6hssZh4LN2sy4zI9MREoxLuz4dOUGMaPKL9rcvJO85Ho9/McuJjpqZRgUqaS+yup
	 v59ryEcp6dTPxVM6W3zvlJAaEc8lqVCUq/7NxbwBvPdYZWNk51AkDngA8l/gRjN4XK
	 YHmYjEQeNNykgDaGt/PdVPZVjRUjwkqm9ziLpyem82V0NfWOY1D5D+EqgVwI/n65YO
	 f5fFy5i5gL2Hw==
Date: Wed, 22 Jul 2026 08:57:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	jeyaprakash.soundrapandian@oss.qualcomm.com, Vijay Kumar Tumati <quic_vtumati@quicinc.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
Message-ID: <20260722-literate-nondescript-seagull-cbdfaa@quoll>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
 <20260721-add-support-for-camss-on-sm8750-v6-1-a5f841061d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-add-support-for-camss-on-sm8750-v6-1-a5f841061d18@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 05:46:00AM -0700, Hangxiang Ma wrote:
> The SM8750 camera subsystem exposes six CSI2 D-PHY blocks that follow the
> same programming model as Kaanapali. Describe the SM8750 CSI2 PHY using a

No, SM8750 does not have the same programming model as Kaanapali. When
SM8750 was created, there was no Kaanapali, so how it could have the
same interface?

> "qcom,sm8750-csi2-phy" compatible with the "qcom,kaanapali-csi2-phy"
> fallback, so the CAMSS binding can instantiate the CSIPHY nodes as
> separate phy devices.

Redundant sentence.

> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml        | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 7943049834f9..95375efb2597 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml

I just commented on very similar patch. This is confusing, there is no
such file and I do not get why you keep adding some long chain of
patches touching the same lines. Squash patches.

This is untestable.

> @@ -16,9 +16,13 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,kaanapali-csi2-phy
> -      - qcom,x1e80100-csi2-phy
> +    oneOf:
> +      - enum:
> +          - qcom,kaanapali-csi2-phy
> +          - qcom,x1e80100-csi2-phy
> +      - items:
> +          - const: qcom,sm8750-csi2-phy
> +          - const: qcom,kaanapali-csi2-phy

SM8750 came one year before Kaanapali, so how such compatibility is possible?

Best regards,
Krzysztof

