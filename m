Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF17238B7BA;
	Tue, 11 Aug 2026 13:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456360; cv=none; b=EPdHPZZ2YkZpzJBlC/uN2SgrbC6S4GVrJb6GzIMLlKICtED+xOOitxZpM1K8Lj9KIaZNCAGfg9NidbpMJ5jPKAsGXo9N0JuJbJytZxt7aiqx/GKrRQSc/RFK9wcIVqdDhtykP04P4dZDAIKRkwIAko7j+KjB3FYJdVQhhWXtO/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456360; c=relaxed/simple;
	bh=07QQD9n3dd9eL5OaDxE8sNxsj5MqdyEj9XCBZLhmKbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/Nc9QboWFV5io0Z2n4LitiqjD9tyUKVwxD1I5V/DHElchAQuuH7sPo81Cb6Nkz2AtOKR0hvnorxII24t+ZZOyePeTeh11sDMgg9+1ZfbIH0AoIsDRN15s1yfvc/Cf+N4f5zv5XJdKzbBqg3oYxrtnTR7FmZGkc3yb3RvllbNIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+nTF3gJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+nTF3gJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1C41F000E9;
	Tue, 11 Aug 2026 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456352;
	bh=8qG/AVOsFnlV7V2/LzQ5KRmzkaVFG+vwZ226967/+O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S+nTF3gJiQPYAcTAZoHOCwldwmZYTApVKlAGQ5OHDwblvTbppmG96zmpuUaHytdFa
	 12glA6kDsn2qi0uYWYot+GSNI6Sp1nvJMmWTGk6v+Fee/RLVwcDybWeoA+JbRYfESm
	 cdDvrkGe4G6/gBdEYKdihcvw3uDeYxwM7NtKFE4krBTKIes8DiSFRd2aBWDM01u8Td
	 izPUzDfy5oZEAhgErTYQ38arQ9gKf1zA965m8JGfDQkzxQv+yTJfOSnWhRoi56ax7Y
	 CKIx8ypFD98t/jEpJgz8cCmGSbsUyul0qzeLnWNqByTNsLqTqrbA3hnUz39ZFZkEsI
	 2KHjFgEAWNoNA==
Date: Tue, 11 Aug 2026 08:52:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Xia Jiang <xia.jiang@mediatek.com>, Keke Li <keke.li@amlogic.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
Message-ID: <178645635112.2073056.6980920721242765478.robh@kernel.org>
References: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>


On Sat, 01 Aug 2026 21:55:29 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>  .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>  .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>  .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>  .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>  .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>  .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>  7 files changed, 28 insertions(+), 28 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

