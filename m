Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242A8483816
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363767; cv=none; b=rzWkm9rZ+NYdnyc3yhTh4cXcJikbu9vmtsYnNi9RY3G8qL3KJj7K518Ol/UadPW8mjIKWvpEVOu7iVNycC+fbuE8nALkkYflpk//TgEusBk7dW4q4G7WTzN3yGVfEPXVgCIb6fE+0FhhnSJzrqx6uLKa7SdEWSG4ItpCYzMosCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363767; c=relaxed/simple;
	bh=RuhyOjKQKg6pBFbp3gU3ApGTv0VXjIXo8m3P/9Wd9Mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UOhPPl75SF0RXCi+DbUtkBoxFmmlotTkimKw9UNXtbya94g1Cwo0ycjqh6Xmtd07DGBrH+1w5MKVJMJpWM2pO/OKNNHHmubocw4OEwZuxZhWHgOp5vQuE4gL8+RafY90OWo3EzEI0YFXvfWjsA++YzkRTEfNk8LMpDOLCE/5ffU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLyPETOS reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLyPETOS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jsFc2312960
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RSFwFFRmZR1
	WRsY1c9AXXEPBp3eHl/0EdS15woUz0X8=; b=iLyPETOSABKLVZ5ZARQo1uGOZIP
	k8iVfaswVA0lqLUo0yhZG/tXkvfxyiDWDKGsR5p7ByfTwH8WGAPCb09FOrMLHc5v
	C2IkI7mEKiSUlctwAJh/i2us0c5Wxjl4f2YvZ5A72scxj2UMAJJq5pEYLEZBjiOq
	VqsiDT3sWKXvJQ/ZOutBsY+RT2D5IZr1nva+TsJis+w2hURPTrbEnPmcI6ZZaC3g
	w6CHg1ZcOsQ+PK1ZWtgJ55AUNAd/NDQGHS2vV6dBcIGz0eygcpBSo3WiFsoWmM1I
	I7/MbqK3+2EJ2nAOcVQWZQz2BuLrxE4ZyUnNDSMdRft4Zg5FewjIQVXqStA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53asknh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:02:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so697587985a.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363735; x=1791968535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSFwFFRmZR1WRsY1c9AXXEPBp3eHl/0EdS15woUz0X8=;
        b=mo4MIsbK4jSiAtjDTgCPsEeSu7lKPNjKTU3akvXOprx/DAZzJLfcTEyr+s1KlqWFNu
         32K4K6dsLIU3IBtPGmNfZBFjbLV5XHKnXmi/T4GMojWERjQDdR3NhFvuF/s2rkYTHIBZ
         4CDya+EDdcyn8XmXiuCH79P0cMB67Wl6rSTpEwPLwRFb65AN1J1GVxFElg0ea9ZtO/Vn
         Nbb+uPi6qXxlkALS+1fbPnzXCxgHEaufowq4rwVu6lN4ZKuf30XyC1BJJc3ctIdges2/
         85PK2sYo/kWvvFXv74vv8SsfCgDzgkZ7R4NhIhPdv9T2jFDq+6FQUU88+fJL6KS2Vbtu
         tWmQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSyqR+fUWv315PZNS8iCsxjz+AOnxmlZd29cDknWcD+3+4RyipwFPx+cC+3KvIMPiLzUnyHIVmNE5oPQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lJlPxBncnXaNQm5+ABNauTzf0i0tkMPny4rFIjd9fxrVsrdLhU
	FOXwUowpPc//MgZMGa4q9FuDi/TzeXKIa9cTWlQTRKNY0phfM4Pe1CgIx5gXUQ5pSIRqZkGd0v+
	UXZOqlnUrRM+AWawzRdAksnnwj0GVsG8BZC5HR+NuIlmgZXo+hjsLExfFbRH1ciM97w==
X-Gm-Gg: AYBFou2LdfT22bermGLzaoZWe2ZCdMIoXwwSpNMRkbkqPCtUYTkWEllKZGEbrpmLZ0x
	saJD9GW/wqL1z8dsLJSI2mnixHcYdE25edLV7Ld4AALck8MAG9A3eD+dJSUqzI+1vPqlMw6ICMX
	JzkmofPxqstue6u531CTaPOSD9JsO9i4dBX247NNPPorYHSXeFGfn6ayqpYmAY2p+8ulJhIJfcS
	aXVecTOcHVFLzYD9kB7aVO6h2Zdo/FO9b7zeiXeeG22XQ3Le1v6LnLE3JkodJuFCs5G0H1RtHck
	g6Iseju639sVi4g/dBbmmS7Q+Cu65jFtRhvyXWD08q2XCpuj1YcbmlQ4ysg=
X-Received: by 2002:a05:620a:44c7:b0:93e:9809:3369 with SMTP id af79cd13be357-93e9b856ee4mr312957985a.74.1791363735195;
        Wed, 07 Oct 2026 02:02:15 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:93e:9809:3369 with SMTP id af79cd13be357-93e9b856ee4mr312950285a.74.1791363734638;
        Wed, 07 Oct 2026 02:02:14 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:13 -0700 (PDT)
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
Subject: [PATCH RESEND 25/45] dt-bindings: media: qcom,sa8775p-camss: add pixel path variant
Date: Wed,  7 Oct 2026 12:00:21 +0300
Message-Id: <20261007090041.3732717-26-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8yvhjjoLleXFEwMTAHMgDgP_n1hIdwVb
X-Proofpoint-GUID: 8yvhjjoLleXFEwMTAHMgDgP_n1hIdwVb
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac60a97 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=-SsTkY4pZgJ_H_-AmIoA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX0Gkj44jLYu5H
 q7IWCtaF7ru5tA4qQs+TjfeSXAa1+T9iTSc23iLeBJzC/RzQAX4kbUHU76QEmg/dvlN33bq1Ub/
 nLRRQluiXcqJxjfgVOkrMK8O5eQ0BzGak1H4RVl8Ms1SrD9a5leHSoy8YPFzoq6KVQU5LaZAZ5I
 +U3t23TrOtCW3ZNQwBbgYTOY6OxY6xqzbej56YmDJ0rIwLBePhomBBajhAx1p4+ldwB5IbSqqzx
 yezU852NcCDOtxWKssmhepLIzs3No0MWA/hf9+9xg4VN7qYKPIXXMB7DaYCjPuao0BGIkrP3ce9
 TivWjxvHpn3RRoumj5GjtsBu0o/webF3JOzVv5a6n+qKAwnyA5iIhgXk/ndhsnFMYcUN9QeZTZR
 NdELjAn3h76wckV3kqwLh4EerbIvZU2AvCl0seJkhDdSVKSGIct7o/mW/QZLIFQT8XWvOoq7Zne
 l6GvdMxh4V505gbakGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5zCxn2/ksLn8
 yrZUQeVYScjHUWae8kIQDuWmHZ+yOYXAMrYKHyoYh5c2YKu+ck8Lf4cVFlc3sk9DbGlVAZy1as1
 MlU6Q6EuKxrdYKX97PpDTthDGKKwhus=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
index 48f280e99809..9206c7cfe197 100644
--- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8775p-camss
+    enum:
+      - qcom,sa8775p-camss-pix
+      - qcom,sa8775p-camss
 
   reg:
     maxItems: 22
-- 
2.34.1

