Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E0F39EF0F
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326436; cv=none; b=uVUn2GvSsCfaf5xv5waGGQzwa6BNo7mLJuIq2tx4jED7AHq3ocxwdxAmyaELBEkuHdnmQfEEg3E53wzewfVQ/VCmH8zIVUmvHvPV0jsGyp0Yl1apD3WLw+f9nVPh0kwpF6VX9G8WTh9NVMCKyIE1ZUNKRsnZrLajtmogzjaTCMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326436; c=relaxed/simple;
	bh=o+pArcNbJmp2jNe5MdLimuBeqxq5vqZqEf7oThdS1No=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SalztkrxztFwqdvxCElogVbOGOComdZoEiHCosM68S/i3XmFZ3It4sV8ZucFo0I39KodW1jKtzMzupc4yc2EygciacTG8BRuEoUH1Bp7a0OnJMdc9gOnco04i+OL+UuVwrfqqoHzrDj36DfS4WqX1lpIL9344jOi4ibIHMCcoig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lO3Ga/vC reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lO3Ga/vC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeQ3U1029578
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F0S3PID9SQK
	AbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=; b=lO3Ga/vCQOvPl4lOiWmolG206QZ
	LpBXrfJTW1Cwb4SHy15CVGqBnmXt0bedrW6cu7VXhPBe3gMc0dJKf3aNDCBj+Cu8
	DYZKjxTUVke/IxTA3z2TP4bYfizpxYNzv4RjxsJrcnTyG9vsrK7uIhw47vLrJoMT
	+qdW6BDDzBxMw/YXT3YkmoDknj12Qb5I/qtSFn5SkqmqQA+8SKDTTRphQPU6loGf
	pYa0AQ4J8lf/QJKncpr74UTxioJDZbfL7M9YRYnB34oPJJIZtOmLTZwMcZ6rmeC0
	OubHJvgjQ6S1xFKvPqFFPV2purN1lG1NbQbL9thCsuAI5+kLuZdO1+gf9Aw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ashtxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:40:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so600158285a.1
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326425; x=1791931225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0S3PID9SQKAbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=;
        b=q5M8bWM/jSDISurKl52V6mp7N92mhZygmuvLMfXOFAOTAWgWLj3rsGI7LlJ0C2YBMq
         s9p+Wel3eC7fmvsKhrDsBVF/PE+G0VZPNr25sG7pAS0IlKcCN+c5xEoGiapfQ+oO7yJq
         ipRGx9RF3efk+5gkYfhGR79dsymgt46yw/sqAnnf7I5qMGD0h1mfUnKkto1FZGbdD5uQ
         Y3kRoDDf3n621u8CTCYFqA2/gKyd18LnIhXpKWSplUKDqw5yoEejnnsyZDsyD6oBLJ4m
         3DscHu3CmMtPy0/t3zjgYOLRTiIcW6ijy/Te/rxM6OXhXFPq+IchrD1MlM/xuCwOiOSe
         4QCw==
X-Forwarded-Encrypted: i=1; AKwUvBxnY/Z7eGx7zYuyeuU96iIisN3sNQrOcOce0VL+IEfozgGcDnGmYVO4gilm4f/mw6u9Pnr8R3GyZdQFIg==@vger.kernel.org
X-Gm-Message-State: AFuF++lnZwiegnn/oytQDBCvZnAiLQN3vg/FcPpP6R4zYQo/h2fUEbBF
	Puq7PFLgGjQec68iNj04Q4AsRLFmOxJ6WSL2k2ugNrJfxpZ6mFxlkcafDAeB8ZkIj9hYctuDW24
	v95JL1rrLV8HPIOQ3x9SdDb23e6VsjRlx/69VOWCptclD6Y0NSuoO6y66wML8j79LOA==
X-Gm-Gg: AYBFou1DHXuW4kSO2IZwg6067xg7OZGaZUy6olJEYkaSDIKQcPPTQJlcnBzYn4mU0Za
	ITuVWhfCKwQxNDL854SZ5d3AhIKu5DGuMatJnDUkvuMDYyFO6+BtJ3wpjcsMKpMaOpbGU6ayr8E
	oULsxE8G7JsSzj4PNrl8n090BSovwKhncA0p94eV/Wnzs9EYjiNOplcLoMXaCBK/3Leql79OKFZ
	dP0WZvrX6bzGQ25rRAh4bMhB4FuzOWNqWJCJL47jFNobb/qkYbL5lvYYDN+2HO9b+vsj10bVCND
	640kVPbkkLc55hyx0Bw2iEaAPuiEfriX0d48r6RcpNWBP8bnykYINXLw0bg=
X-Received: by 2002:a05:620a:4488:b0:93e:9809:3367 with SMTP id af79cd13be357-93e9b83a81amr80369485a.72.1791326424888;
        Tue, 06 Oct 2026 15:40:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4488:b0:93e:9809:3367 with SMTP id af79cd13be357-93e9b83a81amr80363685a.72.1791326424280;
        Tue, 06 Oct 2026 15:40:24 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:23 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 05/45] media: qcom: camss: keep CSIPHY lanes active while streaming
Date: Wed,  7 Oct 2026 01:39:13 +0300
Message-Id: <20261006223953.3382273-6-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a20H4tZrg2-_dtsjKt8iTK1JKAXPfOSS
X-Proofpoint-GUID: a20H4tZrg2-_dtsjKt8iTK1JKAXPfOSS
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac578d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=0Z5QZsCCh4IwRXeKKPkA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX5ddCY2GqytF3
 bzFMHgCVbP/QCtVLboSfDzzZTTjlFkvZwG/G+xKzL93SXKRFQpz09QxB6AYYXpag8neZ8YY0fO4
 n8bZkjq5e7QbHsSRmIXuAdsUns9PcKI5EVKnMQ1tbu3zJULz90hjdDIuQNLN4dP8Wy/yCC7eleY
 EamYIqV6RXl9SxNqt7d+/ISZSr7PZ0ctnLMfiRw3MSAZbcfWKcm4vSfjpEXf/UR4lOGbfcP2/EA
 YuQr9Ksc+YJmvutNEWWtnRHZ9csV5VNqJv0LuJRpJXNadKKTgbw5v03Cgrov823Ica2VUDUs9lm
 7EXRC9Ix/s73ZGjwR6O2kO4Xv5b0e4aWhDO/CgNqe8t/xdghYKReVwuBqJBClXAwNtuixk9vp3t
 XfQ4pnsHngTFY6/naJLnaBzo/z3/2jSVA6bf9YhhOmHglaDn3Q4/v+rECwKg7HnoxFn4bFGr3oz
 gfsHRBXhlMHPiOgPOpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX0G866q0dSfLQ
 jjeIydwks2qYww/a9/awaxIo53fob0oWoEd2SQ5LiYTQLNMLOscsw25VPSfBprrt990385Ssu3Z
 6cKOAKMeVT+R2goBYBiRG6ZtsMTYqM0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add a stream_count reference counter to csiphy_device. The CSIPHY
lanes are enabled on the first stream start and disabled only when
the last stream stops, preventing a shared CSI PHY from being torn
down while another output is still active.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 12 ++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 9e95d04b7235..4938e56f481d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -324,10 +324,18 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	if (enable)
+	if (enable) {
+		if (csiphy->stream_count) {
+			csiphy->stream_count++;
+			return 0;
+		}
+
 		ret = csiphy_stream_on(csiphy);
-	else
+		if (!ret)
+			csiphy->stream_count++;
+	} else if (csiphy->stream_count && !--csiphy->stream_count) {
 		csiphy_stream_off(csiphy);
+	}
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index e55c098dbe67..8c1eb83de751 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -115,6 +115,7 @@ struct csiphy_device {
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
 	struct csiphy_device_regs *regs;
+	unsigned int stream_count;
 	u64 enabled_streams[MSM_CSIPHY_PADS_NUM];
 };
 
-- 
2.34.1

