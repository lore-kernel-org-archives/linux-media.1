Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877233;
	b=tPdikg3LUN5tVQbmnZl3FX5F5dKbG+QHS8BwaSsK+EiokvPPSha5jg+eGHfaNH3lyV8B
	 jIb7OS5qZok3mwWG/t5dtcBpqS6GLLVt6nPtDTSoCcVUjq57I6cueEuosjBGNepOJN2eE
	 mKHE5/oIDU1dmpEN83drmyJdOxTcljRQRrLXqduYr+Q5lP6Qb88l+/ZcVff0RtLJC9r8h
	 K9zSo/97M1ns+2XovkXIHxPRDWVZqcp0vbozRIU01beiSU00YOAsBAZaafKLgryG0T+uk
	 /qhlv1vSn31NDsKev90OJlB9lfIkmPpICrocVddi8XM/0u69ATBv8i8JwxPtYK9oiRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877233;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CvzPVAwD4Umz00zXe0S1BY4cdKBo1nYAbJVmvy/Y+D4=;
	b=37R15/VSFnqX5blpF1CAwe/9Vnnij8fIyHNgrelyn9lQLwImuk4K4XoABEDh9facuJkE
	 r8mz/eA5DcGEuRREAbwMdcQHsxcsAesbaTO/HbtuIleir7xoji2T7gF3ioedHmq5gI9no
	 xe9JR4BIKNOYVEu/3dvPsIYpFb3fzB4yH1tJpMORWxM/AW5GGPUM2RlofJFXecjKzs/ud
	 sEaLLAYuO/UK6hWk/Ad08ik00Va0BB1b0kbBjHxoxRtg6ZcEllTf6I08hmF2RPlYob0JX
	 FGfiAOoC6jhQddEjbkApxQb84iwq8weW/GLcFKUThTXnc/TrOnerExR64NTW5jweg/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b58dexaW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49C2606A326;
	Thu,  5 Nov 2026 11:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b58dexaW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89C01F000C1;
	Thu,  5 Nov 2026 11:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877232;
	bh=CvzPVAwD4Umz00zXe0S1BY4cdKBo1nYAbJVmvy/Y+D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b58dexaWPxsl6BONKKra5HRZ2iBK+s4F0ekapDy/oYsA/JlT13spoc2TDhq+Z8Mn5
	 pE1YeA7ryugQsvGkg036yWXHDR5s9R5sk/6uFiDSWESd2fjKOgHYwhXpVkIuLbeEhr
	 cjr53dKWBQaZa2ae7pIsU6ESjPqbWy8BCreiOM0SqqWewpM0GXuNaU2615KyooTr7l
	 ndXl+KO8QbLFFSt2TbSdJUyHKTzuoiE3pKUoA3C8CTV5CNPjAvBYd8l4QrVNjRUR+1
	 lx+ByMsZFCViHNgLFjhnBIfMPr1+kshQku2r64kYo88Ovm+mnPjzpFTNvsrRn7gfFD
	 6oCpoT9nzJPKg==
Date: Thu, 5 Nov 2026 12:13:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: Add Qualcomm SM8350 CAMSS
Message-ID: <20261105-berserk-comical-swine-e9bcdf@quoll>
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-2-vz@kernel.org>
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
In-Reply-To: <20261104234533.3044265-2-vz@kernel.org>

On Thu, Nov 05, 2026 at 01:45:30AM +0200, Vladimir Zapolskiy wrote:
> Add device tree bindings documentation of Qualcomm SM8350 camera
> subsystem.
> 
> Qualcomm SM8350 CAMSS contains:
> * three CSID and two CSID lite blocks,
> * three VFE and two VFE lite blocks,
> * six CSIPHY devices are described as separate CSI2 PHY devices.
> 
> The SM8350 CAMSS is very similar to the previous generation SM8250 CAMSS,
> CSID register spaces are placed inside VFE register spaces.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  .../bindings/media/qcom,sm8350-camss.yaml     | 262 ++++++++++++++++++
>  1 file changed, 262 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8350-camss.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

