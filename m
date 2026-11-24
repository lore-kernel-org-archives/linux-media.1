Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538869;
	b=t4LJVEJAwENFk0MAIbcf9uWjTN938Kl1LWujoPV7CiB5rnisps6bmBfspAZbYBWLuWr7
	 rzorWEG3nGaw91azA8leC5CyMdtItiebwzW/dwL9YIj5D2j2QIr//d5xQRCXTL7mBJwaa
	 CfAZ1qzaQMG6ZDUiMG1PIBFt5W90BjMtwFKlMTtvKrr8HS2/R91+EU9lyUIRZuYWm5alA
	 1CQHcigib2BvyoIdfpgxVVPktAX3PujROi//dfST56O6smWnQ2HotpVmtqJJDT2ULu/Yf
	 bV7wvijvGIrKfxsT/RTPJRjWfov005H+Lr5lfAZiNU24Wmrqp6evoD9AjzWu54ra/Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=;
	b=0M7CcJ5NhiDdP2KaWfMjgyG38cZBhJjw8qTJTscEsKSCs3fjJ29C7/6xQjiJlvBf4zYa
	 l5DFYqgpDf7tPb7b76p+4H4vMjKpeWVb4bKOhPTAviqVmTYQjzhgJocASxgGh6tEVZ76Z
	 wsNISvpBLoavqAg0P12kEVcvv+FhDlCoPd1YwDmLg8NA1E96I8R/8DLfnjUpgXadtXIOO
	 GUR6G8CgYQxF0JdEM87+IID2NHKFdMISMXT/O7R10k6chS1vDOlBitxNhcMFWru59RjRa
	 8DQHZZQ6HBhLBhdaLUFZJgqL54TKKWcPTAQVgjZOPVJH3mZAmaQBsujq2t3gf2c2tEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="D/wehGwS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gu+RTcrm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA64606A681
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA64606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D/wehGwS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gu+RTcrm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLHPb2318369
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=; b=D/wehGwSYdfacokR
	vMRQuw7sbuVVO4g7TxKw7T9jNTrcpseIidz1veGPlzdKE3SpsS+670tW5usDqOYN
	xGHVhB7lBsd+Nclznm+xYhvfmE/BEfHU5Ef4dVQSFG23foboGNY+mkC2tFaSQH2Q
	pPEyFc4PvkhqqA1H+shE7kyjyQFMsamus+UpyIk49tqZZXo9iCtFaoja5DNhG7Cr
	ykjAiU6r1AUWrcQpWpBySBJz4mbN4JVb9XkrzomWmvSPjUzmWRD1dqQYJ7/zVd3K
	9L4ft5yq5c6j0nvoRa8WKwIvPZRKpUKxAiseMGLLOrkKT8W//dMnjm1LTnjGk9+4
	0GyUXw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd3w8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:47:45 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-86c3a053d9bso64841557b3.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 08:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538865; x=1796143665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=;
        b=Gu+RTcrmQFfiAKpjD75dlfKRCtjvJZV4hCbf2/kirFYtZHErpOwZD+/ZWf94QDs9tl
         k2gGe4pb+riYYevVNNZjlgNqHq6k75mLfjk2ojUFL23Z9SreFfXCYgQvHdaQuiwfOIVJ
         n2WvpIIsjF+4bQRagnvr9zL4AGuejqeTmtgxxueS0IH8GzRw4xcHqeD0eg+nami4ftcE
         +HO/lbQ4ASE07WUdiv3fSGjBh9TKkBBOu0A4mWO+eEWLTSEbBDygfSJ6msmn1vkFAa1g
         eA0FMUOo/9ZwoS7zGYJKKrggsI2hk3BppYQHL/x03Fwr+eBIbetwTeYKOFxEM7/pU2dI
         0HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538865; x=1796143665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zwd69s5iiFQhNtL3OETfY3InFvNRDefVxvbxKiMIjdc=;
        b=jcPAhKxvFJ0y6k+iJvTOEPJqRjxvQUo9btNM8GsqR2RihFiihgrKetOnwANL4v9e64
         h/3++oFWROdb5W6+cfpCC86d564+al1pC13H4hhVboambMeQXn0JyWLU7+3kLqgiAzZM
         u25CG1RcvRZ6KUI878fpD7nNtInmPT5EmQs0crbZRHfAuw+JtPCU1YOlWEWg8iLmpfjW
         sSgCDE1zeGpQm/eOJquGm6djdlLeeWGEBPAXBX3ubA64uv9ru8Y/FuqYN2LTDZza3olb
         vJdUJGJe1tCzQuLlKLT2sXadDKaV8tBiG1A9Tj4hpPYalMpvp9tRFo2GADJJEocEi4zO
         1t/Q==
X-Gm-Message-State: APuU4Z+9uqsuxqtN7NlhECEhlzO7Q5u1gNj6rPHQ7maMO3HNm00b3kCO
	8+fn2TOH3bnvlgzW1WoDauP10P2Spr1yWUF5n83IbjPJ16PNoJms3XKMREno85T5Lbzqv/wf7uQ
	1AL/XglF4wJtbVuY1ythA2ok5FdrWk6k2yPFw9oYGp3x8/IkOa0iCBQpbQnng0QzzWg==
X-Gm-Gg: AZFdTZfh/gh5heOW/SdF7bdKVMOzqOlrhkt16XJvWJSKyT5zlrOTtOkpjYlRFgks9Uk
	dXbBZXNLM4kyWRxiwrFgLqwtlRDWNYyO/shR00JySlXaTpc6nNNMwC6U+jQ/ssdWiZ8iIWn9dck
	9MJ/SI0mh1npGYt5yQYqwAOFSMcW2YTX2G1ETCw+8nAO3zlZ2nik44cbT67O9nCBZLD+s6Zcycx
	ODMtl2QuuREZ2sA0LArVG+pU43Dw2QWCvw7rB7hUuo4lc3FM/bM1huoq4HVPcABxpfYb7Fw73Hg
	vE7rxf67iUtmOyGXAcTk64+AmVx7PxV7C/Meln8p3JxprsgUbcLmklz4g7kwyuOu8w9vEtEmzWX
	FZ7xRixu4MF6JENKq32nw2zadrhaFyRmJtgI2Tfu3IffrqLBIrxvcMKQNyoUKBa60Tl15PARYoL
	ZgQ74c70B+SnfTAbURSDU1n+kZbehOADWjqqqfcgBi+xvxpuTrEVmy+5WcFeutWreVPKnBssV6k
	uwBIDBZWK4BRd+yUc7deVwMBHMW
X-Received: by 2002:a05:690c:e0c:b0:8b4:e258:408 with SMTP id 00721157ae682-8b52051832fmr70264977b3.58.1795538864465;
        Tue, 24 Nov 2026 08:47:44 -0800 (PST)
X-Received: by 2002:a05:690c:e0c:b0:8b4:e258:408 with SMTP id 00721157ae682-8b52051832fmr70264837b3.58.1795538863804;
        Tue, 24 Nov 2026 08:47:43 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm29388605f8f.5.2026.11.24.08.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:47:43 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:47:38 +0100
Subject: [PATCH 1/2] media: qcom: camss: Latch buffer addresses through a
 single helper
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
Message-Id: <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com>
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
In-Reply-To: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b05bfb1 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=q_A1cxkaZBfKfFhyi8QA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX2HkwBofsbrvm
 E723D/urxl/qZHbsDk434D/Ti4hnfskM9iaC+9Rz4DtZAsN72rRJUFG/KttcZF7yh5+h311xLQZ
 bjO49HkgE2C1fZ4zLmBp5q2i+Q/5xtKxGzv8Il8eex3/1QP9P0Iy04l2XCZ2brCADzIvPDhCWBj
 nHtaI07Pdc4inD1yDa2B8XaNF8rp7N499yuloT7y2VjVKHiMJcEPq5uQqD78E9l48Sg6GbPa9UG
 jReKp0VH8tOaTUujdDN/03GcjQ+P9mx9+jj9E1Re4DCzVgZHHs6zmuqUe4g02QWrlQ+xxNiV9+1
 xtbJabdt/JTIrX09TgeYj5P7oc8Y7XT9zCn7EmH6Z53zVXM8c0PmrMiuWxg8iXRG4Z4tzr8XMhc
 fAwxOjt1lI+i5ekYpAzOIUiBLuwYRgx+AKnVgrtL122YGSUTV7TlCEbbFCY/9qSMROywC2MnX3B
 vwxwdi2iB1uKTPY7GjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX4+6MnpjPiDrP
 MKt1oE/8xYSdeNe8bN4z7TLVfYV0dLCBEY7aAD4AV5eFf12oHQl/MKIRe22uklQXkoMbc33uv9A
 Z5mmKNUunolY7dvjLF4LL8sX965YUvU=
X-Proofpoint-ORIG-GUID: l9SapgOQQTTp2EGvEkfsj00qspZIQJ_c
X-Proofpoint-GUID: l9SapgOQQTTp2EGvEkfsj00qspZIQJ_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

The buffer address written by vfe_wm_update() has to be made visible to
the hardware, and the way to do that depends on the generation, the older
ones only expose a register update, some relies on a FIFO, while the newer
ones expose a dedicated address update that triggers the latch on its own.

Both sequences are open-coded at every call site today, with the address
update being additive and always followed by a register update. This
leaves no way for a generation to tell that an address update alone is
enough, or that no latching is needed at all.

Add vfe_buf_addr_latch(), which calls the generation's addr_update() when
it provides one and falls back to reg_update() otherwise.

The write master configuration programmed by vfe_wm_start() still needs
committing, so vfe_enable_output_v2() now latches each initial buffer
address inside the loop and issues a single register update afterwards.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 33 ++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f9bd2367671f6e50c6948a6405f78b8c2b03e5f7..f39e1f303c9bb64a41c59d0d413608b5cb54a8ed 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -443,6 +443,25 @@ u32 vfe_hw_version(struct vfe_device *vfe)
 	return hw_version;
 }
 
+/*
+ * vfe_buf_addr_latch - Latch a newly programmed buffer address
+ * @vfe: VFE Device
+ * @line: VFE line
+ *
+ * Make the address just written by vfe_wm_update() visible to the hardware,
+ * through a dedicated address update when the generation provides one, or
+ * through a register update otherwise.
+ */
+static void vfe_buf_addr_latch(struct vfe_device *vfe, struct vfe_line *line)
+{
+	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
+
+	if (ops->addr_update)
+		ops->addr_update(vfe, line->id);
+	else
+		ops->reg_update(vfe, line->id);
+}
+
 /*
  * vfe_buf_done - Process write master done interrupt
  * @vfe: VFE Device
@@ -491,9 +510,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		output->gen2.active_num--;
 	}
@@ -564,10 +581,12 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		if (!ops->addr_update)
-			ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	}
 
+	/* Commit the write master configuration programmed above */
+	ops->reg_update(vfe, line->id);
+
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
 	return 0;
@@ -601,9 +620,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		vfe_buf_add_pending(output, buf);
 	}

-- 
2.34.1

