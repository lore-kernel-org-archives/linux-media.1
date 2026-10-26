Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009050;
	b=MkP+4gzU8eUJp4UuCnI9BRgCmdxhxO0E27R2H0xJUyPq5q8XPCA1VkbnIofTt+y0xFZc
	 YDwrBm6r76oPCAp0CEJudBQ3FEqKbIZdTkbMCx3YfqxXOUf9MWE+3KdFvoOj3zUbQZb+V
	 7UK87VR/iRqqMHSGnqZ0hR+XBWe2cCfAlRh3MBjoCJLyguskES5ADvO0KGoBdbKuTZ8b1
	 jodNG5JvR1GkFnRMqezXBABJkPoMfd1gEGbmCJnMo+jWTasK7meoU+9Znf8v2MjnboWKJ
	 y5V2slAkEzYsAzAzTwZqmu5VSA0ifElGz6tvxQF/26arK/buQ9MVPy0cwS/iy7DGERw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009050;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DMDVfX/60j1T/4I3Dg47M+PWpk6OsCfOmqDTjZw5jMg=;
	b=UgK9vkhvmszN4zCmMG77nJpBoGO43ISc+lvkQWSIULBX1mm4FKhFykYruW2ioef8HiQf
	 xt+H7T+UYEaxeq6pXDf9c7ww2mqrMJdzr7s5nmolZlessFWcOIL8k9lSSx1Koy91zAWKJ
	 CJfCWYyANE9gOgmwn7ZTLrq6k8TYUrnkV8Am44uEPmWSYbCmOP2K25IB75r7WYwezKZAB
	 QyrZcSPeCSHKZ6vzpN4OUDlTnQv6qLtyrpJiu/p3j7WiXsAcIWzXKXVHxMk9zdFR4B3Uk
	 9VhQGFGz0m9wx6Tla1PbmhfVrSu0nDspZ+EKyPRdKfD2N2YDASbpkZj5GxIL33hop+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RWMWXrYP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8940F606A320;
	Mon, 26 Oct 2026 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RWMWXrYP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EA31F01825;
	Mon, 26 Oct 2026 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793009050;
	bh=DMDVfX/60j1T/4I3Dg47M+PWpk6OsCfOmqDTjZw5jMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RWMWXrYPo9GT3fZIU3eVnduHhWuZ9rtelr5f+AJR/r6CuR6tKVTlOzvsIxGN2qh9G
	 hIEsLnUF59YGpGkpE4ZxFNnq7CNIv7UhG4Y+NXBahwvPP3uWIAfSTx2uchvoxUm62C
	 i1dVCr0/nYK83bwBVVrtFQZLC2TTHBS0+oHyBMC1gFxha+53DHA85zIPm1eEDAJV+4
	 G7ACY0/x425MX74Td5D+a5OGVIQl17jjERvdqD0ejFZYDHcMv2JbhacGuobMSXu0fz
	 ZxaccTGzeqNPWyxhoi4GMy1Axj7PEwqG5Xm7gUI7ZCf7oVGzNdiSmEaNxenF5GKEbB
	 NRz2tJxKdM1MA==
Date: Mon, 26 Oct 2026 11:04:06 +0100
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
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8450: Add CAMSS device tree node
Message-ID: <20261026-lush-boobook-of-luxury-39f184@quoll>
References: <20261023163057.775917-1-vz@kernel.org>
 <20261023163057.775917-5-vz@kernel.org>
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
In-Reply-To: <20261023163057.775917-5-vz@kernel.org>

On Fri, Oct 23, 2026 at 07:30:54PM +0300, Vladimir Zapolskiy wrote:
> Add Qualcomm Waipio CAMSS device tree node to the platform dtsi file,
> the CAMSS input ports are connected to output ports of CSIPHY devices.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 167 +++++++++++++++++++++++++++
>  1 file changed, 167 insertions(+)

Why DTS is in the middle of the patchset? Drivers cannot depend on it.
Please read submitting patches documents in DT.

Best regards,
Krzysztof

