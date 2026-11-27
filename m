Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795927;
	b=cb0MMHNS/VMljIIHYqbPksqE6Hww2HNAQcddwP3Z9AhWYNSo3kI9ynuvdO1YAoohQdkX
	 Ye9jmEA0ChszCwj1y6AsN8Jtkm3/sNpB6qxuRCWnrYudRxPjNkC40DJBZJ8AEEOK7e8Hx
	 ZXJZ8bbRpznGT3gC0L1oaU1C3ge6BsRZC9Ak+2QiKqeoAH/+DoeDJ0w864L1VC7+d3+ve
	 041/42KHu/EJdCq8C3DbhLAH/h/CJu4J7oRk8uLOr0gmprgQmdtoWExtGsIh9jSbIm1HQ
	 FC45ujk7kLcgrPfRttbq1VCq9/sAK0cCSKsYz8My+3kFh3DOOY5vktazslxXovCEeJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K8F6NOXZbO5+aBuyxtstfEHLDrLabiSsP+3Vy3TAHes=;
	b=lHRqpKQ4Az3VW47nodUmKBFi6CeD7WGSfvf1lWfDF/kDJ+7icSdlmQuKMaafpWtLQECb
	 LI/kh8XwI26P33boy01gqgmSJBPaytbrWmd5juBnPyuMOVfsfn12enrr6pMeb7H8JeU8/
	 o+rsbq/WLlHK4E/mNBGdbnLks0UjGjaDTt5djp0hunR41jFCJ4+eroG548Er9Xv1Tb7/3
	 QGXwBkea/+kvSAk2peQ+Hv0x35UNZATVnaaSCKcfij3LBLMmgPpdkABvMoSd7FFzc32AA
	 IQ+Z9cS/b3M+tznEmRjV7il2Knz2wnawpYC9t1FKn95LWONrLZPq6tEAbTeXD9t8YjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EZpptMXU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ly7S8KKV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8B4606A682
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8B4606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EZpptMXU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ly7S8KKV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpjZG2211914
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K8F6NOXZbO5+aBuyxtstfEHLDrLabiSsP+3Vy3TAHes=; b=EZpptMXUQotrjw01
	0VmeZfDb5UgCLjbJmdHW9UfnEaENyekXZRdxI/ZeDccEQtbJ3Li+A23koRe3zeYw
	uvJ+Q8rHPxMXehDZQF7vvYJLcYPdCD3VvMU+d2+ZvaPHHQPD/RYElvTLOOGjJeYR
	NaLeSs92a2kMJugKiuJ6TFNk4Ur5qAqkgJkZM6UffG/3Rdgfn+dy5Tjfn/JrLJxA
	5/fgphf9jO3IT3cmBl6hjZ+hUAjcDDbl8noZipvlDestT68ik46FkWW349omChrM
	5Ue3336kKal1iL0vaMVlVlYM9WApohLSxDmbNCJe0J3DJ/qM5Y1BBx73kOw80tGE
	D1dFDw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55ur09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ee4ca144bcso1092029e0c.3
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 08:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795926; x=1796400726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K8F6NOXZbO5+aBuyxtstfEHLDrLabiSsP+3Vy3TAHes=;
        b=Ly7S8KKVdJIK6biMcv7WMngcy1RG73v0T74VMTHKAEf4LSj6QM7mBvlysFBKiXiFLa
         wglccHTK6x1HCGRIUYNsrMbn7qjwc22OgiMwgiAraTwte0bvgMBAGBZUHc22Dmm/TaLW
         80WoJtRjz4gM81EdGVUV5SUDNBVAT2hoHMeNL5jxsTfllLHYYifrABICspvy1Jiejna9
         5+YYlanhJSqOdbDKVmGAznheLch4jhBmKeQHVVZFjaHDI5K14HRpM9cgheR4d30+Bn6J
         yXVaEZLDKWAexccbCxZqNwfwG7uDYt+vps+qna3DKAzlE8ex57jyk3uX3UlLJ2vkZm1a
         qrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795926; x=1796400726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8F6NOXZbO5+aBuyxtstfEHLDrLabiSsP+3Vy3TAHes=;
        b=WGspn6XnV3k6nclCGhrt+gY5LYOeq39CoGKmmqiU2kBn7MCCZckwbO5fjnGfD0Vx0b
         +oboyo10BILH4Phzw1tSwfZgCMkGHrA/d9nsxai0KCIVBhfKqCWlWOPXs/IszeMWh3lu
         ih3nP4BsyRltu1iM2Tp0eHNYZGWwNDlRTJt7BsF8ehyJl1JnwZE2zaD8gCFSL5G+dr84
         aI1LldztEsAMoP8a35m5YOb8cjTKw5wfBm8NObqFifKkHpRttqjmgKzgJ9ZRdvsME3Xj
         a9/qXyH7/8v2QDmPJF7IKpFx4mEYyizLVx0Zu2PCnvDndOImA4gBgKe3tnBBMF+l9cRg
         uE0A==
X-Gm-Message-State: APuU4Z8Y2J22fOp3jP/CzjghQpQXwVxXBc/yoU6aMzEelhw1r42bDqnl
	Dqgc2yfLcg2kU0g96d08xh3jb9zc2r4RwgqduRIJxfm8bQflbbPO0lZgcf9MPkopfv4RIlMpYYG
	6S1M3RysGe05A1yF8MWUpjUv9aRkia9aH3LvwFLSUiLV1PW5DvDXf9q4fR9rXNF9lhw==
X-Gm-Gg: AZFdTZdORDZF8KwGcwFMs6A5GtV2s2secAl2/UpRlIPoLj92mdMZj0EupkzxMQRFddL
	5bLVmBT6u+xuuBW6wLX1GUUTKprDmcCd4g8rM0/5Fl8pN/9GJhSTWSw3UQcuytxVrXPCwKe3OS4
	a6tWCC1Bva7UW+hIUs4VO+RPLU7mQYJLPwNhdaDaZYM71Y75sZwPIVQ349aEZw5kyFH1sQAxOFe
	ZaiRQCPlU1f74qIGclZiY+n4EReBUqFTpMOGdcP43TtWZMRCcW8Jb9BkdPeRii6Kk67Lb6Yh/1T
	Z5kJhMS3Aj/3cgFm0IDLpkDA5ohWNsuHPk50Vj5DFoaVadObGvffZ7Rcx1dGjpq4Svw1LD1zYw6
	L1mN48hfpBoYUwP+iMLV8RXy1HjjDv7rpL6OanBnWIoV2n1WpDuTiTDmacoBUbzKOoZ4hptBgvq
	UHjYsK+Mj700jekkyceNzR4cT7fOrW8fO0l0sRcEz0b0oKZPsktID92alqNiLRjSPTd0qXJ4PVL
	zDMCtQj36ADffxTjx8a1hvMU8I1
X-Received: by 2002:a05:6122:3a19:b0:5ec:b6d7:9b46 with SMTP id 71dfb90a1353d-5ee8ade9b3amr11494917e0c.3.1795795925478;
        Fri, 27 Nov 2026 08:12:05 -0800 (PST)
X-Received: by 2002:a05:6122:3a19:b0:5ec:b6d7:9b46 with SMTP id 71dfb90a1353d-5ee8ade9b3amr11494856e0c.3.1795795924960;
        Fri, 27 Nov 2026 08:12:04 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:12:04 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:56 +0100
Subject: [PATCH v3 6/8] media: qcom: camss: csid-gen3: Report the hardware
 SOF timestamp
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
Message-Id: <20261127-camss-hw-ts-v3-6-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX9j5Mu9eMDxNW
 iUYqTkGHS0ClYmwapjFVDgeVTCnC8MP6GO3F0LF+sSPgwIgWYZ6zd5lXmV3HKZvgTcVjeu0y6x2
 K+tQOIpCYQ8mf99ma2veh9g5iSPsC5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfXwGT2KbYgwoEk
 BZm0dcus6b2gndH3sTjf+gfPckcvF5TrxOc/wNmZyCK6TlfZknak3AgGNFQD8wWmfs/JsfxxJgq
 Uxp9N+ZuMEvUIpLsAEgR404Ixxg3pQpKhpazbjTDBHqcAjreDTJ5OqnGg0feSHCspPjJmzdTxBu
 q3VMgdn8DRTPWW811M1Z2uXVF66Lwg1YYS5nUV38C0BMKeEFKzfcXQMURS6YN4sdL94g7o4/6Up
 fVoJQ4Hhtxj6siL0ii69wWZaL/2mnKcVkw01v4WnoLWhT85fo5N2E5xwBKoljb1muSxeMZPSYFT
 XdVHW3hzYjMpcIEwmwVJlcjRZvuIpVSUogGZAop2MoQfLQnWHkybDxiOQw1S2IuESmiaXp6fb01
 9vbYUkvdK4XJ1PHW8wnaPVjL3JYPfnDSJGcVpUud+vBlMxnJkxg4hEHcmlaS79F/50q+RT/T8y6
 u/1CRbq5yZdPNexNvuQ==
X-Proofpoint-ORIG-GUID: xR1o0EmfHyCX4QTalBxmhMQ-85TCm5f5
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09abd6 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=uYcjsKY6Ai37ZVY45MYA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: xR1o0EmfHyCX4QTalBxmhMQ-85TCm5f5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

The CSID latches the ARM architected counter into TIMESTAMP_CURR0/1_SOF
on every start of frame. Implement the sof_ts operation so that the
value is used for the frame sync event and the buffer timestamp, instead
of the time at which the interrupt happened to be serviced.

The register pair is latched, not free running, so the two halves belong
to the same SOF whatever the read order.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 5dce6f722d05817f43341d22560cbe32def08cf0..5da77dcd3471033525f6fecde547892fff5965a8 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -118,6 +118,12 @@
 #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
 							(0x34C + 0x100 * (rdi)) :\
 							(0x54C + 0x100 * (rdi)))
+#define CSID_RDI_TIMESTAMP_CURR0_SOF(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+							(0x394 + 0x100 * (rdi)) :\
+							(0x594 + 0x100 * (rdi)))
+#define CSID_RDI_TIMESTAMP_CURR1_SOF(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+							(0x398 + 0x100 * (rdi)) :\
+							(0x598 + 0x100 * (rdi)))
 #define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
 
 static void __csid_configure_rx(struct csid_device *csid,
@@ -391,12 +397,27 @@ static void csid_subdev_init(struct csid_device *csid)
 	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
 }
 
+static u64 csid_sof_ts(struct csid_device *csid, unsigned int rdi)
+{
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR0_SOF(rdi));
+	hi = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR1_SOF(rdi));
+
+	return ((u64)hi << 32) | lo;
+}
+
 const struct csid_hw_ops csid_ops_gen3 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
+	.sof_ts = csid_sof_ts,
 	.src_pad_code = csid_src_pad_code,
 	.subdev_init = csid_subdev_init,
 	.reg_update = csid_subdev_reg_update,

-- 
2.34.1

