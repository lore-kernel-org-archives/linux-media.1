Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE55343BDD6
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312303; cv=none; b=mA+kgOpRWvZJhINQB131S0eEghhbPlDrV7C+utXxKy8q4Dq2MusICT419YEpf/8iX3t6FxChLmFvdIvKd20LAEnBzaHUCU2tYo63jm1O8CMmFokO616b852o2sDf9GnfXTwxroyrJAG7dnidCGJujAT206pPo3d7C+AGw9Tlw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312303; c=relaxed/simple;
	bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f1BFWAwpiuzmPrf9lMrYcd03Pej3o+4y4hHN7NEtWZrfG/l9bd9Ry0X1pz1fswDZ4YhvTktBOuDpIWwi2sRRteLTcTfKDsjqBbIVz3xGCJjUckt3OME7rxviBqgmlhYNKhaGTVwEdfPv0koxF9iJTS8MYcK0VDExftOtS6shO4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AamstFBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2LJWKpq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AamstFBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2LJWKpq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f3kk1309823
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=; b=AamstFBk49Oe9ZFf
	AvBHBgueQ//RRO+6KkfazpbkIzo1kIuCkLQ/N4B06v0xpI4Cm10G3Jvx2gtRpJNW
	D/o/M4TRb59l3zra9tMXDfm4t8CNGhaBU6ChfXtRMQeG4wcLESsSaH2gP1q/G7Ys
	vexoVQQwvi9SiNUwbnANOgfbh2+7g8+K/VNs64PnlthkLR4uHIucM6d5nVkqJfnd
	ZT8Av0xBucRA+a3AdnbCeksSoEkuAFhyLlHsQ/xr8CxY8rOt3Rba3snbHvcBB3PZ
	7P+VfbFXjeM9l4wndNHYoGjPXVdKRIE+4lR/wo/8771WRWiflts5Wq8z1cNwtNs8
	0wY24Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa330ute-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 08:04:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8db414c7so10455881cf.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785312298; x=1785917098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=S2LJWKpqWZh2h96/B4yrw2eqA65bIoq1mePPwGQyD3tZhsp75BMk8OBrmiBtCXNBrZ
         IzKRwdQfcrJ18aecJJEqzgCqC2A5A/q2v/s93Rx7RtCvk8z4FZbK/eSF6mQF2sgA13Kc
         KM2oMUobbhpEgkrAtFSfmMH4Ry++Wi5MWWaS8+PTCc9Mvq8nB3PCkswDPr2PtFTrXdRT
         59L5SPDhDZjggIyAuG3uxic3sHyMhiqM1pNE+O70PcRNCVJXX/okQrcUCVnDwlJiSmmI
         uFksJhlTS89WWdYKaHaO116eonKaFY8t4/Wx2VpoIfGRV6hPRBezNuUFZmi4DIovb2C2
         oB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312298; x=1785917098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=sLXFwMTGEX5SrkbVAWkkhUNwKhvxNAGNgoYjHI8mSfqAxxnPTacBxVP96V8dhUVcMO
         g4+TQ5ukPbLA4Jtc7Z7LPj0+DzPIu0U3vxg4eK5UJCloe8JrlENRc9UXep6RgCDQXmiW
         GtG5Ko0n3ofyYHsJl56it7G2ebNdYlnNanCTpQ+RTa8L7/n1P1J0bBgZ2qxQFyqIGqlI
         zf1suOa/SjH9QYKPuJstX/iZgYH/qT4ixil/E+/v6uIUPuzi9xwgPh9GGgdlTwZUN7Uu
         gJ/mZJzK8aCqOVLuSEU4+c2o2eOr/DINWoE10LvQes1EbQfiuY3Gzci9cPV9DFqmMTd3
         Iv/g==
X-Gm-Message-State: AOJu0YyOgGT8aULmxkJYEBS8bb5a0xvfmfNf3mD14QprJACN95xA/DNH
	qKRCgXs11jwuAAMTPQc9fmA618K2I3uXmOQiQxF7fWEWxxJvjLxSV8AL2f6S7BmOWMwqCDXbXtC
	XQjs77LRIM+B1RdwP6dh+wkBfatHfe7HP5QfpJRrm7BPsulHPh4jTnDGMWsA5ehXtZw==
X-Gm-Gg: AR+sD12VNJoINzqxqd04JhRCKf5Hms9Uudy+sxtXKwPm2H1TaQt0LLoGWJwFq8+TA46
	cTdA+Y2uxsxl6m4AdWmkCBi0OC4jhNI/nwiMuPbKNVL7BRDHP4L8lhBEv17GO0ulSacYWWVztTe
	VIdj/BqVdMYJCIYf4X7bOJnPNBFbGbIKI+PrsVxIPSNX56+zM/gZkEr7ecGkOcOvG6S+sQINh5t
	YTnw5bQHscjsRT2ttigzy/ZwRBTm8+CZeiT/yM19fZYvTid7YPD61ax0O38tIcyuw2bcpUn45eh
	8wG6nFQmn1pRCHCnYIWUN/jOb0qr2vPpEiVg9uysuEQe7lrlgtwALWj8Vh58YUI6GWtCUJTbBQD
	1Cor3U+tMp3Cz6CK48D5g7a0rpgFhlcXvPGmBQ+Yne3Wx/4tZ+Tyi90rdp8Xl/piHLAvl
X-Received: by 2002:a05:622a:287:b0:51c:88b:d7e3 with SMTP id d75a77b69052e-529d70a0bb6mr49972751cf.3.1785312298109;
        Wed, 29 Jul 2026 01:04:58 -0700 (PDT)
X-Received: by 2002:a05:622a:287:b0:51c:88b:d7e3 with SMTP id d75a77b69052e-529d70a0bb6mr49972591cf.3.1785312297774;
        Wed, 29 Jul 2026 01:04:57 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e30f2a96sm13772631cf.28.2026.07.29.01.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:04:56 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 16:04:31 +0800
Subject: [PATCH v4 2/4] media: i2c: og0ve1b: Use monochrome-appropriate
 test pattern name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-og0va1b-v4-2-ec7e7ed87b2b@oss.qualcomm.com>
References: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
In-Reply-To: <20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785312282; l=842;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
 b=tlgcbFCBzF5mtoE45JdNr7sWt/0lZkRSCXN0qhLe8KCeYpQdIERgxqNeCQWQIRH+tiNHhtEhC
 nOUTDPsNa5JCR/foLWIGyrDtq9sSn8TOSDMyVvgZnStlKCAkBfc3d0B
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX/nBbY0eo7ZBG
 3tzol4VBDvskM2+wbYBVmbFd0pZ9eQmXkJCcvA3u5qJNQWfnAqwHnoJjvGAKeDt6GHco6EyLda4
 boCGLXrbmJYy/9jjAqmvqJ1nxrRFs6/VtJoOte4N1bB5/68vNJQmBAhWH4/9z8CVt08pDwY4dyY
 8KnRooAjIkT4rirC9XGNVpeu5ORDBOegO32KvauHFicCOdxgOKBM8zfT29hs20PMadIik6vJnzs
 l0dCMAn4wucXdwCgjUAanVs0+KkzZ4J4kg31YGE+p5RN0Olvdcw7VomHWvvsgZaBoVAEzJJ8smx
 GuZ0TxqeeAKRvxOVf7eoiVuVZvNf49wmUPZoJGiCE7Gu9TTvlLjFRoYxhOFJLQaMFJvZl6jV3SU
 IAdSb32joGlfh2wK0qYu76r73Z9KERGwT9F62EmO/RMMJuTqqbg0E2Z+R5TlzQjTCM48x8rDRrj
 wP+lNxnFUd5NWdt3bRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfXy31VqnfEfzDx
 p0H0cx+kWFkBsjQuePm+xf5KisUD9saZnPpDIzwDifxx+o+VKBt98UezOisg2Py+R4WElNGJVS6
 fmEAu6VlGChttq/yTt2snndfkFl8uKE=
X-Proofpoint-ORIG-GUID: 5T4z7D3ZkFsVbHx2lYPvcmyflofc1M78
X-Authority-Analysis: v=2.4 cv=Ap/eGu9P c=1 sm=1 tr=0 ts=6a69b42a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ni8zlDty7YU4e_isgz4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 5T4z7D3ZkFsVbHx2lYPvcmyflofc1M78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290064

OG0VE1B is a monochrome sensor and cannot produce coloured test
patterns, so the "Vertical Colour Bars" test pattern name is misleading.
Rename it to "Standard Test Bar" to match the OG0VA1B naming.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -72,7 +72,7 @@ struct og0ve1b_mode {
 
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
-	"Vertical Colour Bars",
+	"Standard Test Bar",
 };
 
 static const char * const og0ve1b_supply_names[] = {

-- 
2.34.1

