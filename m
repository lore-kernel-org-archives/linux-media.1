Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009834;
	b=iTbO7J3blsKIPAfRaJYYcwwRsoviQwnmyNhCzQL7Q+6DpQf+F9ep1DeeGip2Te/LAlqv
	 m5lAXGFeukwhXsDtO3KFQNTl+22ylC70oqy5tCw8ZBkrCLOWLIWcbk/X+RXHM2TjJBMrC
	 aaw6BFhG4Xa3C0ogt+SBtZHrof5/yvYqDpCPLcd3VZ01mOhcSBe2pOYbbESzGHs7L/AJN
	 sLrjTiJPHbtE9gn4PLn4HjcTmR9dKSMjZBSnpbi8rf14kP4dhFQUHsuVkQCyAVLgyAglL
	 CoPqT2wUZIlCCqzR7OTaaunS0fxilpywb4bZ2+r+u+Gmwk6JFclSOkvf/+7UMcNOOzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009834;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I6QLbXu1dtA4mnikRgC0BSiTr5/XZGi+Pbh8MBEk3gM=;
	b=p0j6aC8jti+ro5lLWAIP8X5mIkoPv0I/EKjKhyNU0nevIq49+uM1/pnZFl+IrWq5RZjS
	 62r9Pl312scyy6v2BlCf/CgslxzTkLfSOdq1zfATO9xmBm46C0LXdQdhT3HlmvrczJM9O
	 hDe7qnqV1qypYgqAPfOILSkL5qm6Ag4tq2IRcqP8uaLJlKoM6nY1rRG3FEJOSvMW7XZVI
	 7faYS4ddxsy0O2pu99qK0Y8xTcPEYoTuxzTf4RGbZYdpAAuVnCLmrSunHyOGgcDnhjgz2
	 Chi4289CGnCMKYfhlwk+oSMmKjxUsu2KsM0hAnubk9eoGV5E2vS2Izee9UY7or+PcOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=lPLRYJxq;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEA6606A31F
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEEA6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=lPLRYJxq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=I6QLbXu1dtA4mnikRgC0BSiTr5/XZGi+Pbh8MBEk3gM=; b=lPLRYJxqDmiFVqW1Rd69uY48YE
	hZ6n4VHndmHtN3bOwKOfpq64WDrx1u4ENsoi5LgWiSM74MkOGew0SXOweOm1BPtMndsousGWkocGl
	xVv8sK5p008pzDGzChif5YwojxuvpwP/6CBTLNir2reGCvY2qOhpWy3JgPrzcrbhYnX205SBxnf0N
	iGjvX2r+r/EO60ftaSB8dAHFaoWIQP5HCmpsjz71QMZVCxtBv/sTyNJM+f63i6YTf7j/eh8bJUNbY
	cGD7QgwoRvKWEBMj5i0suLop5xFQhfD9fRe0/2zI9c4sqP8OY6CyF2F3TSxhuhNCqku8laH0LAO3f
	kkVAi08g==;
From: Heiko Stuebner <heiko@sntech.de>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 5/5] media: i2c: ov5675: Add PLL settings for a 24MHz input clock
Date: Mon, 26 Oct 2026 11:16:46 +0100
Message-ID: <20261026101646.2450051-6-heiko@sntech.de>
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

The ov5675 datasheet actually only specifies settings for 6MHz and 24MHz
input clocks. As some boards cannot supply the correct 19.2MHz currently
required, add a second set of PLL configs for said 24MHz input clock
with the values specified in the datasheet.

Using the same calculation over the clock-diagram results in the correct
expected clocks for MIPI_PHYCLK of 900MHz, MIPI_PCLK of 112MHz and SCLK
of 90MHz.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/media/i2c/ov5675.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index d5d90d911e7f..f052fe4694d4 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -239,11 +239,13 @@ struct ov5675_mode {
 
 enum xvclk_rate {
 	OV5675_XVCLK_19_2,
+	OV5675_XVCLK_24_0,
 	OV5675_NUM_SUPPORTED_RATES
 };
 
 static const unsigned long supported_xvclk_rates[] = {
 	[OV5675_XVCLK_19_2] = 19200000,
+	[OV5675_XVCLK_24_0] = 24000000,
 };
 
 /* PLL Targets: PHY_SCLK = 900 MHz, PCLK = 112.5 MHz, SCLK = 90 MHz */
@@ -269,8 +271,31 @@ static const struct ov5675_pll_configs ov5675_pll_configs_900mbps_19_2mhz = {
 	.pll2_config = &ov5675_pll2_config_900mbps_19_2mhz,
 };
 
+static const struct ov5675_pll1_config ov5675_pll1_config_900mbps_24_0mhz = {
+	.pll_predivp = 1,
+	.pll_prediv = 5,
+	.pll_multiplier = 150,
+	.pll_divpx = 1,
+	.pll_pix_bitdiv = 4,
+	.pll_sys_bitdiv = 5,
+	.pclk_div = 2,
+};
+
+static const struct ov5675_pll2_config ov5675_pll2_config_900mbps_24_0mhz = {
+	.pll_predivp = 1,
+	.pll_prediv = 0,
+	.pll_multiplier = 30,
+	.pll_sa1_div = 8,
+};
+
+static const struct ov5675_pll_configs ov5675_pll_configs_900mbps_24_0mhz = {
+	.pll1_config = &ov5675_pll1_config_900mbps_24_0mhz,
+	.pll2_config = &ov5675_pll2_config_900mbps_24_0mhz,
+};
+
 static const struct ov5675_pll_configs *ov5675_pll_configs_900mbps[] = {
 	[OV5675_XVCLK_19_2] = &ov5675_pll_configs_900mbps_19_2mhz,
+	[OV5675_XVCLK_24_0] = &ov5675_pll_configs_900mbps_24_0mhz,
 };
 
 static const struct ov5675_reg mode_2592x1944_regs[] = {
-- 
2.47.3

