Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267739;
	b=YlsXVSsPUpkH+GrwKz4BAWhYnMPB/jeQ9SVr/9GYmRYpr5AdhXR1vf49LL1uKSa53Tsq
	 blUdOTUenS02QisvwEZ043FNEvkJe/BQKYVdL/k/YvuSx+EhW1JL4QpSMpl9muhpSiDvk
	 8uXYT7eRuTeMGvZL4diZrVQmwwsR36MLvZ+e7QtVrfu4MQQzZNfP+WKi3U8wdtX7GW4DE
	 chY2igHBTTUzUtFdMQ0QjxMM/HyUfu0veIDzkTMOzv9t7I/kLnFLa2D3tI3FQTBNOAoJk
	 UjldsP/oiQHfPQN7poYAEPI0SJ0+ECrhnYlEbOqNNnzHG9G2EwYGmrL6Coh6KR7rnMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
	b=l+wqQH7Zl+gjUii5499UOS//wvXnDC3XA1lo48WcwnvVcrDqZCeYWck81y0Dos3O0+lu
	 0w2Vqx7VjcmLWcMSIipOzclhOVnQTtJw8Bcwvut8y224pX/TfNoeD5nbXTROdJfomBX+x
	 MUzuPjG3znMIPyHJ5K4FUkLyKZT543H5jnyTaKX/J6LIQgbiFlqsWV9DrVKtTNxbKnFtM
	 RuxfKQpWlcQ41Ku2A0gFzmXedMvnX45TOXp5tIKAcWy/o56V1nkRIpJ38ViFjrzx1jXjG
	 6wkXmU9nOZu7fLr+1hFV9/GGm6DACtXkTqVnzLgOjypUHq5SmrJafEpYyKFVp7KPAdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AOsYttvM;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35DE60A5BC7
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35DE60A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AOsYttvM
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so12037315e9.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 02:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793267736; x=1793872536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
        b=AOsYttvMzASirckNj31yHygQfa8Hzj5ULE/Grk8bspdy+doWgCRd8DGxEmbofrw4La
         yPfp3cavNNm57NDb5FNWXJKOQB/BxAyIt1onF5QZ9G+fXYo/cx1su2CWU6AiNrCHIPl+
         fY0UOs1ZwMRbzeImWj0ryR4ST6F2Bs5PiJuvENV9GyXTkTzE+RA2DaOhobp5QPnl9PIZ
         YrV0+yUCrT5aoAvQm3o8Hmt3GSON7Y9JY4uD4Xy6zoMb0OKHfTcx7y4vc0jq39wwyptZ
         Bhlk5Mk59465RSLgaUSvbAWE1bzd0Z7yrVtMu8lEMVQcWjYVLJNi1GYvxEuVjcirUqbx
         LRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267736; x=1793872536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
        b=O5vR2LCmls3Xwz+OCUuOD5gNQx0nB0N/sZ4VOHtd6ZWfB3bJTburqI8DKBPS14pTam
         KjVzrQk4HKl1gUlwUJWSHEzvT2cKtFzUli739LI4xy7sfzp+j9U3U8hRM7OQ+b75TjC0
         FY681ljqjiLMZdaZbXvlFRLHSrOK9lsrAnqEbaFa4nkTVPkVJzpkVAfZ6fHfOYie7dXw
         9T2KdEDs5fnonkiI/taH2LV77JnteCPnhQEOeifjwCvmKBRZSLyy6D8z28JiEuqroUrS
         zaptrGMDMiRqVKYTQDlAOk2Uz1im8zERTuz78fyzfdl8BUjbjWpDV0beC9HCA5Oobsxz
         BfkQ==
X-Gm-Message-State: AFq9FYKpf8ntwWMbSO79m463wpo7X5imo4CkEBq5lcA/pyj1kwW2zg0G
	8fJtYwMun0kQaeSAbh4ls4EkTdZcnsF3S1EjE2lv+ShXgsnOU+POM95EDZOB4F4ib7U=
X-Gm-Gg: AYBFou0EezJiniRoilVRNM/FM6p17IAEfUEgEfqUX/tRAqGNaD4LzqQwt16tMwTpHbL
	hSN5SIGaPzyJFVvkMENxp/WwoTgnS2MDw8I8sz8Z0BX87p6//HNRJkHC/CysRX14bnp7a/jSpeS
	rDtGIw4W1Bx7Oh52O7+SraWQ6GGVilTM/4/X4nE22fqzWgW7jTx1Vs2KlhGcLI4inN8k7NDxVMb
	dP2aeLNH0fQGw0X/LOYL80aNt5KAKxrsC69US6tM/Ev4yrDdXH10WhfjF49SzLjVvZkiXosIFEz
	sy+aXXp5CMy5YlVb1zW9RePouAmX7JDdGxC38I0ntixTTHfhr5HXDTEVMftbDw2oLXCNRCXmp9g
	1TVq8hRavyauaq/1nc8qXsp/1RpqABcAmXLAtb67G6MFP0dN3dL7ANoy3QYDtDjaXG6yhWd/yIg
	ZZ6Jl5y7oUuN5GwV+sPqbW+poG4hGajMhBcE2sOcGXAUdZABGqvKq/GowM1EDYg8OduniEz297N
	TkX8H1TADbuTUMJXFn3+pD0i10yGUloNTlBctAnEANVjVDUnkUKBgEYXdwoKWVMWQxvVktsclzt
	6rQUmKyR5T1l18i0CvI=
X-Received: by 2002:a05:600c:c08d:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a9678c2c8cmr85135935e9.23.1793267736309;
        Thu, 29 Oct 2026 02:55:36 -0700 (PDT)
Received: from [127.0.0.1] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm40437160f8f.44.2026.10.29.02.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:35 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Thu, 29 Oct 2026 09:55:18 +0000
Subject: [PATCH 09/14] media: qcom: camss: csid-gen2: Enable RDI SOF
 tracking
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
Message-Id: <20261029-v4l2-frame-sync-v1-9-d37992559c58@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
In-Reply-To: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288; i=bod@kernel.org;
 h=from:subject:message-id; bh=JfR+fNInU7PvF5XtlHk/pVeaxutrzq9CX2WhXWJJ9WE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq4xgMWwO/C4aCqtf/PsjoalxGqQoyPNTxDfkh4
 4jOqZA2CciJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauMYDAAKCRAicTuzoY3I
 OrIUD/0fQ8hbmWZ4pfadaormFipAx4Wysnqa+eFVSFPwk5sTi7qo2ysaSVkxc1Lza0fTwKCZkuv
 nbPam0WishR4FxP6BynfKq/xKBgVrQAGVy/Qdo2P7DB6TFIx7gvf99oPMdBSjUjVUOE2azkD0U8
 gS45TQinNzBWPWvWs9ohMFsyPL0kcQH36u2/VZg9Aw+T1FVcvDeP9pn/lAakvkol/kGkaUY6TLg
 XUcoQWMUhoJq8m/QcdYk8TZ8Qn62RNem4YpM4aKV33iX3csHKK4Qzocu4I+ZC/AqflzxaoEXTJq
 pr3w/EMDZtuO+VvnhQ3EOO0wD+4aSi45Mmf2ZJCKHX0C3qR718q+KmBVWGdb1mq8OvZfuIeEobG
 hVOTG++tGjzxzpfRUW4HfHxGKT3xLdzZQkU0ODyxVe95M3ZbUfUXTgaCyvjHLqsFvKZXObHcw1A
 Rc0BfwhmrP6sF8q3ZLnlIRfObFGWRqirX1vS+O09KbuRv15iz0+zpBnsi8stGhLLDwykYWKaBpj
 MGxRTRiIrbQOCjX7GyCfxD6UftlSaVMD6M9krvVyHkNBVvHkMcyCzxB0wWXn1bpZDEnYoPYO/8E
 v2EnPSZkOtHevwKnycsYxHvEgj9fiz5a1od9vqRZY4Oe9foGFSe91VLfioFfVNwvM7014F0EVHM
 7ejthoyFufZYCTg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add silicon specific changes to get SOF triggering V4L2_EVENT_FRAME_SYNC
'gen2' CSID. Covers SDM845, SDM670, SM6150, SM6350, SC7280, SC8280XP,
SM8250.

Tested thoroughly on sm8250 only for now. An additional patch is required
in camss.c to enable this functionality on a per-SoC basis.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8250
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eadcb2f7e3aaa..a351ac4b91728 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -38,6 +38,8 @@
 #define CSID_CSI2_RDIN_IRQ_SET(rdi)		((csid_is_lite(csid) ? 0x3C : 0x4C) \
 						 + 0x10 * (rdi))
 
+#define		RDIN_IRQ_INFO_INPUT_SOF		BIT(12)
+
 #define CSID_TOP_IRQ_STATUS	0x70
 #define		TOP_IRQ_STATUS_RESET_DONE 0
 #define CSID_TOP_IRQ_MASK	0x74
@@ -322,6 +324,16 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val = 0;
+
+	if (enable)
+		val = RDIN_IRQ_INFO_INPUT_SOF;
+
+	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
@@ -335,6 +347,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }
@@ -373,6 +386,8 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (csid->phy.en_vc & BIT(i)) {
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+			if (val & RDIN_IRQ_INFO_INPUT_SOF)
+				csid_sof_event(csid, i);
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;

-- 
2.56.0

