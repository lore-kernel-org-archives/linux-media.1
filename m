Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CA2497B8D
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363832; cv=none; b=Dghdl0cCTiD1FepnRqtjKlvun5NDOaPdTFO/egjyGwkaIQFiMgASTvCQ++JrgvnniQwYyIziRThQq57K6hLgWdN+u0JS8Z5piRIqBa2Y2Ith/wIQJy9ddXzEGZ10FliETbkZehESB/qllge6vJxm2j1qDKpdjXSphcU/Ca22yVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363832; c=relaxed/simple;
	bh=Gi+0SxuObWSnypm60XIzwS6sBewS3GWrLl3c8ovucW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dvYjy582vGa21SOQ9JbX3ez4rwdJk/08o+Eno7ZlwPm6J9B+nSgm2kDyBCtq2FOC0jAKm83uLo9m+AZzRK/KhS98ho/fu7s78o6bXKFlKVsWuoEwmpY1Nic/CrcDG4nsA7fJluRfchMuw5TatTmzFY0BTo1sVQRPEiNA5hpf8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOmRH/to reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOmRH/to"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jbTM3298317
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dlWq6Ov7H3Z
	qTYXe03p4byFmP3iR8MTu4occ91czj84=; b=XOmRH/toX8dbOpqKi+tJy0eUIgx
	txR6mJGJY12YA+kiskNqv0gDFgTQMQCdyPmz/rCp7Oscv/BVmLq72CSkqccQIOov
	I00NVHEy9b2LA/7vzk5nPz58ASsujhZxnrmJRrZT5KcY4ngkY0RvO512EScACt9v
	pofvLfI8XTaPoT4NkCr/lLr47w1FBhMpYdfExKoRPB0Li4Wu01Xye9UZqxYAvYe5
	9CHAVhpWmtcwQho97pMcj0NEoO16Dn/8Agd/TAKIQlNct3I7Km7m8E+yqJuYpXwN
	Q19mMTgAalFuLKM60Vll4W7kAPTIOB5Q29wlbJFFaLbsU+e3IuZjkwc8RZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrc2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:03:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5ab5c136so626432085a.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363798; x=1791968598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlWq6Ov7H3ZqTYXe03p4byFmP3iR8MTu4occ91czj84=;
        b=Hz6Jyrutaqhxp2gKMiQeOVKN7AaHM2H/oCuri9W9OBMcdFPXj0jx6Eiv9qEmNGx5pX
         eF+9Lb9F2dRK0UUHx/WOhDi03PjP0ixEcLDhoyYv5Mg2gN3Hmd1PLVx7C71NxKWZrS5m
         SOwwpbXnDRqQbVzBieYASCHWR2/1f318NMkoKMa6V/RktE4qfGx4OK/PrphvNITJIJCZ
         PoftLUei+jy/dHLXIKVWxyEWACBDM8uH+jELLcQr6E39T2bjITX3rsq5CfQ5M+Dacr1A
         5v12WSizQ3Sw+On/MrEGgmhn9yChD9FJMWoARo1igvUoscxRfSu1nX/du6Pkg4zU0Tpz
         /jGA==
X-Forwarded-Encrypted: i=1; AKwUvBzdYnCrADip5hN+E9gO2zH+tmLJVsDftl6KHNSJo6hxcbftBHvxPmc9ks+3TJmo0nHj75mhktkZozwAoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k9zah97w3X3xCuFfcugszq9gRlS6E88NY9qf5P6SVAnFUZyz5I
	nwukYFJQH5MSfllZpNd4TNe1Da9l8pXMOfYPwzkmWw404yM0QWGj1s7mX0QSQ0Zc7lbNq3KJ2fz
	LdXJk89nLNTp1oLOvb1dWSdautwgF+Md87dDe2L5wIIQzrKqHg1+IRs9bziCXQvkJ4g==
X-Gm-Gg: AYBFou2mA2OhgVgk7I8pyDxOI1whYfmCj5aaXidiHy3azCR//uVLYHL/iaDYMB1WT5d
	sfvSZUcpGsiS7rTXThHkUJ5/dZ2A/nKZTFQRT/Rx7Qfx+xlvTWb9iphI+zSfvovTVzNwgBrRHTX
	98fr6Sjx9wptGuDNyfyHrbymheL8HkKwkAtvms++X161Bcn8XOb5LN5cFiSupdNwPOfE0Vl3ZHX
	apk4v1W8po2c10fC6LWwfXhxNRB3bR0C0J8qU+xpSJXj5SYJfZNSZ/TkuiUBFqSMVMCP3jmpVut
	paoKxMTy3yUNFGqljj8m6ZFmbU4Pa+yVPNCrblhXPJg5xunyrPJpFToo8/4=
X-Received: by 2002:a05:620a:4544:b0:93e:5055:875c with SMTP id af79cd13be357-93e9b77d3e8mr311436185a.31.1791363797589;
        Wed, 07 Oct 2026 02:03:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4544:b0:93e:5055:875c with SMTP id af79cd13be357-93e9b77d3e8mr311428585a.31.1791363796962;
        Wed, 07 Oct 2026 02:03:16 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:16 -0700 (PDT)
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
Subject: [PATCH RESEND 44/45] dt-bindings: media: qcom,qcs8300-camss: add pixel path variant
Date: Wed,  7 Oct 2026 12:00:40 +0300
Message-Id: <20261007090041.3732717-45-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: sSBSEJ3Cp6GVgPoM2aUtY521_L0GvYjL
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac60ad6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=TLHcO4L7ZdRFNAOTDMcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXwWR+z4rYlAU8
 fexPw2J5Cig15vbeOvmY/GwfgiC5zszaE50QH+GmTS+WtWQQbUGyhx1wO2F3VRRjvCgeqkncnl2
 cgTsqu0ztkgnrwCnhb9vMWR/w+/oIK8=
X-Proofpoint-ORIG-GUID: sSBSEJ3Cp6GVgPoM2aUtY521_L0GvYjL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXx41d+wISh17t
 cRYEZBKLsfDj8VUuTliBVUMj0PxYXS61oFMuFRXXSmrBOvv+t7l2L4OzkPxgqnquPI+4Lbh5FuJ
 VNDwUKXkvDiHk/y9jH0ACkLNYtgIedS9G61bLPPJnPve4x7u6zSvsDi/NvHgAghOPXgs2m9vA2a
 4NS3QIsDoZbMpipDJPQRdJ6K9dXKzMhEOCf+hpYxOlQeP/1P42SiP6mJUNqKCuNMqC9nwM0v6AS
 rnMOeDgvY+cd29I8jnQ0NUf5wcM9ICtRmheaD5IGldforFo7cAdoxXOgubW5q1pknzQtrWnKYVv
 +pfazFG1/G0qP3FxnGdSfRjnuFOe5iAc7IwahIuWF3vnQGwU5qkcurPxzDryvJI9T99Rau3TQaH
 a5OrJaMM5bi9CDCeV4/idWWy5eQ5f8MpU8qatnMra8YVZd4EHoa+hJffGtNRuflImLrh+r9/nmK
 GSTzdLalV19b1uxq4Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

Document qcom,qcs8300-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,qcs8300-camss for the legacy VFE resources.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcs8300-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index e5f170aa4d9e..f85104682e52 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcs8300-camss
+    enum:
+      - qcom,qcs8300-camss
+      - qcom,qcs8300-camss-pix
 
   reg:
     maxItems: 21
-- 
2.34.1

