Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F71495526
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363834; cv=none; b=objQZzLIbwH4rNtuC0YPmdCsAY74XejF3oDCk7DT6OvctvMEkulUJSw2UMXXMonzKrNbNqoDrPExYO9gWZFBhR6K/O8tYa490LrHsjKOpECjykwHzB71XGZg87tskGsueMtpqOZoC+6YO6rEk3FLv9In7cm6Xmln/0RYcsPAFtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363834; c=relaxed/simple;
	bh=2t5J73v/MouUPPv8BeanhmSwIres2KIrufqDwmaCcNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qt3R84U/Q0v1zDNzP4As9hfsCuWk81qYLC3CVeM/47mEIDTEtjjdOgij8EVf/phwlrAETHZDN7XP9MMYdX/eJJW3ciS5eVfbvvXgSahcw+e8mCxRAsyFXG+mLySoekFYQjJvrpW7jmgXEtwySoAOQnhg6/x87W0USmaO5sCRYcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgsd9qfW reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgsd9qfW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jjfE2970129
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S6xUJpnqHpK
	MXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=; b=dgsd9qfWx9SnE3hFg8if1gsUaiI
	FxBFQmXS89S9453q1rnYyj5PH4+dtPJfAwEih6koE6l5x7JujH2TG61d4gueOrEO
	Tyz1gygpZXGdKrmbnZabHsnQsmcvIifWzdcsgW88NTrw/WEjHBZWntw8fUstcAy4
	j876X8n6gjyfMR28GFagVdlYMgVG1v/psQ6RqRooLt5OuTYYED+syRou98Ml6RtY
	p+KrOm4DHVDE6FrOMoDKHACx8IpNg3ngHa3IrH+7lF7V5VoEijpXvxGeGveMrqls
	3bPlDT/fp/Vli54tHkaqN8zjhG/ePGimYcDwOYCpv8rTDw/j2ESleM8rt2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679c1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:03:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbacbb996so615704285a.2
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363787; x=1791968587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6xUJpnqHpKMXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=;
        b=r+zYr9QKlqBDpa/reTT0O+LW0PE9900z/XpM4D5eERZqICox7PYOnx5WWdLGFIzMHA
         8uPlJeFwvxP1eahsfHRiQRFN8y6V7t8UPpbiVVsmuXTh99KrwPmYokjxwk4cjCxf/4q1
         aAYFJKFFdTj+8Mv6WemS6RysbS/qAfb5iNdc9rPyhnR3E+HEDMc4NoLJ1bAsFBgugwxQ
         pxaPeRfOk3P6NI4AEO/RnYsV1CdxKi8h0JkCB5PUkoc2A0FWF5A5jDxtbl0GuQ/e+AYz
         S8R8sQQ0b8t4669+Gkeya86IScQ92ZQIbbKNSzawso2TekPcS1VfnaotkTL27qAlws9o
         oQCA==
X-Forwarded-Encrypted: i=1; AKwUvBwdCARJJorDfnbl71NKLUhNQ2Ex58GTdcr7GJSKjRiWoelmhi97o1+/xBP3DMDin++soopEC6MilUGMCw==@vger.kernel.org
X-Gm-Message-State: AFuF++kze4KIPDGMcuHFTRALq6Y37/rwglerm/stIfNRfXDSQzCtvrdV
	xwVP5u7Q/DuAwO1f7M8OxqndrzXau36pvMBkln0TtGfEVZdlwZBpucL/KiA3JK+N8vZ1yVv2Ttp
	jQiFRpts+E02J7mpNu4RJ6oDCjEHpJJoLUxLH6y8Dib9Pw9hhwNhrXlJnq9Lz3wSoKw==
X-Gm-Gg: AYBFou1p4x72EXAB40LtvtcOA/gs8bEyOnVcziTZprUUMVdK5G2CVNQGdRdSxsE8kiC
	iCLkc9J/AocrMMSfYv9qKHpt8At4bPoWbnfCQUOg/foGVgCB6S8GyHpF51kh2vqv4lWk8EligAp
	tnfz1fg7M5UoI7nDw3X3PUGu/olgGegbwGR7RHH/iyl14TYnld244yopJDSHiGha+dCAGikS8CR
	DUC4wB4WAO3KIx7PsGEpwMcfach1F2JjEJFxF7zMvGsV7Egk/H7bHlMAwiotLOVZ/h/1/JM4U+A
	56dDn5h0zwJucwhl+nSC6DiNQkgcibQhTvkWaOU+SRZnXDXKz0USzPOdePU=
X-Received: by 2002:a05:620a:40c4:b0:93e:71b8:584b with SMTP id af79cd13be357-93e9b74e2e1mr290684785a.34.1791363786656;
        Wed, 07 Oct 2026 02:03:06 -0700 (PDT)
X-Received: by 2002:a05:620a:40c4:b0:93e:71b8:584b with SMTP id af79cd13be357-93e9b74e2e1mr290673585a.34.1791363785583;
        Wed, 07 Oct 2026 02:03:05 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:04 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 41/45] media: qcom: camss: create TPG links for IFE
Date: Wed,  7 Oct 2026 12:00:37 +0300
Message-Id: <20261007090041.3732717-42-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXymWrOJl3xORC
 2rv+omcln/J4V+HB9/tKa5sHKLRHQol2ia7Hjax+qKOPLNOtD80SFaSVY1JGJD5dMuit/TgblS+
 NBZYXTBxUaNKVbf8f9vlYFFMRINNfEc=
X-Proofpoint-ORIG-GUID: 7AiiFwHYgPrmCEpbIo_IP4QCmXwPWR8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXzwMPUx5kN4s+
 AKtMSXSHg/HeyZQwN5v7so1Pp4x1ZFGmedamBRthv4cucXKPEMYtKDd1jTFG1riuwsFWiKSkNCO
 BNJ/eOk3JxpLhWzkKG19ivf5UpqBTh2dX+Kp62RvvphS0wosRgn44YirTOWbPqvOLoYxvxpPo2D
 Nel8wLGrWnRFmcblRn/7gCGzmGjUoFZmNdV/+aXlIg1JqnaIV9Dl/GJU2bOKufWKhz/qyXoNnjN
 7N/xZwEKCrefgHsYJQJgSSJCiVTFWL391uP4L8D9Qo16kYyhF4kcwL1z/sSBnixlJYjyxHV4ftW
 vZblAXcGC+dZA1LtpgSpjWaIvcTyKPbVyJgit3YojWnlR47eGNrYRxhZTedxD4pZ1zogTJF5F11
 xvgiugMNMfX77OWHtrMJvPiOjvf0Gc4PD9KenD0EjKL5xFOnO3KSPzHrQ5ouVvrts1cn46BnhKg
 D40rz/XaHoTwykXLn6A==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac60acb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=Edoj-RGbKjCKvmuEXRoA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7AiiFwHYgPrmCEpbIo_IP4QCmXwPWR8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

The IFE topology uses its own entity-link callback. Create TPG-to-CSID
links there so a TPG can feed the IFE pipeline.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.c | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index e2049e00ea96..ab6102fd1126 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -12,6 +12,7 @@
 #include "camss.h"
 #include "camss-csid.h"
 #include "camss-ife.h"
+#include "camss-tpg.h"
 
 #define CAMSS_IFE_PREFIX "ife"
 #define CAMSS_IFE_IRQ_NAME "msm_vfe"
@@ -1574,9 +1575,28 @@ int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
 
 int camss_ife_link_entities(struct camss *camss)
 {
-	int ife_id, csid_id;
+	int csid_id;
+	int tpg_id;
+	int ife_id;
 	int rc;
 
+	for (tpg_id = 0; tpg_id < camss->res->tpg_num; tpg_id++) {
+		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
+			rc = media_create_pad_link(&camss->tpg[tpg_id].subdev.entity,
+						   MSM_TPG_PAD_SRC,
+						   &camss->csid[csid_id].subdev.entity,
+						   MSM_CSID_PAD_SINK, 0);
+			if (rc) {
+				dev_err(camss->dev,
+					"Failed to link %s->%s: %d\n",
+					camss->tpg[tpg_id].subdev.entity.name,
+					camss->csid[csid_id].subdev.entity.name,
+					rc);
+				return rc;
+			}
+		}
+	}
+
 	for (ife_id = 0; ife_id < camss->res->csiphy_num; ife_id++) {
 		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
 			rc = media_create_pad_link(&camss->csiphy[ife_id].subdev.entity,
-- 
2.34.1

