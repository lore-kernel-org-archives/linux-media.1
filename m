Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776051;
	b=Jdm9k3dx5WNyeBC30cgjBhSljB8XzFa6qwNpfpii0omGjQI/Fi7nG4q/8D1/kcQvpkrS
	 vcrDpCasZZNwg9D7IDeTDaYpUcYZDbl25p18jnTc6jp58UeTul4FIbm9RISdazxb55SBL
	 PM8gYfbyEnw4SXmqc0PBqBmdbzTTSHZJApIy69nvF4D0hICIt8JYOOH7uAPuqPnTqBJGY
	 pmX75sCzjcuNZvprqWT0KNQNSDVhKKOQ+RHsZNjb9yTZfwU8zkYvZXsEr/iLrHD9vO4cd
	 YkcWYn0DZxasn5LmU4X1xV3Fiw9Vx8PM7NkUU9EbmRVwhKvUKWK/TO5FoxJG/GJ7KAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776051;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=gCWEA7p3lsEEFtsmSj8QbsCOJuQrxa4gQjqOyOSFfsU=;
	b=p5mt1mvCeGY9j48mCp3P9yrAj0kW8mB7Cf6mVOafLsmN0UxmUV4NZdbbqhR9tWVYX+Zv
	 JPb4rsT4g3wmQs3ACJe1Uo88GVoW4hK9Sh/m73fGTc7WvEZnluuzvhhgsTzaLmaV+ihRC
	 dBwjrqZ7W1UMF9cg+Wk2ftOkV0rUAJId24ENF1BbNTzUpJ9T8URgiNRmVNyFtPPo7SEkF
	 E+Ms/5zQUaYL+lIawFuVxt1ODhbFEwTHe6SAIOVzxOk+OxnRNyVDuEydepxvHEzm/Lw0k
	 yq9spoCZY1ogLQG6G7RHREJ4jOEFJXDX3Ymruh5wr4hRWUo91mjMte/VFPctta4FQjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=eo3HVI4U;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F247606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F247606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=eo3HVI4U
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1962BE1;
	Fri, 27 Nov 2026 11:38:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795775893;
	bh=3cNkJ48OEdhNo1DW3WhvtAMfek9+57b009SW8PNZBII=;
	h=Date:From:To:Cc:Subject:From;
	b=eo3HVI4Uv40YXGaNiRSE3Z6rff4XZOZPvjVgh+zgOcpv+rF6MzWk548xYzPySg/P8
	 GBJf9z+PiNXY8XXjIBUKhtyu0m9JEGvISh5cJUsq6Qmag+8bkD8P+YT0ESuhgbt8G6
	 BQTdcVfgHJ5Y9PDPZMCh67Et9f2CSQIqz6UR0gik=
Date: Fri, 27 Nov 2026 11:40:45 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, David Carlier <devnexen@gmail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: [GIT PULL FOR 7.5] Mali-C55 and Renesas RZ/V2H(P) updates
Message-ID: <awldRF2w_cB2dniU@zed>
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

Hi Hans, Mauro
  please pull

The following changes since commit b4e3c4b6a36fd76f57bf3e48638f68ddecc54ba4:

  media: v4l2-ctrls: set handler error if array allocation fails (2026-11-25 11:31:43 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/pr-mali-c55-for-7.5

for you to fetch changes up to 854b0aec86284458221428d1487faac3b85ce581:

  media: mali-c55: Serialise the ISP enable in the params and stats paths (2026-11-27 10:47:22 +0100)

----------------------------------------------------------------
Updates for the Mali C55 ISP and Renesas RZ/V2H(P)

This PR includes both Mali-C55 driver changes and DTS integration
for RZ/V2H(P).

CI pipeline:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1805317
----------------------------------------------------------------
Daniel Scally (2):
      arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP and IVC nodes

David Carlier (4):
      media: mali-c55: Fix frame sequence numbers on dual-pipe hardware
      media: mali-c55: Disable colour space conversion for RGB outputs
      media: mali-c55: Require an enabled link to start a video node
      media: mali-c55: Serialise the ISP enable in the params and stats paths

Linus Walleij (4):
      dt-bindings: media: renesas,r9a09g057-ivc: Describe additional interrupts
      dt-bindings: media: arm,mali-c55: Describe DMA line-tick interrupts
      dt-bindings: media: arm,mali-c55: Add power domain
      media: mali-c55: Assert the ISP core reset last

 .../devicetree/bindings/media/arm,mali-c55.yaml    | 27 ++++++++++++-
 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 22 +++++++++-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 47 ++++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  8 ++++
 .../media/platform/arm/mali-c55/mali-c55-capture.c | 10 +++--
 .../media/platform/arm/mali-c55/mali-c55-common.h  |  4 ++
 .../media/platform/arm/mali-c55/mali-c55-core.c    | 15 ++++++-
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  3 +-
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  6 ++-
 .../media/platform/arm/mali-c55/mali-c55-stats.c   |  6 ++-
 10 files changed, 136 insertions(+), 12 deletions(-)
