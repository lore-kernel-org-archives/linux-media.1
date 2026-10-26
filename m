Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009010;
	b=ViNcgDmgD4vA8h0MDoRLvmD/pBqL0e9bpBEI7ZHAx1VBeAXcqHiIN+Z0FN6Hn6UWuOKQ
	 8/9ZB4WrX3AIpWTrpDszE+xYaVJqrLeqTdqoZXE2lR8P7a7hof30Dz3heezAMO1NbCZPU
	 ctZqcOVCh/G+VBS7UzDVOYPynybAunWLL80ZMVBn2wBUdf/lf3YoRkJ+0dnGICcEVkARk
	 tGN4j8IZAKQPJmdKhMju5KDSXquIQmEs9TEqS6QUqBOqrxVR2WVX13pvRUQh5n/XxbwuY
	 CZefuXycJrJpLoE5bl3m9Y2c80K0JWiJ+J/DMF4FSpLzRq8EZKL+3CAZSUqWLj38Llw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009010;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=W4vBVbDsli9CIfGvUM/rO7d56+2ydoD8CDU72XQ+5Bo=;
	b=afuKuh2TaJ0ic7jT8WhPpxdaRlEIQf4YWaPib5qvuFyDIS1xYwIOtqoijZlgLSGL3Rjv
	 1mY/eu42ltMm0twfpkLaD/+WnvZ7zBxD38QROCHwO937TIs6pHS43n5BDbLVmHx8FXqSI
	 lRd+Yg0t6CtTpAhjqQ46X3XdT3/7/C1IVt6TBS7kRhZPjP0SI4wuOoC8sPiobDlrG/RzD
	 QnQDpYDlYNvoeXHEuau/cM9FtIeT1mxOOZN2V3JG8eD8tGoLN5M09tEO0zUclTu1XVA6f
	 Sx2kirCWkBf1Iu44WliLxra+IL06Dos9Ww0zcF1hc33shJaY7inZ65lNMIysrmC0JiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GcH6GjCn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A523606A328;
	Mon, 26 Oct 2026 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GcH6GjCn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BD01F01828;
	Mon, 26 Oct 2026 10:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793009009;
	bh=W4vBVbDsli9CIfGvUM/rO7d56+2ydoD8CDU72XQ+5Bo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GcH6GjCnXknP+iQaaox8+4NzLLd/G3M0GZ70jvdF2KoXTm5MFH8WMEGgWYIFwLV25
	 mpUDy8xg5OElW8H1XPkrNtk8UShgKpAMkpyG2LOOKTPzd07qGhE4VswP1be33iaSdi
	 2nhmb2OBa8mwmtcsU83anPvXpJImixQcBSJTF+DLlDbEc2eWq3c0Bj4dLwDjc3u1oO
	 jvqg//HAc3csoUFFUHzqHKJNtfBXAayXXWY8tl95wGFAGZU0Nt8RHElhRHRVI2Xw5w
	 0B6nIbw+eNDenggyCvM9bi4fD5N33Hw79dqLNo11MGqCMngMT6OYQ14ZNV8d2CcmoP
	 HUOr4eyUHdYGQ==
Date: Mon, 26 Oct 2026 11:03:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: media: Add description of Qualcomm
 Waipio CAMSS IP
Message-ID: <20261026-mysterious-vivid-moose-adcd71@quoll>
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-4-vz@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023163057.775917-4-vz@kernel.org>

On Fri, Oct 23, 2026 at 07:30:53PM +0300, Vladimir Zapolskiy wrote:
> Add Qualcomm Waipio CAMSS device tree binding description.

$ git grep Waipio
How anyone can guess it...

> +$id: http://devicetree.org/schemas/media/qcom,waipio-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Waipio Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vz@kernel.org>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,waipio-camss

There is no waipio SoC in upstream. Please use existing names and avoid
inconsistencies.

Best regards,
Krzysztof

