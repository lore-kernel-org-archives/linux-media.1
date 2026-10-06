Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEABE386C25
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 23:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328456; cv=none; b=aiPyTlsAv6Vyt9npPWnuKlSUEWTMiNNUDAh2GWcZY/gHmtrvrRjX9oq9uEoGCjOk3h+EP3tk+OvSTSadgxQLx3e2ZVyWDPK/o0xp4NaU54wwn8BSahyW49gvA+UyFL90eWUS1N0rKC+NUFO6YmW/1e/dOfstG+GtxLZdyExIfUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328456; c=relaxed/simple;
	bh=9IHRMabF/UUZ/I8jhl+b1TFxH72KngRZLYox41kc84k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J8sEWB21VjItCmNE/wbQxmW0YqE2ackc347ItVQSKECgNdwMnW9YXSZPoxM+5YccDtZhHsXZGWPtEAe6vURQooYwGQ3Sy68LtIV3jkaPh+J2l8YEmKraIVeLmJ2nOQF/nLvF0qn5lutddw6KghbnVSg1wU1YJAfiZ1q2ABckagc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9Ditxlg reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9Ditxlg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lerhm2389912
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+w5RJMRUBd2
	5lXyd2GhSv/Y/VzCG8uEh7F6bn9BvQcI=; b=e9Ditxlg+tGP5efF/CAv90lWdap
	WgG5NpPtP+KckNjY0HhrefxkWRsJOzd1xD8+ataYUT20F/Xv10f1PxqyOAzygpAj
	YbCEr8/n2/ZKBBXGu0hmHlzB1QLIMfBZrtlLz8UjGsDA9aKZHVbbs+6kx0PvqbEL
	XWGdpWYMkvbSSLS67qJKeYGHdSZrsYHaOfEpr6sWKC0ve1VPK0mQvUFywWI6Wieo
	V918e3HMakQdY02cKOMjSHo+lFq8JtQn/378vPvIBeg2rIKUFHouUea5PQiRN0oI
	Q+Eai4CYpFLA6svhqCkHVFoJCdarmfVDUb0ztlGqNrnSx1QZVNZAShaEUcQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbk0xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:41:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93be1861d2dso556025785a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326512; x=1791931312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+w5RJMRUBd25lXyd2GhSv/Y/VzCG8uEh7F6bn9BvQcI=;
        b=RYQ8DUls92kXO0te4BxbtQQYwMLwESPDllq90wDvgqjNOQSKadSKber8qDtICgHefK
         0Ok2EbG+5J7tuFWKypivNYH16ARiHQFKTVG81Wr48+xb69CXEtR+M5mCv1Ucofm/eQkK
         DmhlZnt+181ji4COZ151rAOeXdARlIKvQmpGGLaNymw9b9ToKZaUwRSC2pCViY7BPBXU
         npM0HDqYECHDxJTBjWHjLzSjP++55ekjRK70XdG7tkWY85Mu06I8HWISBA3ZyfBHbBSp
         RF2ZZNjT34MNJjy77KVwZQM6eqimiYiSMOcV9aQsnFU9JTRsulVbIkAHfy382o6lXz7l
         Bapw==
X-Forwarded-Encrypted: i=1; AKwUvBwODEwgkymHXWY1ouhJ8xeLLbIMmCfMyeqEFonestPGeLRgq320WRwWJVH0nEIFnssdscNRujRpA3KsgA==@vger.kernel.org
X-Gm-Message-State: AFuF++lfWo8ULj4XZYw95RAY7szJEZjixpPSo4HcYe+I3hxWsO24IaYq
	nKbhnaKjrtrEgsFNrSVc3eY2ARYFFenL9fp/mHV/5K9nyhGXTQKzGd01FG59poXE6RmSzqrAEwV
	xg6+AptBuwy/ccRsyuKnS0Jd66rD+QCfNC+HrBUVdE2ADJUUkcondhtmgiuR85I77lzcuDBCArO
	Jh
X-Gm-Gg: AYBFou1ZmX6iLM8ZFkLIOsBjW4PxuSvypmDznJoitqrXZouMpZpQHkXCtP79k0vapEO
	3isFP9Y06ZZgAzqCdmbpFIKlI7WmrxkBqdh0tgpfcAnu3717/mpnW/Uhwfo5zfyEtpHlqWo+158
	kG6bRGv+P4VRhafh4aQU3LEZHLaRhxSVq94MW9d4cOGypoRXaUIyT4TkcQEFXLZdw6pCWnEr209
	u702gC3pnCNYEBiPQUugSVwvMCaYS5osVZg/OHjeevSPWI3YWsD9+uOfQBeNpFX5x1rqfpwcare
	vKfaQYVywxflHychPoDVDsERKkAmQIJo9SX1vU1QYq3ld2aVX2WJUOju0Nc=
X-Received: by 2002:a05:620a:2b45:b0:93e:92f1:4222 with SMTP id af79cd13be357-93e9b0eda3bmr81145685a.4.1791326511581;
        Tue, 06 Oct 2026 15:41:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2b45:b0:93e:92f1:4222 with SMTP id af79cd13be357-93e9b0eda3bmr81141185a.4.1791326511104;
        Tue, 06 Oct 2026 15:41:51 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:49 -0700 (PDT)
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
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH 42/45] media: qcom: camss: use one lane for TPG internal path
Date: Wed,  7 Oct 2026 01:39:50 +0300
Message-Id: <20261006223953.3382273-43-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac57930 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=knLUxTcafSqJ48ELel4A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -GdD3CZi1Mu3U3AnqYrPFbKo59lRLiZz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX6f7g8xZtxnKN
 O+0CfNoo1BpsSXPaYdyE9x+BgFlSxBPmLZfTeNMuSNl6RvdmrTvbfg2wLGFrf2D1c1WVm2sNNzp
 Al27beu9nuO1+rnLdfbGU3MUCLEupaw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXyHHJp1TsEDAd
 O9dmQvmu0+x5Fcz7N9AMispUbDPOhZrCp0XCrlz1kDrNa+4mnrM4L0ZHbiln8QdbGJ4tM+z/xDJ
 p+iocijfYRkFSNnh9T2fHFwa2XUWZmPrIf8TJI+gI718jhAQaj3SOx1b8h2Vaq4J8fooSVORzwq
 puncDdpwkv6r9ieADTwZDP+HbLr8BXgWnIPE1tqiKMLwa9Ci1dF3WWZ2H9BPQwHbMO65/BUExV8
 kZBJEk2QiYHfWx7VO/JRMjtmVBaV1aO71D1hp8llMHNHZY1kGsSc7FGTWV8YpblCGzgjDu3JmJ+
 2/u/Jz03L0v5C/LqhuPTL0M5D/szBwJ8BxtMoJHmuTFFcliBbH4zB81bcrtZ6hjx7bWaA4eVn/g
 WFTop3lc5EunDU6jLD6kOZoNrMLVXov0CaIo3/nq9pgqlGydyj7AeMId5UiLZg3x/koA6NzSL8h
 ocyzLMQNmksNSMQbqdA==
X-Proofpoint-ORIG-GUID: -GdD3CZi1Mu3U3AnqYrPFbKo59lRLiZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

The internal TPG path sends the CSI-2 packet header on lane
zero. Configure both the TPG and CSID for one lane to avoid packet
header ECC errors.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c     | 7 +++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 2 +-
 drivers/media/platform/qcom/camss/camss-tpg.h      | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index da13963ef1a0..6bb0af77fd49 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1276,11 +1276,12 @@ static int csid_link_setup(struct media_entity *entity,
 		if (sd->grp_id == TPG_GRP_ID) {
 			tpg = v4l2_get_subdevdata(sd);
 
-			csid->phy.lane_cnt = tpg->res->lane_cnt;
+			csid->phy.lane_cnt = 1;
 			csid->phy.csiphy_id = tpg->id;
 			csid->phy.lane_assign = csid_get_lane_assign(NULL, csid->phy.lane_cnt);
 			csid->tpg_linked = true;
-		} else {
+			tpg->lane_cnt_override = 1;
+		} else if (sd->grp_id == CSIPHY_GRP_ID) {
 			csiphy = v4l2_get_subdevdata(sd);
 
 			/* If a sensor is not linked to CSIPHY */
@@ -1294,6 +1295,8 @@ static int csid_link_setup(struct media_entity *entity,
 			csid->phy.lane_cnt = lane_cfg->num_data;
 			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
 			csid->tpg_linked = false;
+		} else {
+			return -EPERM;
 		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..423f45378a48 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -105,7 +105,7 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	const struct tpg_format_info *format;
 	u8 payload_mode = (tg->mode > TPG_PAYLOAD_MODE_DISABLED) ?
 			   tg->mode - 1 : 0;
-	u8 lane_cnt = tpg->res->lane_cnt;
+	u8 lane_cnt = tpg->lane_cnt_override ? tpg->lane_cnt_override : tpg->res->lane_cnt;
 	u8 vc, dt, last_vc = 0;
 	u32 val;
 
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/media/platform/qcom/camss/camss-tpg.h
index 7fb35a97dd06..fb22747f5eed 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.h
+++ b/drivers/media/platform/qcom/camss/camss-tpg.h
@@ -94,6 +94,7 @@ struct tpg_device {
 	struct v4l2_ctrl *testgen_mode;
 	const struct tpg_subdev_resources *res;
 	u32 hw_version;
+	u8 lane_cnt_override;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1

