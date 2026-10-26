Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009834;
	b=z//ZrYaBAkkJGrcndBMfKpWpPzTrxSRIy/462FbDFaMXQvCxipaCfhjGOjFpV/LHJbIV
	 xS41AfOBvcJSjaW4btkDfUvSZnBERzTnKnUsZbiOz5iz/dRuEJ47F2jkDwknL0rSs09uk
	 gONgCJOCuCGNelmr4+LL4kOTMgBbMHYRZv5veO52oZokaC1ANtph6ZayVyjrjomz6P71X
	 61vJowUJEexiQikwzyNNVB/RalhiMQuoPoPF+YMmEfqCjpQ3GqIafWNW5q9H+fnBR+SF/
	 sgYTEsXSXXjgM+fhDMCeV28xAkVYIJXwDJJs2g0bH1Q0fH6QjdhGtmt2Dl7bslbTxYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009834;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v7oLtQn2TThw2YqF0jX9lupzDYSNVkM4mwTJoqFKF8I=;
	b=mopokUxJTOmYEw5r+9TVuipCdw8Cb7ItX2zJyOir4Y5ZJXbH6syoxy3vWHsofn1VgzKd
	 6APH3UT3DjyE7bZPR8WBQKEFzz99weTQvshwwkSNjulV+Besm8vZ+SHWWbNLJueieIYa3
	 TaUccdLPJBsc/ZZMPsHUMaEeXiuX2y3z0GLdcU9iJ/6pW8cLukrZZMyATNcVdkmCblGDF
	 FyrqbTJlsKch2SkHcpv0cnIJ16/WQt+hP+EoZ8dy7a0K38wyOOQK0VYZKzvqPdbhh4zir
	 dwFrZT/O5fU1b4kziinmHgUR15FPWHUtsCmiiOoXRqCJpebeB0K4elG8XxNhP7tc8ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=XD2w4kj3;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEC2606A320
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEEC2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=XD2w4kj3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=v7oLtQn2TThw2YqF0jX9lupzDYSNVkM4mwTJoqFKF8I=; b=XD2w4kj3PjxU46+MkUi3N3+AGF
	OSD9RoNg5jRh1tGHGUKTEpdQChC3TDCs1uuH6GVlDqEvHMZOyAj+jWan6r5f0Z6wcMEVMcRG1oIXn
	Ow9P4y3qW+J6EV/+G293XA1zgBwbXiBGqq+drQ4pXifiGnLDGVhTNWZn1UTWY/i+mmWinNyOtkxJB
	RIQwLSmSiQRDh9Ou8quFbso5ac3i3uK5pvfUxvRUstWpbMO4TPB3OINAe3yGo11XdKyBUSMTsIjAW
	eoQ5AYTPWodu38SvrtaawAVamjvAVuE7wog/OqlqayiDa9ZIkFsj44E9OUUzghZ0c28mWLoSw5RhK
	RrJH7lcQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 3/5] media: i2c: ov5675: Make room for checking for multiple input frequencies
Date: Mon, 26 Oct 2026 11:16:44 +0100
Message-ID: <20261026101646.2450051-4-heiko@sntech.de>
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

Right now the driver only allows the single 19.2MHz input clock, but we
want to support multiple ones in the future. So as a first step, adapt
the frequency check to handle a list of supported frequencies.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/media/i2c/ov5675.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index f6fea59c08ea..1a0ee12912ca 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -21,7 +21,6 @@
 
 #define OV5675_LINK_FREQ_450MHZ		450000000ULL
 #define OV5675_SCLK			90000000LL
-#define OV5675_XVCLK_19_2		19200000
 #define OV5675_DATA_LANES		2
 #define OV5675_RGB_DEPTH		10
 
@@ -132,6 +131,17 @@ struct ov5675_mode {
 	const struct ov5675_reg_list reg_list;
 };
 
+/* Clock rate */
+
+enum xvclk_rate {
+	OV5675_XVCLK_19_2,
+	OV5675_NUM_SUPPORTED_RATES
+};
+
+static const unsigned long supported_xvclk_rates[] = {
+	[OV5675_XVCLK_19_2] = 19200000,
+};
+
 static const struct ov5675_reg mipi_data_rate_900mbps[] = {
 	{0x0300, 0x04},
 	{0x0302, 0x8d},
@@ -500,6 +510,7 @@ struct ov5675 {
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct clk *xvclk;
+	unsigned long xvclk_rate;
 	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[OV5675_NUM_SUPPLIES];
 
@@ -1195,7 +1206,6 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	unsigned long xvclk_rate;
 	int ret;
 	unsigned int i, j;
 
@@ -1216,10 +1226,16 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 		goto check_hwcfg_error;
 	}
 
-	xvclk_rate = clk_get_rate(ov5675->xvclk);
-	if (xvclk_rate != OV5675_XVCLK_19_2) {
+	ov5675->xvclk_rate = clk_get_rate(ov5675->xvclk);
+
+	for (i = 0; i < ARRAY_SIZE(supported_xvclk_rates); i++) {
+		if (ov5675->xvclk_rate == supported_xvclk_rates[i])
+			break;
+	}
+
+	if (i == ARRAY_SIZE(supported_xvclk_rates)) {
 		dev_err(dev, "external clock rate %lu is unsupported",
-			xvclk_rate);
+			ov5675->xvclk_rate);
 		ret = -EINVAL;
 		goto check_hwcfg_error;
 	}
-- 
2.47.3

