Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768193;
	b=i9YtYAxDilg95FFMBHWjAYQZ71t87SFj+WPkbNTH1smZaw0J9kInDlLida5sUVPJmUql
	 3PIhRO5s+QN+iGG/bDclZbGRYvSI2Mx3Ja3XlEgq2OAZkrTMbonQsCC6KZ0OtYMqkvdB+
	 1PNCxu9SOzlkLCqheoF5isdBDL+aphRLBPvt6KxAq4jfsRhtQGgsOnd10EswupNHuoebv
	 2ttOV7C2f6ZtCQzBzSUP6e0oVAqfzlWcPl6kZEnpwgkp0MkVLN7lwkdckdPJ7tavGu7Mg
	 a2jqXYCK0ujaFgVJWzXrqB7sFqBCtRyDjTfm9CMmlcn2QKoLYpLukofZacVZU/ic5vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
	b=NZDQAkVG4mF0ChyQIPF9eIVuXiI4T8ZfCUI9BXZL67JNQAk/7y9idzc1uF+yVULmAGol
	 NOwhhx15wPJfHStEtgcguJ9o8Fgk5FS68CTRCzfdBrZ6roeVb5TECdRObZthIWwe/rntl
	 rQSvS3WbbaZme5YUvRYXu7HWniK+U8i0EgDxIxMybyF87q3a3NK5HaNgc/wDi13sY6ARr
	 xYwqiRbL5ulMIJtRINybKqeakiW1Ao1wPRH46LmooLjkMFahdeCHrMsOitxGR7J+6Z1PR
	 54jG8tRbmcLulI0xFXQlFsmHxfhpgyUP5h8NiZ8vcUOs7XZkAzYqFp2bUzRlV4qLJ8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=py6aQLEB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OB/M08LA";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27353606C948
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27353606C948
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=py6aQLEB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OB/M08LA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wwY4063463
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=; b=py6aQLEBrnTvjNjU
	gz7uI22+xwpuJzETVKih34DNDaXYpQiDG/Vw+7ck3gZZn+ACPRSForH3VG12l1uw
	NKH+7didgfxVfOjWgkyT22d3pZxBhS1XNci/Bp1OApEPg7bjlXoZ/GPpfBQ4aLes
	+Uger+I0Qly92vg9OJul2+Z5ROMBDZ0FZ1gNgWYWU27n5vNPxVAoEfNf4IIrp84O
	CPSSDOrO68aODZbvMp/pDIcVEpW8dXxSPf0FdxyyrtZUDOr8OWxQ80omy320pEfV
	1njcrBcJpUu8c9UIpPmcsOyI3EbAN1EZAdKNK3oQncT4+98Gs3HRaCjF7QMcjo8q
	u6m6AA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrc86k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso156678885a.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768191; x=1793372991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=OB/M08LAGRpVrRAdzAXcFZVTLb4hx2ryKl5A5yvkq8eXC43R9QjuYq843DXi1QN2Ew
         PSq7yRGJEWBxc5vD7zClSLqf/mrr13dvFMIGrqF7pacnATxkJSJrRrBX1aTvj6XwhxPJ
         6HFDCfKzW6gNI/6+Cd4Mqz5U7vdGLoap+Qc6XHPJL5lpmVMq2KEhqqopeP7G7wSvf4Eo
         4rvZhyZ123ab1in2UAuUCUU0JKv8DMipi/dJkUT3Ie9rNamvZDWRbluvHKKk2TOddfQh
         Pank4SBpRiIOrISlbXho6+lCQMNp8R+fINWoMMZtgmMV0weWROw/afnXj+pL6CGHppF3
         5qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768191; x=1793372991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooijHQlhry9x8ePNW1MEInw6PQc9F5ZMCpXfK0l0qXU=;
        b=b7O4nCFrQZv+kWCMHjlbr7Dlb5AR5BNcFLOvY0fGYX32vhBArD5Fjo/Y+CI4WYtgLD
         T8MnmlCZC9lkTe1fnRVJNifQdGuBoBBAsy+/RBUDvabR1OkBLSIqQ4vKEo5M0XXxxMmH
         ffevND8SuU6qc/I1GP+tQ8fDT0t4+Aq9bGSNEc3s4dfG/Lz3XaaDn6XZtEq4MRihxQvA
         zUXdw0ecyQ/lNNJ5ViyRXLtE8WbZHqQeyRqTPZY/7LMik9IWPUDbZj6Nb9ebBcYh19uf
         oEOG7g990hK7/GKG9tWjI27CXd+yv0d6Dlrrc1daiOGc4yS/B9JhXNn5j6uCHlPEqXRG
         +nuA==
X-Gm-Message-State: AFq9FYJYH33Qs2VEJbaRlxywSawbZxm0GbwC9Z/G5yBLxxa1ywN4cIiO
	Xyg+KJ2vuOD/+CWj4j+o84chQVj42xCjEFI+ScFVqLfO1wnBWZAXia+qFLRxcVfzo3go83d4mPx
	bxuCeRI1sxA4GsSGy2ERP7jk5Aymf0ZUnmPpNIAO01pDWoRARpM1SjCcnSUkOgqIoXqL8l1hXzT
	95
X-Gm-Gg: AYBFou3YXgWZysNr0OFhcTNv19/2WQ4UAKey9loKVT44UHggmoUA+gDz7DRHqXn8Hx9
	vtA3SbA5ManWhUwj1IG54UXS8CzJKfdbCO2fCt2VzfK/RT8YI/d4tWFY161OYgRRtlDH1txGHYr
	+gHFLGcEfflUtwWcIFsaHIYw4JTBvM2aqoPApimQDV7GDMZ3Byp8HDlqSALcuIMNF+Mip6uhBAN
	9FsyCuwiejoPBdiZKj0pSx6BiAfd4/4XvnTqiwFHpGHSuaY7tJtzPLT/7et1/fJrU8oLwevFrrq
	1wRvxeIgKomRCPd98NERV7hq3J73KAhk2zgDTsA/g6uTKKLR1LS8h+1uqEf87U5CY2L3nKfS3TW
	LJtNs9Gfp+PSG/pV9CXuskBAF5YasL9uUb2uXVr4A0R/QRY1cHY2+r3jBZT73RSZixX9iYO3U2L
	elwv0tYE3gIpXloI2sg+MHxUy+OxjWHdDC6DlAwXQtT6xTNWegDhc=
X-Received: by 2002:a05:620a:4712:b0:93f:3bb5:545d with SMTP id af79cd13be357-93f6f91c414mr483890585a.27.1792768191467;
        Fri, 23 Oct 2026 08:09:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4712:b0:93f:3bb5:545d with SMTP id af79cd13be357-93f6f91c414mr483884385a.27.1792768190952;
        Fri, 23 Oct 2026 08:09:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:20 +0200
Subject: [PATCH v11 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-camss-isp-ope-v11-9-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
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
X-Proofpoint-GUID: FOIRtMcTBpr82UJAkKpecY85tZPSWakt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX69v3OW+vDDsr
 laU3tnw2Kkn06HJdnSXBm+3RYNex8ftgBkubI5mOhRhYAsdwoZvaK4rhNa+D2CnGQpDbInBeiPw
 cXUXEMxK7PNQKlHWvmNKi1HIHb9CAb4=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb78c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX3+KEQJSzkzFb
 vNhL2yBaY2yrFQuCwhGGLRkY+PNGDPxV0vB60bSFd6PIG7H24712Qr/Wm2mdgY/MtPrWsHBRYB4
 /fVyGeGGP8QSTgjJ7L6OHuGiluLOpWs3FJVXLPUfYXDLJmmWL3kdWn1xmgp9jaPumWh+BAhKG6D
 /iTycNPExhcB3vyhNARb7YiYM4KYU/gbmzqAbOfdK+l2Ig10qmQbZq1lI3tk/inaOd+4D2YCpfd
 SIKkrcn5wZoJCCCfwft/uswcwib4NL1+/xnLX9x43dqmRFi57/jCaesB7YWeL3+Vs+aFuIeE3Su
 Fo7uRuvm3SZ990dPgRfj5KzZreGwok0O8SY+vyJugJVdITDoQccbHKhw49diwqua7efQnFDcbVJ
 zUQsjpijGXimxSlJ12ngmZU7yZPRVlRmVJ/XBAdy9Tt8aZVQgkyB/SqpCwrDsHptZYsytfdgUNm
 MSUWqwrEwRuARnSd7/g==
X-Proofpoint-ORIG-GUID: FOIRtMcTBpr82UJAkKpecY85tZPSWakt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

