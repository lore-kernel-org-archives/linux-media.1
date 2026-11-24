Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538868;
	b=JO4a5qfHXk2xMVLtswvzLbMU4f1x4PqSolr8BSO9iGrkyA5ncd6C0lmTGx4wVcm++bH2
	 sFNmP2nle1LQCR8Fazvo50DBayqjMeD5NAaGZKw2vrgBJFr94B4RXLy6oTGBd0svXbR/h
	 8pvCIoQgbkcW5IcCCT59Moxm65A6e58pnZokFhTO8EoRvmlARcMWNPrquaJUgT+wWkh4j
	 Y6PpO+nzq/4wgzxpR54dlJ2WwrpCUUdNJsuSW+KwUvOIeA6hshC2PrY3m8TaVzp2xOiR2
	 lyzxJTq2yzdrrJCEq7kEBLPQowv/5BFe+iZR41qioi99aG9EZtFK8+Z96qqPeijNB2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=;
	b=pSoPsSJKa8JIQP0IuqSV05+Y8ObdxO4HMy1Ve6npyeDOobOnKZkFsEBpBpqcjbC352W1
	 1xsPgjSjvernlttjXm4RWBKc3QY84sxWTy1wpcj77yMQaeJNwjPLfsGDBe/4t7u0bKF/l
	 P5dzge8kHG+iLLk+Di71x1XwZ2aVgneKPlXIhYqZbLg+hmXpqgQt9dMrDIQl8COkD45IZ
	 RQAK65xs9/wLpSDSYbxyLuiJwm3btqgcxH28QeCXrDWy6mAkBZdGArdgYNtS9SFD1kBqm
	 dAxyIGDZa+xuaasZkz5B6CPBu0OcpWU75C0qVvJibFK5BqkakiMonltW2fAhBPc9kuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ajAFrMyP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGvBdCX8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7227360A260B
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7227360A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ajAFrMyP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGvBdCX8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL8JB1215348
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=; b=ajAFrMyPNlaEgKEs
	FbBFJU9wYgC9rU28HFwSZXQHanhbLP2V52NAvrQABxoeZsOyy0WhZ8pch7B1u7qA
	9+BcHP0WZyNWeonLemVPJTxWQtXYUpbYVDXZ3y5Y/7SyBhKCqmIzaKwyjhq2AJHN
	DKJs4Z7ItctQIcS/C0JdAfdqVUk/roCG4dKGkdushf9vm31kkBaf1KJ7/obflFJW
	G+q7UjsPpvRZcIXl2qrtmvkFruaR5LosaatO3RIOj4doK1Pge7FZ9PAcrEf8NzTS
	wsyZaKE+aC/Iy7M4fIdldM6234Y/LINZfG44GcQhUx4IRKTQ/j5HY1yI+f5pNpG9
	Q1oOQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpjuyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:47:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so848999485a.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 08:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538866; x=1796143666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=;
        b=gGvBdCX8Oct/h46E9pQ6BpK5VPOctDPPmcpeec24S1Tq30qKAUH8WpNS0KZO2XjGFQ
         xw7rUkzlS+agBQrzx+vJvw1Zfl8N+/qsqaDqKDsHNkQzlT9q4fDmvD7eyRyWMArPy48f
         TgeBuTWp3s3BZwIQauk8NJfEuEJ3VCwO/QTx0EJgiPuiYQQ+8PkOo7syUPd6jjGe1wpV
         uthU9bJ+dj/Y4oGR3BAsvggIkaJGCAL9GlzZTi9HePgOswuDpeMjmG8zYvjd6XKz1tJU
         Sj33R08h+mTQ/CWals4GakHTx2Puc1uiz48wwOUExHEtOU79pW1Q1hRW+ObZOszfz3Cc
         acLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538866; x=1796143666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=;
        b=zspFva+6De+PM0Qpy9twbUeQBcl8Mhu6o8InkBzAzZ9kS9TJ0oOatJjvcJE/gSRdzW
         +yLH3o0DTtHndzsN6TX8K5UexVgahzfadxXJ2STivruaet/u9/5e5XEg2hmRBNHY2qzS
         /oWaJ96CcddL52P3gNo+4X2Qc5TW3nZ+6DFQL4f1VW4IwTcub9elN9tGPY/G5cPcGL6B
         Y3txB9uWmjDb2EGyg+erJ3fVcI/64kotxzdahThJAW1yW46w+YG5CFIJyV1TRbypreeK
         erzwWUa1xo7LQQ7UlsFWKNJQwVMqASU6aB7xeVGniEK+Nn1hfhbVmH0i/AYS4xgKOtC5
         XVYQ==
X-Gm-Message-State: APuU4Z8VoiVQosaCt2ilARK5PvsALA9yrKrZ2ZVo+du+rpHfsDqgD973
	Cn6oGxgr9xILQFvbTpgI1NhU6GKmhWUg31AvP0Az4bDRDNcWw/nWdVfn9Dzguru4+EMMByvY/Wd
	5hOQzs1v97dEEglmcPpDO8FLvZgWKSC3S0OKifX3jYiB1HNMsXqIBNicW17ObLVJoCQ==
X-Gm-Gg: AZFdTZfVtw+KOvlpPPEsJBJxsOIBl1GCoyK+fjDKWOalsOpNGL1+0rTsJ0nhfKUgPac
	Eug7hoGul6Gw1IqosLZS2F5S0sSahhgaqPqjs+1qDYQ7BkShQ4Hha2rqoPI9+39fy8sMeZNTgnt
	PjQ4ix6x+AppUtt7yGZKWzRVnvam1ur5PyXlTl+7MzFxRN1rBPKu2hebfb8PcoTgPCZaGEGmfXF
	vL6QRoR19fHDOl/4pccxRNgBfsMlERez/6P6OwkdQ7TgDURnpkCSl5VjQdiyAiF0EtXd5CsfvFp
	aV0vN8KOEMthTC8ePXTzXLBljTVxd4FwM1LdMiiBa7c1n8b9j4Iy8hIHbkRFqPF3+DZ8FRMl9a2
	5nrKFUNsj/tPZGXU3ZOHxcGngaOsw8PEzhkFoZQL+UoRn7k22aAoULWdT4Ma0fExfH/VdOopTGJ
	Vp+iQpeYwBYhYS73/OmLIvsdBtnc9tltPeeQh+2OMRGOl/e6gt32n111tAvKq1G8ol47FyLrGVb
	bwocoyozyM7L+xzcp3Mgpn1+rIf
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2873313685a.29.1795538865666;
        Tue, 24 Nov 2026 08:47:45 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2873308485a.29.1795538865223;
        Tue, 24 Nov 2026 08:47:45 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm29388605f8f.5.2026.11.24.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:47:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:47:39 +0100
Subject: [PATCH 2/2] media: qcom: camss: vfe-340: Skip the register update
 when queuing a buffer
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
Message-Id: <20261124-tfe-fix-irq-v1-2-fd9840d952ae@oss.qualcomm.com>
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
In-Reply-To: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXxOcDBb8lq9FN
 eBbEpw0wZTH/YTioSVNxry4jDmrUB/DVuS7AMJdilkydMMyQAvt4ww4GjLRNtFOv0OtJ4n9Fae2
 wYfNJevI6+tpq5k64PwJd/eeJI5hfUp6O17kojjP4JgJ2rDx5+oEqNgEoPAOdzgNlv1vJ5gWe2v
 6Y9sjLBekhMD01OqsFgAgkSmgoLDln8te0BP5ANtMba3n1yUJPbH+TtE1ACUjq1ccWLGoGswEpY
 B6C5gCEYlnhMJIqgKXruVr3iERMbF93zvijvEvwjIhRl5jQoi8o6OcFBcAc5dj2/hRsKoZ/ap6v
 rHaZlP9jtMKIuFYIgHSb1WT7Vl+QXCZeocBTYKU5rrohxfOxnoOI+VS6UUNOkdqpWKtyVt5bS7M
 u3vaO+nlpaA1di3E0E3VKy+fLhQSD6H9mX8OFtkrdrGpYZrXXc+3WWhH0i86zCIlf5kJcH0F8RE
 1H5MUaBCoSHqQlQlD3g==
X-Proofpoint-GUID: FYQv19TjP5UitSzW8RatDsg3rjCJIAwS
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05bfb2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6k50daf3fveMbYCwvhsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX+ErMCrT+UAHv
 OyOCqb54jm3Llclp4WjguZUsBmB6dPuNysS56sA0L+bIdEdOo0/i+Jdt437igE6oVYhJqzW6qUT
 m2swjLKMO4i+JCCkw1qd+HQeUxEb79c=
X-Proofpoint-ORIG-GUID: FYQv19TjP5UitSzW8RatDsg3rjCJIAwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

The TFE bus image address register is a FIFO, not a shadow register, an
address pushed by vfe_wm_update() is picked up by the hardware on its
own, with no register update needed to latch it.

The register update issued for every queued buffer therefore costs an
extra RUP_DONE interrupt on top of the BUF_DONE one, for no effect.

Implement addr_update() as a no-op so that vfe_buf_addr_latch() stops
falling back to reg_update() for this generation. The register update
done at stream-on is unaffected, and streaming now takes a single
interrupt per frame.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-340.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 2526d568686db06a233f0aabe4bc176e4c440ea5..e6f863d8f38d0a7f1e8fba431dff2d8583eb2cba 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -365,7 +365,13 @@ static void vfe_reg_update_clear(struct vfe_device *vfe, enum vfe_line_id line_i
 	vfe->reg_update &= ~BIT(__line_to_iface(line_id));
 }
 
+static void vfe_addr_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	/* Nothing to do, the address register is a FIFO so vfe_wm_update() is enough */
+}
+
 const struct vfe_hw_ops vfe_ops_340 = {
+	.addr_update = vfe_addr_update,
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,

-- 
2.34.1

