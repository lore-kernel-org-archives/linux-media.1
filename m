Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D79739D3FD
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326427; cv=none; b=gOFm7/H49NncPvGiPIL9XLO2TIQlzpRHOeZ2j4DaBCaBzCVoXwr3Isvm4zKb2yzTlLkdT3vOFz/0UyLWBxdBqStsBrZAiGi8WMnOweG38F8BtxqlkvVW46iDVe6wmk2fwH8I6NkfOH3u7RtOWT4VBeYK0J21HpjL0eMqkzXN+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326427; c=relaxed/simple;
	bh=TfE1HXDmuMQX5LOFZmUlH2YF3CEUyGNIm/P5CWo2OHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=khmD3lWd4parxbOTKe5XXnY+XMEXNDmxqg+ExWtizlkprOam8/+W/ukgyBtsbaR7NOzHCmWpb2kYkKTZx1m8bWCo2klCt+aoov0jF4jb2FStsdSHyj3smqWqO4h7lKOfZTrdH7bylfOEgMDL4iYHfzr/Zy3/eJTNHxmlZyj5NNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8CvO56Z reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8CvO56Z"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeKU12049144
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x4NhWmEecye
	fJPvH2GfE/phtWfDyt95THJZwcognhfg=; b=H8CvO56Z3xw8BpkvkSlN5gFeOYZ
	dM2P5M2sbMz1Uu7IZxZAByJ/S81glJwcxJzXjA64Udb3pHadz+wuryyKjG7DHcmc
	5BF/eLybbzWxgZc8cJUG85S879PO2GANWN3TMkjrshCSEo6QiCs9Zw8PJkmiA+/B
	lAuCo4gu7SEcazVEHnIcSq3f7YPRwBrmNfDURFIR6ONdSeOgS2bEZbSKBD54LgjV
	map7Jm3DAOZvxarUWcdtG7I8vivSJu02teGsH27NfZcIi8Xufe9uyVeX+Ht2ms46
	iLIUh6tFg0tkty3np1ytqHrXG3ReYybG6YIryMG/p965Pn+ZX5iaiUwnqUg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54621gxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:40:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9197553d398so50423776d6.1
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326422; x=1791931222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4NhWmEecyefJPvH2GfE/phtWfDyt95THJZwcognhfg=;
        b=Kt0SaCnPqBQj3c/eXtgoCp8xxJch6C8VQbZPbm74jDkqferPFcrNlDyjnvVrSpU29o
         F8nxwjGeSp1LFCGKVYgISTtM0U5oWv+IhUfHFgMyIhuKKFguLQsfsGqdGqp/yzdQ5RfZ
         dRMLK7lcCZ2tI6KGZNmgYnmojjkUKYtA8VrPiWelOXULC3BMv/0p9a+xP17hydwcjLpe
         Ulq28h5pfe5FEVX1BJyOiI5BRemmJ9D8X86TMQ8x9lua94RdfDUH/TEAeTV3rf/fhn4C
         XryzkwF7McfwHMxy/qIXzqWbVgxkc7x9whQ3yyCgnG70OCQmLVtl+JvqLAHNJjx2nLfV
         wMfA==
X-Forwarded-Encrypted: i=1; AKwUvBzXdG6/2C2loDsT4IwnPv+IUgnxulLCefSCmD9Jh/9aIHbuq7TZHKDha6Pj4v7o1+PgMIlENyFkug3I4A==@vger.kernel.org
X-Gm-Message-State: AFuF++kAbZuSojRRTGdK9Lptz3KwCDpvZ7y3wP7OqIePwUMgLyITLLTt
	byyZtutzGf80uGvIcZDBdJq3/pmqafdJV5ckgSPebYf8Sxi1mWwkeUl2W8iPl2HayB9gTJs82KX
	6jP5wf9ZMYBHIG8HIOjP0d9fv5Pijqmo03GUICZ+9JBpKuFWwPmZeF/F0ygM51sHOBQ==
X-Gm-Gg: AYBFou261gd9XLsjWvYCUcAlXN1NanGWMTH5H/KdP/B2vImhG5r7mrlxuXDGa5kRf8V
	ZuqGmK7c4u2HIwE3EIDJzY6L5UnAcQBhzP/1zlhcokN/VXtqnQuwsaiE+Zn7lKOdK4r71uHs8oN
	jUrfVwdOIAX3IXpwcZtneHAnnCJKyEZugzk0u+vEALVNXWKwV3tlVohuSOGAG89ubBVzdlFqTa4
	gq85YR/6oWQR6QzsfURnbUxxUp6slABGq+HYzg1OUM8TYMrCL+czl4hIWhIgLSbUVCAG9UW4E1F
	Jj3dYoTGM4KiphmfqoVIttLhxY1cNdBhrUKl4CtaDbujlUkVvPslOZ9Lh1Y=
X-Received: by 2002:a05:620a:270d:b0:93a:83d:1d0e with SMTP id af79cd13be357-93e9b7b9108mr73777985a.38.1791326422091;
        Tue, 06 Oct 2026 15:40:22 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93a:83d:1d0e with SMTP id af79cd13be357-93e9b7b9108mr73774685a.38.1791326421653;
        Tue, 06 Oct 2026 15:40:21 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:21 -0700 (PDT)
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
Subject: [PATCH 04/45] dt-bindings: media: qcom,sm8250-camss: add pixel path variant
Date: Wed,  7 Oct 2026 01:39:12 +0300
Message-Id: <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: GXAhN3izAXLT5jR3DU3FmqgBf66DaoUN
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac578d7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Wj6AohW_YgefuVwW1yUA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX5yQqZCMehYyK
 Xk1Xgw2Bq974x2eIubqni4WVxVv6cbovq2R7MOx3MuUe28Iezbc7bWNHFbp+oKyL7TqnB1RSTWE
 ov02Wty8qX03sh9PbLKolN9XAGojT9w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXyKoLAvjvC6q2
 81MyuI+qe9ESradQe+dAk2LPoCYS5eqz7GGf/PXmNB5A75KVOOLH++ckIrK1cdlFQqA0MHHhpVu
 vKF60CU7pmKOh5QnQmhRmtaO+U7HR3oju8UeXF8p2jvsc4dMuOyN2JxVMOtN8e/U+vJCFrSn1zh
 HJoF7apRYsQuG1UlwqFqPb8yeHUIu37+hdMM0ubq/qnA3/zrNY8dsedRO6rm0TdkCwH/qx9/t8h
 VDIs01BjNNR99OXN4U79ysyj4rxbU0Bh3zMF973Qwt75MNkEtNK2rBCdRXOlbdOxYXdL/PHojFl
 yftV3S2NbdOG1CztPjQ5doOwCw9rbGbq/pOdVV56orwkwx0M7/KBag9TRueroACkeiwFQYoZKKn
 i4MBMzjqv7082aX3ZH/r2dbfq5+h67LW5rWSwn30viv6XEUPZxnlRgYTdrbKCoDWeYNTPwmQe0M
 ew9wXn2tKNO9rKQ2D9Q==
X-Proofpoint-ORIG-GUID: GXAhN3izAXLT5jR3DU3FmqgBf66DaoUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document the qcom,sm8250pix-camss compatible for CAMSS configurations
that use the IFE pixel path. It uses the existing CAMSS property
layout without additional properties.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-camss.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index a509d4bbcb4a..d561179be48c 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -14,7 +14,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,sm8250-camss
+    enum:
+      - qcom,sm8250-camss
+      - qcom,sm8250pix-camss
 
   clocks:
     minItems: 37
-- 
2.34.1

