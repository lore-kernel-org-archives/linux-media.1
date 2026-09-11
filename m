Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9241B3F7A9F
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107771; cv=none; b=TemJ5Ab7Tj93+HKTAEv43yAdW3wRwEoh88a3hkMh75aZPKHG2xJhmQ6rixZZ/aMTSbrT/npPUQWik2VSJAYl0Vxj7fRtWL4ybVTdt48DaM9OVdnYNDoUda16hj4KgM1yoU2efDiVQpqC9OubIoiBSiOC83m6Fm24ty3Zstr7Dbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107771; c=relaxed/simple;
	bh=0L0JCT4m4SJmuTDQ+ialCn/oDk1pcYctuSrLfXdVlfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uN3LSKkU3K+U2K7+uq8luVR+D0kO/yy4kVJbUY4wKqp/hxM3hUEk00wmlGDe45bBi8NltC7EZ7NbdLOtccsI8NviEiRwnxSukUxLLc9x4KkT8V7BmSoaBLpvtvBQWztXIaJscsvSNmt1hNfm8V/YZwvjk8I+nkxQqDpDtUWV7Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGCvurTc reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGCvurTc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B5JBsa4002407
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SNjbE1OBTi0
	QsyaZe/ehtUm/QCb8UHhqjcRZksbd9v0=; b=GGCvurTcTnGquoC0xoezhw7uEM9
	mZubqQOY/NhAVKh3U+aAmaYpk3hXhjTPzVZlRgX5dHF4/dWDiphqEj4F/pc8sTEj
	P67CdKWTakIITN428ir1+Am42pSaN+eeksl4jGjWzdGkzBkisGszukqCv13hr4+P
	vB3C/qdaUlFFwcDJ1PBelex0v2yvRUWasOrANgNzu5fSaF3kIfBU7mpR7JgLaekv
	pcylbxHfHTULfGvJnbq7FfzdCJXVIaga3g6mMa/I0SI4KG4YPEf6e1zCbxSxBdNJ
	i2ZFWFm6Duw4QgdqRU8Rbm6S36QmozLGK/+sYnqyLNphu97LQGiQPkgiJaQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd387th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so102520485a.1
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 23:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789107753; x=1789712553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNjbE1OBTi0QsyaZe/ehtUm/QCb8UHhqjcRZksbd9v0=;
        b=B01h1aaSxPBMo00cfcDxnJmowqAuskNHOH2zTENluuhBdgo/Ct7a15EfXog85xQS0q
         p+qwYpjF2QxXRsut5zitDv03Hw5YiRk4NDgA+nC4LjwHaeNBsoCXXG7Wm6fLHQI1WLu4
         0E0tzpoGyQg/pC5LkVYJE4MzUbeEPy8Mo9c7Kdh5dhRxhPWGzAfblgmI+bCsaAsWFLoV
         500K5AGTcu4hzjo509hFO1FqSL0uJPkYu/Hq5WjmpQPAtxZOFmNqUH8Ec/A18tmDgQlq
         UyYJc4byn4uxrYe49amnR+0bMdNs6oBfXII4nxGKwPAJB58w1080Wfu01Hb6YWbivF6k
         M4Ag==
X-Forwarded-Encrypted: i=1; AKwUvByu2e6fvEOPrfHNnTEBYGz9H1aJ+I1Vw77nO9w3FGiKQ4VZFYOfU40KqjH0ItCOinzl516x9xlxtg+RuQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nVwtd6GorodrpNUe6I3+JKEj/QAld78QNxY9QGga8AEHVSFfb4
	mdkbcR+dqFAieumVLDfBGIKchPRzHXM5PZJnpeDa+npVgfBIxaa85EaJzysHUkEqF+ck+DBfS9Z
	ehgvjJXeGUNQXYaINLJzLC4kBf0XxqdMLO8977UpL/LS6VMRiPWT2ooBq+53nrjkFTE6GSNp22H
	Us
X-Gm-Gg: AYBFou0r69iwNuCvhsSA0/zWCiZyC6NGS05ueOPOnxK1DcXXzmkuTJUybJAmYWeLOgk
	thqX9uwcQikgL8FMTsVJVmk2xf5V55YvpGxs57oRDLrMqDzfnKixntk45BK374F/vmgvs63Zt0v
	KpRgOqJPcDM4z+HMF54nPAwY30HDVMq/IpDDJ+iczJAISCQ2z3Pq0cI6Ko/p9/iXfUf04tmdt4z
	DBayaH+eKqU3QdwVd0qR/fCArGhvvSIuWO5wJu3bwVW2tADZaEcTK9+PXft8FoFEaxqz0IQFj4P
	oVripFTeiJKwGhU51l/+QQqYfGi/n//8DaTzjjKbMSEoZn0YOHkRruikAxk=
X-Received: by 2002:a05:620a:6f0d:b0:939:a199:45b4 with SMTP id af79cd13be357-939ea195c50mr353479285a.39.1789107752612;
        Thu, 10 Sep 2026 23:22:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0d:b0:939:a199:45b4 with SMTP id af79cd13be357-939ea195c50mr353475685a.39.1789107752160;
        Thu, 10 Sep 2026 23:22:32 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea60sm3681969f8f.17.2026.09.10.23.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:22:31 -0700 (PDT)
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
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH 8/8] media: qcom: camss: enable streams API on SM8250
Date: Fri, 11 Sep 2026 09:22:13 +0300
Message-Id: <20260911062213.195007-9-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa39e29 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=HJ73pzCofNdhR2KX5BsA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6c3aK0T7brUwi1Z7iCIkrXPL7jLE-_ro
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX7bjO5wSlNkhn
 M0oWN/iIlIT36z1jNTU6Nr7bSR0DQZ6mpKDkyjuqMRCMjfuZn1LUhFvup9uFx1z5twnc6xDenQw
 mQI5sod8bn1JJEu88dZZkOb0XaO5qrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4NiBTYWx0ZWRfX6Lld3b6q7z2L
 91iQ5VpGkQ5VOtkCoOElFKXtAehyq/19A0W1zHnlqeoX+PKr1MfHKZ1eSxWSjJHaG5tBDMfxUI1
 3Q5qoDT9YA4ViYN56tkiJfl2LvLq5LauWG8ma9dpSDXGseQOdc1QnQrYp9+iNca4QZjR3hDoquW
 6kbOpgu9o+r2o6bZQ+4wKx6orYtibFhY8nGQXUabNSM+T/oOJWyIFTJp64CvWmoFUKPLfdco22Y
 HSL1/bl4lgS1+F7wGVVEfo3K20Hty3IsOtzE4/woaniQSJ6S9/UiTp2TPZDvRSphXIYCB/dDGM8
 8X/e73KF9OdMKshrh2QqNUpqnE8S34QGd0zyNje1CpzhF8AM14sRePGU+A6aYQkzVSoNbfbhUuL
 S5QVuEyaObyF1FSySM2klcizS/xMybc1giXnzK+0ZMskdqd3LGh5FkN2rUgErwrhA/qWkDFtDnT
 uRD3WMoX3qpE8MGnl6Q==
X-Proofpoint-ORIG-GUID: 6c3aK0T7brUwi1Z7iCIkrXPL7jLE-_ro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110086

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Now that CSIPHY, CSID, and VFE support the V4L2 subdev streams API,
and CSID-to-VFE linking is fixed to the correct 1:1 pairing, switch
SM8250 over: set streams_enable on every CSIPHY, CSID, and VFE line
resource entry in csiphy_res_8250[], csid_res_8250[], and
vfe_res_8250[].

No other platform is affected; they keep using the legacy non-streams
subdev ops.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1bb22cd23c5e..9bfb0290395b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1964,6 +1964,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy0" },
 		.csiphy = {
 			.id = 0,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1981,6 +1982,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy1" },
 		.csiphy = {
 			.id = 1,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1998,6 +2000,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy2" },
 		.csiphy = {
 			.id = 2,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2015,6 +2018,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy3" },
 		.csiphy = {
 			.id = 3,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2032,6 +2036,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy4" },
 		.csiphy = {
 			.id = 4,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2049,6 +2054,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.interrupt = { "csiphy5" },
 		.csiphy = {
 			.id = 5,
+			.streams_enable = true,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2068,6 +2074,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2085,6 +2092,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2102,6 +2110,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.is_lite = true,
+			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2119,6 +2128,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid3" },
 		.csid = {
 			.is_lite = true,
+			.streams_enable = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2148,6 +2158,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife0",
+			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
@@ -2174,6 +2185,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 			.line_num = 3,
 			.has_pd = true,
 			.pd_name = "ife1",
+			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
@@ -2198,6 +2210,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.vfe = {
 			.is_lite = true,
 			.line_num = 4,
+			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
@@ -2222,6 +2235,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.vfe = {
 			.is_lite = true,
 			.line_num = 4,
+			.streams_enable = true,
 			.hw_ops = &vfe_ops_480,
 			.formats_rdi = &vfe_formats_rdi_845,
 			.formats_pix = &vfe_formats_pix_845
-- 
2.34.1

