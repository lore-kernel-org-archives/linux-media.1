Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985746EF61
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 22:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672376; cv=none; b=b+lVROgat7d5ZQ7QPaA7AC91Ea6Hct4fdjBwfR8isKQ7dsjnBrdLp2DVxMA+cRUAqTUfIIqOY3xK7z+/zA9+KHAN0/UI23mvnV7OFgRmPcdhpSlgP/DP5SXVQwgmgEybAR21rCDObPBPb8Udn8c4ur/aYAiLHdQoMIf/U2PXllc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672376; c=relaxed/simple;
	bh=h2aJj7pziAHUBp+6L5MUVW4GhG2BrpklrlUA9BA13eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nBX7Tg5b6Bb7635V2ms7dC7KKZDi+vcgePmWl+EugEB2PlzuM8mj3G9oYyoCmSTMmcj3sFUhnCWeYQC034P2uZFucNLWgQnyIoIhYeBU8LEQs5hrVpdmAS+FEoD6rCPCfQuSgdKWAoAAH1x8lohkWGPvpdJj/5CKwxM8nKJd0M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QwHhk+8k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QwHhk+8k"
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92EC8BAE;
	Wed, 22 Jul 2026 00:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784672311;
	bh=h2aJj7pziAHUBp+6L5MUVW4GhG2BrpklrlUA9BA13eg=;
	h=From:Date:Subject:To:Cc:From;
	b=QwHhk+8kupvIuVIaOsJJXGrg90y+9AolhqEW8LMJIOHnToDcYGKq7Xqy4L5xugFOl
	 kvD0YaBlVQ/vTQ1GY+g6gpmebIn5OU8kZj0dGQF6HxbPQaS8ufSLaAy6oncvnyJoMG
	 0H3wE6an/R1dk4xuEOdB4iXYqRMjw4Cr06D57PIs=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 21 Jul 2026 23:19:19 +0100
Subject: [PATCH] media: i2c: Expand gain values for ov5693
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ov5693-gain-v1-1-0eaaee0a7bd4@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAGbwX2oC/x3MQQqAIBBG4avErBNsNKOuEi2k/mo2FgoSSHdPW
 n6L9wolREGiqSkUkSXJFSq6tqH19OGAkq2aWLPTA3fqyr0bjTq8BAVrHLO2gAXV4o7Y5flv8/K
 +H3wwS3tdAAAA
X-Change-ID: 20260721-ov5693-gain-e4362204ee4e
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=h2aJj7pziAHUBp+6L5MUVW4GhG2BrpklrlUA9BA13eg=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBqX/BytFUcwvfOcVJB5Lw/AehlOHDHZW4pSbqN+
 UE3k7eYFNyJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCal/wcgAKCRDISVd6bEV1
 MtBTD/0bEuDytuLODY8kM/hP32CdBt0LkV1dkcx7v+EFsrQ2LiGAN7TkOBv92xWXDCx1Enuoqa7
 wl7PwJVGcMCXPHz8phtkeFxPKsbt+Dl9jYEDoqcuNaEoGiZjcnhkdBU8fm5hxPnt/dNQIphtj/S
 CtNhDJkiJ9HgyNyszcWnxH4mHAysOr/ji+JXcu/l1Q1jIt7BBUrKH9UFwtqVcEduhjMpY1TKckv
 BSXA4n0yCTdIQAs5x//Cu/A3bS7vRQhsglnCr+nNFyLe1cNldAuEiux2I6K62M8CveHBS6g98Fd
 uw67PmbkHPcoXt3wWiqOj1lTMrFK2PU3rs/QckJSdoYfBXrOG2h0Jiv6RmUyfQ2RR9Y9S3mWyx9
 kbvmt9+/HIAz9ZwtaETCXlspHT5sc6z6IuAz0E/zZJy2pZh9Dru6+roaupHP7tjR1o/D17g7GgD
 ugNeq43s0JxAE/2aRM1pRd2rRZpKcrvSe4UMEPPwL12Rmpbewt98v3RLGVFwgjIPYjSwHR3b37v
 36dfGs7kunaHwREn1r+7uA8UIz5+/Kyjbcf86ziW4Phl0DnDvJoYaLk+UI0A16hZicTiCD61bO+
 ayClu0jz47NO3hJycFSIGTR3pPmfiYqIusvrk2ArW3jP3zzylZtCRZ6kngl8Ah+0ntiDmfAhk/u
 b6xqneGK+R2G4bQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The ov5693 driver currently allows values for the
V4L2_CID_ANALOGUE_GAIN control in the range 1-127. The input values
are left-shifted 4 bits before being applied to the hardware. The 4
least significant bits are fractional bits, which means that in
practice gain can only be applied in steps of 1.0.

Update the allowed range to take any value that fits into the 11-bit
register and stop masking off the fractional bits.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/i2c/ov5693.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 4cc796bbee9263c032384d8327961b5cee52b9e7..1fedd835fb69532ebc3b48b7b8c9b02744bf3da4 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -48,10 +48,10 @@
 
 /* Analogue Gain */
 #define OV5693_GAIN_CTRL_REG			CCI_REG16(0x350a)
-#define OV5693_GAIN_CTRL_MASK			GENMASK(10, 4)
+#define OV5693_GAIN_CTRL_MASK			GENMASK(10, 0)
 #define OV5693_GAIN_MIN				1
-#define OV5693_GAIN_MAX				127
-#define OV5693_GAIN_DEF				8
+#define OV5693_GAIN_MAX				2047
+#define OV5693_GAIN_DEF				16
 #define OV5693_GAIN_STEP			1
 
 /* Digital Gain */
@@ -444,7 +444,7 @@ static int ov5693_analog_gain_configure(struct ov5693_device *ov5693, u32 gain)
 {
 	int ret = 0;
 
-	gain = (gain << 4) & OV5693_GAIN_CTRL_MASK;
+	gain &= OV5693_GAIN_CTRL_MASK;
 
 	cci_write(ov5693->regmap, OV5693_GAIN_CTRL_REG, gain, &ret);
 

---
base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
change-id: 20260721-ov5693-gain-e4362204ee4e

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>

