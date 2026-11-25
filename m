Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612184;
	b=jpcSNDpzs9TCygciyuytR/XIx6FO883aWyAflf8hmEMsTRDLcsF7qBaun9MdPWZmvMGF
	 gyOe/eXKcsK+kfipQsZkQJxrHU02QxDreS+/r6KUBlaLrNchKdT3m9xvXRuwx6zqfP2Rc
	 61ifVs5h029cXX5c5K3M1JDTOG7rq4WFcIEeVrc5t3BTKSfZER+nQlQczcc8clN5MkUT4
	 KHj0P684O2cCKMxmygKMKYvlC22/i4zH2StarB5lNtUQSDss1ufoBPpKu1XCAPKhoVQ2K
	 arM+NSNzXGoTB+AgpyebKYQP0Za9eZ2uBmva88Coc4uWM/+dXTtzLv/W1HVpkEqvEng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6nt5vf5KokLLxQ+cPVaRnbgcc7SXudDJDjw2fVauZM4=;
	b=Kld3CIYZFty8Mz2xA8LRp3vp1CXVlX+Cenmuod7AUH9E0t38CBu8vFJdVFaW9NodWOA7
	 20qreuWFy5nofLsapwRvjUKSVQJWkvn+5FmAjAO+2Malnoy4rKmO/OVUIzeuz6w8b+uMl
	 qDXR4WzcpXorMJ/Vm1ZV24VnesMPTs7f4Reem5hdg2DQaRjbWzt5TT0Q/M8rpEnQRH1y2
	 qcasO3cFxUg+xYSbwoMhNLtPQvcS3P4H3+gfQp7V/RVu4k3VpD4FMTY/eZDosNRrTxEyD
	 0vgZ4XJUcCNPwZfxrdEQMYiNKqRupnziPWfEbui3jj+9IpmryTA3mZMMJ1/UReepTzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W0Nl54nU;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E04606A69F
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E04606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W0Nl54nU
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3289928f8f.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612183; x=1796216983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nt5vf5KokLLxQ+cPVaRnbgcc7SXudDJDjw2fVauZM4=;
        b=W0Nl54nUMNTPHRGQUs2F4KEn4U/JhdOtCc5yG3eRglGdwbkEAWguHiqR3LdleBUH9S
         jkK3V+tX8AMyOFxVUEUBI5uQ6JlCJj6Y9awLSMnOUPvGQJO0ZL/EDXofb8TSitH7Pn/s
         zaIN+qhaXjft6fBscW/lmYYuUOkLo8gGjaCa8M/WF/mc15vC4E5XfzMVZvoqIk8BpfsQ
         28TfcWrAWmYqiIH979QsGOcPRyzJ5dNekmHP14byA7CkAinIuNyTAHKnE5v4mQxnqFkZ
         hD8W3mMgHydMHTxRmI1S2HXOxeaf8GIAZ+eaeUwIUfMgzEansAOjT59Kwq3JUN/hOFr7
         KQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612183; x=1796216983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nt5vf5KokLLxQ+cPVaRnbgcc7SXudDJDjw2fVauZM4=;
        b=Iggle8FvImiHv9wj436iIASlspjKu+SFhItL6QhG/afJbguxvyRf7p3TIjhF4fWD3j
         w2WRhphldU6naidv92G9und90EZg624tIzttWlIsKoWd3r6unn5+wYdM2jRh7m95Rf01
         RQ4rPIi/cKfILfUg4qlpq3aO44yfmD1MuBeTvbdS944g/alNnfxTts08yx7pDc/iQZxR
         1BfJra4F2hOTvvT9Uep+rZfAE0ODtck4ldFo+Y5iRxPwGDjS0IRlVmIPiwy8b/ea02nM
         KRY0Yrg2YM5sPhETNzKn74j+byzy11fdMMbUpf7KzstJkNooDzSe0fJtJRJ75IBHjjE+
         Ye0Q==
X-Gm-Message-State: APuU4Z8P59zFWP7Iol0eogxHEnifBEFg1kGvMOJIn30u5bxqcEkenU8R
	n1nclm/2AnMgns07kBxhM721It1Xd8gVgzkJNwjWlaczzrGCWUeyPouyqKnsvW+Loeo=
X-Gm-Gg: AZFdTZcoga8m7KawkhW9A7st5RAArjurfSR+RuKOW1170XnS/BlFcm5WMVDPtpdas8p
	VhOXyftbnUqlfUZgkfy/9xVqHp+koPZLLQmCkjo3n+zoUYaF8z1lE2cJCaPI0gWNjl5LwaNo2aF
	GnUqzwyuNKW6PbLpVVu0EoVAhzgsWeBCI5Gawuq0+DU4JZvNEkJYpkSllzqkyjusUPH97sr5Am8
	gPGVcHL/ZNOk03BUrklfNespivw3gVXZgIrOezTCQuOEpWJT5p2qiamimTHho696/RU9vl7foFn
	qICfRQrklZiP8ZxAXHY7CdFbgOGwbcnHP3ZEEeXYvlLy2NBBLsTN1pQFWK6vbifMNCXtvprct3j
	TSPRvLouLCQyuPWan7bmS7DXAlesH4mTF7xSMuJKoZPFoWYCX0shrNUoGOplcO+LwS+PZfoob2Y
	WqoByNOnOaYykI9kKL5MIocM3mFlhlo4GF/PFz7K+o13WXx52WJ5Cmfxv+pXDIvFIhFTo10ZUO+
	Vnkktg6LYMJUMqIZsvAgvr7IeVHCLZnZsohUCDtL5gNtcYGFk1uCkLjo1//DdkvYwbyzrW13/Ci
	wBoQEPiKnjf8a0tJwJxiWabDBf3DBvdNoIpVaCi5ZK8Si5d8IA==
X-Received: by 2002:a05:600c:848d:b0:4bb:6b6b:fbaa with SMTP id 5b1f17b1804b1-4bb8880fd0amr363558955e9.16.1795612182478;
        Wed, 25 Nov 2026 05:09:42 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:35 +0100
Subject: [PATCH 08/11] media: iris: gen2: don't align the decoder input
 resolution
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-8-58b9f6b3fe86@linaro.org>
References: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
In-Reply-To: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=e8Wr0UiZuc5JjFlR6D5E0/SBg/8WVj1e4lATwe/KlYo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4OgWld3b27tgVUFjv8MZLSCeZgjw45bMoRKG4j
 t3ErWL6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDgAKCRB33NvayMhJ0VOaD/
 9a2ozu5tyM5PWl81YUUlW9pjajRaMg1Vu3Lzo2XWzwb5fCoxKDwU6x6jfZWwlRkbW4JXW7omw5l8uM
 yoS6cjmdj9isj9pg50fCEcDPm3fcf5wBUbYvc/3/Arkc4S1bGNl6s+IymhL5EWRhNdKSmi7sn2PRVe
 zRewJX0YiwLFjLZQqG5N2XbJxuD1HpazYD2q8StKeX9bVBMv76G4SxtDa/4j6QOnLNhaQHkwRAaTlD
 N5qx7mxg/bLDUSsZN8kBXW65eSSNzhKYp8dmCQmZzt5Ac++wnWve2yL4kcP4P7qIvX+Zs7wi5IusPz
 Ts4tH8tHjbt7xejz5PboJOiqXDzkVXQPGQw6j+RpWG3xVu0Y3XXB5+yn9GSvs3IX3EZUzWMHmXcbI4
 l11+gPxNKvHjwCfM801tEtVK/57dpmn5rPrGGZhLRFDb1lRAZNrxDsvCZ2Y3yIURh8OZVXFl8dkX5m
 2MHnzAMZj5AWFfdoAh/qv9JoTQBV36ZuY0ExmcRnC9l+gFhmLuxhJKhtAG38bPWgrT3y6sTYPoL/zd
 HNdyF7Be01rl89y1UicBcpF4/BTEOmI11bpVZNWLocgaNBRneaY4DbprcSVG3eGPYhNk4XACmFonBb
 XFG/k2dMKQe0pcYfOJFpfFar7GLsVG7AFYXPk9eUnN8B/1Z+jH0PK3doeaWw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Since commit 49a940f37de3 ("media: qcom: iris: Add rotation support for
encoder"), the decoder input resolution sent to the firmware is aligned
to 16, or 32 for HEVC.

For VP9 and AV1 the firmware reports the visible size as bitstream
resolution, and ignores the input crop offsets. After a source change
to a size that is not aligned, the STREAMON(OUTPUT) of a seek programs
a resolution that differs from the stream. The firmware then raises a
settings change for the next frame on the input port only, without the
PSC_LAST buffer that ends a source change, and decoding stalls.

Send the decoder input resolution as reported, as before that commit.

Fixes: 49a940f37de3 ("media: qcom: iris: Add rotation support for encoder")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 9464543836c0..608fc405ea05 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -197,9 +197,10 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
 	u32 resolution;
 
 	if (inst->domain == DECODER) {
+		/* Send the resolution as reported by the firmware */
 		width = inst->fmt_src->fmt.pix_mp.width;
 		height = inst->fmt_src->fmt.pix_mp.height;
-		resolution = iris_hfi_get_aligned_resolution(inst, width, height);
+		resolution = width << 16 | height;
 		inst_hfi_gen2->src_subcr_params.bitstream_resolution = resolution;
 		payload_type = HFI_PAYLOAD_U32;
 	} else {

-- 
2.34.1

