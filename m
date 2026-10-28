Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189386;
	b=XV3DpICzjW6Mjao9PzERLqFY+zsmtNrtP1Zr4kDkFcpb4sIDQkR0ZxYYGPWf1/HLNKqJ
	 uXj07aAXrhcz029DqUUDr8N2YZoS1c3aZyH/3mpBRWlFtcY23XJvVxbRRBn7qUkX+iJYR
	 19fe+y2g5WTPpfHBs6o2iv9YzRdoNVGCN1MGANghwCys1xwXrS/pGpJHYay9LLc0n8iEM
	 4qxZgAMreynbHR6eSq5m/mACR3/C26TlH7VlG/pKzHHUKQp2Ro2s/jy2zASSaic2Iey4H
	 mLo2vgaNN5DkJ/Xr4Hp8Kgrn26Oe86XCFwyKlPpTiBk8VpuFrVLD4olhVDh0PX2Rm3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189386;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bvZsWGjE5bOOOfMNzS9INtnRdMpQ11g4gS7L2uDyTi8=;
	b=f9cA9nxAEI0UAS5s2DmWbMJeEH7qKkeWumjraflTCrUHqVbUCxv2MmMmNk35RdZ7joEI
	 xFC/7tdrLcKuzNCHTk5Ut+YaP/6oW/J9z5heyYppYOILBf4PQIwCisMCCQz8V2I+m2tZG
	 T7O1T6y4LR8OFNVtdGNwdg2JUuAVGslABws/RitCNaaLQfb4y27IpXQa047yVxWbkvfRh
	 EnOoGddra82iT3FMcJ5YuiihhzRGXY2kuoZl2rOh8tbycJ1sDuV23DoocrzGNjI3i5Bre
	 UldGeV/RMCzRWW9P5P2ut5UVGjlovrQrNK3AMILbPqHS0OUFNGzEkON7Xpav1GTWxbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MM62gqiK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3687E606A31F;
	Wed, 28 Oct 2026 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MM62gqiK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7451F01825;
	Wed, 28 Oct 2026 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793189385;
	bh=bvZsWGjE5bOOOfMNzS9INtnRdMpQ11g4gS7L2uDyTi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MM62gqiKS2/oZGrVIYik3VvmM2YN0UvVIeo+uvT/paMBKTy6nYfrK1+3Vs0grys1C
	 6GwZmi7JkJ9AGG0l5L428XfkDaIYCAe6wBmlVFXQCjXO2xnVtm8CKu7xk6d/ZgZW1R
	 TGaPIyeebuxoQ8WS5kZZjkQnqBYPOpcPOmeUSPlnd8ctpn4/AlD56irsmZSoikF0l6
	 mBo/zjhWtXJw51FB3UtNCNjLEyKpfz4ULuP4GpmhuMJswqCEedyuczGjUGjwVmPcGc
	 2hGIgkDybXZg3+4IIN4M5mWzTWOri4npvffJt+jBY71Ys8L7BdRvBAn8zgW5tDSYlr
	 cgiJVrztQI3MQ==
Date: Wed, 28 Oct 2026 13:09:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8450 compatible
Message-ID: <20261028-abiding-soft-beagle-18a1bd@quoll>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-2-vz@kernel.org>
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
In-Reply-To: <20261026224957.1115370-2-vz@kernel.org>

On Tue, Oct 27, 2026 at 12:49:51AM +0200, Vladimir Zapolskiy wrote:
> Qualcomm SM8450 SoC has six CSIPHY IPs, which are compatible with Hamoa
> ones:
> 
>     qcom-mipi-csi2-phy acec000.phy: CSIPHY 3PH HW Version = 0x40010000
> 
> Hardware supports up to three different 0.9v level power supplies for
> CSIPHY0/1, CSIPHY2/3 and CSIPHY4/5, but there is just a single 1.2v
> power line VDD_A_CSI_1P2, which supplies all CSIPHY devices.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

