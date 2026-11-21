Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264755;
	b=U2Ed4+jHs0L6qsre0gH5iiQJsGj+1q00Baj2X7NpsIj+bCfLIwjfOsAsu7dTxs6fdmTZ
	 L1O0UQxTHSeolJ2yyWAZl7NArbewBUIGakW3CZFY+6BIfqcYjAE7g/hQEgbDM/jPi7nrC
	 nOUDHYllm53YHhvlvpDnEB1gRnCtan31tY7x6Qdk28YJsGHTsNDX3mWk+vdxrugvV2B9i
	 9W4JofAWcP0mArKIDked20dP1k1Cs37vCQvLyMBM+p/4S449F4Jql7dHNDAky8QXFC3KT
	 C3ROKFuE+oo81GGEyxp6oFaic1M28cIivV1w5uXmgKhztB1qyGg0AKhLIYyU0W1KySA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264755;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QhcR+FgElJw2wYOYLrrbwLgUPU3P5DQ8R/NSwKGVo4s=;
	b=JKINWLp+/eMm+RonDETbw32cpTgRqvgSRnhqJ+oHabgyRAYxVf3KX756Eham0rKpt6Bh
	 wdVNdJ49onnErVc+/4vUcuZYTGkYEfnCnWuRO9w1kY2PwqUhTAUdoDx6fXRTym8K/ZH7U
	 WOH/14h2mjQtW2LCcjPT/Pj/b3iCknEx82lUMxEWY38ZvYubJIU/qvpg+kBDynRKD5uEc
	 YuGNGlk9jqijtsuhzyIS4oXVHe8yAwcRwYtHwgoc9IJdrEWZx12LxydLkpuvRal3QBytY
	 lKY7Xwd8OL+P5dYVRkZLa7SzAp5LQMKXH4m91D7BjYBiZ6W2xBLMCvMdJerPlfNtOIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PlX+JJOJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11730606A320;
	Sat, 21 Nov 2026 12:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PlX+JJOJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18ED11F000CA;
	Sat, 21 Nov 2026 12:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264754;
	bh=QhcR+FgElJw2wYOYLrrbwLgUPU3P5DQ8R/NSwKGVo4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PlX+JJOJMWKF6qq8m9vcoVBN7A/qN4mQlMk5yv6F97kUZ/Nm/JvBGpXIYwna++kmO
	 iT297rrAgeVRO7xcy1kjdVN8eEmJTu2rrHBjsvNts2q1ZpZXOiJqtAa+JA6xh+Z38f
	 hV4Xcgab8ldDI5nxV6iR07uTrNFO629ohxw50LDK3AcXG6muidx4FjORLkLLXwXhA/
	 +6K6rQzGaOzjJ48WITgowRYLO4q81fOQGH8xOA370XLHODs4BnXhGMGX3P8A+mQGVy
	 KUQHrTMEeecvi++tepckyhJtLJqw6dHUiQea+fl9ZsSvHzMVYEKH6RBj+MRt1FhfBT
	 Utt+DUIgHBAqw==
Date: Sat, 21 Nov 2026 13:39:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] dt-bindings: media: qcom,hawi-iris: Add Hawi
 video codec
Message-ID: <20261121-neat-chachalaca-of-adventure-0a4cc6@quoll>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
 <20261118-add_iris_for_hawi-v3-3-51786f6d4057@oss.qualcomm.com>
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
In-Reply-To: <20261118-add_iris_for_hawi-v3-3-51786f6d4057@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 05:41:42PM +0800, Wangao Wang wrote:
> Add a devicetree binding for the Iris5 video encoder and decoder block
> found on the Qualcomm Hawi SoC.
> 
> Compared to the Iris4 generation, this block has
> - additional power domains for internal NoC(cx & mm).
> - additional clock for internal NoC(cx_iface).
> - additional power domain and clock for apv codec.
> - different reset lines.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,hawi-iris.yaml  | 256 +++++++++++++++++++++
>  1 file changed, 256 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

