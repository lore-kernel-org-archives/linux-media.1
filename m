Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105439;
	b=cJOKRzFP9ZcgRoxBJMqvo6ReGOKPU8658J61mtpl8QSFSoLx/Q3q7bO31cKSRL6RRcno
	 VkVietYscXV9IruNHzQJX82Ks/KOHRSJ0YvJvV2Blh6evlstd6ZkfP5XuLzQaRANANOeY
	 UV6tOgRN9RisD9gk7dA+wEAVfU+7qN55KjgN3kdnEE1LAMKNdvGp9+KZQf8YKLWPPWr6k
	 We9fRrNvjhMDI0B+Ph2K4GPf8hqeCqAWNF/NFEbQQLWuC8UeK3wcEqbLRvSF5pDDoPYp1
	 V6JrmOsYnh8sN0XRlBfnKNh/49rgpIreVbwg00JQXrldeiVqUutFs6q33WEYMAG6LNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105439;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=dBXavqtMtY9Ez2EruGyacWXl/ozOz7EdwD1qaC6t62M=;
	b=IdpoP1l19guxCwfmeGSa+WcalJm/IFwI8/BHQqDEyvzDRvGYcPRlEgMcs8C9wz0i5FD3
	 vMxJrPl4vfRF4kkzSxIHptg8Wet+lgeV8yKG2CjYSLQ2KwE19T9GZM1GW53W3Xd93tnx3
	 xiTIdR0gBhsSfaEb5LUA2qguWFo2GBHsZVpfHO5sdbNrAPsCchWd8jZ9yZWbHxPC40CaR
	 E14XSr2t3Z6zh2oovjFLYnS2Z/KYHw0hh+l0QD9UmparlEFMD3J8dLGYr6HIRz3PuxP/5
	 ZOklgD/tbNWo2c0ZyGYxdLrJWW16wWEAkq0oQMK3O67cuX+goFOmJQwB5icJKJyd0iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hxKT5OeH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A643E606A337;
	Thu, 19 Nov 2026 16:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hxKT5OeH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09311F000C4;
	Thu, 19 Nov 2026 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105439;
	bh=dBXavqtMtY9Ez2EruGyacWXl/ozOz7EdwD1qaC6t62M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hxKT5OeHFCzRi8nnnXANQv6Kp5gTvPp0yNZGs3Vh4tn2dKS9jSU9+f/e/9C0lInGN
	 GsE3WmzXSbvJS0W20zzjFljt3LPHWhWSQzKzfLUSCfi7/22Pdq1HGgo1laHWIZUWoz
	 8kDAx8IbRJFvMWLeW69mA8ZXMWmd468pLnykkNt1Y1TcJ12jMZ2IWtGaBT7yMXPd44
	 LlbjFqb/IWNbH8tcDqC+/jtrQ3JSI0y1krRYz3MHRGZ+VZxrhQ1jceZL66+Wkh25Zn
	 iR/uKg0P9CBDzMrq+tBXFPfNTbDpJ8KVuL4DxCPh6Hex6wtHeNKVHPL6DyGatIznPS
	 oo6LhfCEDYP3A==
From: Vinod Koul <vkoul@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vladimir Zapolskiy <vz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20261026224957.1115370-1-vz@kernel.org>
References: <20261026224957.1115370-1-vz@kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] media: qcom: camss: Add SM8450 CAMSS
 support
Message-Id: <179510543434.1370333.10289839587183821711.b4-ty@kernel.org>
Date: Thu, 19 Nov 2026 21:53:54 +0530
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 27 Oct 2026 00:49:50 +0200, Vladimir Zapolskiy wrote:
> This series adds support of Qualcomm SM8450 Camera Subsystem.
> 
> The CSIPHYs are described as separate CSIPHY devices compatible with
> X1E80100 ones, there is no legacy CSIPHY resource description in
> the CAMSS driver, and this option is not intended to be supported.
> 
> The change can be immediately tested on any SM8450 powered board by
> running an image stream from TPG to CSIDs, CSIPHY IPs are equal to
> the ones found on Hamoa platform, and were tested on a private board.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add SM8450 compatible
      commit: 069e05f3dfd76b1ee4d0500056c983a469f58b87

Best regards,
-- 
~Vinod


