Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601589;
	b=2mkqu4DkjEVUzDgTDst/WKnXx2Q7sg5VDvI8mo/y6Y0Pc6bW9RhgdFNOW/QghsjkFngB
	 QuSwRvPDaNELchqx8EijjOhTQIhz6wMEsp2+iISJKBqBzW6bypBJ8BNIfl3+tuUb+hQK8
	 Np/Ig2Oukn/gB1LYoULGWVqJxx35R5uay12sxgKlhywThwiFWr2OOto8wSaIYznEXSHZ4
	 C/xJwQIvx2qwG0hcH9ewJgC7ufZmzgyCfl4ihkC/WDS1RyKPbw6QkQSzCW9phiB2rBNU+
	 YgNNclfTt8qOXflUT71iyQIhryjur6TdYTpVGVLW4tQN6tIKN/ApAjZBOf07isrAh+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0m7khPEiz30Rha/KLLauj8YmgXwFrxSFcaLFsZWMMU4=;
	b=k0PAZyCw6vLT/YomYvTiIPM8jMOk17In/ZwjxgEbjLRuX8ACupk2p6m10LoWo89jSla1
	 IwwpM0cYOGo6uJOF0P5Lxv8+obaqEU8QY/A5WCTw8QTNwj4oXkupnyl43YLFo4Sr7WvQq
	 Zeh38Z9b+BnXdstID5ClG+XEsV1vwTcPXo+TgJz5Bq6Ymsk65XSiogSAppws1jJt0KiPU
	 pBXS66xjCyiP1rvksaTI1c/MoF57r09xscQ8k7Mf/vbsr7rfuAeZj1bPn73+jZXOM4aIf
	 Dx8xCrNm/kh4R3AXaiR/ocKcaEYtURe4tsA844WKxeFewnlMQZtbWR7hGRxUDP1w8ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BiS9y+L1;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3349C606A32E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3349C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BiS9y+L1
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa5103so3293123f8f.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795601586; x=1796206386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0m7khPEiz30Rha/KLLauj8YmgXwFrxSFcaLFsZWMMU4=;
        b=BiS9y+L118TIRP/O0b4oS4RsYpCngmE+0RVEsHN1hRbh4oZ/at9HnPZK7uA9x38xNE
         gkPyonDnsXNpbGOibvyBwiN35fQEg/U121wyqkep1i9z1bPZ5s+RuGcmN1PxIGA6aYcq
         1X8IYy+AxaG7SyEf3+W+jrq0ynXilC4OqgWz30AH1k61a/FvEq0aDvIPO6WaXlGtF0SV
         qryaCDQL8fNkIx9mDDbAKoQd+gSIDIsE5ePnYZCHD7eZ6lwGHZxGJSFK+tZo/new5x0d
         /YrNeC4hYrZsGD63r+dRLOPUXtt0mmiJMydCG7x2v41A0At/tjQ0548tXkthjhiGdri7
         /rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601586; x=1796206386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0m7khPEiz30Rha/KLLauj8YmgXwFrxSFcaLFsZWMMU4=;
        b=O3YlpF8xZ5NuuB1bjpktJ+IYyS3akHiha1WM5PXjP6w78FL7BRs4PrY/X6LcfW/4dy
         mc2b7FucDNOCMixg4BVqQx6QqaV6QYFNticpcPtFXvUKhGSXV67jUU3MNfAEnZC7ash/
         UUO5tncY5GAjSyjrC6WU10cSA/oQJ4MTHDO+5Tn5fTel7xlIzvTJJxJJyjLZcUSz/nZ8
         jTU6+jiA4P/Od6ndow0LLrD3MnphdVbvgNttqUSTBuaI3AEq5bWO3sBVXknLKvFhPH/2
         /Dp/j518lOywXD/IQqcSi723/kaTIRO4iBDFakkIjaQuedFyv8WBUGKTm1AUM6p+Pfky
         PtaQ==
X-Forwarded-Encrypted: i=1; AL+hErHqj7BCHleWqvKqL8wh0OXhPsDiPXG8NkSE4SfFkTSrNELtJ4+iB+KOSSCeIqIN0cY2UYPYZ05bv3aVNw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5ie9F98WvxPo37R4CnHnNPK0QV6vReuozClrZN2JgzT8S+aXR
	8DvN1MOhu8525E80Ih8Sp+xzkGmKmUYPE2GEsSbwmwO6d1q7+1B6zCBfkSVqXGK29vk=
X-Gm-Gg: AZFdTZchxCA4Sk6e2lCDy/Lvvs3AW8kS++ljeq0JSmSHkoYpPde3ZZkngXwk447CDYM
	3et5cD6Rz8yj7XUvZsPB/ytlLG43xZPAuZqjTsUqlKWlE/OonoVN9f8zNX8O0CAYcGY2JfYDfXe
	R+TsQ+XkkHnPapa9wLbwm6LkYnHVRv/mA/Mk/wdbN/0F3IWw0fWLoYpB7BI03BzMRYdiEZPFycj
	JdgGXWKIxQ0gk9xgi7yn9Kh1CfrtjPFqN168GHrMfvt4SxjTy3XJ7VmVeZs+pYInhZkzMMuwQFr
	DwozyYnqJWpAk3N0X7OlFukGGy8F+oiIhg0t7AU2CjP3imILfHt5+vEcLbJSSMDBo+cAea4qqF/
	Nk2ihoq68fmU7So9bh5fnNY+cnsfAmaR3sgiI/u98vkjKj/xzKdFQglKjoWCH5y1c8igXFIY7ZR
	2O3iW7Nji12n6vnzaiC8W6APhR/ONt4HjrJy+PyEbaLEiso2YmpMo3CPXn36NXSL3es3dzbg+Ml
	H5/Xa/uSYCE+GxfIaeXqHBNpnuHGAdtAS/FOLoCbuUDVt39fuL5gLEdW5RZTBJwZp0pp80EifZd
	w00PzNBsADyOuSAMvIMSWvrra4k1YJcS7C2QqFradb/uVJZOYA==
X-Received: by 2002:a05:6000:1865:b0:4b8:75e5:301d with SMTP id ffacd0b85a97d-4b875e5306amr7387173f8f.0.1795601586248;
        Wed, 25 Nov 2026 02:13:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm31713382f8f.18.2026.11.25.02.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:13:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 11:13:00 +0100
Subject: [PATCH v2 1/2] media: qcom: iris: gen2: subscribe to the picture
 type on the encoder instance
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
Message-Id: <20261125-topic-iris-encoder-fixes-v2-1-fe6af9761f83@linaro.org>
References: <20261125-topic-iris-encoder-fixes-v2-0-fe6af9761f83@linaro.org>
In-Reply-To: <20261125-topic-iris-encoder-fixes-v2-0-fe6af9761f83@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5466;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UV1P82q5MEsZSCbv4RL6iiC5cp7Sf9M19lFf+zkJyBM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBrSvoAM77i46zPuYqHDGTaAe5WgLoMQukeX+jO5Z
 E8nPLZKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawa0rwAKCRB33NvayMhJ0Ua4EA
 ChMIGi8rCsWnbUWh14gNKJulszTw2Oyg6Q1iTDYks3VZW1VHe+aMsEwVi+YQWCzJBk8bht6BKuyzUM
 trSoODLzLaJxT5kaRUA4AdVqB/FIHEvoKy8vnvTp1c3vwrmvChGQEcomEZjwi+xWBK63N/+FbaJFAK
 sO2+smYhrL8jcQFu21wXNqR2F9P5X+Gf4kD5+mcW/+plpk6WqXsdy2AsMA58X7t5u5d0bDbg7wraaO
 mBLeCdbz6IceA4F9Y4hvJIE8UbnAOL2AVJcqmRW2E2XgvRAIjiZ5GFk9Jv5GeykdgOC2TkGkn9vf3P
 weraHrvXjOOHY65EDN67/BoFmeWAEt64DXpPxO+MSFW5RF3HaVV7FJj/SlOxoh/gzcf2bB6PlNT1lh
 TAoYmyShmedCPcb4jCoTUw/F1SFzzmBB8x61N80kfbHjdZVdJkHQBYvjgTvYvR3CQYBAvnCHp9Gvhq
 t1asEgyndVZldmbIS5Bx1/4IIS5H/YftwbCYZJMQE2wT+I3dyi1/zB1der8A6v2wiZOD0qUjF7obJY
 fLRY2oE6nRUtwYuqOZ5C8NQ/JRW//eAv+JhBkuGwZ/5PqECuS1ZCVKCIXfhkIGxHMjXWi7ZpaEQuOI
 gCCWMGWPqKkSUCAW4ppXVGRkWDPjnspzZCoIou8U7xw3+UptElWWsEJeSKjA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The GEN2 iris expects the HFI_PROP_PICTURE_TYPE for the encoded
buffers, but HFI_PROP_PICTURE_TYPE is never subscribed for the
ENCODER instance in iris_hfi_gen2_subscribe_property().

Add the necessary tables along the vdec input and output properties
table for the GEN2 hardware.

The tables are aligned with the vdec and downstream iris driver
implementation subscribing to HFI_PROP_NO_OUTPUT for the input
queue and HFI_PROP_PICTURE_TYPE for the output queue.

Fixes: 92e007ca5ab6 ("media: iris: Add V4L2 streaming support for encoder video device")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 23 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 15 +++++++++-----
 .../platform/qcom/iris/iris_platform_common.h      |  5 +++++
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..3b0fb408f05d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1906,6 +1906,14 @@ static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
 	HFI_PROP_WORST_COMPLEXITY_FACTOR,
 };
 
+static const u32 sm8550_venc_subscribe_input_properties[] = {
+	HFI_PROP_NO_OUTPUT,
+};
+
+static const u32 sm8550_venc_subscribe_output_properties[] = {
+	HFI_PROP_PICTURE_TYPE,
+};
+
 static const u32 sm8550_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
@@ -1985,6 +1993,11 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
 	.dec_output_prop_av1_size =
 		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
 
+	.enc_input_prop = sm8550_venc_subscribe_input_properties,
+	.enc_input_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_input_properties),
+	.enc_output_prop = sm8550_venc_subscribe_output_properties,
+	.enc_output_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_output_properties),
+
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
@@ -2032,6 +2045,11 @@ const struct iris_firmware_data iris_hfi_milos_data = {
 	.enc_output_config_params_size =
 		ARRAY_SIZE(sm8550_venc_output_config_params),
 
+	.enc_input_prop = sm8550_venc_subscribe_input_properties,
+	.enc_input_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_input_properties),
+	.enc_output_prop = sm8550_venc_subscribe_output_properties,
+	.enc_output_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_output_properties),
+
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
 	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
@@ -2920,6 +2938,11 @@ const struct iris_firmware_data iris_hfi_gen2_ar50lt_data = {
 	.enc_output_config_params_size =
 		ARRAY_SIZE(sm8550_venc_output_config_params),
 
+	.enc_input_prop = sm8550_venc_subscribe_input_properties,
+	.enc_input_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_input_properties),
+	.enc_output_prop = sm8550_venc_subscribe_output_properties,
+	.enc_output_prop_size = ARRAY_SIZE(sm8550_venc_subscribe_output_properties),
+
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
 	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07..6131d22c579f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1059,12 +1059,17 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 
 	payload[0] = HFI_MODE_PROPERTY;
 
-	if (inst->domain == ENCODER)
-		return 0;
-
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		subscribe_prop_size = core->iris_firmware_data->dec_input_prop_size;
-		subcribe_prop = core->iris_firmware_data->dec_input_prop;
+		if (inst->domain == ENCODER) {
+			subscribe_prop_size = core->iris_firmware_data->enc_input_prop_size;
+			subcribe_prop = core->iris_firmware_data->enc_input_prop;
+		} else {
+			subscribe_prop_size = core->iris_firmware_data->dec_input_prop_size;
+			subcribe_prop = core->iris_firmware_data->dec_input_prop;
+		}
+	} else if (inst->domain == ENCODER) {
+		subscribe_prop_size = core->iris_firmware_data->enc_output_prop_size;
+		subcribe_prop = core->iris_firmware_data->enc_output_prop;
 	} else {
 		switch (inst->codec) {
 		case V4L2_PIX_FMT_H264:
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375..cf5ae420f646 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -303,6 +303,11 @@ struct iris_firmware_data {
 	const u32 *dec_output_prop_av1;
 	unsigned int dec_output_prop_av1_size;
 
+	const u32 *enc_input_prop;
+	unsigned int enc_input_prop_size;
+	const u32 *enc_output_prop;
+	unsigned int enc_output_prop_size;
+
 	const u32 *dec_ip_int_buf_tbl;
 	unsigned int dec_ip_int_buf_tbl_size;
 	const u32 *dec_op_int_buf_tbl;

-- 
2.34.1

