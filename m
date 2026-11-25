Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601977;
	b=cV13bLaI4DdH/Muf3JMWeFLkz48yFoxmGQTcbdNGu7KSILPc6PN23yuee0/c9gxGYSL2
	 j3G1uG6LZ0mo6RW3GiA/zo132B/UPBE+cRibPup55tXh9njvlX/vK0SOhhnBM9OFHC2uO
	 +EFyOHEyK7UiSQ+My+k3oKjnp3ZBqsOg3wpQSm0ubIl4JEJYKkERfImh8mfwWcGREtZ8D
	 WSn+53adw6b197BLgZlvfkZBL+Pelzqh0g97OwGpqKd4lTu0EVl5XBWc9N2QcEETE2q6y
	 GMRQ1XHUvQt33MJreYrKNdqfyTNGIk2t6Fm8bFNcK/DAy9EvOsfp5xzt7xCxlpykC9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
	b=j+/O29Nb+247tvLwo/kxEiI0XzTpTC1PeBk5hmSrtooNvNIzzqEpcKCN9F0PVipwzKVW
	 0Tgu0w4Qi1AXxYvkEX1SHqETDWwqsrNgbP9rC1MqmJxIwoa8xppNc1hIVOYBERjybFKql
	 5nZ/cP+074YlqqN59NQY3NKRo/Ya8E0M1ne6gPFglVDDqaRxd27RKo6U5ps/N1W2z5/q8
	 SUHTU20IkVBXsXt989LqzmCQSBCPUx953UZW60w25iYiQmCsCgQN1ImhLMDbEAEsepwyX
	 wPp9OgVwQCyggMs2GxYJLkRA24u1b1kCeoKC3AiOXIb+SMnH62qdnnClcARFSpIyAzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUqvqEhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqVbrQCS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C41C60A2637
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C41C60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUqvqEhC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqVbrQCS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9m8Js4130788
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=; b=BUqvqEhCsOj4AdGB
	Dfktwk0NHcI+gwD/hO33KMhCdaTlGG13Cpb8+CArmd0+hHGBTh7RbmKIELgYsiDu
	eSCfuB3DiWDPOuh3tKu7NkJKZssBP77I1KMvoNRGN+sUkpTYcrxlk4lyjKJmKk5M
	FLbzp8jaLTI5K/PPqPp/5FQ9Z+9xuTEi/zr18deOygnyxXqYsmvjVGSwlIjrFNoh
	8JENEuH6u3Dtte1HURIn1CkvoVpURhonrNEXt2sDuMzyoa2Ynms42BFIN5g4WjFQ
	3o5IgUOEjNVoCex7eMmva6dujZrAPmzgjsgw76WtyVsBTn+4yqy51VBGM3RKgCqB
	hL77Og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrayy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso164465285a.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601975; x=1796206775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=bqVbrQCSv84uqenS8LEaQJu5xs/wRXNyd+J8kzVmW1vIP6EKAVjB+Qye1AXaNZZzL+
         DMfTB3+pa5wTw1qEuNgDvmYmK8Je+Pz0M4OF7C7Xybknnsu42iW93nI2J1ygbPhYl2/X
         td88eqC7mg9fKIuojZZWoJFz7qwP5ePbCfPsbkB7h0xWG0lfumxKQjJIsrIv/nXtvdRr
         QwIkSNTshUMZVqj8SCMtAaBN3m2y5KEyi98I0OaNUI45GwLljH73wqsAQ24h5/jar2LS
         08jDTntLD2AMwnF4B7MpqF6Vsw24GoSdan3nwykf5j7sdfkmZHGtR5TPzVRLRyFBw13U
         m6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601975; x=1796206775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=MfMZm+Kfz6UK8FSIbsnBm8mpmTz/1kxGkCBVZphFfM79ump8DM6JnIsNXQI+Zd8dPL
         6l9/xhf8A+um/adP6/W+LIDkisUshMUFo6aZQNYO083JDeIgc1awZ8CLT8YGjNFnJHRz
         ucinZQ/4eqxoc2BnkB7JfCtPneT4HOC4N9KxplKi/3XOaqshilOexzBDvXHvDqW2Hv05
         dNTjuYOS8OFTAJ7VPbuugcq61z6DEhBz7LLhlTtKpohXrgD0kbboPgMGcvowYm3Z+u6C
         4D7c9rvuJ+lnerzS0XiW0axvXu2yAOxwr32BWUmWv0+JqpkCXQTVNTxviNDR8QILIRAv
         ++Mw==
X-Gm-Message-State: APuU4Z+HQ8S9/bpshw5WPdULlmoH0dub05J5czVRuJ9Va9EksOVfSdnJ
	82nh/bclZirFkUDJ6vStf27HoMO2li+4dnuspI7M8Ere0iMJqohtwKcqH9qt/jQS+yUJm1/TSP0
	RK2q9qQqNtvDbYYpSuYlur8uR9GnURlGGx8Q+bIX4xGcn171KLmMVuJ31H9oxYQmu3w==
X-Gm-Gg: AZFdTZf3knpGid6hmRvMlBmCvihQ0n309ZShOufhfWw1yqMRac6poZ07lleJUeqj7H/
	CTiIoRDPp0rwozVQ10BlJ4RIoK0zZP1fiPggSUAmmbp8CRym0bFT+axQwwWIJhotVkyu36UH4gZ
	gpJRC3aEe9GMcoBOZ2l7kbR/ZcaaXNCngIWq6Jp/tHYnCKouduodHElsNZ/aMYMDGBeDJtpI+4j
	pc7ENTFKehUmPlfDnQ8qfEQN+/4nC/0dgKRTSSdnytdlZdzbaP0qpC/CJv4tezVgFLeW/68AR4+
	Slt/du8Z1VvD9ijw8pxzSNcL1Ny+LdQfM8SQ9eaM7jfN1ib9ILl7ocnV+F9VtwXEcX4evgpPqH5
	bNL7p/MS6Hu6M4GovOf/MoMPgT9n8+fCaDaW6VvUYnkq1HYEVJgZen5bt67VALtUmBOAFR633eN
	F5psS/w3xsZLfekV2FNIAi+fByW1oCHEU9TPZ4229YDaVtbmmczXtRXU56NQc2YobiQmAQ4HjJk
	/0zkb5bLKXXALGSbjjtCw5imBa7
X-Received: by 2002:a05:620a:6496:b0:949:72c3:def2 with SMTP id af79cd13be357-949bab78ae9mr2742284985a.69.1795601974926;
        Wed, 25 Nov 2026 02:19:34 -0800 (PST)
X-Received: by 2002:a05:620a:6496:b0:949:72c3:def2 with SMTP id af79cd13be357-949bab78ae9mr2742282985a.69.1795601974439;
        Wed, 25 Nov 2026 02:19:34 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:33 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:29 +0100
Subject: [PATCH v2 5/7] media: camss: csid-gen2: Report the hardware SOF
 timestamp
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
Message-Id: <20261125-camss-hw-ts-v2-5-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06b637 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: l3ZFfgHAVqtRLmIRtxAEVUllhSz_hbXP
X-Proofpoint-ORIG-GUID: l3ZFfgHAVqtRLmIRtxAEVUllhSz_hbXP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX8P77yQAnpDub
 YGciv+9mdOKqhT9aV99zmA42nNkHu0i9vPXxPvbLpEwYxnt8atMNFe6nDfHPa6vOlSffUomHl62
 F2EyvB+Ri67c0fUIDPRVOjFpVSCALZw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX/TeyuHgs59u8
 fbKP5L5gLL3jadmUEOZbqs44ETVYb+Hj1Zq+95K4R8FIeQ/0M9ER5qmN08rpCWGXdlvEbj7CfNl
 jP1p9UGemfWLQwKe9q8gC7Ex0e/3vil/nyNaM1z0DeF9+nOpD4oKUF7TUvDkCKclNwBQlL+RCcO
 YYAce/aT/vjmYALrqY0k68xi+mNmE+yqrXtQsnDJBSJxc4OpROVLN57mUmf+O+iDyOR54rxyrsa
 PVGrP+UnM/rKvStyESystFdyV34ULkjoj5tYkSzJat/ZAIyShBgJ5gU24E2h95Bjgcg/GynHbDP
 079SEUpUDyyZbPx5xiXBc5lXRePXoEaC6jESgT184FGkwR9VKVdYs+ypXVrm933pWH6KvUsp31s
 XOFOcVgYyt+S0Drj9EFF/8EEbUH/W/yDqyKkTMODzmVTnfunqw02MagJHYB3VFHIQnyg7kXJT9E
 MW82JGqxmkfciXsLd+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The CSID latches a free-running timer value for every RDI at
start-of-frame, a timer that keeps running across system suspend. The
driver already enables that latching, it just never reads the result,
leaving the frame sync event to be timestamped when the interrupt
handler gets around to queueing it.

Implement the sof_ts operation to read the CURRENT_SOF pair
instead, and let the CSID core put it on the CLOCK_MONOTONIC timebase
the event carries. CURRENT_EOF and the PREVIOUS_* pairs are left alone,
following the reference Qualcomm Camx code which only interacts with
CURRENT_SOF.

Upstream CAMSS uses a fixed mapping of RDI to virtual channel, hence
VC0 => RDI0 and VC1 => RDI1, so the event id indexes the register block
directly.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 85e9eaf78df75f95d5f44f83b45dc7a3633401d0..47b0881e9c9942eeeaef53d8aa6b466ca21a366a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -376,6 +376,20 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
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
 /*
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -459,6 +473,7 @@ const struct csid_hw_ops csid_ops_gen2 = {
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
+	.sof_ts = csid_sof_ts,
 	.src_pad_code = csid_src_pad_code,
 	.subdev_init = csid_subdev_init,
 };

-- 
2.34.1

