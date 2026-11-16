Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851540;
	b=FjfUFwngxAU1eLnbmyFQQaIYawevAg8Z42upm3zvSImhYITx406jPSwksvA4UQVmLu/f
	 Q6qdy5lltOjko8Y4M+PYhiRRSo/Snw+v5f0JXgAen7tk4Yh8D+yVbyICRewSeFffxSkYq
	 DIy8qK2prDdglBcuSfJtA5WXksPOSfTm+HP5IRkskiZInfvd5/YoR/c156vEqCIMPXrMC
	 eAPZreUGRQFp640Qhl99VKYerrEcA2MdFri1MJTRNFwfVZX4q1dVrQqH1zKbm+l+ZtotP
	 k/dEYmsRNJgq/avNsIXXnM7AhdSSkr6eUuv9OMH2dU6W050wSd3LNvHn+uXhw4pky4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=27hTMuZJ1nA66i2pyU7gbAoW+DUnYiuiRAEIvnlQvps=;
	b=MCIvPG49bwc8p9KrSqWyPYPp2NEjrv6w4yjFX8O9LN7LeMLb2xYN9sWez6vJ1n1EeXzR
	 jDimGvhNGjybUrBM+qFbbwgttbevoZyT087R5DxLBqtnNI0sE27WuK8SPjsadz08UXBbb
	 Jjtx7etIZ+snu8XB5QHY5OQ5J4cP9R/3RQSSmgnkNXC2GsUv3FxQkO527nsJ6B9Vq2jh8
	 r5Txmq8wZNZQdN7N2Dq/efczW+3souIZ4A1DOgS7+BNvLAPMhA6Y5p12v6yTPVAr7g/9I
	 Hn9GvaPoigl8E4lndTmXySpFTEtAcLB0KFmuJasokY+qFgEr1v4sfxBtu3c6SZOSN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EiHA6/VL";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551F5606A89D
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 551F5606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EiHA6/VL
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso30729675e9.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851537; x=1795456337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27hTMuZJ1nA66i2pyU7gbAoW+DUnYiuiRAEIvnlQvps=;
        b=EiHA6/VL7T0syc28WB7DUZlL9JItrTQFkuyP5mHTAqSdArLCtgFfTxjWkVTyNsn5I7
         2/l5Nr3JawGIpB41F6WSjbSMO2fKd92MukNU29kyHsVIPQovbSW8Pta114C93mfnhKF7
         1N405J2LtLyA6Q0Z70LxwpocOxSAvICqG/q9OHETafOXYHfXWjqJs/GwhSK9tC2EO3CT
         jC11ZsvgVIe3JyRAauk5ZMh9mglon2gQy7iC1RXiXuxsryEDIzD6jdcT9OFPDB1kw7Sr
         XeT/XrnIeZxHmqUWicMd3XzrR9t9u6fqFYRn4OAk5IlihdVxto9aYhxbbQhsxq33xSd3
         vhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851537; x=1795456337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=27hTMuZJ1nA66i2pyU7gbAoW+DUnYiuiRAEIvnlQvps=;
        b=oZerC2RhTZpkVzbN2FFe6nTuJIc6C03sX2OOXNNtcfz8yqVvMMOnn4kJ+m0hISXZzx
         ZYIghzYgNMWM3VQLH6dpvumwL8m3ywDPyxA3AREqeG1aPQtaQqWCYNQitXGPEewISXda
         A6RZ9rcNhBaReugPk+HXlAp2B1JZl2Ay3Ek4xDEs4v/FHES6qfwkfaFFarRWzNMpe56G
         F99NaYaY5xee/QX80QJWD8NlItP0QcK7WitKkkjC+H43adfwF/PSCf+SiSOv+B2dnC/G
         sr/1/RHNMvlDYmlOpGr+UmF6NyDMMsAPVyr/fMr4vd3LkkCVC2tvO0dbF97eMT+zg/MT
         FpuQ==
X-Forwarded-Encrypted: i=1; AL+hErFIhExgRNSmDWTFKkgnZdUuS/yOfL7VWhciMm2EA/l4lx3c8QoAS3Ebe2hk3u6fVrMFpIIS+C4s5i6ZkQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8RKvGSL+GT1ptzX6qH+Yd8IaKV4mMw+qeciGXt4WkrfaVFKPPX
	l3/wdrYT+c1BRZ1bYsI3s1urlccBvzlSpe1tDpsZ/d9TPNO6Hfgx+Xd5
X-Gm-Gg: AYBFou2mPe3GHhZ95egPDLTV2LiK95WbRyWRpWrndEyCTU7njzgzKxpFbfhC6hPnvvx
	BI5z4HAd6azqcRwOVl+ONh/m0cr8KhgWr6wa+LBcv9/tYeCbMhZo19ezocoMpK0+Bo/OHWM7Cx7
	pOI2b0pZPGx9I3wwm3TzzAJc5oI5xcJbsNt2Ztj4qnXKcHbRxf6FROYzuU8yZzcXifBC4/xZ1TX
	r1LioZWMoq2sZ1lbfV1/kB1IqO55r9JthFqxgqWPHCoCor1Tm84BpnTULwA4YMs3N63F46Eu69S
	M4S5Hc0cXftK95I5IarTcTXh7dOGmXoH78bfnD8QMLio6v8tXKiOZe2h0sdIfiCgGCn8W64Yy9Y
	RG3+TMM6zAFf8QDsTWK/EcgBdgvjrP38ufYF8oDeELNXFoD8K56QOKxXwnzaLFXgY6/H40x7M/6
	rGrQNfDMyD7w4H0EINzeIiORRBrhi+0wJWpdyrtNOiTKP4jSnlYMMvhnQlB+F5CslKJp/GxsIkp
	a/t2bwVCmj0M3qHtcSPt2qyaSaXpfTNYJzkuBigJxFvyoJGA6jXaBKLdiS2QI4IaCfmMQ5y+iLO
	d2aZJlbkV0Cmnde/nU2ZjW4mvV7bh4elHifKPhqKMzlBTr38LcE30JdQ+mMReQKz3Sw=
X-Received: by 2002:a05:600c:8b8a:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb55abbadamr247795715e9.31.1794851536667;
        Mon, 16 Nov 2026 09:52:16 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm4546075e9.12.2026.11.16.09.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:16 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 3/3] media: atomisp: csi2-bridge: Add IMX175 sensor config
Date: Mon, 16 Nov 2026 17:51:51 +0000
Message-ID: <20261116175151.20150-4-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175151.20150-1-volodymyrchapman@gmail.com>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
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

Sensors without an entry in atomisp_sensor_configs[] default to 1 CSI-2
data lane, unless the firmware provides a CsiLanes setting, which the
Lenovo ThinkPad 10 (20C1/20C3) does not. The IMX175 rear camera of this
machine uses 4 lanes, which the imx175 driver requires, so add an entry
for its ACPI HID INTCF1A.

The firmware's own camera _DSM data is consistent with this: it returns
0x0104 for the IMX175 and 0x0101 for the 1-lane OV2722 front camera from
the same method (GUID 918ab242-c37c-450a-9d0f-f47ab97c3dea), which
appears to encode the lane count in the low byte.

The VCM is left disabled: the firmware does not name the VCM type and
driving it has not been tested.

Tested on a Lenovo ThinkPad 10 (20C3) together with the rest of this
series: atomisp configures the primary port for 4 lanes and the IMX175
streams in both of its modes.

This patch was drafted with the help of an AI coding assistant (Claude)
and tested on the hardware by the submitter.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d7..239c287ce 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -360,6 +360,7 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
 	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INTCF1A", 4, false),	/* IMX175 */
 	{}
 };
 
-- 
2.43.0

