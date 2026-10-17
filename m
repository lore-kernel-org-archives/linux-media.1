Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCDF2E62B7
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209147; cv=none; b=pEMiVkGqCJWW87ZPDLuLFFlH9F8W1yxXL8xEilZXkww4QOsfj6K6yKxb7d7tOzJAlc/vxYrP9kgalxQX0TA0EZCYLZ+lEBE2iwEYfEmDfo+Mq7oo3q4GWDd/sqWIM2/LjXTmXq4wGklrcEDOzFhikh2tZzTAbCvCKq9eAfzbXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209147; c=relaxed/simple;
	bh=sO1KrEv86EVrexKpLzli8BENnpzHRBMlT5dgGwO99zM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kAL6Erk6rrA0af1YLYZJAaV5nfRIWxulO8GHIihXwXdczVVC0zC8jCWHoOg2YGig78f1VB967k2bSeKeIA9YoIVj4gm0qwjMVJjYSw6W0kmcuCY3oxwnN43C3rR0yNvXIokb/iQWrpr1UUY+BMBTQAYffOL78bjfUTNCbygO5l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojNTjD1l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NisK2WHl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojNTjD1l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NisK2WHl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H3Pce74134198
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ouMhjJ2W5x2xNX05HwynhCEBAhDpgm0AIux
	Z8xIIUp8=; b=ojNTjD1lWAhwpNYmTK3sIScjHNZQ+nvdvpJ4lUy78oG5qzz47Xa
	Vfxb1oaxZX28Yk/Kw8IEeN/e3cg4OCweUYV+HpDhB1jLq8gN9LfifFjheC8uP+RR
	FJFDwOmNMdGXhyT22dvjXP8g9OrGHFsyeiH2lxBYs1vM+waYgt8Nl35Gsk9m2MMW
	CYAPckIeuav+j29fgFY0LY9ra3J6CnbuUS+5H5Qv8zL0v5UJMOxT/cArl0WpQrR5
	ED/aV3gjlc0skQ3rBZHqArsBLl9rCgThcbbUWblaizP3wyyktQtJ7YmZxbmD+EDq
	0lrx2bNOsvYg45QisMMyoomXvpsQv2u0apw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc13ur1ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:52:25 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso1126296c88.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 20:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792209144; x=1792813944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ouMhjJ2W5x2xNX05HwynhCEBAhDpgm0AIuxZ8xIIUp8=;
        b=NisK2WHl1W5axzkvlMEyCfIq+P81D+O93lR6myKTNectMTdxoplsA7QJGQVY7A4WA9
         6cic19y3iB9OLClHl5R8eO8uaDH57c7xDZK4lkrsV8QArW3V5ttYbKRNOQ1y9IHRBnfp
         u53a+cqlyzGEeeFGcUea5qBcgI82vX24LIKvR465K/8lePKnChyX+7ZOFZ6LFWpB3OQA
         +Ayg1urDcTDXoCaeNIeXY7xbVO9GA9jEf+24CdGnZjVggE4GtgmgdSEQNRwBK80i9H6L
         t9tDgFFyjWrDeaNEb6fMUB9QUOe6RA1BIr+JItanB1GeAshqQQlfVE9SfwxBQx0Q32sm
         rbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792209144; x=1792813944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouMhjJ2W5x2xNX05HwynhCEBAhDpgm0AIuxZ8xIIUp8=;
        b=ihFy8IBJsI4L6zp9euO87ABo9VJbyPFqsfpWTGpaHjSNmp7N+PDg4UUAJ41Vh5qyVq
         9bvkpMDtA0Qjj3/v8DD+8c5KPLTs/xDuWN8hLIDl2mviV6RsQjOrhCT+00kBcV9uBJjc
         rzDGJcuAnuZfGsgDc0nwmy/BICaTKAxWIMLb+nfpTm5kH779xijOcWak7P+SCqp2U40H
         LZW6kmY2BS4LoXnWbAZDIIlS3BDWMumRZBPxDGCypp5kcQslVeFHZkGIlwrGwuB7bCfh
         LpKayIHcpCJmdHK847I0LR1ZKDA0te+l2T9Z3D+Vi9RMQzY/hO3Suhk9ycLv9MKV521p
         1I0Q==
X-Forwarded-Encrypted: i=1; AKwUvBypSJq2mdrTSW66zNcwrSsvZ8VI/RZUCXUlWe0A688Ta1EsQzJfXxURCxk6YbAl1SFehTd0DqoE9TBr7w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1oXpTDq8gq0Ka9PRttc2+BbnM36//dpEhfkK0m7I7rMfJ8h10
	rgXqUvosjZ3e6pJPn5pgMkSCUcRXhevSLKP7ZWissf4mWFU9CcO/dIY7TAwCWRhtD2jkvyC4UGR
	tDm5yAcP4BmdBUvSM/gcYpFum45AI1kSIls+BMPvjQuk42yc2b2WP27oNMKC9xi3Y1w==
X-Gm-Gg: AYBFou00jJPYlgzvDWKaCCwCR2LZeQ5pkxI5dsWVv2/zSCItEqVHs9XF8IZhw7tRSUQ
	PKw3I633/7hb9hbNsjkSqj3XqOnLbU30A/lxPcH9chpS5c0htp/h54vVmjqPeaCOtV3GRshUEIT
	sTZiryLzr1P8EJqzo26L7U6T5B2dj00SoLvhMWVRyAeDbUfDJYQ7ysoiSi/meghh8OOK02x02w3
	bw2Q3TZ86CMr99Aw0H1gfhMEIAGM/EBKNReIk6KRX+S5uKIGbGcVP9To4jlEURtU0caC001DNop
	Plk5wzsH3rMYPw22DKE+NDeeWgT6kgroOZdathuWocO7q6jDVzyKCQ73Zz5IIIysLlqqIYcPftI
	oB3Wr60ZYJngJ6i7z8QdyWvOztg4kggfd/eYACxAYZWwysnBdtckCGA==
X-Received: by 2002:a05:7023:a4b:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-1850ce9f56fmr2609848c88.4.1792209144039;
        Fri, 16 Oct 2026 20:52:24 -0700 (PDT)
X-Received: by 2002:a05:7023:a4b:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-1850ce9f56fmr2609810c88.4.1792209143415;
        Fri, 16 Oct 2026 20:52:23 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm9723006c88.15.2026.10.16.20.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:52:22 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: david@ixit.cz, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bod@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com
Subject: [PATCH 0/2] media: qcom: camss: track PHY type and scale link frequency for C-PHY
Date: Fri, 16 Oct 2026 20:52:19 -0700
Message-Id: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PX8gcJ0ROJ7OE0SWunDG4GmtCP9qIXVN
X-Proofpoint-ORIG-GUID: PX8gcJ0ROJ7OE0SWunDG4GmtCP9qIXVN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfXxg4jECmZGEHS
 2mpmz2RN939GrhlJ6qBJb+FKpUG4RAxB0OMZ220x2T1Rh+94691v8nruEda7448nbtKLy5Y2oB/
 Jcu00P+Z1KMCQqTa5V0EyIFLUtiwfNE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxNSBTYWx0ZWRfX13lRYpNs+GqY
 AexAixORICOIiNdH5Jy66Vbde9373U1CTx8PvK2kzWLmmvkpnjQK+n0MHslLQutt4wJMPnaH6uK
 NcVM3JojrODVF/4rSg0arVGRjy19Xlj8QT6SAF0HOqVy+cjYoYd/n/q5HKjzHpsl/4fcZCMGIDH
 t5VGMbA/CT49iAS6RWhe26HMpFtGSEbq2wb8ZrZ0Ybjo66WVaL0jxP/3WdXlRjpQd/KpuP70vrz
 /55bSo2YgsVxVNO0inh3BwWk7kKEEvjxTUrQOo9YDLpZP+XW9XQUGOO+P0n1M7UxMRYGeVEVD/D
 w2b8qfmTjGmN01nbhgCKr94z+7c8SrxRdGrc3xcgP0nzIjSTtp9LOWXIxu7hvxnCD9mYbC8D2vj
 Qu5FSEPINMJxNmmTyq0rI+6Z11UO4tlUsmwIwqd5QdGeJJjN7dQj0KcNoCG9kjmDuUsHpBB62Yv
 2zcRrQirT/EK+skMR5g==
X-Authority-Analysis: v=2.4 cv=SKzXx+vH c=1 sm=1 tr=0 ts=6ad2f0f9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FUmL66orSvod6niQ26UA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170015

This series lays the CAMSS-side groundwork for MIPI C-PHY sensors.

Patch 1 records whether a CSIPHY endpoint is D-PHY or C-PHY from its
device-tree bus-type property (instead of rejecting anything that
isn't D-PHY), storing it in struct csiphy_lanes_cfg.

Patch 2 threads that PHY type through to link-frequency calculation:
camss_get_link_freq() gains a cphy parameter and scales its per-lane
divisor to match C-PHY's 16-bits-per-7-symbols encoding (vs. D-PHY's
1 bit/symbol), and the CSID gen3 RX front-end's CSI2_RX_CFG0 register
is programmed with the matching PHY_TYPE_SEL bit so C-PHY streams are
actually decoded as C-PHY instead of silently defaulting to D-PHY.

Referenced using David's C-PHY support(v9)
Link: https://lore.kernel.org/all/20260617-qcom-cphy-v9-0-83da8a8e4e44@ixit.cz/
Depends-on: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/
Depends-on: https://lore.kernel.org/all/20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com/

David Heidelberg (2):
  media: qcom: camss: csiphy: record PHY type from device-tree bus-type
  media: qcom: camss: account for C-PHY when calculating link frequency
  
Anusha Arun Nandi (2):
  media: qcom: camss: csiphy: record PHY type from device-tree bus-type
  media: qcom: camss: account for C-PHY when calculating link frequency

 .../platform/qcom/camss/camss-csid-gen3.c     |  2 ++
 .../media/platform/qcom/camss/camss-csid.c    |  4 ++-
 .../media/platform/qcom/camss/camss-csid.h    |  1 +
 .../media/platform/qcom/camss/camss-csiphy.c  |  8 +++---
 .../media/platform/qcom/camss/camss-csiphy.h  |  2 ++
 drivers/media/platform/qcom/camss/camss.c     | 25 +++++++++++++++----
 drivers/media/platform/qcom/camss/camss.h     |  2 +-
 7 files changed, 34 insertions(+), 10 deletions(-)


Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

