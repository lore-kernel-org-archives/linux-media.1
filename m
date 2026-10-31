Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445752;
	b=rC07KWVY0n+RE2Npoyq0Xe515HuHxxy5bmSvXBs19hvWvo+MIKm0chQYgZSXyH9oaGyg
	 wgtIL0SrSYBWR3V+ykj8ZL3reBo2T7RB5FHcyTxvDXx3wmqxqQzE8ny2dZafSIQRs3nAV
	 EqpPMm73sUCm4/o+pmWIj95CN3Shhq7j7a85Xs3+2ezTOdkO2r44ygsCuW5paWiMckxFf
	 5NBF3spr/R90S6KToakFLAoZL7lzpFpOtQFOhooyu2vKvXgUTfeeOXjvUv0pj+Mh7Wr24
	 N3o4/pENdxe1iINRIcxyNWb0z/IpRAlwOxKznRytpCpYvF+yA1hFN5vy/4b5NnyVAog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/DP7KNdQWOH7BpliivQ5bW4gkOy6G4pd7ggK78SbJr4=;
	b=3w8gSrMBDAfPuX8F7daM3TOnByZa/mta+vLWcZMrP4Xby8waVHMqjo3kADyk48oxpypx
	 98ynWqOnEn0LyfT/bNu6pUqEXSOet+Gkoej6OB+dcmvCU6lPrzj5TwLvAUGSMZHQeIxSd
	 XyTohFSv+VscjeXu//HBbUMrTuTuHg74BSPWuSE6vpJiKDfCaU3cULoG1mYx9Q/AnsUbb
	 fLMz159XBsrs9mDKQksN9d4RKshfcAfoe5gMb6LZBydb+x6T59lTKufDjxfg3/fKQzfxd
	 hdK9AbtwVbUG4+lTulZ5DjaW0x80gWsMDGPStUBV4LNWKxqiWn0FqJedIgYXKx2f5/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mldDd7mI;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB03E606A323
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB03E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mldDd7mI
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be4bed05b5so83359e87.3
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793445745; x=1794050545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DP7KNdQWOH7BpliivQ5bW4gkOy6G4pd7ggK78SbJr4=;
        b=mldDd7mIUPPKxAeoDWfejbL89Bun8PxS/Pfoi/C+OVqoLglRPk/llZ975EI/vJnPFS
         MK4M/1P7wBS0DRkWhJoau6Nz8P8iTt2Cs0vfgBp7lOzxtuNU8Oq1fDfuf5Sgogwzr3iV
         lXYWR/O6p/HCum9RuHeCf6slQS9z54OlsW3lJBtUmgSnXna1fd+ihj4DXO4vmgFWXq1W
         j8N4cYbS9qVov43xtvmoFeE/VPhHDjnZGSZSrS1AiWsjoUcrytSDpxgop511LzdipwS9
         2Xi/lbGUlgukqXC35RlO+pn+W+DoLmEsmftqIugwPrMJQoS+B6qWm48/+d6VyEB1wvQe
         HoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445745; x=1794050545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/DP7KNdQWOH7BpliivQ5bW4gkOy6G4pd7ggK78SbJr4=;
        b=wGW4mFplsi5hjKhSRldrSfYWzPlBJug+d2L7pQMrT7raYco9qNqFtKqFqENoOnUrgC
         NfhSBCFfLRc7iFHkG+DfZ9N9ULTo0Z9XYasJMZjzKyRh3BmXCBKn0JTEiVu6QiXYrj89
         xVgJbk05UiK+sOwIELr1UQg6mYyPT8RyO14ZYAEo0+m20NWzMZzAKPhel2NnY+f6pDq2
         VUoVhuB8EShV/sPTdVnqHW5El55vDFdXEhRjHlofWiIVHU7cdqtGMbgHSCg4M/oP7nOP
         XaQD69Q28b3sF0TiFNoeZJ4eZnWNezq8lds4j5fRlPLr87LRZ0YZR3EhWOUF4f1P5akM
         Qcow==
X-Forwarded-Encrypted: i=1; AKwUvBzGlriIxRrNi08HiOJL3lITQb1S5iU4l12/gcWYfpPMvUm3U4Xz2XiI71oFW/3aDg+JoIP6kQT2AVnL8Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLcz5NnCVYRPaTRpbk1e0eu2xjHprFvZLXFWE3btNJwafTPPxLz
	XFtbvivQVYn+kdUOUvXzqKLqwPGwd6VI1BFEQtwW3PtdhdfHz+z4tI/x0bNK4I0VikM=
X-Gm-Gg: AYBFou32SlgFq7JDHG93R5Ymb7TqO+5b3mTULTLwTRlhkKDUtZU4OEIX2FliynZH3u3
	4wIyDaaBqMFyhlGdse1yBF9It/MSemijn03sTLlpqYyOvzBgTqg/YbfGV93McwyNE9112DuC3KO
	OQhfDwHkrqUo/mjFgrKVKNAq71iCHwgOl0Aq+FB4y1+uoXKnTTEZFzRH9gLpJPSIrsbr1eA1Whc
	4496TXHvkMxKq9kTgnFPrE5zmV6DmsvPF5w7CaIJ3zuuBtpmGf1vXS6kVR3u4TW8NSZ464RiBBR
	juWEzbEoPKt62CFYHIFij46IYvJLr8XR0rbrOV7DTf4JKyAcuShM6hlK/a8dn4lgU8oR/tRM5IQ
	4MU3E4QhzEaG2vlLC3WuF1DbYkXy5HJDiVMUBAT5m9+4oOYEz6bkk0MmIgJj1x0c6JN8i1jo2bz
	RCXmr3Rw4kBcZjH+WOvAOkYFGTEZWsFHSdCrMsdjR6B4lvw0qdgGidFMmL7weZ6fNa7EErZZMQU
	064akb16cVEj1jy2MaN3ldiOWF0WZNznsdxQwvxpKdMdY+U/hwIHU5ZfQb3Md1jn+vzn+fORcfD
	O2Y206FB3YIA3D5g82rQ1h5IvJSyigbV+NOhUg8ioQMPt37SGTjkJNeGrMX0rSt94oKmEP4=
X-Received: by 2002:a05:6512:4041:b0:5bf:a48b:7807 with SMTP id 2adb3069b0e04-5bfd952024bmr1809892e87.1.1793445745111;
        Sat, 31 Oct 2026 04:22:25 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074aad9sm538469e87.75.2026.10.31.04.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:22:24 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/6] media: qcom: camss: tpg: Add support for v2.4.0 TPG
Date: Sat, 31 Oct 2026 13:22:00 +0200
Message-ID: <20261031112203.545319-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
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

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through the
TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
the data source when a test pattern is selected.

Add the TPG resources to the Kaanapali camss resources so that the TPG
subdevices are created on this SoC.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[vz: extracted pure TPG hardware support part from the change]
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../platform/qcom/camss/camss-tpg-gen1.c      | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..cabbb2638cf3 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version < TPG_HW_VER_2_4_0) {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	} else {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
-- 
2.53.0

