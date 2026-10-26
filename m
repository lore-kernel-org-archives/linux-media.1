Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021861;
	b=2TqpQhNdmcEOkkYPtHxfOLt5+rVJ4mKq4H7S8tunGDL9t/G3LHfMUeRpzYgzQccgJ6Yk
	 u2KWsdb510Gr0SMBrCHLv+Av+aAGnm7zXqoe+uoRwRtLRZK2IMihLvuU5S5mc1SwOkXhG
	 OMEvUHzVi5BDN6cGQP1Y1yIDB2amjGibAYVUIoZzlbkUi1TeDxqjaLqi+be43sumLWEMQ
	 kwgNizfmSD47g09OiqJDIpk65tG6UWamOjOE8VkWzNk8R25ErfaEBGnF+vk+GsEWlaGS2
	 wZ+cFHlkg5BGkKemCxqOQ9noeGgjGswiZ6Eg28KiIElZx/xzfqoxJ3jAlCIQtEpjSiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021861;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4B/0/ytmAQ/1fkoAxD9o7NsMiq+YGg6SaxzXQJogg0E=;
	b=HxBmNI/Phn9kzWLCPnSKIujO2DPBuYZVuGutl1U5Gc3i22qa9GKm6N0guzr1vv4B+Ocl
	 taO20BWgNuHGVh/oeQOnkKCckaFjwJr6FMfhKZlz2APn2nb0AhkTEljGioSV3u+NqZ01J
	 2tj5gtepBt7OsJiJigsnK8iKxJjboke0sjvetct2GbLmTvSBVk7EQFwhvMugkmKG//6Vo
	 sPTV3Ck0eWv+L6H4DCY/OHkUq7LLWJLsIOhJZRYLYo3ivCm8uLW8xk1wMcEduCSsbFbZk
	 /zA8I85+nhyFzhquX9qdnRtdJ+MABfsOu5q7W5mUC5VBUrndKTk6v1XJyDDIKbDaVXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu0Ukfiq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2ot5XJ8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46360A6F60
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF46360A6F60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu0Ukfiq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2ot5XJ8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt7WY4126429
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4B/0/ytmAQ/
	1fkoAxD9o7NsMiq+YGg6SaxzXQJogg0E=; b=Cu0Ukfiq0hsUNul7fY3GzX11zJX
	ppz5tRSZTDHK5KM5L3Xhp44Xo8gOpLo571jeh9ME3nGD61fGoElb7w+Seaoe+hKd
	Y2d5GPyZVyj19jrKgkcpcH0HxTnAww70Vpudk8LVpmEIc9eKs7SVDB/pOzXoHzdf
	PIdA6jvaLYZ64SS7JPPPHuZOFvghuLsC3SgISyo74CQzCnLPglPf0HNct84YsIEZ
	xMa0mNfR1Y3A/evDX4iqynrA7ywCcbniaVyfa+2cMqYwmA7+NFw7inVzjNLQpSn5
	/fFQkiBbs9u9jB78YU277WQSDz2LfNqcdioq4pJ5Kq9kEcfewolHG8k4fxQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshptm74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so683160685a.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021859; x=1793626659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4B/0/ytmAQ/1fkoAxD9o7NsMiq+YGg6SaxzXQJogg0E=;
        b=F2ot5XJ8l1yRH+oHHy0GnLA/EY64Id6pvVo4m/LzyDwOgajvClcTk6VCwKTNQbeFQT
         NHq72VqMq7jSat6NlxXMD1cyyss7poxLlKMsZXR89faDPp4j0xqiLttTqQQMVlbmHps1
         f6th9HwPF5lAYMJLvcmoBcS8po7yqMlWxHZQ3pXlNnyo5Kqzpv7I1OMJzwMsRLBRWdhT
         M6AmyKObvXu3xjhZUVbr90T9Y2Zlh4xphxGAGcmk8PLPFKPM+oYGWtwUK7kMv45LgEF/
         PC44z46MbAwKNIpzva1tiIGiTvLTAt3lse17uHRH3KkZL53fFbUKoHVZqhfpjGpTAd0j
         bo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021859; x=1793626659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4B/0/ytmAQ/1fkoAxD9o7NsMiq+YGg6SaxzXQJogg0E=;
        b=B0Gdnw70O3MPy/+0d7Aktat+F66O+eAZoONNMMXFx0Gec/8X7fxxDtsEnbMykS5gO/
         zwlAYaRKM8/59Sj9oPqjjzjvegrWoDebiD0U88JGBB3Xb80RlL8ZhdyIQLThFmRs2qMS
         NBKfoE1lxsS73lc53GqygpzDD82dpTnOoA+K7BQVuG+t53lLvRAe0qE3DZEHn+VLmgPC
         QlaQOiosmd5xFBEPycVmgEDnUycaz2NXV3CGFXALWUzkVboptd4DWjBeTOmwGBU5aOb7
         VCxGpJpc1xZeZHHdhoE6wV7IZRB3tX/v+SUwTE5u8Ot61DzR42l2tr2EN4STVr42wlOc
         zeDw==
X-Forwarded-Encrypted: i=1; AKwUvBzQbo/0KF0Lydv4Db9+wR3HMxo6ojkszOqM3zVeH3X/4P5MkCVnG03ui6KAvYA2edvHT9xAnqN8eQx4uw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/IgVmZFrzgUSWsMt76xvaaTb3b8w2e4AF9QsaTEzFK9/eT7yz
	A9C0ILursDnQk07nv+Ugf3o8p3cm8za6QtpvGoLIa28imCSZvtqxH7kdZ9vUE4kvmRlFDVTcwFC
	9G+5tgAHMgE3vqJ877JaEOZ57/wxQ/qex3yB/aVtGaO7A2/ZW1dver3YWnHl1R5c9aQ==
X-Gm-Gg: AYBFou3fBSp85fGdH3x5+0FwfgVdZzOsTM7ACQklqZ3f+sKKnys0iE8eHHCfU8rjja1
	9wsuMqweq3fHoEz/X+VzSR/+5qdWNDDeQWS70PtjOxyuwqt2imUDaxduwSXwnI9PBCl3aW3l3tD
	H5jMoTI/l89bN1eEcLXxq/2bkkjrOcavTChFZzu7u7yDHv1SnyKlEURTzQdSK4jgT3PeUywehQv
	qSsrOTDVybcqNHUA5m4465RE7U9gEVGDoFagEaV89r/XPTGRjFGyacvwIyMt2S1PqokplTTDbvp
	zmbExBh7Jp8JZi846uMPA81orwA4go5XUo3GjYRiAilPUJ2u5XIXxjHm1YhPm5eNFLn34V+83ft
	a5KcLNEhHBENvqIO/fG8JNz8o
X-Received: by 2002:a05:620a:2556:b0:93f:2b65:593b with SMTP id af79cd13be357-940ef9dbe6emr885385785a.38.1793021858914;
        Mon, 26 Oct 2026 06:37:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2556:b0:93f:2b65:593b with SMTP id af79cd13be357-940ef9dbe6emr885381485a.38.1793021858386;
        Mon, 26 Oct 2026 06:37:38 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:37 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] media: qcom: camss: share VFE clock sources by the highest rate
Date: Mon, 26 Oct 2026 15:37:24 +0200
Message-Id: <20261026133726.3249235-5-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX0VPDITzCmbn8
 gZc/uuk3E/KU3lx6q3WDmrcAjl1s9DUH0CDbFIQPOps3SHadzHJXRrqyzlbeIqzxjnUBkcG7XRg
 Vnx6l8lo4UTb8l2zs9v0EIYts8N4yKA=
X-Proofpoint-GUID: fMLNjclPkyqQI9SToECNTmBtuDAOc2P3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX/XkR7ERv+vu1
 JKeunZIm+R2Is0KFLr+D7UO9S6Aq4UBb3uRj+88bSdEb9karDEPNIEzo2FY22D2xFreIFsFxmHe
 rmWGSMeECzrYq27ydOxcsPe1h6+6jkZ2eD11yGm1HiGcXFDcWv/cgFJWwASvKLxlUZxBxlleTc3
 xs9fOkcGV3dXJapYek8GloDhtuxCOtd1EIBUOoevuJPyIE4Ied1bbuc6BpC1YyfKqFa/2bqfyKU
 U/G6IHtOSaTdQA6mNgqaBwy3oTmvrcuW5t4XX98N+f7sKJW4dUBRrV2+UNqRLzCdqe1In9I7fFM
 /aPcaZg8bzDlMd3FbmekKq4OLu7Ul+7sswnyKpgoTuZ7Mf9o/Tk3XKNMsVZ2kLHjiaaomJFL1wJ
 FEUKWhbTcbnhKY2s/TdffSBo1FTcm8SYSJ39oA5SOK/v5qTZtLGpPUW3mTSWzLRAyUmwlv9c6g3
 mAU0q34ruh9N48N9Q7w==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf57a3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JGaTzBXvs14gQrlZAuoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fMLNjclPkyqQI9SToECNTmBtuDAOc2P3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

Clocks of different VFEs can be fed by one clock source, and each VFE
sets such a source to the rate it needs. A VFE started later at a lower
rate then lowers the source under a VFE that is still running.

For example, on SM8250 the two VFE Lite share one core clock source,
which the VFE sets to 400 or 480 MHz from the pixel rate. With VFE Lite
0 streaming the CSID test pattern at 480 MHz, starting an imx577 stream
on VFE Lite 1 sets the shared source to 400 MHz under the running VFE
Lite 0.

Request the VFE clock rates as minimums with clk_set_rate_range(), so
that a shared clock runs at the highest minimum of its running VFEs.
On power off the VFE drops its minimum and sets the clock to its lowest
listed rate within the remaining minimums.

Rate ranges are enabled through the vfe_clock_ranges resource flag, so
far only on SM8250.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 45 +++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.c     |  1 +
 drivers/media/platform/qcom/camss/camss.h     |  1 +
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 359b5942df89..30504e614e4b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1016,7 +1016,10 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 				return -EINVAL;
 			}
 
-			ret = clk_set_rate(clock->clk, rate);
+			if (vfe->camss->res->vfe_clock_ranges)
+				ret = clk_set_rate_range(clock->clk, clock->freq[j], ULONG_MAX);
+			else
+				ret = clk_set_rate(clock->clk, rate);
 			if (ret < 0) {
 				dev_err(dev, "clk set rate failed: %d\n", ret);
 				return ret;
@@ -1060,6 +1063,37 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 	return 0;
 }
 
+/*
+ * vfe_release_clock_rates - Release the minimum clock rates of VFE module
+ * @vfe: VFE device
+ *
+ * Drop the minimum rate requested by the VFE from each of its clocks and set
+ * the clock to its lowest level, or to the highest minimum rate still
+ * requested by the other users of the clock.
+ */
+static void vfe_release_clock_rates(struct vfe_device *vfe)
+{
+	int i;
+
+	if (!vfe->camss->res->vfe_clock_ranges)
+		return;
+
+	for (i = 0; i < vfe->nclocks; i++) {
+		struct camss_clock *clock = &vfe->clock[i];
+		long rate;
+
+		if (!vfe_match_clock_names(vfe, clock) || !vfe_check_clock_levels(clock))
+			continue;
+
+		clk_drop_range(clock->clk);
+
+		/* Round first, so that the rate respects the other users' ranges */
+		rate = clk_round_rate(clock->clk, clock->freq[0]);
+		if (rate > 0)
+			clk_set_rate(clock->clk, rate);
+	}
+}
+
 /*
  * vfe_get - Power up and reset VFE module
  * @vfe: VFE Device
@@ -1083,12 +1117,12 @@ int vfe_get(struct vfe_device *vfe)
 
 		ret = vfe_set_clock_rates(vfe);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_release_rates;
 
 		ret = camss_enable_clocks(vfe->nclocks, vfe->clock,
 					  vfe->camss->dev);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_release_rates;
 
 		ret = vfe_reset(vfe);
 		if (ret < 0)
@@ -1113,7 +1147,9 @@ int vfe_get(struct vfe_device *vfe)
 error_reset:
 	camss_disable_clocks(vfe->nclocks, vfe->clock);
 
-error_pm_runtime_get:
+error_release_rates:
+	vfe_release_clock_rates(vfe);
+
 	pm_runtime_put_sync(vfe->camss->dev);
 error_domain_off:
 	vfe->res->hw_ops->pm_domain_off(vfe);
@@ -1141,6 +1177,7 @@ void vfe_put(struct vfe_device *vfe)
 			vfe->res->hw_ops->vfe_halt(vfe);
 		}
 		camss_disable_clocks(vfe->nclocks, vfe->clock);
+		vfe_release_clock_rates(vfe);
 		pm_runtime_put_sync(vfe->camss->dev);
 		vfe->res->hw_ops->pm_domain_off(vfe);
 	}
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7fe12049b78a..80eab898611d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5736,6 +5736,7 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
+	.vfe_clock_ranges = true,
 };
 
 static const struct camss_resources sc8280xp_resources = {
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..bffff5b6bfbe 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -120,6 +120,7 @@ struct camss_resources {
 	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
+	const bool vfe_clock_ranges;
 };
 
 struct camss {
-- 
2.34.1

