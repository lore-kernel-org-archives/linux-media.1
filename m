Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013322;
	b=sLZ0wTlBkdGiuupO4yBh11GnHVatI60UdSS7BG9UThqdYCo2VuqMnPo9RNOlmMlpTfdb
	 zFkpZpK8PnlNb1AEsOM880e5Z4vZQy4wz3Ee5Nsfi4vkiB57TVPWNzhlOz9PMKSQQbqeY
	 OzVd6NocqDG7HJwQmvFgNy312IdKpTLUiEV8LIX53SkgNGzrjMlWwCdvl0YYSqt6vWUO+
	 Alh58Sjpeuna5Ushnxo+QiosKgilJdJ97QebiV4zmhPn/pV/+YzSBPO9w4E9qxsr9PpIK
	 2FqtHMRBD7HKnpCCwJ2FTu76G0S1mu1ztYQK/f4hFQQKK1BaJIQtwr1aSODliTeQS5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=h5cClEZ8YHxPTxgdJHm5HGcyNkbNZ/BnVXKmclhqFhM=;
	b=bL4tXeN1N7a+VLpRniUtErS3XB8cxpkuCCiQKR/PGjZ9FABzfLk0NxTrUQRYtWpgpaDq
	 1HgsD4zdfeBvblkCZu0rrKh7GYYE1bDbSDS5t2py+3DAJEcDvUkoMQRntEXm6v/W0qJYR
	 c9BGoqmdjqp2nm89coQfbNT23Sag0YIIiebpDkZwqqP6mOI0upfb6TH9MZtVM3FBTQWIW
	 mlGSkkOVXdUF/nXTvy2jHDBxrS4eP/jfMRBCoBGymJNIQkOeEWbhBYj/EhWd58eTlN8am
	 NsJYHaKzL/2IBmxYYOSs4UVNoAwon75j+3u/x9Z/03bj2LU0HJ7iJWo6DL80n8+yLhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qMqWAoz8;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB69606A331
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 01:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB69606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qMqWAoz8
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso10677725e9.2
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 17:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013320; x=1794618120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5cClEZ8YHxPTxgdJHm5HGcyNkbNZ/BnVXKmclhqFhM=;
        b=qMqWAoz8qjktZHehFwf+GXFohjzE+4FVAvpB/9nPmfFGZbmN9yVUpBRUDBQRvqNPAk
         zjdniukz6G5l6DkgTHvkm3grPIPY5Hd1w55T9k7HA+k9nPSDbtqNOk1Cw/4UqueUR/ku
         PF/9GC7PhEYVlRX5Q0h8OkxcX1DmtYEtwLFnlyF38KkCEW3tWLByC/1nVbgNLOmHDmON
         ncg9thMI7KGBPEhx85v6GI3e460vyrEWjO4o8+cUcLbkbFPXxKYnwRwA94O04KTy9NNC
         bcOqjnJOj+Sr3u/gjZCKXdNjVFJgW4GZfcAacS8b6lvCPtPwkaEHNNAGLyxMN9otbuBO
         nORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013320; x=1794618120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5cClEZ8YHxPTxgdJHm5HGcyNkbNZ/BnVXKmclhqFhM=;
        b=eM1mX/D2WTaaS8XjALV9y3+QJrIl2RbDjXGNKWhcNfmyYttcThom30V5dKUV9VvCw/
         AIifWjaM+QbB/T9BqWKCZk6hIHCSr2gFDw2LJef30PC2UtbMgQN/qt+03TQSywMHQyA/
         cP5JwhscNXRL9aPDeLvYFUF5aGMLPztKRTLjcwew5bfrCAcqYaBhNSR+/Z2QJsepeu+h
         AYIJ1lGt/PjzaLEm80Qa3ZPkoM/jB0vand82vwNPC31Cyg7Jv2M6K1mFrGBjXkADWxvp
         BxVZrzsMC89/+BZYu1+ioIXj9bxynCGQjuu2y76XerSKH5T4KL+XNp35YqSi8pFheV0q
         sXPg==
X-Gm-Message-State: APuU4Z99nnZnl17DHVHm7Etyf6d5qsk72WCsrkWbpL1o5mAFc7WVfQj6
	+AXFl2Y1xNuG2wn3y2g6/G5c+kngCY6Lq+hfGXjANDF5aE2hPECr3Zkz2IjZU35RNC76iBKEUuU
	ZLqDq
X-Gm-Gg: AYBFou2Tv8Off3G5qnyGG8jPjPLNrxWfYsZ0yRFfZ8cVxEv+APc30smEWcLasMvssBN
	EPom/St7gD6cchxikk8j+Gfs6KJl//olSE9s3V2JFWBGxvLj0EzXc8rtvAGxaQRmMPIbwdgL50N
	RqjWdylXkQuFE5UAoBHrTb4+9m09YXuCqgt7FL1Ie3H6dyFsuY0s420+V49X+jfp14jFQkNbNjh
	M2ttXEVwflCzP7p0XH2Kdfz4/r+6C6Owwp8pcRJdn0vnAzlkR8jdqdrxDwCeE/Wj3HRPfdbF1TX
	yVZF8YLh8fAsZ43jp93+hysGwuTMvHRLKwWsdzUMol8Evw2FhCkcyLTXs4HaOm/LT3dsm60Jx4x
	HwfmZjqnK8FMfM/MSSiiJv6SGmnTYkaosC5beedNrnEpSAB/4NStsxO82M3jhm36SxArW7ZMQPu
	hr8P1oJYZLdugCCe6Gd7VxaKjKtQVBXeBOPenOeBDabDnNa5zDXTJfSaVA+FcfARiieFxlZEN4D
	1V5eXmwcvcyol+EUxDt75cBDltCkeO1JG+zlOEthVD8bUjX6pz3T7WSDNdQFDiQ0xz6LOE6ycAj
	f1nr0r6vXmQy6gWL0yGtLQ==
X-Received: by 2002:a05:600c:6206:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4b6dfab3fa9mr65842215e9.20.1794013319963;
        Fri, 06 Nov 2026 17:01:59 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:01:59 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:47 +0000
Subject: [PATCH v3 04/11] media: qcom: camss: csid-gen3: Enable RDI SOF
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
Message-Id: <20261107-v4l2-frame-sync-v3-4-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2702; i=bod@kernel.org;
 h=from:subject:message-id; bh=WmiBVZpxVNzE2zPZyHjmv3Y9VnCeYFeJ32iBUCdu9Oo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh9/QdpXNE5QhJ6y4CFacliB59UV5IYRzHn8
 pK6MhLJ4haJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fQAKCRAicTuzoY3I
 OtyKD/9ZV3Hf/ph7UV6M+liMAapx53DP62u6aXAcJxJMSjI2BK6QaEG7JNrWURz9tolCNQgYpZc
 b5ngEEntENBTZOfgFY0rU8ZT7dfK/SoZzPT1AUD1f0jg1Jl8YBii7vUhGpdPMtAwktgSc30EGT4
 ELCr8F/1Qo9brvy4vfMBniGmH9nQUVBrVr/L0Ywg8SAG2f8kvdJdzEJBrDl41D92tK+rJ/72Asn
 L1z7on2u3V5KlToMEHe0MP3M6i5oAN1JN0PiYXsvo0JJ3lpXssXXdJJvO5ZqsZ+uJE//mqnZmHi
 /mn8BzvkKUkwizTyHlKB29UrUQZbo5XeXzGtnTS58aoUHiztwDDfTuBJHCp5n3e/YrmqPuYzUyb
 l9wWfkIbTsGVzg0SGREQknXtqApzx1OhQNo40w0NxJ6F32jaxIhOpEctc25JuzRzergs5ayEJ2S
 WiEOnHpkVMsr+/M1h24wZ0gGv7dHWttSaLud4XSo7Ju/iNdYctwgXCMyrwbIaVDko5XloGZ95D0
 D1zy9F7ruwEC51rDj8voCQAvQP1029ivjl/BCcfkhU/3mP+emSivlfak9ACZfA8d9T5yIz9+sL/
 D9rN4nkWxLYENhVsOYS7W1LZ6S70iWSKYc1bZr2b8tHoKimn7tNVvjIZ1gjO58Ucj6o4GNy8EhW
 zt9LgmZYq5Gxyyg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in silicon enabling code to generate SOF and trigger the routine which
produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
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

