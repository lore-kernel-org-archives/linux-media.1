Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009834;
	b=2JqKKgE2BClUJ1k0NH7Q7JiX3ivSuWw/+3zcQH+nrQARYwQMfnitoB4MQMjuhC3loJ+7
	 GPCafwKv5w5oVEo11+gmHIP2nPmS0SSLHcwSYadOA3IEaMus5B4fgCTVBuNaD0tf6z3MX
	 oAyWkzbCj2jKdPDJvrYXkD9kd/383kfpRyYCZUiqdZvJOBuAXl8rD+vGmKfZt3cAy/Okb
	 35xRgd9nndhH9XLqDFNVEP91ULbezf/UOnxh45IxyTZz4EA8ifS0hsjVhjDC5G0mB69QW
	 otZVwYVqmRB3nwcFsOu3hAkTH/4xNuwRuahFUBBBjR8lxtCql/MAXBHQtffG0FzLrrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009834;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PCI3cqObzbeUjYT+OwJ8NTy+2EcwN9s3APsl+1ZVP/Q=;
	b=X8ymgDwaQpbKqu8gALfFiyBk4DWvio8aAmy2ry1eSCJVNStzLbuLkmXAhiQSTo4JwgSI
	 vWTKOU9FsT3kO6egQzdDju92L5xpTqxk8rcmLDzSqR5/Izz+145QLOz4PNRMBCOqhzFk+
	 rCG5b4clm+YCxPeSifVKY8Z9KJLCKe4/oRCdJnSBVlykMkeBIgzTjjspK28AUKHydHDZ1
	 JdM51GZJf8dT6IgxAIQRcOpIW93iZH0QqnyWww6lrSUq3TM5aIv690lVlopQUWjI84VZ4
	 m2nTgjQ/2MfbvqGTNG/QfMn95ZnaOwSKACNtsB3UE7Sm+D7o5K7KueOAASlhnzqSdeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=bK3qweT8;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF00B606A322
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF00B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=bK3qweT8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=PCI3cqObzbeUjYT+OwJ8NTy+2EcwN9s3APsl+1ZVP/Q=; b=bK3qweT8MsgwCCSYS/d5MzkTVD
	WI0pEJG3BU0HMijgRK2aXLKp7Mwcek6iFfAqa6BDJtdIqb6xotlBEU325PRhyZm8S0T5RvNMJuFo+
	Sx3fh80r8syjg/23UGRsldpGRxBd0EeKBGQRhvP5nIyz8EYdAKXtKDnIUB4JCh0WOm/FWWZey3HiF
	f/Q/9c6qkoZ5iSEP958YNXNeZfc0XNsxtXI6GOltrnAL2l1tSglwGoneWdiossTP3BrdQRD2uDx5x
	1m8+d1iLv1q43C5p2de4ryAXSEfj1zUBLKmKOrCXEX/vHCph/YiNVbxEy7k4DdpIsGiXJ3eVbNFBr
	XjQ0Hb0A==;
From: Heiko Stuebner <heiko@sntech.de>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 1/5] media: i2c: ov5675: Fix type of xvclk_rate
Date: Mon, 26 Oct 2026 11:16:42 +0100
Message-ID: <20261026101646.2450051-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026101646.2450051-1-heiko@sntech.de>
References: <20261026101646.2450051-1-heiko@sntech.de>
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

clk_get_rate returns an unsigned long, so don't be creative by using
a different type in the driver.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/media/i2c/ov5675.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 1c31b2a57eea..5a5d34708e39 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1173,7 +1173,7 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	u32 xvclk_rate;
+	unsigned long xvclk_rate;
 	int ret;
 	unsigned int i, j;
 
@@ -1196,7 +1196,7 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 
 	xvclk_rate = clk_get_rate(ov5675->xvclk);
 	if (xvclk_rate != OV5675_XVCLK_19_2) {
-		dev_err(dev, "external clock rate %u is unsupported",
+		dev_err(dev, "external clock rate %lu is unsupported",
 			xvclk_rate);
 		ret = -EINVAL;
 		goto check_hwcfg_error;
-- 
2.47.3

