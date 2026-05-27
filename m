Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AB9410D0E;
	Wed, 27 May 2026 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888913; cv=none; b=SarwKRBVVSVkmyNefG9WyQCIC+R73CyRC0KFFGGeLFSpuGpU0im7ehH+LcVu6mNk1cDV4ANqkeQkJTIoN9pWp1thWJagDbnO3dfTj+kALjrU8ySZFP8fzIPNi0PzoVn2a7/s3pl38KKqqxmcdG+NUeKVKrer32o79RjQ6dY0fys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888913; c=relaxed/simple;
	bh=Wl8lAwidPCYqHIaLZHmsXTWoVdT/fZTz6VWTHkX6pWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRyuBpuZomKj8I9DoWzkoLCT6ct1vb8S/h17JNptSmtRJSeS63W6NB4UfHGCx2zoYWBFtZfTSo8QGy2t1AEJVLCA+qUQG3SdAXWTqdW3V66JNnKv3WuHufSjTK0ZW9hXHyFePJJ/Wy3UhjBn0kIZCggNT7l8wnWaKdfOeetekOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Q0uEJmSC; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Q0uEJmSC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7bbLd/ReiMVal7BI3TQK6EkG9qzsmUQTFJ7L4iRvVGQ=; b=Q0uEJmSC2jorPw/8uLKDtgqIft
	zOgIaT7DfctgL3B+ol+wNUa8zWAEcEOn5hhJqktN64wvxF4qgG3Ns9PylFEd7sN71wq4MgZJfMPyJ
	lpbu8lfei6JrSi7lVJn3R1M6b7HrRs2HU/ZMfabpTSqDyygO2NUhzjyVzztiY5K/8yC/5HMue/2Ej
	N8GUNcyGSmQmgvGlkmabT2y8T/NBIt1H5yOLjXPxFGerCwhwfuv3Uyi3yk7YXsktvmP9zJ/kXFcOc
	HPzqJdpulAQYuFzulBcEWHwTD1Q0VeoVG1OfPLf8h7YWbRpYCiNaJ+rBTF4MIwFZo1sBWK0xx9I/C
	N9iP95xA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	nicolas@ndufresne.ca,
	sebastian.reichel@collabora.com,
	m.tretter@pengutronix.de,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: (subset) [PATCH v7 00/28] media: platform: rga: Add RGA3 support
Date: Wed, 27 May 2026 15:34:55 +0200
Message-ID: <177988888078.3803653.9229622993223830333.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 May 2026 00:44:05 +0200, Sven Püschel wrote:
> This series adds support for the Raster Graphic Acceleration 3 (RGA3)
> peripheral, which is included in the RK3588 SoC. The RK3588
> contains one RGA2-Enhanced core (which is already implemented by the
> rockchip rga driver) and two independent RGA3 cores. They feature
> a similar functionality of scaling, cropping and rotating of up to two input
> images into one output image. Key differences of the RGA3 are:
> 
> [...]

Applied, thanks!

[28/28] arm64: dts: rockchip: add rga3 dt nodes
        commit: 25ee898961a2c661e4cd72bc98f0060f1cd11222

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
