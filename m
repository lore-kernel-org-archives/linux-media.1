Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB34BE44A
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005007; cv=none; b=RWz5CrHUud+/OG86oDHfTD53D7mxxSy2+278QjZ50U78raQiuK0RqkpuFno4nRg4cCqveWwX3g1Wqckw1m3GdZSw+rIvcMgf7MOQhSV2LQ9QMFLL05oNq5XXIg+UoCT9djvWM2C2zYSLOC5CSRqw3wwxU/+jT4NxpsHRWZVNvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005007; c=relaxed/simple;
	bh=H3FZ7znaCS6E2tCa+3jHj85kDw9yZ0pmbfqMcQI6JqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tGmY0SG1CmmITBmZJHcABmN25xcEtDlOeBsx5uS6GA2NcRgbegwtUsn6JdIxNTLsD8IyspnI3tCbG63vkNoL5Vl1E1pP4H5Om/cxb7TuL/BHpdBbGWLavNtq4b/VuGrvCnuxyEIbxkI8bav/82gfkYXTYkjnFq6eu9Lu0tq2yx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWbQ9jUe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeOeX011; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWbQ9jUe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeOeX011"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFB6dt886453
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 15:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=; b=dWbQ9jUezQSJ1tuY
	T1FrdwSBXPFscE5nNBotwR9KY+RQClgxdJ7Eh3nKsIpq3uprWwc2VT6riLALZKFN
	JZ1P0uO8FvO48KBuda7CqQsSIT+c2HFGCqHtSKceCNYH8vkXs+2hddrAtmG09shs
	5dWoZwkIHt7oR7/eVGEfYJXBhjiCJP4U6DH/j+PJMIJrWsEWjK+F1eBP4ob0wlWZ
	4RvkLCTKxq4Cp1/Uj2Hv6yOFvCKpPnjp/Hjt47H+gZDunJFDsKJg181+8W/XIQpe
	WsUOS96FjyptWRBJi95Gn6TdsLaCrgm8EqxUDuY5ukXDXyohRSI9nnwnUR5Ruj+e
	e3js8A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj1vky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 15:36:43 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-980882ce555so333116241.3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790005003; x=1790609803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=HeOeX011pehEoSKLv2ZUhMJpfX2NH9XxqoWkEZAZQDUtvFxSBevbStdRwxF/lV4pjG
         F5i1U7YclRTyxijPBKhDHsAYdezlJlWb6t5XRa/qu0R+8qKJNSu5Cyb/z7tC3gjgx8oT
         xDQEmyt1cbBXgAI1DuQt4CgOKE5GdTj/JOCD3225SWNjYww+E0DrdUkhSnPi4nKklPQV
         n7fHROSeDvaEdDRAFfhCXDy7u+IcUckSoNbGyWA+c6LjiOybDTwFzryrFMPPItuIkEuR
         jLhLgozyxhTb7L9iTuRG+z2m+fkrMQvbfn/ndE8EZ5NnAlnx2S4Dpb+CdBq8ejl356qL
         Y59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005003; x=1790609803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=WHiCY8J4CqxWY6AB5lizpNi8Tsc0eYxoBVAWNB6qUEnqnOjoVfOIkAmXP+V2K/2BVB
         ztWMpPpqBU7H8sSUssUX6HbAPQBAeBKyV7zMx/kPAyhGkRRk6wbH/n7Ie1PjhTgtWlhq
         V88nvmMbG22zb2r82rYEHQSp1QXIjKKQPMkxV8NjjAQskMRTpshWNQkLKEEro7Ib3bL8
         0+Y5r9MNIer4cv/g+AlM3pH0SxJwA5ZuVp0Dmam561I85xS/L5KTT4a8UnnIXJagMtcB
         ZfAR10iyKY63wezrtX1XiGtkNlWHExfvlqQ0beiOkLZTU64iUk8p/gnbkPwn9+11bCR2
         LuLQ==
X-Gm-Message-State: AFuF++nXD+Lb1Maq7SH5tfl8+CD9FE5JuDUY4bSYu1AD8so7rs/nAYGD
	Qc5Ctp+roSDYcvZMss/IyzqRFKGcG9Hipa1PRBJho35MC7t/4uswO7TOd7PPJTdWpuxyZjJqqxm
	ozfBPOU2fLrv89V35OlsFJ3acJiuRAWiMWpLQ0AgHec34d9ZJL6wyKmerCsJycjiD0wGnmqHGTw
	==
X-Gm-Gg: AYBFou21S22NslXJ8LcZOUieyBV9IxrQaZXUERv7/H61f9pYlK9MGIWLtid1CBZf87k
	xr436oZ2RtUAyqp447FKe6yJ96+Vu10UnNL9KUPIoXdcGuTEaAMFdTfvnpNHgmfIdsLQ2VB6t6/
	pIVvsU0TVXsHyD3Edt37TbOOEu/zQ1OK7QNs8ICcqlIyeZ1gRcshW4+5lg5mGFjWC5R52lhD5Wf
	paoI/ZJveY3d/GC0CYIUvfyzWdLIufHbY2CfSAj1vtB8OGCvdPVwV1TriVjvJh0DSor+JoTy0Ff
	7WdjqqbsGEpS4HLPMU/PZopkqiwWEAJl7SW41nc+PvmO89gnkSTJBy/2b1Ji7gW/cc2dSgp/jMq
	zcBbFpZG+/GxcJ+5c1qh0ks7FjGJnRcf4G62M2zSMWr4h8VXdzFoO3dlUHZbDKkFpDIHE0j/uME
	x6oXaw2v8J/FxUWmmGtqudOXtMBtk/kteyE2IceTqFAJp1k6m8oYY=
X-Received: by 2002:a05:6102:6b0a:b0:7a8:10eb:96c4 with SMTP id ada2fe7eead31-7a810fb1f76mr2252342137.20.1790005002788;
        Mon, 21 Sep 2026 08:36:42 -0700 (PDT)
X-Received: by 2002:a05:6102:6b0a:b0:7a8:10eb:96c4 with SMTP id ada2fe7eead31-7a810fb1f76mr2252292137.20.1790005002356;
        Mon, 21 Sep 2026 08:36:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d5b5:76d2:82e3:e5fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm231054065e9.9.2026.09.21.08.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:36:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:36:23 +0200
Subject: [PATCH v8 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-camss-isp-ope-v8-3-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
In-Reply-To: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfX9TiAafRWWp7j
 SSzZwmDocvaMplgzVe5fdG0wWiDwjN/F+xoxHKC1mLkrvH4TrqCXWrX+N697AubHUEohYehgd/I
 2mmPpDgWp2r+EZLH5RXZMJ/GsraQVwE=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab14f0b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 6k0fn-0bW6adBse99GJsHhv6F_U3RZ8r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyNyBTYWx0ZWRfXyGlsBQC8+bps
 pw3b1j23TNphNRe/d766U8z+23vFqpOAeL3g6whqPUIunTYKykZCP6eQbRsH0smGh5AnW9lK8OS
 FUASsEre5QN3y5BV8/d0fq/zAvNojTprcYt2sQnVN8tofdpygwpFC4icEq7vLz62AgYlY8kNq+J
 zJAUaFNZhgLoJvNizfNnI83DyXLog/HxD0+n5PhbXq915V0e5MsI6PPpkRok7K2kSdchs6n+07/
 dsva4BlFGjJXVHj0+ula1DBOn8ibkrWny0jbLUdEZMp8Ea8w9euZ71FlnulydCAjtd5xlOmsR1i
 19EMzFIIYBQdlddV0Qv3dYZ7LnFUIsi+9QiLRSEuJlIWBFp+Lft1//MvMNl2d/YbPeSgfs8NTe0
 QHwG0hQ50abYMFvVLdWrKEV0+e7PkOhvt5x8wLRXKdkUJCZ8dEsU2ZWyoKzbHKb2zz0q5w8+WUd
 Y2g62NcHUz92peq4l0Q==
X-Proofpoint-ORIG-GUID: 6k0fn-0bW6adBse99GJsHhv6F_U3RZ8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210227

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

