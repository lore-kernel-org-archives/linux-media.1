Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199456;
	b=UYdRMqj/DLbTVbsaAa+QlsOIANCxMo6dFZgaEV61dcNMZUHk3opVSZ/1PVRcSzas0QSA
	 xKlvUPAjELRFJDQlvJHObFMHUxO/bd3o0pGE2WmFp7egmY9OaEwFKEMLYM0GxF9/QQIcp
	 /pu8dpHfiWKfVsfFiCgHXYchzlloaNxIhAy8MIzmJGVKvN4Zc0auFZLysAofWti8EWo3n
	 hV5gmKSAZbXtCAHmVZlPrhxtNVPxh3ukBmPfnV2ukvuZnGpkMHv423aNvZtL0mE0hpXTx
	 BHlLp51NSt+0ExFzzIHgS/6dRW7LkIBAitbcB+p5kH1O7XUlurD91S7GcNS45m1VwRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199456;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=mIGs1095/pi5A3phf200bT5vD03Lp1U81y8sX9m5/iA=;
	b=cMPIFxQm5Mge4DMxTOWJzKb0mvqadpZmzImBmRomfm3kRuOr3ghP4nieN4PO9r3Xakf+
	 rDdfuddHfY/MM3Ku9/1kP+yHSbarFtqzFYMMrTCznTylnU68hS+n7QPRARhTLa7C1+r2W
	 t8bVNWOEWvcoS52n5RYImp00FnIbFS0zsHQ+LyLezsB4qgtKRuDkPb4gKky60U1ZUIEQR
	 Sn4FEDdBxqLOTn94QE2gF7EPc7KQ0eGJsfeP8JrmeP7cc6eMsFjdqClCLdFSyKWE3KNpw
	 QQpsVn4Cnl8I6Sc26jrvAyggTQ4lOsnaGBXk5kI0YwMrLHgn6Y0zClHjn3hBM/PrTNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jMdI/a00";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54988606A320
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jMdI/a00
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BE31F031F3
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793199456;
	bh=mIGs1095/pi5A3phf200bT5vD03Lp1U81y8sX9m5/iA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=jMdI/a00XCHeoltZkWKqXpcnERaff94e8hUKV8fOm4MaNY8O7y8prtqZlsS9V/TkO
	 RKGsHZDgxOXPjYTyHI9CJivdGW0s6UtXpw76OxzGTPoDgIC7iHh9yHraCorypu9A24
	 f13SbMaf8ehpJ1Vrn5gwEG45lQsOTRogifSRjAcKVDsVICaojZ3L6MiUauU5qEyNMj
	 qdSbdcvGdfG5xCBzqJn0bcDbuYF1FWV3HjEfaA9067wejwOomt/ISv4QmQZPp64M9I
	 2GQTCVbh2sJlrSjd6LsK2ctiDl2gbWRxESTSbGZXlkBjr7n38p7Qedfk5K1irUEH8I
	 YCwFtpin54F8g==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a98fc80925so12202581fa.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 07:57:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzNMmUOjJ3yJjx8+CxJ0Cljl+eHuTMZpExVPdpMbM6QMpZFb5tfPoPCsIgYkV2TC+gRprXvjqYkzhXfZA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKxa2Jnws5v5jxujqeT0xSegkdvwyydJ6jfiMJUgT7nY3c8DSTr
	ARd49NHmN1NNJHY/0TQ2sJQHRMLE4AV/zynGysytffKdhUi0TJF8z08sYzkwK3Kv3fjuzTLIulY
	XlnPWK2NqjEMHGnYU9yLqDMjSSKyqYFveFXACsKomWA==
X-Received: by 2002:a05:651c:1543:b0:3a9:d756:bfdd with SMTP id
 38308e7fff4ca-3ac9cf1d2cdmr6179361fa.7.1793199454407; Wed, 28 Oct 2026
 07:57:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 07:57:32 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 07:57:32 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028120216.2657397-1-robh@kernel.org>
Date: Wed, 28 Oct 2026 07:57:32 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md2xhYPdUEQ2SeqiGq9uG1qcc9Hi77T4k3ta_wmd56BhQ@mail.gmail.com>
X-Gm-Features: AclHuK-L3iqt92WsRHLJE8OI5aNBBhyNCiN5RHrPr_WcVOO_RomVfpU-3_RxU7E
Message-ID: <CAMRc=Md2xhYPdUEQ2SeqiGq9uG1qcc9Hi77T4k3ta_wmd56BhQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org, imx@lists.linux.dev, 
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Eric Anholt <eric@anholt.net>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Peng Fan <peng.fan@nxp.com>, 
	Aakarsh Jain <aakarsh.jain@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 13:02:12 +0100, "Rob Herring (Arm)" <robh@kernel.org> said:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
>
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/clock/qcom,kpss-gcc.yaml     |  2 +-
>  .../bindings/display/brcm,bcm2711-hdmi.yaml          |  2 +-
>  .../bindings/display/msm/dp-controller.yaml          |  2 +-
>  .../devicetree/bindings/display/msm/hdmi.yaml        |  4 ++--
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml  |  2 +-
>  .../devicetree/bindings/gpio/loongson,ls-gpio.yaml   |  2 +-

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
