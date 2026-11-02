Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627826;
	b=kkIggnrnZfR3Ruc+7b0Z663ZQGduhtmB5tQht/T70ApPdL9L9HbKoaccw0iW+osoSuta
	 KByIX/+cmP9RsreqFjPPGwbG8hJcqv0/NqJF0Txd6T9eN0x7N3fsImaLB9+tFT5zTRTr7
	 /513DU5w7lhTgD7k13BmjwBRUngfAwkfkNpPNgw1ZFvfSn+nTpP2OqPDsc1Iqkx+04O1m
	 IKp3XLJ80TYsGr8pnT1EoJo2OSQZF12gN8uLQfmt2gM5vV04Tmmlgslea2fHz9iCFDkMF
	 cTv4gZwu9mZZVaBdfpUcP1LiEGnZl6Oy+2uNI5BAfsKg3+qYxdsol2ImWNp5ABVcHlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
	b=l5ia4FxNOI8aCEmRG76365oK0asn/m+rn5b7XwtcRYI9ttIfmRwzdVsFe1pPVtpuDSkX
	 ebllbvlV948m0ziXlwpjUfMlkpA4/kj9SnPc0IXX8itwg1Vm76kEAD32S0FJ5K/2iUmEa
	 xQHJe4bjfV7l/WuLmBll6m4tUrTdZTiQGYu6EHuCSMpE+MHVin+TLe8LnAkde+918GDJq
	 QGN6T7ykJB1AMnTw7rdMuh2JThyde2KxU0KJjoeh6+Mgr1VumtpqnIGG7qn+G7DTkYD+H
	 NWjh+0GLctoibkDU7+TZbOe35OESnnGzjsMRpJlrIPVKFsP5P58zR1Ny/YpRKeW2L2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aEzKUd0L;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D2606A32E
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 13:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215D2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aEzKUd0L
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so32539435e9.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627824; x=1794232624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
        b=aEzKUd0LLcWYh4KCjvmLuI3NSY4fNBIhjgSk0m+PfrEDsLXnvKZeT1nz0kpDeGS+L2
         z7u52793lfb7BoCPCcgOf7t/H+JZTAQ/il2OzjrYK6SVhbp/DJWIrvBgrebrtoxbYmes
         Bp9gPypSx7B/Yyb4WAgnh9MHLhw9PeD1YeWqHNbfKosBdIUl2++m/8xjxQKd8EwcSrz+
         5KUfaYvLqcx61z6GpqSFYAPNCSXQl1QNVFaJI7zwJkQw7E8e/+jVGwz4rr1OLt9CThy7
         U39VNOe00BPS/drx2UYDMz4gycZq/4c83k3ij+7hZSoD0bMZLQLnROF/QD1wbWNsdUKd
         hFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627824; x=1794232624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3K7UJYssYgndcsY5/xbkc+YHKRaobFw80/xyUa+zJg=;
        b=QGSZNZvLtLSXS76WM+vCAo+ALS8hTxml2Oy9m/IoTdWhKJ1KgEtTinoFr5kcxXbOqi
         1qiDvov11/CY9FXRyMyTQ1eOqsD6oMdgL/johakprACyyA9WMgk+hrGEzSjoUrW3yARH
         TuOFhQClqKXpc7ZeKZ9cq1z6p0+zJRQIlOr6fZ+R8YMn9aYvCnJHlrnuTcmOBwMk6GG/
         agoWgQzki1UkLIlR60ydCdQmwuwrNMgFBMMI04qUjBnCuM0vpZMVPRqct1Wxa30r9Ve9
         VkR4+DoB36Ww8XLd5JNm984/O4Zuya7KQJZH7EPK2oa9A8RSx7NmjPVwn5W71BADsrdr
         XpVQ==
X-Gm-Message-State: AFq9FYJjYZ2J5lGM+XSr5PJNnj8ZkKYsNtDeO8dh8MxbAzlT1ej2mSTm
	xj+E+DgwSWhz+et00C5OiA0R9I+PzVBzJFRKB+9huQq9S+PlYjStT879JZe1hLeUjEk=
X-Gm-Gg: AYBFou3BytfqSFVtAFIbKM1HvMA0WMhBu5jq/EgNwWuypHC+52axhIYhiWqO6w4+hja
	xGCttehuM4OjFxgzEfstRfxgTkFGdzXPtxH6NhcDCdhrvIGz4V8fHbwq2Gzdu21hiTUH8W+5EtB
	hjfmMIxwAsZ/SvIt8aOGspNA+NAbkho8n3st1AffPKxgAnOLCQwdYdVdDFUlNoR/5f5PpI7B9uR
	qtvDy9K0zan2CFTlGXWabnUG1M42VVdsMuYDQYbofdeTEr9rmZtldXrAPK+OLOxt/IbQ87UQdbL
	UabnG3u2QRCCLOJIy+62m7PAondwTWRHBYPL4rksa91p5kzovnC7wq+XG0g5gF5R0d6gZqjGJ1i
	DQJW4TkwxqXarRAWifhpPpA9Hj63RanMs/wST8t7FZ966ZT81mucSsMZYCzertRWnqO0BEeCEXN
	RZe5uYQ+sf4aqSoRMgNSsMuMKhzkRsWQrIDhdo/DwvTaQ/avY9PZPP7WMshtCx1zMtQK+DyQQkK
	WniaGhkjTaiDKE5LMtM7+GbcceADgpRDk7SAPB8Zs1MonR6c+WtnPlXwt9aJ+5gwINFFX/YOudU
	v0vq+YrU6HZ/KP7yUw==
X-Received: by 2002:a05:600c:8b55:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ac19234a06mr224682515e9.31.1793627824537;
        Mon, 02 Nov 2026 05:57:04 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:03 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:52 +0000
Subject: [PATCH v2 6/9] media: qcom: camss: csid-gen2: Enable RDI SOF
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
Message-Id: <20261102-v4l2-frame-sync-v2-6-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288; i=bod@kernel.org;
 h=from:subject:message-id; bh=JfR+fNInU7PvF5XtlHk/pVeaxutrzq9CX2WhXWJJ9WE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JamS1/LWONiOT94hoUv29jshWGdAlBEiTrUs
 cthxjtbbiaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpgAKCRAicTuzoY3I
 OoFnD/0SyrVl/h2OVTPe4RwwjfsaCtRmmwgsVZU5wOmrLbky5alPlEsooEnIGyFj2BodbCd0ADA
 ggRG5n0M+zWHA9+Z6QLUUJGP0u5XRp3ZSqSucngto4yUCOlfM50V8pn/XMsneZliQSrXUKIdf3W
 t7IkHxYq77+Ionm3lVDU9WF74fbK2t9GitNhKCS1xFJba4vZ1E+FNt0+rKWDaBY7heJelMrI6xZ
 ihxMqm8EBomr/b1ZWgKQGgVtDZsI4TGBYb488BXGY1isPXPhyNRPT2c8DqFcjGDvuIuXKxBL+ic
 AosUAa1eU42XMS/DUs0XS1DDf/Ch6rjk3Yy9wb606yNxNQI/6y2BEajd7yQDSUVPBJxkE3nHDNc
 7qvgrUYhgTgcXeWQcWI58mtxWJMokmtCGrWW58+81JG/1SNJii9Dyy/9/j0SMk01l3UMh0zkC+f
 c8ra93yXP3WrI93weV6b1Yi0VJ+Ukvw2P+md9fAZVg4we2Xe2/Zrtj10FzRWGcL/tNKqCwpXUvx
 EvpEqo48Xd+Oz9/YRP/VZvfNkDqeBo9X+HnNNXcsAfTJhy1st3+xdzP+cJkuwUH3618WEtjJVCT
 83G+YhBdHlw1KHdftZ/HcG4tSPLWiUurKf1lFxgFcnJdr0lR26DiefvTLEhfHGNEp6ihdcN3LdQ
 IcnjNXyRon/jQPQ==
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

