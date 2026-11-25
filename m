Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612179;
	b=1+wy9lHh6sEt3OIAyBokSvLbKmmGaAuPf83eBiEJ3FPiaCprJSIspSbE0Bt2CXcwC+Hy
	 GoG81QlqexJqmXGfCdR6lJTmRXKaMuhvIE9EQmRlshuJA64ZP+0lCqt1/5uPKmTTBQfv0
	 bYT+PC8W3ytodz6d39IOmCHYsRT55V9/JdhtC0+b+nm2pKEVTfxmSLRvelhMQAedM1yLh
	 5Ak320bnst7sUNRoeov+VnKglVYwztxcsRoPZgO4+XBmlw9CFqfj1hQSoVrKVvsF1hN38
	 T/tt6HiLaiLTBvJw2Y9DbU5u5oZ6eS+Y7bgRpPCXfEPQH3b/62jNaz9SRzg61aphmeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=gm2/ObuxDVgUAne35bqkJz27tcih45Pf//RuGwaqhd0=;
	b=JiCuvrPDtIcHURNIXmh8pg4onVQ1BBcWa4TX5T1LAtdNIy+ydQLcaw6q7V065cy6vw+p
	 WmkFcqn3sFYiXpCTo+ltHR4LRRDBRVpKEsJ6qpqiFhX8nEuD+IY1GpSt5BXN3kwdkAzG8
	 Ovg+Av4c0z1U9m9vFxVbn0T5LaZVywSnIMd9QuTNWLJ2U5oR6J4E9Ju6nD6cBC5lZVREr
	 JJvKx7ewL4daUYKSOJtMSFo17lrX0dyJJx6iBX7q+c0fJhQg1K9CLT4P/Issf1uX+YyTN
	 DhdMCvlT0X/Kj5wRmdorNaqBJdXyE3wrrbLjRtCGePUbEt55kFHTezgVo00LUvQGRZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lG6It37v;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C564606A329
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C564606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lG6It37v
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso5028990f8f.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612177; x=1796216977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gm2/ObuxDVgUAne35bqkJz27tcih45Pf//RuGwaqhd0=;
        b=lG6It37vJI1yamReOdJgOu4DK+G/otcskTVwxP4z2pIcqBlDCabM5BnM30nJmEsu1i
         icfnRjApC/nuwIhQP/PQiJEFGNG4NXjQi8qT4sf8e0k0gIRioJ2GgvbGIsg2ZjI5ef27
         7V2InBkbuOSqyWYlm9Q9x3BIp2/BHpJivZqr5z43RbQX5qUi0DKNLH+b4HN8VJiWxFCa
         1P7y5u08FIEpYYIkpSk6QDJs1K+u2ZnI8XJYzF1HcTeRRT/MvwP+AdVjh/6oh6G++unW
         qDMfPr1wjyiO7rqqDzUfNGQ4YMibBX2rPInuHQl/M7JEypT21/dxVmdtLquKzlHSnKyb
         rbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612177; x=1796216977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gm2/ObuxDVgUAne35bqkJz27tcih45Pf//RuGwaqhd0=;
        b=FNlMtOFHq+oMs7cGU9Q5cylCdXuDI9tVAIkKMrlIVZlnIA06b5/R9hPLj4Ur90tp8i
         HkBrDA8vFmqVGx74pUcP+VLNS48nsDUMlHnf63z28kvyi1buoifoRogdT0a34Q/5PoZs
         m2JMZUj5OWGeYHdSW9gaTyn6zYJ4h//57lc7LxcAZ4z1YAxi3faJK8nQU1F6GqGoKOfQ
         pnEV74Q/HBdPgowaFDowfOvrmjqxSdgqlTSaSjAal6GxyXHJu1PxNHyC/uanOs7W+MSw
         ZosX4oraHOk2327/OzxRymXqU9OPgx01p6fLfABV23orexSqrMySj7wicO/KKEQ6hSO7
         uhPw==
X-Gm-Message-State: APuU4Z+KgMqvsTEtV/z5sCjsCsHJCgLVZIXk8wUkC28iCxPCkJnJM04K
	Bz6rfdfp0j2XIIJLCsuneuCr1w+2/O137TFczsQ194e2PBzneBDlCHEmBOmotl5+xyU=
X-Gm-Gg: AZFdTZfrjGx/jviN1asTUEa8GsumW508ErwHYTqxNJwW2aHbQcfXvpS9J0KmqUkt5Y2
	QmdE85qtDqg8/JhvpgqeN6V4TNW+H67UQH9fwySHE1RUGxYuOEBM6zGo+65F56rNxvbZuxHai0q
	6MRnF8lTuxYl0GyhDhBU385ccPUY/Fzgvh4XXsf95n40UTy+IpQsDxBi4cEVWGo7eZX9GZAWHVe
	Swovq2qn5KqsM3RCJbUfnV8BAmhgQuI2IsCUjXHbZVKRUaSYGfeJrjwLeua5hIjYkXck8gFTxT4
	LJGlAsrYxT9rZePDTjNsy4fMmZiFobVrlTAFF3qgrXgQzugIDBzxYwPHmGyj0XtMcxr+2lXk51k
	8s2rU6zyyLElpqG6xAey1YujWMqa+MN94NGbCHmyjfxqp9RF+c/lFHkW7beBlG4nFi18shJctMx
	gGlQj0HQlMTOR+n+/PeIuJhcAILioBC7iRmAsSoIrMEF3tOc3uwT0Z3wLF4wR4pDXrbWV1svhp4
	tdEVCbS0MuNjg8adW1E3Er+BCrxat3GAe7o8eelRYI3WEPRTR+2xPcx0VEpzIGpqc1RC+HK/+ou
	0b41ov0RajMUFXnOD4Ejofabpu7AWIAKu8f3j81haIHWKqKQM6PX3a6B7tAlywb9+r+AHtM=
X-Received: by 2002:a5d:5f51:0:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-4abb2168e0emr36120520f8f.11.1795612177309;
        Wed, 25 Nov 2026 05:09:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:28 +0100
Subject: [PATCH 01/11] media: iris: vdec: accept V4L2_DEC_CMD_START on a
 running decoder
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-1-58b9f6b3fe86@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=u9wQoclOz0uA+9WaQA0dbU1U3jch7fedoVMeG3ZnpKY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4LQk+Q+UXmBx4UgVks0ZzBgcSVpIQ+k3gbiAfy
 xeSJArmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeCwAKCRB33NvayMhJ0Q+AEA
 DCYIOVh40OZ30H4xA20IfLQLl2JsnIHa8iLhGa53IkzMZW2GZs8FY/GWfG2wlFSridLk6xlfIbzl+g
 iCfrgefirxxj1DCxbcNj6UbUwtbR+0VGQ0JxEukC6JkqMSxce3qeeGzCX19zGakp7asQFeRNRvqNFp
 OEBErh1Qe7pjMLWDf+UWYlzrpSEXOt9FHa9ddPI9++0tBiGR398VI78IcFI6nrMkHENiN0CyvE2Abr
 p017BwkbmqP841VUUCF3kzzpwqHuDCYabkr1IvoluitWxFZWFcZ4Do3gbuD4/XXSG9QtKOaA7riWoa
 E1F6RptUxHicK6o4NynaJ4B+5FKxHgTTBqvvEfj/3n5dob4fPs21MDmlaFSxn7cMAUWJ8ALpyJWtVP
 JbGULrl+GOwi5/nBiJDYLo8CnXy+sUNlzjh5JJQvXKzb3nMvshrLSFaI+xweGE0FNNugW1KOaWocnj
 OW2FYckeJolHmF7ZpzHxaPzIz/NF3wrikcyAm7AS+0iMrfFl6hV2uQIW+JILS9q7i5ZZxmOkvBkziq
 ic8+HmVuqE98NoL5+9TSawkWm4I+MCgFPi/CcrG4fzr0DzwaaTNfgUWSSkIYu3n1cdLNc2/luTlKH7
 c0MzE+e6wDHxpg8T8PGeibcuIaNHLVu00rGmD1hJ4ZA751+KrjN14OkyXf9A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

V4L2_DEC_CMD_START on a running decoder is not an error: the specification
only makes it fail with -EBUSY while a drain is in progress, and
v4l2_m2m_decoder_cmd() returns 0 for it.

iris_allow_cmd() only accepts START while a source change or a drain is
pending. v4l2-compliance completes a source change with
STREAMOFF/STREAMON(CAPTURE), which restarts the decoder, then sends START
and fails on the -EBUSY.

Return 0 for START when no source change or drain is pending.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 931221564a33..7b5a607f94ba 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -601,6 +601,11 @@ static int iris_dec_cmd(struct file *filp, void *fh,
 	if (inst->state == IRIS_INST_DEINIT)
 		goto unlock;
 
+	/* No source change or drain to resume */
+	if (dec->cmd == V4L2_DEC_CMD_START && inst->state != IRIS_INST_ERROR &&
+	    !(inst->sub_state & (IRIS_INST_SUB_DRC | IRIS_INST_SUB_DRAIN)))
+		goto unlock;
+
 	if (!iris_allow_cmd(inst, dec->cmd)) {
 		ret = -EBUSY;
 		goto unlock;

-- 
2.34.1

