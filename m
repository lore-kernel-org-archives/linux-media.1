Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612186;
	b=XcNSPgteLIjMJ8D1YMY2sN5iAcmEtGwldr33m/CN8PLqDAlmqDL/mzzLadXA0mZ7kDvg
	 HLl0VpFOPo41y+oYc305OlaipQiQbH7OO/bre44lAeysMNppeDm7jp9gAdkiZEp6K78Ov
	 77c7F2Wal5a13+sZuAKYaZH4vphdcUZU9zEdFwr1pPHG95OMM41JbypQRJ/5sZlVhd6o9
	 1HSQxBI9FAWRSzgaWmOuI5QyoNfCzpOLjsq2dd2YH1YAYA5XeLNsFiVbAJHG+xmZUag/d
	 DMr0t2rbcwN9Wv+xOreLtuRl3tx6xFYDZKuZPRaQuTMXTxG7gbNNSbXlOTVPuXDLoIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Tbq3WArIKfshci62hPLXBd6m9hDUDlRFQ7rBlDH7S9g=;
	b=4XkoIsMXOc4sgxik5EbXJxKdMXakS6wlpm5wyQAXbaCiOUfZfZdoOsgsMIbEHy5D/GKj
	 EJvWku9sLOYcSqeZxtDgpIv2C62AbCEZoFB9weBrzUBv9t9r1LM9ANzDPPR/9DNYgrNoj
	 XUeg4ylqQ4FLM9Ud362ffrbBQ3fA7RjnIa2D3w7Ow1UQz0DwUsDKZ+PkiuE6RzklmNWpu
	 muNWKs5whn+aUhtNSSk6in0ngMdk5eEEFglvnUk2Wa77U/mq3Byi1ujxTItucVXWsYoXD
	 iYjKqQsY4H9R0yaaNWC9jcKMWGaV0wnGDi0AcknMuHBVYIMcshYRR7j6OUdV7yfCvEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eW32hupK;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629A5606A6A3
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629A5606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eW32hupK
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3289952f8f.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612185; x=1796216985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tbq3WArIKfshci62hPLXBd6m9hDUDlRFQ7rBlDH7S9g=;
        b=eW32hupKCdsxdS9qiRfXt8Mx8t+jXTwM1HVS1XKXBrr0sZ2GVqOs5NrZnlyHATrIZb
         brqiWcj2erewxmMGn2pBRz+tp4593jq5R3fPl+r1DeR1b7jpNNRVWWhHsTAgxaaZSXmm
         HsxQITQpCCIRm0najVXKNpQPOgMplIDzKF/gkq+SNtUBy4aWgVFfFzimQzswjMPeih5F
         4bFiYeXVnP7FpLG87E8UtWj4fRrMpel4j4FpuyHXS0uxIguWrrMo4zRPdEkCEEMwYdyO
         Q70jEYOWeTvVEKLlf0XxV1OxeyIBSZ7b3IL+Lmshdga1UJIoVpD6vjHba732S6nKQ2J7
         pUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612185; x=1796216985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tbq3WArIKfshci62hPLXBd6m9hDUDlRFQ7rBlDH7S9g=;
        b=XcNq/I+o2Qii3NFd9Et8oBCgKRM0qp8H5MgjNcAUc3ygQi3gAw8ZlEwD4sVwnds/q7
         G7yG0wwta4VoxPo7Q/9ptnnn/4Yw1g0gILQK2OyfdvuHSOToWFY8/g1zBY3RA7ABvCji
         zlONpgeyfVtfWIKrTSC/yo37UsoOi2suj4sYOdGSqNZ9Q8wqTL/uO27JRsZqcaKgCt9s
         pGK5H33C27OoujFIcQCb7Q7ICZmuHyOWaF7mh0eVK8fZhYn0tEog1dJUn65ifzAT0N+W
         Y1EKSHzFx7s/rYManUfWL3QrvjXUtxqhRyP5/LxoWYMI87JLI4qqfgyzSayocDGm3zdY
         yg+A==
X-Gm-Message-State: APuU4Z84ix+fCMsL2IIu00UciBb46hXnpO42QzGoQdcPDP3w+unbOkDa
	l/dn3Fn3YIs3AkMOwzuuN0ooRX67ut064fcTTaYAxi1s2nZ3rP3oGXs8qn4Cpy/Pfr0=
X-Gm-Gg: AZFdTZfClZu2EkctU35AQCRIkKyLAFto65whtWPirEdxjk9uR3c565qB1hxZ/PzIT6C
	NDRUkiU4PSghyupPm0/xzAd15xddRYqWb5DkVMA9szdx9B40f+hUm6nxFtwSuWUJWgNFp0G9Iq2
	3QI5NaLTiXB9rj84jUVIHQJDGdJTFbI0aSowMwCHlEyGaGYU370fk/+0KoRUYvp06qc5c3JEO2F
	avHOqiwg1cPKF3UlTU6JG5d10EZhK/0mEgfHLbB2mUpCSE782aHaB1yiDbBDOe5f2jBV74ONUKX
	Xsp4ZLrJf+HiLpsRglUAm7uOC+LgGhKwze2ebnCn2cyieU4zA7bMZPftlbnqCgxHqkH7VHAQRJE
	H1LFkp6UXn9fLqNWMwpvV9hXsClpeV9QAdEAPaZkkJbvB0z/av4SEY8s6iek43LvdBO4HSdQfxD
	zUl8FcqfMFnTSAm/EFGV+y/a1QcjkI2HJxcaxD2Qg07wsMI91K2ziULi6nERIm5irLndFIklECN
	uqWW08EGfBMK3xG+GigbDwA5uO8IRvE9vMSx7E2IArBStLTmQOOPmn7h3fseg9nOTM+Fh1r56XO
	h/1yn3XLjZepaMgYyZiEr8gh0DcPFpdv8Iq3Ng6baj+Ca1nDmQ==
X-Received: by 2002:a05:6000:288c:b0:4b4:2ce4:6dc1 with SMTP id ffacd0b85a97d-4b42ce46e7cmr16774660f8f.44.1795612184622;
        Wed, 25 Nov 2026 05:09:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:38 +0100
Subject: [PATCH 11/11] media: iris: record the LAST buffer returned with an
 error
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-11-58b9f6b3fe86@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fpGCW1w6dJjhk8t6QuHx8IDTWoFL99bE+EV2naxWqHI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4PULAdNJCktlHUSosC8YCjaC6SZvkTGl6mH6KL
 wW8B1I2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDwAKCRB33NvayMhJ0ZstEA
 DEIz3NUZ/hgsVctmVX2LgyCkOUFHaQW4KPS/Q+AocRwkK4ypqI1NzYP+EZrILd1f3MfWCOZzfcUgHq
 Gp6pEr6yKFQBCQvQdfchV0G14tiz/+G27ud4amwXPu+f0+F2MHvm8llG15OGSpn/fKwHF5P26lEGPx
 6fd8BFReoK/BG0sgv1AzW+peKUvdHsS6dBkZAgJjZcrOr5XrRPZmco4NS1kGN0EwrdyOoZ2j7i1jQn
 yUT0X2ouyQBNTyGGwza+468jCWX/NjYBKBy2VDAK8nVhjJ4b1hIC4wCE9z6lBA2g1duMnOXlzTw/BP
 ISG6B46OxotDGc3imoRtd59RpwMH84uKNQPv4nVUkmNG4QYK7lEjWizhVdWQ8yejKy+w35GIf7hotJ
 Alq2/ThKBj5W18nduzWm15dzs4lnXvXOzXbOAmQ8sl7S+iYO3xN4XYblMu41Quz1CEItd3bqedNCLy
 xPin6YJKdTKAty0YUg0qUwAJgWjesxghO9Qw17RHmvaL3BB/Gdns655fXAJYJ77zJ9pz62zWAr/W2X
 t+oN1i/mtuwYZtyYYcbI57O3O4EmaFGVb0r0ouZwp5EH0l0Wgr0OHIyIA2MuXWqwdoT/FY2t3lzLem
 196vC3GHvkbOqFDh0QvvCuqQQCFKgam8StvV3R0Hh6ut8x3kt0bq/tji80ug==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The empty buffer that ends a drain or a source change can come with
V4L2_BUF_FLAG_ERROR, e.g. from the frame information of a frame flushed
by a seek. iris_vb2_buffer_done() returns it without setting
inst->last_buffer_dequeued, nor signalling the end of a drain.

A client following the specification may queue its CAPTURE buffers again
before V4L2_DEC_CMD_START. iris_vb2_buf_queue() then returns one of them
as a second LAST buffer, as none was recorded for the pending source
change.

Record the LAST buffer whatever its state.

Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 38bdf366b384..b9ec8d0cce83 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -951,6 +951,10 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 	vbuf->flags |= buf->flags;
 
 	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
+		if (vbuf->flags & V4L2_BUF_FLAG_LAST) {
+			iris_vb2_signal_eos(inst);
+			inst->last_buffer_dequeued = true;
+		}
 		state = VB2_BUF_STATE_ERROR;
 		vb2_set_plane_payload(vb2, 0, 0);
 		vb2->timestamp = 0;

-- 
2.34.1

