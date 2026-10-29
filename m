Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267734;
	b=vvmlWfCrGc4ZwpvBLOJXfFdlyX0/C8NJ2DEXA1xsaANCpJkICyjnNKvMq+PGNb8EEKi+
	 MlX99SWGi5RAdn/9tERejDNlNbN8Cc2FbE/Ixw/i/PpudxwkWZOhSjWrCEuX8eRNWB85H
	 fHOGocsqw/QIsT5nB1lgafZPSSbjj3DNpebkQRZfiihaDlFHazyAPHM59p1yFxy4Swz3Q
	 IrMpNETGhUy3yFiRYfQQ9H7MUk8R1x4EwpGHc5Endm3Kvh6FO2lJgW8kyBH3neOM5QBK8
	 ciQW4NjnTQC5xhPIQb//I0Rl43urw6pzMn1fOmqKGzIN0Olo2uXqPplwt5VPgK3lCaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
	b=HcumyaKb3+n9P2HGhQRhtNj97vHPVT9vWzcHG4osDdN/kmh/UOW+JO1iB8a5mZTGaPLl
	 OP62dQdqxS6WAlioinZfswnGgSjyIsd5+5bQ0Z7nTNXX6dT5w98+smT8cm1vvlL9G1UiX
	 xWDHvcYAtisW3xOKcBNF+ucauMzjCxXmyMVaFeph2uetwjBG69AmwbalnzqWgZ/S2EGdH
	 M8QrvD15Cy21r8fh21evrzpudSZayDW7P+N4OA5UEAfOAG5MOSmnh6V8LAXKJnfLO7GQf
	 GZefIT35WZPzmXsvUIIhws3qRsQIjzA5PmGj+bB1x+c31pA7zGIaxmRKOG4eaSdRjiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cXMMokD7;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477B460A2630
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477B460A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cXMMokD7
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1512369f8f.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267733; x=1793872533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=cXMMokD7mcfeH2AOuFyhj0i48INDwHmpExWFbj34kef61T201rUWCq2egO+Sas0o+f
         IbjuT4ao0gRrDFYhPtmpQjB1sNw1HSYXAz3wcA544TJQ5rdmdFbVsb3c334NEtivWSqQ
         PJjW5bBltS5K7lu3GtUkjzQ/veIAyJtWbETp16cxoJlh/Fr1hi3SzZVbeW+pRZ7yyI/R
         OUPX39mT1Hl5TpmOc8sk1O6KOLPqblSthDbRRigoqLWe7bQ0zk65VnaNn9i6e/aEkdvo
         Hjfrvlaoz68GUGchC+Y05/0P6kayJumcN4TLYW10u8W6xOvTP4fPj5ZA1td3u7Cvd/9l
         1nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267733; x=1793872533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aiIeR3alBrog5cELvWkVvv/B3sd0ft76xr4SIvuC2Ug=;
        b=wRmOvCfW7rLMWDe2wSM66dwUtX/vVZin/Q3FYWkP0ovWpYwfAW8qCu/2HVoKDcGHNL
         cfeObClZcbY/PBYjqybTTKMzsb3y6x3NcT+2bAG2LC/d7RLRoAXKrY+6HXRoEs3PaR6Y
         Sloj8aPfR9kIG1YBKmzmnEBMEX8QFsdO6IH6aIk5E4yi0whoKIVZhyWvyQhwcYXyKnhl
         n7BhUi81FBlQz1tL4P4Akh3ItbrMUVsTgM1ffoo/gHjyYS+urxq2lpiea28qcY4Tacd4
         itNpr7okCpAvl8Lak++TkPHeDhBKMQKsYUdqo5AeEiR6V/GO9FTiammW8nNuHCvolVEp
         6mYw==
X-Gm-Message-State: AFq9FYIJ7LR5yb6PsnveI0MZCNCEuS25ylVVkMLPUGyR2MQ0wZz1IMug
	bSZE+DCNguZGPOR6QBeVmx6YadG/lvwnhpwKut7FYBcss1wufSaYxdPZOpJPhxYbe+g=
X-Gm-Gg: AYBFou2HDXCRRi7Fn9srQdwLdmmATFCXQrNYnFVEi36TtM17ZY0rPjZV8V0zhpfHY63
	XI2eojgg3fBwVLhtXQdkJwXXnWW7yc9+nmMJDPMytXFbm4JI9hNgFB8ZtPWTHKbo1j9NTrfkGDg
	eDP+6CqhUYVNaquuFDV8jjPOY/yIzoUMQfMds7irTL1C7Ie3R7z9QNonxhV+3D9clGP5NjOD/M8
	I4TpmCaOo2kNAXavRuePvgZJptWXxfqdgJ17pJFi5g2JFjqVnFh1DjBOzuqP9fv9XVB2Dz2VID/
	lmYoaU1+4NsmO/66hCCKcZ3LhlQO6chgUC+Yuim6J56pVjYLxfRuBO3X/NfdqMZfwA4VNemo3kj
	x6RGvGBRI6Nudesjfiq+V0XBRF13PBQGk46bonT5QmabwOUHXNkoPcSyBPTDmZwIskyKPq+Fp/O
	aUNkmNnwpU2I0VUUB1yj9biIhSWCrZIsH3qghBGB75iGGp1WxkUfwR29esdSTQDbcaxksFMb2ub
	QAQSgIHT0M0PJsiYVp/LdhFQUhycCO0Yuki9HB6Ro4Kz2p2pqBsD1924Lyq0dzKOcmGVlwPSVa8
	2QuhL1b6gg3NN/hrKOQ=
X-Received: by 2002:a05:6000:4a0f:b0:48e:64e3:e923 with SMTP id ffacd0b85a97d-48e64e3eac0mr4729613f8f.28.1793267732733;
        Thu, 29 Oct 2026 02:55:32 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:32 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:14 +0000
Subject: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF
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
Message-Id: <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593; i=bod@kernel.org;
 h=from:subject:message-id; bh=9Su/hrp4xXNhLORySBV74mmMzNRxA4TivC+heqLtS6U=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgLpTHdwbJ4RtkNN2neiyQX0O2KMdWh7Elly
 Uu053FBHDSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYCwAKCRAicTuzoY3I
 Ot+wEACc+UqdBo/XlkBNjOV2Awsxijpo4r+lFLn9HbCpa4lp8yDmyg3yVTcMjgHTrzvkP2fjS/K
 HMAleA48S8gpbz3iCRLaEg78HZAs7tufiaV0PJScOhu7GrxzrfWOjiJ8m736JaRywRX4WOEny3E
 hO/WrgWaSqEMUiyN9Gilu00lI0iQ0muI2r1itia9oO+Zgx/3L1taJE3bKuvE28oNzVOn4plEMEq
 UCG47xyAcF6oPZrGDGtlzRyS2F+6BqORfy7CCJBXnlfNTjiIp0ZK3dVB8FFyawaziFah1LduT1D
 ar1BYVOIpFoT4thgXsZlC1ORj40Qm0faf/gWtWZr26exNp/gQpfNfYiT2mS25UOkgfgnTH6j7bj
 l6GihOpghINipjMzCgA37HgZECe+4L+3so/PC4f74XTlAn+3y26wFySo40ylJ+xdoxKXGWgTbHd
 RvHdOe/CihBsIyGvd9Cf21rbnDCLcgETlp/vMsIqpmZzJGPNouiPucd841fyi/tQYg4U5GY+sl2
 T3K3DXDdf+Td4g0KVUVy9RDRJsi/EUnCZbhh5m/f+mOwlRFAa4rZaqb3mgJ3fxG6618jIo9M1m5
 7hv3k++f5BFMrQYHpDjffGVSqcKoqzpxLJL/xPM10Oi48um2xNAVkTEoOTPpR35i5UEFUY8Ik6F
 owrW8qs5c2h/vig==
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

