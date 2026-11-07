Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013322;
	b=v1Mnm7TWOe5RTWY1kk+dmQaVvV3YFO3KyZkNkHOW3YAJR4/CWCq+FFkuGeX2QyekmhAW
	 Yq1MySHgk7izckEwPlHBv6M/yeXn1rZl6nm4Hspa2Kad2+pDBTjrm7DMhhaZa72bC5jD5
	 QykoCrQProxoOQZ8vIdA0JB/2KDtGo/YYZZ0+aJgoerbwxoWrEstDyWQNdaEzpsnNHYw+
	 KJudwkPxWZsIDO66fpSGE6JmLHScwSzG/ASG0CPOUIA6uCEzJ6RmpS7iuZSyC87pugDL6
	 W0CsHG8v66MHWKXwQvsCxjHfSr4e3RLJsJzdiQBa156mjwYDrklcCOd3jTklpINWLGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cwULloUIaYoXz2vD6C9IL15PuOFsPnKMD2iSjIzuNfk=;
	b=QaTmVQMdC/cpfJe+4zEuPmUe7/Z26sisEZ7x3SdijGE5DUIOJTxzflr53DJZwHMBGoxv
	 3lgo0M4B2yFBM0vzo/Qsmc6vx13yAsykIINjJzzALSQcfXQMJHHZHbqpYnl1MQjkFa87U
	 lOzB/g9Aacl38ViDKg8mM+/D9ieoyvifCGfYTuyozM3w7ThACYHPlbVieMiephdWGmYbW
	 LY/blz07dEZVY3f4ef0sUEjXJ015qHnSwVcSjXpMYi28LXlO9Oieq5VoQD0UDMlFm8SIJ
	 Ht8BhzWVuSmgbSVoxa4u7lqT9+ggizGwRIgoWYUjDd52kSVw20kcO+A1aQk4GCbSdVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gZK2BcCc;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CC2606D837
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 01:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CC2606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gZK2BcCc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso13219715e9.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 17:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013321; x=1794618121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwULloUIaYoXz2vD6C9IL15PuOFsPnKMD2iSjIzuNfk=;
        b=gZK2BcCcaQ+9w/+bYNY/xGefbwh+SJhOuLgDgA2JgmHOjhWqqu3UMxf89GQBklRrSd
         fKLpqoW39Avdc3YvwaIUb04ckWA+7q4BzimDFYdu+AUbP6TpJ+qseREnivgjIPS/TLse
         OUkajj2ZM5D7G7QH8mOAwan/7tML9nnmdbZ3yKfiHDBmMPeeYpZZYZI8nst/uNLkqCil
         fzn4+AS1mUwPXruaJ/SGwpcdRpC/xmyTPcJq4spH1BKV9wgmkLES96xR62cHmP3p0DqY
         6B5PnyKMJxlzktYBrCE5EZzmi30GXHlufFGokMITp9xLYMy9rNn2CZgn4wHGvZGpzbWF
         No8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013321; x=1794618121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cwULloUIaYoXz2vD6C9IL15PuOFsPnKMD2iSjIzuNfk=;
        b=aW+POikoB9EWyKFtru1I5QFDQbTR0o+SqhmWNiFWvfG6x0jQn+OlJjsd4iC0wNQH1w
         8E8d+x3M0XQMizzoWVEvwKPPgPRujwdYqYlPOh8Z2Shg+ksMzxGW1FNKFKOhxBEn6zZj
         XaWGO84zloVA8xAWdLLygPFFLKUmvXL+jagMNDV1UdVncbVxVnmIbJ0b4IpvPsJuTXOa
         aXwtz+P0voK/xIrxT3U3E6L6FbGXuLemUdPickGRHOgdyFUJlDCj9mvSGOMNBWcLZDh+
         VTF3bOMxtEgZc6kgOYIpWsq5uveAdSIIBsdD5RP5f9K/8YinV7rTWvvsF6uGDa6vGC+H
         aRvg==
X-Gm-Message-State: APuU4Z+KXTS8EoKsVIneiT+e/1WCwHYNO6iEA+8r5ntUeByilj5Ehnon
	4ROiP3QxzTdTaLkqTl9rwV930YfMqww2Cll6x1ZTNJWLKa1MjaQQuKgE7B7lY4BFVQ2nBOdTxtr
	MMO94
X-Gm-Gg: AYBFou2ebl+xxdffSOQzLZKoatey3pHni/+uhcjDs5gcxoXQoDpRl2jYqhK1CZ6sgV8
	m42cy15ANp9dcecFd4NG2zlNTRFCLkbbwUrZZt3K1vqW9uzHwQaDBJXGje60WUKRQIbP7pbXg7d
	7dK71I2Yh4z7HYDDzyVfmXqfKsOnhrZVK8cTTKJ+LwzZbePEC5uFJSzydpLgrDF/l1oZEIJVQhd
	gQrj/4k09hBatsJ0u5rqu2/cQ7WIa/RquED/+lz+a4eA3uxFChhDIOO+wx3F7W/USlmtzsJK263
	MkOgRHmypOJscXpUT3gNmHtMv5F0eVArOf/+OQ9xudW042aNc0Q2WVHwR4gtJGFtX/uJR+r3e1h
	UjYZ+LTFZacaG+Rk2wyFOZeCojziQDTpL63vBPJ6w0kwhSdwv1GBe2dAIJfb1ye7YxM9H2hzU7f
	WR+vg5h2kn30kY1Jis+YXCFbo+D1GL+nZT89iWl5X08F3ukIzNrgE40z9ffZyBT+FTKiU0eyY9D
	XGhZlqDmevuplWh7MLqfC2V2vn1GV6vsxK/kjUHdk90xfVPwfBlNqJ7ZvI2NTPlDXDntqCf53RC
	zxpPTGVIHGbKkIGBYaG/kA==
X-Received: by 2002:a05:600c:6814:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4b6df4f2554mr82962045e9.31.1794013320886;
        Fri, 06 Nov 2026 17:02:00 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:00 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:48 +0000
Subject: [PATCH v3 05/11] media: qcom: camss: csid-680: Enable RDI SOF
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
Message-Id: <20261107-v4l2-frame-sync-v3-5-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922; i=bod@kernel.org;
 h=from:subject:message-id; bh=fCzv68buAwxsczHI96n29xaXwuX+5lf+63yPz+cuhLQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh9zEiRkUUXRCR+iMuw9E1ljDxeTvSSlD3OI
 B1gf0EYW9OJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fQAKCRAicTuzoY3I
 OlriEACiXTL2j1V9wLVWE6FebRVlIUL945TiGxvFSQyCEUXpAcmSSEYZyqczz3LFZsvlH55pJ9G
 kRYoFyjs0i1PWG5yqMYr2vSKg7eg0J9Qe90FjYMXAG/xu9I7XPQUXBbqSz4hXmAqpYTszHFHBPB
 G5CKm4BMYc/EtK6lW+TZ/mbGixVxHQt14aKgz36IjPErjZHfq7E1AttFH3bqiidB4NS8cvuxkg9
 0gOvMQR1D0J51PKCN/XXzDjud/z6xzERSy3lY4eoYxOC2PHZ2piSyzxLtkT3agbNR5+/pNwcG3H
 gr14mA3Mu27CZKzDVjUYQIbQLTAuqIb+MGHLC2MgmRBuTNpIOvjUvWdbooRUv9VJP81BVE3KNPA
 73Ba1qpM7lLvHOGWqBkA3GW/uzCn1vrZkGzOJuRh+7WBPRyAMpiKyGQJpAjJA0fKInDYcBoWQ++
 tNHWxUP7geG9khibKUzR0499UQpRVmDqDCGEJCuhszglsA74D9Ar3Ob6mec8OnfQ1D78XwxVAxo
 JQdOzoOsBAkVokySUMMstb2UvaTHLqi/4/pSZaPorL2uAYPu2kOkk6M1n94uFMd90oMmhCtUdDA
 zJRMwyVkGK+OywgNI09EwW/Hl2AqTlH825wmvoLjULZU7OTIlx97YcvzRoZ229a9Fb8nawihJ8n
 erRM72EIXw2/qiw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Similarly to the sm8650 we can quite easily switch on V4L2_EVENT_FRAME_SYNC
for x1e/x2e which uses csid-680.

Do so now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 345a67c8fb947..452640e72f6d5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -296,6 +296,20 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi)
+{
+	u32 val;
+
+	val = readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+
+	if (enable)
+		val |= CSID_CSI2_RDIN_INFO_INPUT_SOF;
+	else
+		val &= ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
+
+	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
+}
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
@@ -307,6 +321,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
+			__csid_configure_rdi_irq(csid, enable, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
@@ -395,6 +410,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		if (val)
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
+		if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
+			csid_sof_event(csid, i);
+
 		if (val & CSID_CSI2_RDIN_RUP_DONE)
 			csid_rup_complete(csid, i);
 

-- 
2.56.0

