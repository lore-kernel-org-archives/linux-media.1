Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612183;
	b=FYVSMeAxn/tn7thEgSZmmxeuwRDgCBtGD6QMgSdZAdiYBgdjGqiPFSCNMW3/h/9h9orA
	 MUuRhrbUDjP3DZ4D0dA5KyelKOwZjVry+sYa0zNGo5+OIfC9QoqVNupuW6BxteSo21A4T
	 41w2wBE5Qws0CG7p1qNq6DtXYBrLKqph99lgvgEk7gNz0IKEna/S9C8R9fNkw9/TxJWkk
	 OYRrSiGCFfgux/zuLDMog1vIGfSauP1mE+0x4krK2n5mqvRAg8zTzNXdY01lVkViwl8WS
	 1JodUFO2nXt8bomOK5QKt01YZRBgvgORkiprhhDFFBLNwdSuUckTj6gat1uN07yKOKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=RfHhL82RSFRjqGArWKhGQj6Yg+HmOa+wEbBl0/BNQSY=;
	b=AvQUAYC1/eUxZL0a2k7qFH38Lz9N/RKAdMcrLf6eIGwMahkOvZCtZSMlWxfNOMaXdOxp
	 uI244QOT/L5L4nMTZpdp6kgG3G0Na7jTwZJvKgraY6QNvi2WVIsPuqFatG80hz4bOUbbP
	 9eCdV/PYS9jdsFprrWB9v2nVcFERHYsApgeS157RSYku9/Y0HadTlHGS79tDHuBJL4YBa
	 w9kdOFQxvTwkTWjggheyb34n8flStFWFN4ybFrpSPYrN4VGWX/wNtps14mjU2xtYDsgSQ
	 buQwB+Nm7SMl6xn699giWibT0RyOdFGWyb86l1ELTY4TrQvGkYTKXRXOMrQ6p64kqaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BYQjLBys;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70DC606A69E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70DC606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BYQjLBys
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so50934965e9.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612181; x=1796216981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfHhL82RSFRjqGArWKhGQj6Yg+HmOa+wEbBl0/BNQSY=;
        b=BYQjLByshvYup1afxoovlswzHwO7sw+gOfUhvGWnOBLiEFGatTIa+gjBj8kHWoTLwZ
         wXQWF/pguqda6tnXS+ovNwO6/s1L+fTvZubypwm28C8R4qs5VLh9QTK2zjfcQ7S9BMQr
         C4XYws3RYOreeXQMR4c+Qmydcj2WueWHlZaIRbl8gb0rtoDOHrj77Py06EcrRbWvLQgq
         6XOwY7oPUqqHgGOlpt+QtOeZgDS6xdIIneLP60gsojD39cRUwMmHWCyciOa8lSSEnK8C
         DpcBLLyuP1X9XT4seoTfPq+Hsj48v3IeI5IGcTA8xs305ru2h/W/wwCI4Cu7AzcyxNSc
         xM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612181; x=1796216981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RfHhL82RSFRjqGArWKhGQj6Yg+HmOa+wEbBl0/BNQSY=;
        b=GFtfmaMoXsVKRv84zOsFXLpv9fixToBweJpVoZtrCuwi0Dd3YaOErfkJ2PjGupzhJP
         /XGbJ4tzDRoI5QxMuFxGLGI3Pv/4SKL7RnO294QYSS4mN0InxiqjMIoUsR7MvDZ7Lezr
         Vrb0lve0rPa/eWAEjSdSp4RHeUqAKT7ByUpsv0GooZLp9GorbxPrxCFPBH+CyfTNa57S
         7Lst9AoPG50m4+AZ+btkKNEmWAG1khAnK6A+6ot9FquhrlOWTe5JgUTef/Nx15GklNXm
         xVTgUSixycRwmXzk7u2QOvesxvfm4QFZqSVK7iGF+GW0A+YGnmLTA/Oj0k3npLFCmnpw
         K9VA==
X-Gm-Message-State: APuU4Z+w2EgtOL3K9zMxJ8t21HF6geYCx9e7MkGNPD16+Lt3JuAFx7Lq
	RVSh25XoJig+ZWEQHEB2y4+UpbYTqOcDOLSEln58umh5Jsav5/CTTAWtGEXXb+e8EoY=
X-Gm-Gg: AZFdTZdmE4lfJzWY9qcH1IxhaQOdzc+3h5+DLTxRyIUlQMrqo+OfkAKvbJZ5UPNpxhp
	nIx87yPO7mSYg17H6BLjJ7FVhM1WfNSmuKa4j0utm5Tawi0t5YvxE7Bgppf/Pg0uOizOSuXurSj
	AR2CV8dEkgqx9OlI+LyZqCYr3AEPzGcfVJ8wfJ5bL12GFT+dQV8SRQh46yn57MXT8EGtb311Pr9
	dSTLw4/3UBVXoNKafaEObwSr58nwwVO4s19s7L1cppAFFtI6h6Fh8/EkNon7VdPqNET1hxv74kN
	z9FJkdWn3Ip2ka5lFQ+V4/mOPkNIUMv0M5CgVl2BiaA6elO2iiKmmseVnI8zdO1su7P+GaDkNZl
	TPOxNVxzDX+QZiqYxnijUOs7BjuDReJbud7Fkyt/cDItAPeb9UvT+5VT6a7uhBCWnyTe9sM5/He
	AsiB47xwR3bYkPDfh8QFGv328PIMkpeiPvQXLcl1Dcj87R76+BIjVwWY0NPbIs+B5XNVPz31KMz
	yl9igTnjUNgsRU7s/C1s0PIunQbu/T/TCXWGqnQ1qyOba/D8RXhoTMteEPzetfyoSYG8aUFcl0q
	o5uACqWxeInSm0x2jPIaVPCaV7BarYs2bWyrzsIEhbNOtbCXUCA5AmMOg8xonePYQJkBepg=
X-Received: by 2002:a05:6000:299c:20b0:4a7:ed95:7ca2 with SMTP id ffacd0b85a97d-4abb7b5c76bmr25510841f8f.52.1795612181073;
        Wed, 25 Nov 2026 05:09:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:33 +0100
Subject: [PATCH 06/11] media: iris: don't return a spurious LAST buffer
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
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-6-58b9f6b3fe86@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2834;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IvGdaBlzk5dfXTzAfmZyUO599GL97WDoGnlQcbGakoE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4NrT45CsJj1ahd31s4XC+tkoLO0ByJUkmz36wd
 jxj9tAmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeDQAKCRB33NvayMhJ0XqVD/
 4p3Krf5847lLitqU98qSwwWLE6LU3+QzmqhxNOrnQdyug8Zs9AGWtN5uqAXw6WxtY9IJVAC+5UHG17
 gI3/G3XnWpGerbO3ELtW3MryBglQhZBVg4FzoG+4I2NkPMtArLRnKVY83z4llHzg0sC4/cjf/gdVms
 lEHqH7i3IJR2BVr6jBuB8DieEpBjmdW8muwlnR1eX0HrTxiMR8s8dmkQMtj+XlT8ab2MZNrDsXvfj3
 zu+344reDAk3TbKsbYaqVQAeMHs/B/q3sdX3PTeTJ7sGHkdwt2UO9qsW9TsOn3XjxP5hyddmMXmqwz
 3icugIDwOHnOzJBMAHqzh36CKCEmhm5UGyDFZcVH6jhdj/BIPsRGoKaFJ72kYlgLzYjc1E6OYNr4mZ
 nifKynvd9UQ306dIimWWCfP0ouk+8aldSo8gXbnb2/0gT0Yi9dSdmkOXdfFv0DFfUrv829u4pk8XZW
 Ajt93WbejNTbQrHWxZQLCfFdvAljy2kKK78V7xRqqG6EfCkeQc0tYGj1PqrXIzOIMEektg7KEtVwI8
 PcIFNLbjyVSOzZ0xEXBp7PWYDEKTnfPnK7uSDMaq0fTBmZcniUTxQMpRrprTXAiWI/EFhMnkikccxW
 wcl/pgOaZgnl9qwEmyQujupbUsH5ooC1rpXlXgbGe1osXhMLVcz8kEqznb+g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

While a source change or a drain is pending and inst->last_buffer_dequeued
is not set, iris_vb2_buf_queue() returns a queued CAPTURE buffer as an
empty LAST buffer. The client then gets a LAST buffer the specification
does not expect in two cases:

- iris_process_streamon_input() clears last_buffer_dequeued on every
  STREAMON(OUTPUT). After a seek done while a source change is pending
  and its LAST buffer was dequeued, the next queued CAPTURE buffer is
  returned as a second LAST buffer;

- vb2 calls buf_queue() for the buffers queued before STREAMON(CAPTURE)
  before start_streaming(), which completes the pending source change or
  drain. One of them is returned as LAST although that STREAMON resumes
  the decoder.

Keep last_buffer_dequeued on STREAMON(OUTPUT) while a source change is
pending, and only return a LAST buffer from iris_vb2_buf_queue() once
start_streaming() has been called.

Fixes: f15cb8652b4f ("media: iris: Improve last flag handling")
Fixes: 92e007ca5ab6 ("media: iris: Add V4L2 streaming support for encoder video device")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_common.c | 4 +++-
 drivers/media/platform/qcom/iris/iris_vb2.c    | 7 ++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 61634df56797..c3712a29ca85 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -83,7 +83,9 @@ int iris_process_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
-	inst->last_buffer_dequeued = false;
+	/* A seek does not complete a pending source change */
+	if (!(inst->domain == DECODER && inst->sub_state & IRIS_INST_SUB_DRC))
+		inst->last_buffer_dequeued = false;
 
 	return iris_inst_change_sub_state(inst, 0, set_sub_state);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 426810c848a4..b56c855567a6 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -335,7 +335,12 @@ void iris_vb2_buf_queue(struct vb2_buffer *vb2)
 		goto exit;
 	}
 
-	if (!inst->last_buffer_dequeued && V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type)) {
+	/*
+	 * Buffers queued before STREAMON(CAPTURE) come here before
+	 * start_streaming(), which completes the source change or drain.
+	 */
+	if (!inst->last_buffer_dequeued && V4L2_TYPE_IS_CAPTURE(vb2->vb2_queue->type) &&
+	    vb2_start_streaming_called(vb2->vb2_queue)) {
 		if ((inst->sub_state & IRIS_INST_SUB_DRC &&
 		     inst->sub_state & IRIS_INST_SUB_DRC_LAST) ||
 		    (inst->sub_state & IRIS_INST_SUB_DRAIN &&

-- 
2.34.1

