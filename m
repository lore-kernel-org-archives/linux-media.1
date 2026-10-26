Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009834;
	b=Ghv364kgNw/+flXtVQB04YVhW2xfvIyQ5f8lMz7M0U49Lux6HI47bm1M4J4l0mzR1ENa
	 Tl+IwWMGtOmcyBqezmfJSvg8icm+w+dUy/CFKrzERVy/yOUk3r6Ow2cvxdDXpNPv9/xd7
	 lORZNf9KOZM4vU7x/q1H/ZdesNfTkc1XV1MVvj9iXKfExbmHn3M/fDL/A+ZuPiXUjeNL9
	 8zU9vkrY+o+iJlp6BTfoT19x5jnk/kD92BcDDQeMrc6c+hSaiWLd76IkWEFHGwGLBjyKf
	 DJiGYhWxQV7ZHwHWQW15IC6NoalG2XlfsDOftLvTpBWEtSgIQuXNn//ZYUE4S6ko6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009834;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0ZcrPoSM/HF+xsbOJMsaVK/yYikUycVeSiW/9dTcYbo=;
	b=YC5noOkYPnjJZGRqJc8977SLAaEcPOWkOfFiYCY8n04202jZrJYNTC32fdAxlIkSUQV+
	 GlcCA4ighb0AHmN2KHX4pU76qg9Tex1xb2DwpCEZmgLliC94jjSuQH1nTcH2EqxhunRJl
	 HzL0B1r1pqPEAQHOCd3/R2fIdi8R/L9OtTNWL7RRr/ZYOvEnsDRxIBJ0OHGsQ61+jKbMO
	 OvfSeqFhtP46lnX0oq1r29x1N5mDQS0v4kzZklHvK4C3kRoTznE4kS+LOPbwiqXeR47bH
	 TUdXCHljfqGJyiO8Cv8Sfy6oWcyuPYQ0AMDi5CWnKwZRVcaqYUN80mVxMF4EW/9a3tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=xT9qgb4b;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED79606A31B
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED79606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=xT9qgb4b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=0ZcrPoSM/HF+xsbOJMsaVK/yYikUycVeSiW/9dTcYbo=; b=xT9qgb4bHU1QG1HmamaGMQprI7
	NraL3RQ8VPpUOC9KgXz2VPe6nAxhBJ1JkCe17LhZZ1KI15OPbGAKiGcp9hFUQ1mCaFLsv8cDPm/4l
	lzYie5SQIzhIOyK2CQjEZ7oYcKEGkPcjvcFvLIgS0ABpm+xWVXdRDe2JOq6+haRiTLYjwVjm0B3jJ
	69Zn3XD31b9JfNSDWHzg/lW6kJr9PUWi7D9RY5wU3ZJGYwmsAEIRoP1dSq7cY5Vru7t10YqhQLR7f
	n663bZAMc9MkzjIww5QvMdeiC0zc6hIRzZpMcPEWeQKv0D8buS3TWZqFPSGtvSp3ZIfIf33swWrvx
	J0z8Eo5Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/5] media: i2c: ov5675: Move camera init out of the link_freq sequence
Date: Mon, 26 Oct 2026 11:16:43 +0100
Message-ID: <20261026101646.2450051-3-heiko@sntech.de>
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

The register sequence for the PLL configuration also contains basic
setup like the software-reset and making sure the module is in stanbdy
mode.

Instead of having the byte sequences, move those to a dedicated function.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/media/i2c/ov5675.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 5a5d34708e39..f6fea59c08ea 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -32,6 +32,9 @@
 #define OV5675_MODE_STANDBY		0x00
 #define OV5675_MODE_STREAMING		0x01
 
+#define OV5675_REG_SOFTWARE_RST		0x0103
+#define OV5675_SOFTWARE_RST		BIT(0)
+
 /* vertical-timings from sensor */
 #define OV5675_REG_VTS			0x380e
 #define OV5675_VTS_30FPS		0x07e4
@@ -130,8 +133,6 @@ struct ov5675_mode {
 };
 
 static const struct ov5675_reg mipi_data_rate_900mbps[] = {
-	{0x0103, 0x01},
-	{0x0100, 0x00},
 	{0x0300, 0x04},
 	{0x0302, 0x8d},
 	{0x0303, 0x00},
@@ -890,6 +891,23 @@ static int ov5675_identify_module(struct ov5675 *ov5675)
 	return 0;
 }
 
+static int ov5675_init_module(struct ov5675 *ov5675)
+{
+	int ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_SOFTWARE_RST,
+			       OV5675_REG_VALUE_08BIT, OV5675_SOFTWARE_RST);
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_MODE_SELECT,
+			       OV5675_REG_VALUE_08BIT, OV5675_MODE_STANDBY);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int ov5675_start_streaming(struct ov5675 *ov5675)
 {
 	const struct ov5675_reg_list *reg_list;
@@ -899,6 +917,10 @@ static int ov5675_start_streaming(struct ov5675 *ov5675)
 	if (ret)
 		return ret;
 
+	ret = ov5675_init_module(ov5675);
+	if (ret)
+		return ret;
+
 	link_freq_index = ov5675->cur_mode->link_freq_index;
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 	ret = ov5675_write_reg_list(ov5675, reg_list);
-- 
2.47.3

