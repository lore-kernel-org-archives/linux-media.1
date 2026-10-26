Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009834;
	b=tBVNCXQiwxc0JJbX+QVXju19qBHWNBccl71CxkwQU3aDSnB0swGTOT7rekaE9soR9bfu
	 m/Wr76xmvj75E+ywBK2RduxfFQEpnK1Wf6kkp0Gj8TLVNd5IZVkj2tXIuq8cSND2Sm8yz
	 2MS1hshl/aRBDa149eKQgcNAeIqahBUku2rZHuuSRe9Dj6+Y66pMyoYWixOrzFZd7PJXQ
	 YrWHnv7ZTMRTSWiYJuwgIJfLpiabhdM2aNJMifTZMoT51veBCVEElE5JDM8bhHthAmWmI
	 vcQCAVYcrgaZLqA6wi78Cyf5b5NZCd6KFEy1n13P3EWUk8wEP+EQ3sLCMkqWF659B3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009834;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6YT/FxnMG6X37OFjlPVT9VWDU38kDw2eWve8JLye2ko=;
	b=OOBMMEzHD4oO0+3Au49vpvuM/36EnauHFo4ccm7+kPKnfhFhlCORBBVKry9opAAA4DYd
	 fNz7+olNFbrEZerGuUeT7CA06HwiDkD1lbkargxW1SfuOW/sAWRT1rEw9QErCvax1NgIp
	 NlcYQbKGk9dERP6fAnnsKuQ53GIw349NybFfvu4E4Lm/NWxbaG5L5B+dc+cW/ZmeQ7Bkn
	 TJO0GfX6VUPVk/nV9/UujLI0NCpZSzMt6EOID8UvCaU8mjj5SakS1V598JuzHUkzfLkKP
	 C1XrT/KLPlVCVDON8du2PG7tiYqgK1GOliBYD9ORqirqqW/yTanzE4OUmGoHeSURtZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=QXxYQOI8;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED95606A31E
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED95606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=QXxYQOI8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=6YT/FxnMG6X37OFjlPVT9VWDU38kDw2eWve8JLye2ko=; b=QXxYQOI8wtFMCCkKGp/mkxvRh9
	xinidhkL7dYgsgXoCDV7LeKEzpgtMT7ut8WjHCGZ9uZrsRXW0eHBnXTDkZ5Pd6tNdqhV6Znp7uZP3
	gtfqNS9YD6+pYoEldv9LdEF7Fp9uQGBz47U9NvLPsUbhhIdpGRkuqB+J/rwzEqrHwGpsFU36qusGX
	38hXUr5oey92GjyFf7q/XWs4sC1g90j9tqPsRN7Kb+ik6rW4LNePnYnVPi0+m2/faroaHqTpQ4lR5
	WoOhIs5lW73R3nvnjX9NGSL2/iTNIk4CwX3AzcePQVqw6HnaWDQnIMwMig4k7ry1tHYVyU3n/0F3X
	/qqIWRAQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de
Subject: [PATCH 0/5] media: i2c: ov5675: actual PLL settings and 24MHz input
Date: Mon, 26 Oct 2026 11:16:41 +0100
Message-ID: <20261026101646.2450051-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of our boards cannot supply the correct 19.2MHz currently expected
by the driver, just 19.1xxMHz and we carried a hack in our downstream
tree seemingly forever.

After finding a datasheet for the camera that includes the clock
description and the actual expected values for a 24MHz input clock,
this can be finally fixed.

After testing the values and receiving correct images both with our
previous clock-rate hack and the 24MHz input, I choose not to make it
worse by adding another hard-coded init sequence but instead describing
the PLL settings similar to how the ov8865 driver does it.


Heiko Stuebner (5):
  media: i2c: ov5675: Fix type of xvclk_rate
  media: i2c: ov5675: Move camera init out of the link_freq sequence
  media: i2c: ov5675: Make room for checking for multiple input
    frequencies
  media: i2c: ov5675: Handle PLLs using actual register descriptions
  media: i2c: ov5675: Add PLL settings for a 24MHz input clock

 drivers/media/i2c/ov5675.c | 364 ++++++++++++++++++++++++++++++++++---
 1 file changed, 341 insertions(+), 23 deletions(-)

-- 
2.47.3

