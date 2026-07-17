Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0A83AB288
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330021; cv=none; b=XSpYVv0r9kk0S5Gs9E7YKM/tZ/73Tho56uKYkebMN68NQ3Fsz0V78VRvBX0szFxlqlLchVAADfC8xRnNF6pViIyhxFVoI5P69la/gNdDYSKCDPRMXj8heBz3j+ml09x//vDlnSg9XruWkTKPpreMDyjcxBVSvCyV7OBRryRgFOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330021; c=relaxed/simple;
	bh=Up98YOB7wYXCI9k6FIPxnya4OaHPEQPWmJM/Y1HYB+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CRU14s4K6qmo2XfpKsX4LANsrRJ7G2kYNaI+uC2aSuOWXW1eUldCulXCW2YaYSlje3lHEptTP6x8eQKTGQmT8L+zkJ+RAJ5ykyitEoX2MtKrkz1dbDGrxocv6upR+sbj+AcydPLRdhwo1TuGcpF159ncugBawSMpq4moR+EcgEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBX19epl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E69fo6L3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBX19epl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E69fo6L3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtWmH2906324
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Qc5IIgLE9a1
	OObjGw1KIjE79SvTI/Q7/+JXmhOZ6GIg=; b=KBX19epllcLMdXBrN19oPot6gNs
	F/ZHlVq7Fv+tOLUhwbyxQtbNn4VoL/CHu9js1TVmSK4klwiskCKgwLv6UuuQDxKw
	6HJGia7zCD2aG+HsszUhbEZPt3UYMecc+JcLYQvTGdIbLsBLfPBnHeK2JVAMK49P
	PgvKFz8Eu4m94P08qjsZ4Sg3aa3CmoyGtnw3Z2h3H7R+yW27T77FrBjyouGB9Byq
	SAQogSUF1P32w4W+Pds+ieHviYZEFWnOYIal08V/UAhLfVmEANH642jKBR+jxg2a
	up9pbbSC7ZrXRssfTUnjqplescAZOgMAZ6Ogxu82EQ+6ZJ5kxFbZkDPHXMA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq9513-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88fc985a65so16084372a12.2
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 16:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784330016; x=1784934816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qc5IIgLE9a1OObjGw1KIjE79SvTI/Q7/+JXmhOZ6GIg=;
        b=E69fo6L3WnLNuBO58tqXUC031nX4uARD/aro6P17ZLyXo9IadQl2dnqx8uT4KCSxUW
         FhEeR+ESfm80cjvR1tKwnfbFxFUbjVdbrF8jJ332lLNZHysHzd4YlqMi2y93hCPbA0rI
         2pyL/+8xtdxR24Iy3hNBjiksfKW9lxPTBEBklfMKGFsr3v86n4W15zTEow5SknGCXOo/
         wEu3KIo5PARoumWyhvGfje+YBzitkHVmt+XEkhlUOmYRjaCJmuBxzaf2G00MYmQjn9dz
         uyQP4WR4msl1cm201xqgKvuytydtq4x2IbxxmxU10FSe3xxh0ztAhS1ihpvHAx2q82OB
         j0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784330016; x=1784934816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qc5IIgLE9a1OObjGw1KIjE79SvTI/Q7/+JXmhOZ6GIg=;
        b=Tw2Xu/k7dJ6eDhzb/pytxrY4CAQa9UemDXuyQUFqQ7a2i4nf6KbaV95e79ZCpRWpvl
         CtkaKhCAwWTYU6Upuln9nDTPfcBe2IT6XUbiFuVqe1Cl6cGJKGMnGftZbcxY9A1yMRm1
         VVzUnlqmgWnqxN1CothA2Z4VfSVWfSHiI9cFlDewu5xLo9r2Ov4btYWBjQb8vFQRP2aq
         QulbCcJ0JfhYe79hEDMeEj86p7giDF/QcJIj+7WHXtRprhfb5PST2ypNvjzRZvwexWz5
         WPyP2253m5m0ch6xMxtXgAR+56WIveNpqA9QOLpgnRUTBbbWJf8zIAHScH8WV9TgQz0r
         5NRw==
X-Gm-Message-State: AOJu0Yw2BJ2A/Gbq94LfvNoaG9a33BZfsZPkh3oGgg/I6rqp7GAyH0uX
	X1j8DrOa8w5H+F6yzYdWtsEPkeqivG3MikfzNILGjnza8IZN2jG9s7FZunrMVyNuCQ7PbZTl01A
	xOlFiq4y95rVvcBpVIjzhT03a2PaB4ZTFZnPCWOyC2Qv7rIeGevp+V0Y8CG2QUcJrtJObi9t+SA
	==
X-Gm-Gg: AfdE7cldKDkMGxy52Dh2Nq0j/ye++PRhHUUX31nzp/rsFKskW1FpxIZXdix7Alc5Qxo
	48rv3H3lnS692BQuG41Rlu6O60TVj/Mo4VYl30AQ2piGBA0yilcKWtB4pb5lzrJkY5uXU7ZxKxc
	FDhWy6GduukDCAaYXcjtZbmvaA/RSCSvcKkvWmqAm09nk3UKEljTi5SKc6KiGzlmbIiv/sGSimh
	5uxz8sWKCJjWKBLwVBUu/ms6XZmzmvHGNeT0Wp+WLbLOciJQyO53BnSHxk+hTDYi3Ps9XSURj1Z
	srvVidLwMKWQWB2aApe6xwi49bZtskOFb/VKOEEvgLYxvqvLrJq6v9GeaIU0OzNz/IcYh0ImCqj
	EhIHdeUgxO69FTSNX/UeFip3gd2qwM7ZO+tPDYjWJMuxRXicTFlsn1Yw=
X-Received: by 2002:a17:90b:3ccd:b0:38e:11ba:992e with SMTP id 98e67ed59e1d1-38e4b57dd07mr4551013a91.35.1784330016334;
        Fri, 17 Jul 2026 16:13:36 -0700 (PDT)
X-Received: by 2002:a17:90b:3ccd:b0:38e:11ba:992e with SMTP id 98e67ed59e1d1-38e4b57dd07mr4550985a91.35.1784330015880;
        Fri, 17 Jul 2026 16:13:35 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm8145264c88.8.2026.07.17.16.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:13:35 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: anusha.nandi@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com
Subject: [PATCH 4/6] media: qcom: camss: Add sa8300 C-PHY 3ph lane config
Date: Fri, 17 Jul 2026 16:13:29 -0700
Message-Id: <20260717231331.1229693-5-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfXzuskngI1P1Hq
 RWsRhQULiVeZJyrvEOb6dqrd70B3tBU9xhH5Y2nGx3soTXK3JH84+EoaY2LQAi7TNfqzIdW231o
 suZ2BPwhHOHSzNouS7faWTl+8xfXaHg=
X-Proofpoint-ORIG-GUID: -WVZVNDZ-6bvsZ0L_C52eHPuLMwG9ShF
X-Proofpoint-GUID: -WVZVNDZ-6bvsZ0L_C52eHPuLMwG9ShF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX6GZEAv/FlzkL
 UAUql7d3Fd77GQpyns3T85+ROZ9ouVRdHKejZEjG5iL/0ROHP0MVkX/Gk780zhnosAT7etH+UsU
 +QBb0fg6u/drPoFEGn12y65N3Iy8eV2qvJJURfpcmab0b/RQnPRzYYgPJJ3tOgInv2VKsNfgI/M
 36wWikCpH1nZBEhEpdQXvD7JAZih7tnE93qohUEKAltX11ntNEbhnQJQoptxiovHCF6U78UuVD/
 W4KBtc2CJWEBzeBnMMTYbLuvUd5Dew9h5TrWLZVV6+4UxIEm/SGRBqMcitZrN4JG4QbdZ+KjLc2
 mk4as32PSqnIHP+0jlCpYDEq1x32VnJQNRI7DxG2AH2Hc9l39/DESxRdORxb3DuM2OnUniiiB75
 gHEmMMhdxNVXXzATBT5UqP+pjY1xFbLf0xM5Q+M+Y45tpYjlxs90JA/tZiNk06smYxOahB0mzEL
 dpQ4Urr5Tl7i2a93FIQ==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5ab721 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=bGiTdSc0qFR1_pC41MAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170238

Share the C-PHY/D-PHY lane_regs selection for CAMSS_8300 so
the sa8300 platform uses the same 3ph handling as CAMSS_8775P. Also drop
CAMSS_8300 from the missing-C-PHY-table guard now that a C-PHY table is
provided.

Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 8f1e70ad2b7d..0d5d4d4410f2 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1416,14 +1416,6 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 		}
 		break;
 	case CAMSS_8300:
-		if (c->phy_cfg == V4L2_MBUS_CSI2_DPHY) {
-			regs->lane_regs = &lane_regs_sa8775p[0];
-			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
-		} else if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
-			regs->lane_regs = NULL;
-			regs->lane_array_size = 0;
-		}
-		break;
 	case CAMSS_8775P:
 		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
 			regs->lane_regs = &lane_regs_sa8775p_3ph[0];
-- 
2.34.1

