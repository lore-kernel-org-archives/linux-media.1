Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D05F38A726
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609483; cv=none; b=hecgHfOsKZmBacieKoQhZRafImIRUcG5b0XgBOOfYXVzCSqX1KYVV7hvOJMx2JxO4HqvygPBTp42V6rB2zthpcyBmElBnfW2SB0QSGr0o8lNWB26Vj+o03t0IrpXrWCn6DmGMj3qwPKrYpbONPIwrGP3LxXonXNvwneajYHb5cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609483; c=relaxed/simple;
	bh=CojWuxuD9n66r/EUNi/f0S5ZcbJmIz1LSyhP0wh4IAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cT/kjMyr7dW0EUMCL0rpoVblVPT625BCP5kjUUlhDRRbtquTCkI7JrqaxrEos1dM5HekfOwZxvyBRoHSHQ+aTuQiBOfuNad/XqbDeAETHilN03E4y0EVTM4lyCi2PoQn1Y9sPWcHRkzgXcRnRPDEEMn+317mf2sMFkujoSM2nuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYhSykBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ipkUmAb3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYhSykBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ipkUmAb3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNClZ6046212
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2nBVq1rdutHbNnIKqLSxvl3wO82LVN+nGH96S4XIfw=; b=dYhSykBssctILex6
	b88/heH0M4Tss2BMXPPDe2bDXAYbcUgSovCBlKXvduduUYVyx46K4ZTHpo4owjQ/
	9gi9eGquxNmtvt6TxBIffoEW4MGtEWqmunTVVFuADO8spQ6A1RfWU4HQyCSo4VAu
	qES+Wq5r9c4CL9urQ4Eff3KFHiB+KTzk0i2NG8SUtBVeYpCaVjbUCODZ24oL00yn
	I3lyuj31obLFZWIyabBIhd8SHlKsVfYSaXM+sXSKcrxxX6wAIEkDeU8X5RlVggVh
	4YCbS3pyRGMpR/PsHUrwAGLUSanftT65a/foduu/dkjKVoS7prOqOZqN584HtmHd
	uea62w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5ta41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacf17c7e0so108208965ad.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609481; x=1785214281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2nBVq1rdutHbNnIKqLSxvl3wO82LVN+nGH96S4XIfw=;
        b=ipkUmAb3HPHihrRD7phRD0NtccEVJYT/b9t7P33JlcOdhVDOzaDt7BxyGb2fiaSEw/
         EuUK8XMQQDxZmNN9KMML6UxlEogmsMdpfc//5T4xfVn3xu+8pKHftsEBT9jEM05xvoW8
         Cn+O2iqR93lDAVGwtXimv7qcWuX6n6ETdUoH4+ag43rGz3QUs2NeKfaJFAsk9oknuDuS
         kQLr2mLNRQoAloPT6XJsRrR0L23P7LXeAIkb6VitH1PHLXHM5BpOUDhwF3sm6zhZ88eL
         gVokEZu5057NS8HmEU37oeZkaaYD1WXSvaaExoc9r3AwwI/EV0g0IoxbO/bXMGD4fNT4
         gCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609481; x=1785214281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2nBVq1rdutHbNnIKqLSxvl3wO82LVN+nGH96S4XIfw=;
        b=Uu7kbzeUUDzBBKdZjaY4rhtZ5D+QM4EEm98acS97oPUZUKAC6CvAnN9cMd2h6lQ47G
         ZubVHxw64RkSjHKCSbLJGv+lJ3GehioBHxCwKjELCXW2FRUr6Uu1fyY8iDl0E06o2CZD
         mxzUV1AcrKJ/W/YRojIPH+gfRoFY8YhFAJ6R8C//ZurNI7YGXiMUOiX7A0n3UCIwsyKb
         McYNU958Qr7iIqajhQwcL3qFCJv6VDKykC0D+0K7klBD9wvje9oohz2hjfzhAaHh5iIz
         ucgI4aNrtgNTW/UauHArhyVZvJo3Cz21bQDgyaRBvna0Nrxnwx1Tz86ijX7TtRUPNRQV
         9FYQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGb/xASeR+oEAKd/aMsLHnS9efAW//PxHa+U8RD3WjU7uohJBcoPh9KSii36IfC9ICgaPKJvN8xESg0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzVUBlu18o4ddWUwkWq8DB1/Jx2+Gg0x8pjLro4EqbHAZ/uqlf
	J4F69Fn3tbaVlt7bSgQ6HZebYC5HwqV+rLszY1A2vSsu02gKSjUPA/FlVgwT9tWsf/cvDwl5sBy
	NzwMM9nrhZE8j7S8vL/DgF44l4VdZeb+F8pATQXQa7gK735fh/N/ShNWg8qAw/k4hEw==
X-Gm-Gg: AR+sD13Zr3KRKYg/gUwvY/hrtOeFQMqSr6YEy0bQXaLVlcsDVIry5UDD4lQAA3yxltH
	Xt5mZPrMdofQkFWpYoqCxdoooSjsjwf0a0vpN+u+GPvwZYrcFu29arjtG5D0e4ejhH/zeGM/uKZ
	messwIvHoo0K+furkUf3qLwVT4Qq2Y9nA0dK3li+HstUKhDJ/kKImpX1iF3ElQNki0cAnUJFi4P
	9l4JcfPix0gPhDLvKZZHy0KbCDSrPUs9aFnx1HjiEckz95KZ5YHey7BWVsCdCJW1MWM9fCD/c/6
	+lzYN7maXyJXNVQtaSSrMstbf2E8i/IRI4M7JiGpl2ui5RnRiRhjxyn6lfAmHE6xlfa07XynA+M
	soZZQH4p//iJe9CvJYyLNVjrLI2dG/HOMbCSYdyrh5FX4nG1ge/WNlfg=
X-Received: by 2002:a17:90b:586f:b0:38e:6b76:f0a4 with SMTP id 98e67ed59e1d1-38e6b76f1bcmr10802637a91.2.1784609481018;
        Mon, 20 Jul 2026 21:51:21 -0700 (PDT)
X-Received: by 2002:a17:90b:586f:b0:38e:6b76:f0a4 with SMTP id 98e67ed59e1d1-38e6b76f1bcmr10802608a91.2.1784609480573;
        Mon, 20 Jul 2026 21:51:20 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:19 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:50:34 -0700
Subject: [PATCH v15 1/8] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
In-Reply-To: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX8RoLuFA0Q5mI
 U8v64948MTdl8/df4od/V7MySIvr+IdffZnPLOLDKzMi3k+gBfEJ4VQWHfGthXl0rTbpgYBP+Y7
 39cDDRq9YZoeinjMGSswtqwwayh8sDBGW5l2E3aILX1QJm7EHNIJU/6q5/PbHySnGXGUKCTwqfU
 Eh9dud85L5WMYvcAEpsAY3BwEVflCyBa///xSRPhnedjqCCECfSG2pM6tJvdXzAFHYvOGu+3o7z
 Ipqx7W++4fYcC7suILm1Og0yo9mzNAwWXKhOrLjG3ZeIkeNRyGLxBEBO756I7PVm9W77qov6XDk
 tz4SxJDTw5Y0cPYglak5BjR7oDpRPcCCZyVNzAEmAt7ZxNkO6UtyEKNdkXHiC2zp9oC4hXwAEhU
 91x3ntShNTj/05gD+2L4/HdY/YZ985My/mMhu+gn45LS0CHtUqFko9v3DriAGEGhwGeJweEHFr4
 9v6PZ6uEtrP/hRnpbMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfXxSwe2g16pmaK
 Dq9lwCXXahms/GGZgWODlCXnoIdhuMNWBj8YEyFe2y1QuarjnXv4SPg6pk4VMFpRP4p3YOCBwLN
 4hlaF4bRbkebBylfK+EX9c7OzbgAQ7U=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5efac9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8sc_bQFcTW-iTt5i-CEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ZcB-oanxRb0ho-2kdKQljtS8yVk6QyCd
X-Proofpoint-ORIG-GUID: ZcB-oanxRb0ho-2kdKQljtS8yVk6QyCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210046

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 880fe602945c..7943049834f9 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    enum:
+      - qcom,kaanapali-csi2-phy
+      - qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

