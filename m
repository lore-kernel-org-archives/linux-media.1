Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627824;
	b=IlLpzAOALrGUVyNtb11oSSidHotqbpRWXwVV9mU3CoAA/c05EKk1obm6a9ppNmebqibo
	 TGSc06So3hTxze5bjjq8evvmQ37nBrmcm0oV+ekFqEyTsRc55wHOptuFLzE8ZOomN9opa
	 0dLKNQxnAyamqNkZcQeFceyzG//tbhMcxVqQxrwTapoaVY+dlftImTS7BHk6ONMbFKOz2
	 IxTR1G7hjrLtz5BOImsaeGdG49wsUGr1YOvpjiDNWeHT2eH1vITIVnr7TuNkBgyWETclc
	 c4un7v4GYhW+Vt17FuzFxSoOMnG7fp8UNpK1I/oWbjjfsqGGqi2aGSNUDmMd1MVPWQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
	b=DHswfDs83VLgmq/gAl8Jlu+o8izXeZy/9rwMo100LopK/FY8rJBLfv5H0R7yyfftcDOx
	 O+DnesEbf4kbjOtTFY6sr2iUOdQJwbqzSX8QLbEriRYys71UMSWQmZ0+ZZTaV5NOKKlc1
	 rZTeB81LR5Sg9KMMcdDX+K76f+iIA4+iCmTqFAxZ8CHy2Ho8irZP0UHlZq2YPU7m1UEx8
	 7ccJdvAbSnnsmOqI/qkXzmpku81vnwPyb3jT30owY0Yl02bzrrm1ihwdY+5Pd+FX4O+Lp
	 ZmCZfrLB+33GMde9R7iGBvKzR0OBnIYYlXoxY0oISsaOeVk287MgNhSn5Z1myJqsK1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qh5hrq8A;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2760A3807
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 13:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC2760A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qh5hrq8A
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so26991145e9.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 05:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627822; x=1794232622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=qh5hrq8ATk2xevegmYrJJe/V3SZi+adLjiCL067pCp86DV+2uw6V49Hawh225VpKUx
         PAFz0T3i8OredE4nceP0qjiYQk3Zk92QrpI2Yx8OJg3ubhgGqv3kkue9gxvfUkFkWKY3
         C4Nno2ToGmNq6dIT9jciXm7gH2kbyLq5MDBgVeF/qX3GbC/3d1lRphylu5r9tz8Ju9eM
         Gap3+TQv0JcMrwi7lhlQQxhbdg1RlqPfiXUv75gJQ07tezDWQ5SCEpBaZRuIjNxvlru+
         AVlTIIEiTyEm9VpjB07YeWp7KiD5EAmy5pe3/EEiv+hTZIFD4Cqxzew9wo4k2sA3Ja3x
         b40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627822; x=1794232622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=l+kbGMvLuvlTe0yqCXS0AWDF0GkOg4B0H2SC8w48Pz6x2qzM+e2JWjhbILn4aZzSN9
         MfMGfCxGYGkAznlBt87Fi+jITfXtw+fE+bpYO+2Q6e88VpCMYJWBdgpoEuaIDHG+ZuAf
         TLdxrEggdZFBsgJuMMQ0gUPumJtesFtBy3iUpRfYIM9FbDhEzGQFgQIGEbrHLNhedOuI
         1/hRPgI8topkJMKRK8Ab7mPMk5absrvUdI4Q97qhkNlIl+rKmKs27cim1zEKC+DFmRB0
         c+5BJgIUq4EaiPmRG7HOYh8zJSzeNJNA9gBqMBtAtHQEPQO3soGvC6dRmjt9ejy2OhAa
         gSDA==
X-Gm-Message-State: AFq9FYISz1lmbdRIsb/V0oMDPtcj2/qEhDH08pU3c428hyo3XGdx9pS/
	6o6+/8fRZnXpTBKMZQe7uFEdxKupPJHJvSuQOsyWOyIpQO6o98BYxYFG1qcd15CJSDGWzE6ZeLC
	M/Nv+
X-Gm-Gg: AYBFou227dYVeHbgr2aViVx5CiQH9+R1+y1LoXJB+GptRJwJ4MhtSkAUni8qmsQBfx9
	KRZ/Lq8g+aJM12vWKtw9fL4LGz8xJ70oeS8U1MeNluozZqsDBU7wMG8OfoC5qgTcsFL6dsIGXYT
	O3ZQSE4Qd8fakWGEQ2ZUYKUznyv3d9cKOVdhmR6qYNhHHjJxyDnwaJTlTm6TPY5vioD4JVSdGfN
	vLyOBoxXEhGGilXvz/ZtP7dMjIyGomZXaDjJzt7Dq53Qvi2+3n2a9xwNU/ChkIqdVXU8pc6co/B
	/T7uYjUA3B6czD1f4E3z+Q7ZmQlvbg+JDjrT1JjnMeAvjHJivloYE/Z9WLPqT3yxqCOVDeRQ1NX
	NNJOw788wN+wHto0m2spZdNAUWVvS7jS7EBB5mRdCkBE2Z9sCHtiZcSbmHaFIJr9MRMnQyy0usn
	KPO7hHAh9AsMQHMJfs0DxV66nUq+MaO1oz3eV+2igkbf0z7GODM89bOrEQ/KU5qO8zQrQAeV8Vn
	RVx9t8lok2WfQruEMax6lcAC/7vh1IMK+m7JyJgaisAeq6jseg2zDvE+turyWr8vhLAb2jzwlAe
	hs6OvGE/ooh8Dzb472tfy8tAyrhJNSm5zTmZ6b0=
X-Received: by 2002:a05:600c:3b8f:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4ac16acfdd5mr241592915e9.11.1793627821995;
        Mon, 02 Nov 2026 05:57:01 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:01 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:50 +0000
Subject: [PATCH v2 4/9] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
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
Message-Id: <20261102-v4l2-frame-sync-v2-4-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593; i=bod@kernel.org;
 h=from:subject:message-id; bh=9Su/hrp4xXNhLORySBV74mmMzNRxA4TivC+heqLtS6U=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6Jalz9XQqKDvt0dR0lQ7lPSaYS37WBDsZAvqv
 MK6PK5/8WmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpQAKCRAicTuzoY3I
 Ots8D/922kQlxHfwFZkbSTpEPLuETpxaOpt/qs/eYXUxVdAL0YuRvrqkX8CdEPIJzUXNUQSnPgz
 zkdUUqKV1DZkhRSS7eKOOfqFWOB+Kq8Wt8aZQK3OuLqVcPDxQxMMVO1J2FnkSVTT4ltdBddmQbO
 5HYYigYviM4zK7kno8nQj2OLGdQ5Npm9NezE99niA1gkW4sPhfGCEkHQq8lRXtmAuc8IE1xmJhA
 JXCQ3Ir+5ynSmsuF012mfJ3Wii8qwF/xhnkR82JMLTU9GZ2drtHvHWFh/Ga7T63uXQkBf5vzzCG
 ayApNVHf23to/7jHqzW3hl0l5pwBbiQUZl22dbCsu3rSlA++zltBr91OvntFFb0mDb56FX4xKlR
 rQYjupgCsrdb8WqOvMBhXBXxmxTpvUBxxASYY0hxG2eCWyo2w9HDbGn/xg+Tg1E8eanddVxBr1Q
 9uQ15RPXNdzUdqRM4Dwo8uVtl9wtJGI5mmuCyDdb+bERSJD6FE1qmE+5MFb+ZOIfOG9xw3TaZ9x
 LhwigVpajL1zRPgaEfKnNZbyrHXQ8V+ZVbBt5IdH6XpTELd3H1k0ug/oyp1H9uUsLgJ4sC5mk3j
 SwbDWVmtDVmFX1v7m3Xa26y7dN/vegjF93ZvY/B2ajulPNizZYmaR/1Ss2OYv4mHNqhdoNdmqux
 o3a/NNgOjgdh2ow==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in silicon enabling code to generate SOF and trigger the routine which
produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27db..6a538d825f78b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -34,6 +34,7 @@
 #define		CSID_RUP_AUP_RDI(rdi)		((BIT(4) | BIT(20)) << (rdi))
 
 #define CSID_TOP_IRQ_STATUS		0x7C
+#define		TOP_IRQ_RDI(rdi)		BIT(8 + (rdi))
 #define		 TOP_IRQ_STATUS_RESET_DONE	BIT(0)
 
 #define CSID_TOP_IRQ_MASK		0x80
@@ -58,6 +59,9 @@
 #define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0xEC + 0x10 * (rdi))
 #define		RUP_DONE_IRQ_STATUS		BIT(23)
 
+#define CSID_CSI2_RDIN_IRQ_MASK(rdi)	(0xF0 + 0x10 * (rdi))
+#define		INFO_INPUT_SOF_IRQ		BIT(12)
+
 #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)	(0xF4 + 0x10 * (rdi))
 #define CSID_CSI2_RDIN_IRQ_SET(rdi)	(0xF8 + 0x10 * (rdi))
 
@@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val = 0;
+
+	if (enable)
+		val = INFO_INPUT_SOF_IRQ;
+
+	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+
+	val = readl(csid->base + CSID_TOP_IRQ_MASK);
+
+	if (enable)
+		val |= TOP_IRQ_RDI(rdi);
+	else
+		val &= ~TOP_IRQ_RDI(rdi);
+
+	writel(val, csid->base + CSID_TOP_IRQ_MASK);
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	u8 i;
@@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
@@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
+			if (val & INFO_INPUT_SOF_IRQ)
+				csid_sof_event(csid, i);
+
 			if (val & RUP_DONE_IRQ_STATUS)
 				/* clear the reg update bit */
 				csid_subdev_reg_update(csid, i, true);

-- 
2.56.0

