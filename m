Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775057;
	b=dmcQBHZLQakWm3R7nENytgdsGLmBMx8YpnkgMdsEmj58WJv2OhsfdKpcjgjOykAKImIg
	 ACJSRWFXTcUjlAc/UsI/7qBVbJTLTtuKeZCHKRhnyNUwglQqlAMZSCPWAHqpDDK43OMok
	 sQsKx5foCPU1vLMEe9909H5CSJ5PX5sz4I9FxyCCtzBQuet4/oWwnOuXEGdhOzGhrGu71
	 S0Rvyym0A4r90SGKQA7MKI2bzI0CQYtKjR7lA3r9xQjdldRTJUUvm8uR6gXvKa6Za+6xe
	 51RonSXxfxxSdfpPqDda74uFcq34I20PXleN/E1DondveTVtQAHDF7zQTUxFWEyf0AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775057;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=xBBeGNFc0o/+AP9OdTLe4NNX4SBstBS6dwzCkp+IMIE=;
	b=geCtV0a+2wKLtHWYbKuZDNOorT8hXLSjZYB4ITE/jVTsb4qEY2NkPw4PcVLQzsIgDjWj
	 kni+HCzTQJnjm28Qi0bz5p/X5abFEqpn1lJyAyOh+0/a9S7y0A+7Xw2sqp6rpn0UMtBPg
	 VYTAuQ3mWTssW+eNk7FyPJl51fichuOp/dcfo/TBWuTYewicGcF7Zby/P1hDibZNpvRKl
	 Y8vq5TbuJsIBuI2Sg8Pt6LDlQ+yv8ns3w6pfLuvKXi9envdhHjVkebAGAjMXnuG7A95xF
	 VbU+p/TzqnDS+p5c3Vmi9kLU3Y5b2d11QD4OIV0APxQoPS0xQDz0cpAIOS3a/3QWUOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=pK9cKUMl;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024C606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 10:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E024C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=pK9cKUMl
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D196CBE1;
	Fri, 27 Nov 2026 11:21:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795774899;
	bh=cZ/ctRIxVkchNRHmUPujdSz/exOyoTopzqwwLjJV9Rc=;
	h=Date:From:To:Cc:Subject:From;
	b=pK9cKUMlC1rxmTIsz0SJcmqsFrzoTqbchbhX/6Y9ov9B4tfxGRvg3tj67laSv39MF
	 4khm3nX1wgrBxer0MYWNxcTM+3FNkB9Hgl4j+EfEP/mEMHeOFBU1eHYIQQGQY7JHx0
	 t+ya2Z39HJ0xiekNqEHrsNOj2JvYhu035qlf43ZM=
Date: Fri, 27 Nov 2026 11:24:11 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Subject: [GIT PULL FOR 7.5] RPP-X1 and R-Car ISP updates
Message-ID: <awlZPM4gs5Odo-Ca@zed>
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
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro
  please pull

The following changes since commit b4e3c4b6a36fd76f57bf3e48638f68ddecc54ba4:

  media: v4l2-ctrls: set handler error if array allocation fails (2026-11-25 11:31:43 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/pr-rpp-x1-for-7.5

for you to fetch changes up to b04e4008c452c5a5e5aa7e9a25cd176417de3ea8:

  media: uapi: Add 28-bit bayer media bus formats (2026-11-27 10:43:23 +0100)

----------------------------------------------------------------
Updates for the RPP-X1 and R-Car ISP for Linux v7.5.

Add on top the introduction of 24 and 28 bits MBUS codes which will
be used by the next generation of R-Car ISP.

CI pipeline:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1805304
----------------------------------------------------------------
Barnabás Pőcze (5):
      media: rppx1: lsc: Fix and use LSC_SIZE_VALUE()
      media: rppx1: wbmeas: Fix uapi documentation
      media: rppx1: hist: Adjust configured LAST_MEAS_LINE
      media: rppx1: Move register definitions to header
      media: rppx1: Update shadowed registers

Niklas Söderlund (4):
      media: rcar-vin: Return unused buffers correctly
      media: uapi: Extend bayer media bus formats table to 28 bits
      media: uapi: Add 24-bit bayer media bus formats
      media: uapi: Add 28-bit bayer media bus formats

 .../userspace-api/media/v4l/subdev-formats.rst     | 596 ++++++++++++++++++++-
 .../media/platform/dreamchip/rppx1/rpp_params.c    |   3 +
 drivers/media/platform/dreamchip/rppx1/rppx1.c     |  95 ----
 drivers/media/platform/dreamchip/rppx1/rppx1.h     |  92 ++++
 .../media/platform/dreamchip/rppx1/rppx1_hist.c    |   2 +-
 drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c |  34 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   4 +-
 include/uapi/linux/media-bus-format.h              |  10 +-
 include/uapi/linux/media/dreamchip/rppx1-config.h  |   2 +-
 9 files changed, 719 insertions(+), 119 deletions(-)
