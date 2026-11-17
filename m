Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928891;
	b=Xw+ucZtvCn+ivYy61J7vEj2ug8nFKT8BQPbo2z9qcEzZPrvYvJQXYdt0uKs22tETfZTe
	 dmD72cxBcBC2voXsBHYTza0n0Ovx18Rbzcz7KXaUDF8CGsfIocmU5fIQGIxZpkGndm5Ap
	 s0TsEkDw13dl50IvzXzj3ZYiGCNvs7ZEz9VNa9Ny7DJBLlhDITWEDjGDadxVjeb227HLg
	 VUOhab8Q2pIgjGfm189L80em9Q2Zd4mHeWYYdQ/hDMKWXLiRDcVmvJ7Zx5mf9FJod7VZM
	 h4SXtnk+1O3gxeY2xDON0jLCvajJXuaY2pSLGQ8qK5lBAwHsqT3v5XvWXHD5FQ53MMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ibsoMIR191o5/+0P6Gi0r6U9JCXD8WUx2HgK50Sd37s=;
	b=Ovgc+r79aaF/f8ofpA68o7mUn1LqpDX014mjxVl8sN5egqrHs03hUsygvAGf2PX11aSs
	 EIAyxVuqFxQPWF2+mMgnIa8hEYEb2xj3SaJegnWCL7heNgYmzLJ+EVTMkCPezaQjRRdds
	 auoevOMiifEBBjReVYsDluFh+Db4xt1ZFvX7Hb3VekEP3ybfxlu4+OBVftqhxEkLd797p
	 APswvdJyA66TdFexQ6e310JZ82uZDgzjSwsU4t2inKFHsGWWXyjZr73d0TpWw8zy80aw6
	 d9DqxugJASeGevKDmyFJsmCIJlMhNqo56pttzHrnGhMvvJpCzR0fn8aMiwnkol1bYWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eoPqm6fa;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97E9606A338
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 15:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D97E9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eoPqm6fa
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4967860f8f.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 07:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794928889; x=1795533689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibsoMIR191o5/+0P6Gi0r6U9JCXD8WUx2HgK50Sd37s=;
        b=eoPqm6faGUmm/fW470/AUOLCzxFkSr0l69aMtatN/qVjbyQnI1kXF+6pQ/Yhx9xnsR
         TP9K3tNms22J+XAzm+AjOPufTpw1BAZJfNNxETPTg3iZOsDNrgY7TzV6aP/CJOInG3TQ
         oZDn8JDHo2QowF58IwbWsSOJpzZvANCuOQHxIB6n2aokLFtB9U7G3muJ9n/wEvTfmscL
         JbA2sGbE1T9+VShmaO/z/HAyXsChLBnyaVnYkhtTz01/VUy8yxlLGWlyKvACiYsmS8Aw
         t94B1+yeeYCCBQrsL7rh1z4bJ6rncHikn8tnB/ngyCGOvSyGC3UjcLIh7JwXaI07qLqI
         XrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928889; x=1795533689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibsoMIR191o5/+0P6Gi0r6U9JCXD8WUx2HgK50Sd37s=;
        b=Hqm/Fb2eoq9N2hyuUaesXXOHRUFAWCByV5yUsdcXCCB2ch90vZMYY7LuyVoLLWsW3m
         Q27YFmRdnC/nUdUR701jFVf+807n0LZx0BAwmihRYq6gJifxLxiE4XZRM3H0KVEftOVh
         1vw0Yj/BQ3I97h6J/Aj11SBg9kvwgDYqRx4UD63ylU1hgScZ1hTcFNfutuiMyJnr7JYH
         s5oWxpAER7orBBWFIvuMGdZXl8sxzPkixKVhZ1EbIbTm5sGy7IGXDI0CeXqKaAUu7oVj
         oD44oMndSIoOcnUk3F7/ahsJ2y4muFInpGe/ahHtI6TdkOwqOwNZx33PeosDatafcaAK
         5KlA==
X-Gm-Message-State: APuU4Z94RoJe0Z2C3Eu5Vb5a6xnp0PJIYRxDQoWp7qTZgobzGFF3jRxJ
	gE88lGM/t1l/cfrwGXPoEKedYEnSqnMZGCKnhIHFA+kjH5nn9gMBBkMDnhrsULDcUwI=
X-Gm-Gg: AZFdTZcVmbWYBTmvrUm2L7sS8FbNRQPWyv+GU7aFHZz0zSrpqLvTlwCevJMmSc4mw+a
	CATNKLbC/nuBdjJ7qp01LAZ0Ha95iZsr+ZtwePPYze4M90hwCkwch05c3ePECSvMMPUcWi0GMmZ
	sqLLz6EpA05bHh0tVVeRDHM4MrcghRCSEp55CieAtLhuEn9Zbj9b+1jSw+Qso6pj/Y64W56HM/I
	W0mvaXblVL7iOJxAPjLpBN65QlJFIGhtQq6Huo4XqDpGucAuHGRaizZt9X+TJlfOyzgqG1RxfWk
	AUXhg8iOgk+TAexpFkqtg989hMt0XEEeO4W3wL8oyKh/PraX0+LjQ8yapFyxK05vYCN5y26gIOs
	SkU2tujXKCUkcx+Dl9jQbAtB4XC+4BoNPjpZxi9J8tMkZ03KHvQTpXN+2rwFzQUqmDeFRboCjvQ
	wobvv2BJXV1EM01VPEgotjoNaP0Z0dV+PKxEHfXirc1qYkNwI0Jzjx81lXI4t/uInxudCkd3tP9
	crL+IIzaimb0MNNLFQH+D55lRhaUQLmd+KnTswUMaxvQtsKOqdeXWdCLTbo+0INw0NIBLg3hqbM
	/hJhFyCdi5iVAzefB8ilpQ3DgJ/2vbDRctYQHzWLbGIIN8AqL/Mz1xDKo7d8TnmDXkM2ICc=
X-Received: by 2002:a05:6000:3ca:b0:494:f239:aefa with SMTP id ffacd0b85a97d-49c727d1f69mr29199448f8f.34.1794928888680;
        Tue, 17 Nov 2026 07:21:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm26703133f8f.41.2026.11.17.07.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:21:28 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 17 Nov 2026 16:21:23 +0100
Subject: [PATCH 1/2] media: qcom: iris: gen2: subscribe to the picture type
 on the encoder instance
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
Message-Id: <20261117-topic-iris-encoder-fixes-v1-1-169ce990d12d@linaro.org>
References: <20261117-topic-iris-encoder-fixes-v1-0-169ce990d12d@linaro.org>
In-Reply-To: <20261117-topic-iris-encoder-fixes-v1-0-169ce990d12d@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5376;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hR9u08iQGGo+xG2Yvu66rEMM224FCZ2sUrMhZDck3s4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq/HD1XMIt2BTRKhJrMlJYe6FoFYTNcwE0z3rNwL9g
 /q2UbruJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavxw9QAKCRB33NvayMhJ0ZD8D/
 kBxP9We2LVzxB9AC2RPQXfLdM/msnisxUlHcVY9MshG7+2B/m1hHory1IsFgDccmACEawBa6jmCN3Q
 vNgxHWBNdBvjPVNv0S0w84kXpzS5VhnA8bzsv6qVaWUDgE2Xpfxo5ylN1LxnajYSeXh0oRUby4xV78
 zxHAp750rSLCxYPXSEBCRQ5K2jKKdjgaEfRBHCXnwXw10DtGgfShydem+b3qKP8NGQ3bwtnZCg82Y9
 EggHGUXij3765Hx+7FninPuklBYoMsc+TemuDC6FZFrNqdNXhxO9HQ3EICbuS2R7EYTX7XRNtJjpqg
 1ZGzhI0hBCxzJF7OmFEljRKNNzx8V29S04SZX/Pl5HI6/Kd/34xrbUS3X8zVgrF34vQwj83LA7gChd
 ihLmEdiPmtty5R/GXQgiVvhcQmiXMsbJmriwfUgRgnSdf3o0Q76Q1SHMp83lRNDM0Kl4Ztqro+O4bB
 6zcSyiepvqWS/bCwQ6jn2VwUW83D+M3zzGm6e3uCGWJKs1fRwmt4YRfnLIMfc15T4qGtyx1NNdUSLg
 XkF2RRRkYAHxK3OAV7lFALiNvPD4nGyobjs0NwAr9H+fM4ysFiok6pdhzziMZZiVNsNWOCrCzS/ArJ
 +paPExflx0SvexF6tsiFONjN0oZO8SGgEuQTQG9C/PPmL+yQctOrj02CmjsQ==
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

