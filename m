Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FC345FFAC
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778291; cv=none; b=pcBvbKPJQFJ977DOZnlFo0YZ74y9YvZqvg4fyYWU/tNZjLZoe5VYq2Fjw7kGXv/8ZFiLK0Pp8TtfK9Cpz16QPfwjAVsxqRNWS+UKAsULxlBHow6X88FmPInlZmGH53/jxUMpJsaG5YmPAO7dDSchkLAZ9G9iM45BISEfVCTqpo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778291; c=relaxed/simple;
	bh=i/EfGcaVwPdBD4d/EhaLA+xeFVF7rZ7sN3Hf7EI7L4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmvrymBnfvgo8pioa6759hakVu2kLjfKw3BTnWfTExb770Xc3hf1trw2ZVwmo4mq9MeAM+vOSQrqR8PxoKrIQDWG83ep27kshjBr/hbHI+46g8677B8COFoUO/Yfc6fDsydcRjWHld3mTx4B7rVnZcU66zmGSxgSyB03ZD2Ruxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkS27gba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDgJoUUu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkS27gba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDgJoUUu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An5ad3862534
	for <linux-media@vger.kernel.org>; Mon, 7 Sep 2026 10:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=; b=NkS27gbaG9d3MtXD
	EallBjS5w0lf0sqjQLAsXEOywa0b2z0b052QCQ1y1M4O4+dlsA9xeG4HXFExz0h+
	jUJFk+4RqFImX02ieA2adl1CAhMSFb5om239ggLmWUazZM5TEfE7Ewxcwo3il836
	f1Ji8CsfCTH19QE+PrT0ijMcCR8hjrb9qMkA5WhC/t32O8AsaMX/OhtMtqwQQGfH
	TpnH25dfQ3pHJe0vBfyVPf2gIYwgiUsW+B0F8WMOEygtZOZqn6BDC4anI5hne7V2
	sop9JBy0pZYYFF9eDfhigjSL1J17NzdSOe6HMexkmybb/FHSlMtkX6OLj096ILr7
	W+FUxQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hevf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 10:51:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so651994685a.1
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778281; x=1789383081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=SDgJoUUu61Jeo5iOkwn2qsI/lbN9q4MpM+53znFJUH3P6d+PLLgJGX5yLQoRT5lk6Z
         v10NdLNb+zkdEW4x8F/+HTR+8HQbbzM545iXW0FjjvAqy9z7rww9RWidiLXEBtDurWWU
         NBfBWxSe64K4qisQAADl0NH3VviYiuxWzqGztdxrGvPwtgD24uDxsPze/H19kaDJ0IeK
         fMhZQjc8zhD33lGNFN9xftAb4rI1PJ3iQ8aUo3kvW8nL8w3Bq3hiZtVjvg804K0T1agO
         83rUPumybMDKBGZxCtnxS84rk34Y4UNtLd92hq5kkoqoi9HqRR7W95jAd+8945E4CobM
         MP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778281; x=1789383081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=P7u8lsTtpBJFaYKMhQn7BeCsZoT7LhhyfiTWArfPzfXKPzIQbD9nlUpnS5FbY30Hyg
         cC/qmFMouUWuO+AzSFXyeKkifUllBSpHs2wRygZOqdHGIAlpqLKTatvf60zOKTNJwYnV
         9IlwfmDUdjy/M+Es3SudL6uiNVb7YF4G8nrHYaOQwys10HseMbjhc9PDdE31VpH0tFs5
         cQSUYlfrVnWvV8YdGDKUWI0ETCDEPmPMgEwtHsXuPmizB+c0UbmTK24KA4Ri6XD0UhvI
         ZGCMThfprwHw1gQ3RJuM4Kd2pHyRczzF6PN248EdsETZB0izd2wIPlhMcB9vaXJRcBAE
         hC3g==
X-Gm-Message-State: AFuF++nLusCpOJfrLR9pUXmK99gFCVOyVyknrRlOv62Qu+Lunm/yaN1Y
	KAlu6FFTjtN5TgOcn7CuyaNtgjOHcg+XHPXW6N4yEqXNPHk5TWBkhUCvGnTtXMHXiioKjVjIVGN
	gPa5Gk9M3hUtz4WGEQSQsWZTRHVMgtfzlgeF4AfsFX313tnR/j8MhWSHEl3bDfE2yHhAHO0MlxQ
	==
X-Gm-Gg: AYBFou17QRV/A7SG/HGT5TGt1EUc4GW1EZh7QNpDqfRDnjaUxRhYF/0CsCYlxJr3oxU
	1set4T3tNW1T/SrrqesOJMef5tf1rjsx5nJy48NE62XR8GIYIAteZYMqMWk34uxeu6gp5AAt2dN
	5XAi9Gp8xWaAwzc1L3MUio1MvihhUACLON9BoJnZoTkWRM677E4fFI6rwViqluBVloYA9GXgIUN
	UQkCV2vNxJAwRKSvKfvCkR58vURAwyt7AtWyFO/MxF8ZGKpZY4HupMDbzdoOcCcsenXzRSswqae
	k0Kxp5d1P5CKwsiPw3jyyN7BOMhsWsqapJHUUIWcKF2HpZigmsKwT7M1tRMJAGvhvLJc7BcBBPB
	S/2Ij2Y7RGCdMNehJ+qHJYctdY//zR0X+GbBOIfrlOcHtQEwKkBZHyKZ+y6rttNjXqacGnjmsPj
	Cph8R2j3GRt9ismQNk3yPM/NfK5w/6S5ny2MXYr2HmXiVVSPTM7K8=
X-Received: by 2002:a05:620a:6086:b0:915:a953:4b9c with SMTP id af79cd13be357-93980324543mr2237088185a.3.1788778280559;
        Mon, 07 Sep 2026 03:51:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:915:a953:4b9c with SMTP id af79cd13be357-93980324543mr2237083385a.3.1788778280175;
        Mon, 07 Sep 2026 03:51:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:18 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:13 +0200
Subject: [PATCH v6 3/8] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-3-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e9729 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PNF8nk35kTTwmDxLYkklHjGVHkoWhPqL
X-Proofpoint-ORIG-GUID: PNF8nk35kTTwmDxLYkklHjGVHkoWhPqL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXyLlF36QHFTbw
 n1gpaV+Yk/ZOsKeGTv3SJ+URa7LKp5sf2AfMM2wehSttpTOAA9CNwuPx31O6/SISg7ZpJL1KMgK
 JsqOXkovNcpllnF/cAdg/SwcMcAXSnU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX0vQffrx9cpnC
 4pubrqVf2y5962ueELhmPFISmGJEYtUORg9zqFqX4nY3+FS4wLJ+mMCxxd4b9nJ7PZ0jUDXv1bZ
 pxwnv8GY8JjqQgTSLY5FIsOiGM6CcCtSomIUnEvjUf9AFBsIWyQNYbkNJDbqeiLst1t72GBJRff
 J4pwcpmaiA11WPQ5ZgtwcXbaAjruM28MDlEyh0jbrgEG48MkgOpH4qMTceBbVPlhycBBQw/q3cC
 +92O+GDLqyq+dZI64yUIlFFPmudDz0lip3+Lg5ePZwPC0T/2j/jQGJdvq/6ajbNTIAhGh2oDYBm
 Gj/G65+mvLeNp3PLHUTbrg6DhDj6gxH/Fmukq/myeAeRlRP3ukitiCQfySSLNkb2VtvUdTqt1aL
 DwpMFP/1X3AHU8LiCX6MAKmZTab713NsfC/JIAza5DFsn538a1WBOUpp0CPQ5TQ+bk5jyvnKFHU
 doMjTz1ACuIw6HNCzfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..90b54b9808e5999a4dead404aa2063ab695cdfd6 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,8 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
   reg:
     maxItems: 6
 

-- 
2.34.1

