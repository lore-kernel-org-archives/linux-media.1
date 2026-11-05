Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874546;
	b=ud0XQt6dXILBNoGrx59OdEVP6Y0ohFmN0A0Jm4CeTO1NXybJ2gTKH2dkFkj1G3xjYu5t
	 HDbzi4hca+QleDl7ZDjJowrYEeAljoZmNenkXuI2OEyG3wT9+tYQojV2AJwlDj5Gi4/LP
	 ockKzQt81qEvxtDFNwHZ3r7FYupgXI4sDEBFYEJn9CbapC5LQWDjs8HXPGVIl6rg7A4R9
	 jg8O+OipDwVWN1yEVfYrc4LtWFjkUcCHy09iXTZEUuiR0jDYnbxNl9lXNvLV9r8LWt003
	 sNP02SveER9uKjxjtfgEecpIQfDcQIC1uUIgz/KnJaVwyWQTbWixuKp8GBpvD29R+Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=kuiqWlPXMfPHzXfjavSlArdOnzZ4gKQLgR8XLdjD/d4=;
	b=mHuity/Nu66ziqT8TwRK2r3Iq1wv1J2Ps2rrHXEPPqNE0uVGMTzcy8vD58a4erw8G4Te
	 buOXbAbFe8C4syZEM3fa4s1hYlCJ3BfvDpubeZCr2Ik5AMu7ue9+KJUebjiSR9+yo2cqL
	 lo//eU3Y91VIWwuBQTU4xFaLc7edIlTsGdAWP88+2a8qw120vRRR5cwPS6cHkTv3+6MEr
	 o1CIrHFN/qE8gR69Bhaxwpoddlpehv79jPu75xyWzaz4B6UkS4JFiG6fCIJ4Ucy8e3rfl
	 HmiFjYxwDe2ynIrKa/CSp5eoLUEF4WPO9klYEQ5osHMpRn7/DH9nYU5IstVa7ASwK6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=rpkKo2tu;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC808606D819
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 10:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC808606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=rpkKo2tu
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so2101010a12.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 02:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1793874543; x=1794479343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuiqWlPXMfPHzXfjavSlArdOnzZ4gKQLgR8XLdjD/d4=;
        b=rpkKo2tu99qcrPys0C/XByLVaqgRKyDLy5hwXBlYwnlBUw0XJxAh+YlCeFNWURR4yX
         xMChmFQXpXPOddaoUiW761WyIUnxA3ArhlFo6+qFdXLHmlzgfqHMnUVTLIg3RTeQEx+F
         lQBe1Jp7OZmyzKDJ00S7moxP2Y0oo7kIuWVB6tnYunZ/Z3kovCbpSCn5AgIhDs0M9VtS
         7sEvNZhSNvp000PLpA8FINskroYfLgCzDEfKqDo1dBN7cylbtWs/E0LZWYcA9iH5h+Tp
         OvYg0x8H78RaH+xwjeZUjlBJ15wIEYThQ111qfiUJTFQkU0wLG4RKghL3WbgBV5ySE8X
         5XEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874543; x=1794479343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kuiqWlPXMfPHzXfjavSlArdOnzZ4gKQLgR8XLdjD/d4=;
        b=YL7emZ8PS0opd4H4L1rYEic53Bu426P7enxmZfYo1LjUTRKDe54B7XSw/mNXEKKmWQ
         QIthldnSjGpFsgcD1Mo9hfE26bSW990O9mTUwk6nPliaYuKgjx5FzF/XdhtI0uZKNwtu
         +S+RzLQ/Qr5o6CIAW4ljfG1JdZhHZscMAQMlE7qVY0cMMhK9yr6Uxl/cTQPZrkqv2Poe
         D5oqVgdYoIMZXQkSU4MAGhj/Wz8X5G5C1cPZUwE5NlG+l7q/uGuMbzYYeLSVU6KcL0cz
         rMwFi0GT33hoF4RTr4RnFe++gQplTQ7l4ynf1ptfKpR2rqF1sefoiTQqyIQVyyMw9p72
         BanQ==
X-Gm-Message-State: APuU4Z8Vo1a1Uw8UtPIFHdXlMSD35hd7KROahIEmJFQEiMy2xK442ZqF
	y/m/JITWrcz+T4eGNIxf52xYRkKzHenubVLA6exHUkJUpAkgTOjxwXTTECbvTDy1fmE=
X-Gm-Gg: AYBFou3snKOaSLFVCi01LY8evvMGGUADPYdfZgu8QIs2kTgRb2VNFO4+nyCCqs2VQ79
	fhYUKx6KpE5BsLqVedGbj7Mi7jc/bsPHyHFCP4ge8n/tDJmC8Kn+CeBJyGrt3HSbQ8Ncz07o5cF
	QVDeNp01du8sDMcPBMOfu5Fo4GCp4/yQx6c4C5KZ/eEo6Na0nX1m9J1Y367Je5Jb7xCCGcByizd
	S0ngtM5WOmBiPCcqRUArobBMNTFfvwegCAd0rOZwNrCq99sOtLrBmr5m8f11OYvrl+y4G1jqIfo
	bzt2WG0IbBOrsJCmuPOIaJuCsky5d5L8qzDCWXqRcFY/PUGAMX3MspM9ZxDKKYcVXCJ8chmHDaI
	3gOmGO0rczYLqqq5pCPcsGFAKccYS7qwyRe6ttxJjowX1UvPORPH/mhZ6pj7h3uOcpE37qXr+Od
	TDwxW+6JmZE2Om9o7YW2FJZVtZDCGyBf+JOYP7ztzWF6Glv9+A0r8qpe2+C0Z/Vy/45pJw4CiMk
	yXAnKDKP/98Riu6vJ7X5jVcXGOz8eLcHS/gF58kHlTemj83E3AhTF/cOo8YT6PCSVRrFur6cjw4
	3OzkjOrfgcVhqRai3vUOtnVjee2yjOAywvXXb3pC0W9jfOcoEzcF5bqCi3ngb5ragswdmK6sLod
	iDaDCpbRCzQ+cJKK3v27OcvHnTg7d74bK
X-Received: by 2002:a05:6402:1f45:b0:6b1:cea1:a023 with SMTP id 4fb4d7f45d1cf-6b4d4c6f85amr15321879a12.19.1793874543256;
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5864a87c1sm278665a12.2.2026.11.05.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 05 Nov 2026 11:29:01 +0100
Subject: [PATCH v3 2/3] media: i2c: dw9719: Update DW9800K driver
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-dw9800k_cleanup-v3-2-6850ee6a5a5a@fairphone.com>
References: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
In-Reply-To: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793874541; l=4806;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=vIdVuZXzskHp6BB4VyvbfPYAsFbE+ScV5dXe5s5BsrI=;
 b=6+AAeHghITHv//1oWnkYUBCUdUedB1RP6RwrpnwU99n2tT+uf1GomnfMlKYV19Tc5Y/NU8ycr
 vFJN8EdB3hvD8BvCbxnsAeHP+8ErbZ1tN5JXFFUg7bL6D3on6uj6zrc
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The previous DW9800K driver code was created without access to a
datasheet for the part, now that we have one we can clean up some
misunderstandings and add some features for further expandability.

More specifically:

Previously we were blindly writing registers to their downstream values,
Now we know what the correct default values of SAC and SACT, and write
to the correct bits as specified from the datasheet.

We found that the device does indeed have an ID, and add it to the
switch statement when setting up the default device properties.

The largest change would be the implementation of "Ringing," this is
actually an internal switch bit used to differentiate whether the SAC
(smart actuator control) modes are enabled. if the "ringing" bit is
zero, then actuator modes DIRECT and LSC are available(based on the
value written to the Mode register). If the bit is 1, SAC2-SAC5 are
available.

For the devices we tested this driver on, no new values are being
written, but now the option for further use of the DW9800k is available
to others if they wish to do so.

Fixes: 083f7f0dce16 ("media: i2c: dw9719: Add DW9800K support")
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/media/i2c/dw9719.c | 65 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3b7ba88fd67c044ef9005a0aac6a5d26ab939a90..3b99c5492522c33e0aeadb9fe7e9b49f777b9470 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -68,9 +68,18 @@
 #define DW9761_VCM_PRELOAD		CCI_REG8(8)
 #define DW9761_DEFAULT_VCM_PRELOAD	0x73
 
-#define DW9800K_DEFAULT_SAC		1
+#define DW9800K_ID			0xEB
+#define DW9800K_DEFAULT_SAC		3
 #define DW9800K_MODE_SAC_SHIFT		6
-#define DW9800K_DEFAULT_VCM_FREQ		0x10
+
+#define DW9800K_RESONANCE		CCI_REG8(7)
+
+#define DW9800K_DEFAULT_DIV		0x01
+#define DW9800K_DIV_SHIFT		6
+#define DW9800K_DIV_LOW_SHIFT		2
+
+#define DW9800K_DEFAULT_SACT		0x20
+
 
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
@@ -90,6 +99,7 @@ struct dw9719_device {
 	u32 mode_low_bits;
 	u32 sac_mode;
 	u32 vcm_freq;
+	u32 sac_time;
 
 	struct dw9719_v4l2_ctrls {
 		struct v4l2_ctrl_handler handler;
@@ -140,10 +150,6 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			dw9719->sac_mode = DW9718S_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9718S_DEFAULT_VCM_FREQ;
 			goto props;
-		case DW9800K:
-			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
-			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
-			goto props;
 		default:
 			break;
 		}
@@ -165,6 +171,11 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			dw9719->sac_mode = DW9761_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9761_DEFAULT_VCM_FREQ;
 			break;
+		case DW9800K_ID:
+			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9800K_DEFAULT_DIV;
+			dw9719->sac_time = DW9800K_DEFAULT_SACT;
+			break;
 		default:
 			dev_err(dw9719->dev,
 				"Error unknown device id 0x%02llx\n", val);
@@ -185,14 +196,50 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		/* Optional indication of VCM prescale */
 		device_property_read_u32(dw9719->dev, "dongwoon,vcm-prescale",
 					 &dw9719->vcm_freq);
+
+		/* Optional indication of SAC timing */
+		device_property_read_u32(dw9719->dev, "dongwoon,timing-control",
+					 &dw9719->sac_time);
 	}
 
 	switch (dw9719->model) {
 	case DW9800K:
-		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
+		int ring, sac;
+
+		/*
+		 * Enable ringing for SAC3-SAC5
+		 *
+		 * sac_mode	reg	Mode
+		 * ===========================
+		 *	0	0X	Direct
+		 *	1	1X	LSC
+		 *	2	00	SAC2
+		 *	3	01	SAC3
+		 *	4	10	SAC4
+		 *	5	11	SAC5
+		 */
+		switch (dw9719->sac_mode) {
+		case 0:
+			ring = 0;
+			sac = 0;
+			break;
+		case 1:
+			ring = 0;
+			sac = 2;
+			break;
+		default:
+			ring = DW9719_ENABLE_RINGING;
+			sac = dw9719->sac_mode - 2;
+			break;
+		}
+		cci_write(dw9719->regmap, DW9719_CONTROL, ring, &ret);
+		/* DIV is 3 bits split over the bottom bit in reg 6 and the top 2 bits in reg 7 */
 		cci_write(dw9719->regmap, DW9719_MODE,
-			  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
-		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
+			  (sac << DW9800K_MODE_SAC_SHIFT) |
+			  (dw9719->vcm_freq >> DW9800K_DIV_LOW_SHIFT), &ret);
+		cci_write(dw9719->regmap, DW9800K_RESONANCE,
+			  (dw9719->vcm_freq << DW9800K_DIV_SHIFT) |
+			  dw9719->sac_time, &ret);
 		break;
 	case DW9718S:
 		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */

-- 
2.43.0

