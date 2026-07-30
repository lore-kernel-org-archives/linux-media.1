Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4DB423782
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424860; cv=none; b=ol9d9CmhYGM1XGjAsqTf8I7B7y4+197NLyhgjGGys3nIBJqIDiEMJJCmaXy5rcDxlR7IssGWR8TrquzpmY6XhGi6yjQNsLzcOa+RNSrUlS8pfbz9kKEhk98dNY5BHz7q4TKVvqsw3h/6g767J061jBkuwTS8Gs42sXuDIWhLWqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424860; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujmmtJESCo3i9DCykkWiWlQC0eavItzLyNNWz1PYsaGwmUwqNcIvjFB/+gl0Dqj6TwM8ovHXDcfjaveB0o1JGOd4Frh60CJS/BoF6uTAIE1iAZKUxh83mzTTvOT8m3LLIlrqOFnHIem9+CoNSKey+56fDBwvIBqkj2j37yeOEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVjWR9V1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jofhmO2t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVjWR9V1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jofhmO2t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDebSQ1228918
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=nVjWR9V1hCf4kNtL
	IPa6EniCq8B2Uq4Iu8+FnBGDYP72K3nOEwnp/LimgZ44bE2JatQuQq730fIMQxEl
	mTAJFPNT2K/XcW5ZeJF25PwjmFtHnO1O3amskfcaPZfQ+b+VhIsP+zU4PBmyrrMO
	jfHUpIbKGHmMbomy+x9mBKz8W3fs4N31zK+OR82CosopkwlXQlBMfbjsSzylkgQ9
	balWNlXU0/C9AY4zJJ8Y95gztoQp2IhRlwijW/CvBjjEjV3/NarqaC3QjD/UwW9y
	BOTAZPZath9gRro74FyrFFQotibrQGnTVIma+0N7C8uOlQdKUCkNGj5M1BS9tttC
	sn8+mQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7q3gg7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:20:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso41800751cf.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424857; x=1786029657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=jofhmO2ttoW+OkfLQWixzbMMSJzsaGMu6WyD0Azx9TBlAXQ6vSgJc6szXmc8TUWexT
         Qpx4c6Kpln+Dz/dZle6dr9UdzANKLmHGH6ENMefC6Ich8fsSsV4mr6ztGYQLr/dx+YS+
         0MYhcnZ6ImREfI4iMCwd3yRCv58EGmxZj/T2ZTndTv9QW79tFx/Rq37af7DSk5Fh8sRW
         hTLtY14Jsay8cGVOrD4UehEBr1j3KO7q6YO3ZnpR5lQMYQtpP5PmwFaIRJkea7gIF43N
         3zjERXbUY9bMJP2H+JDl/6575dzcmYryYo9AsbFxIog8rFrdpvCmDt3m3MCz/spo6fSJ
         Widw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424857; x=1786029657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=l/C+rXVe5ySSdhqc0Pw0gdsOdb6D0qikZAQUaO23A30kmuVNPTrAuNTH5+WcJTH8UV
         C+tl7fp26QleGSkNOhJ6VNbkArKRxYDvVZ264c9mwd90yG+BQHRsq2bf5HPVPbM9nfrF
         fwNsq8wdILQui1dQuWWvh12WCQHKtKmdMrIIDX/I0EPlVdp/Z6+xEgNhicG0C4eConZX
         QLDGfa8CCgbunq2c4h1tD3uw02LzN167O6ddV9WUNSezPFzMJMvv6dDKNqAoQE+PtON4
         6ia8nR39eCfKx5f+yIHAwscjFV8qo4HvsMyUUMPjwAfFl9SDZnR7Ik4ebt7P3re9hKOW
         ys9g==
X-Gm-Message-State: AOJu0YzwQqYW4p/X2FKy/BF5T+yRtH9JlRZqB++K1c58sAXvdRGtU4b8
	4IHwF8aMuKwYLg2RN41ApFgiNsTtJ8h1DJeehHEemU6DMy5r8/3m9pyXYwfBIV70c1vZGuQMDFW
	KAYK0r3x8sg3MKuOygpZ7oSghCYi3lScKoWWhJRFSZY6GDc2aT4BlTGfmbHz/iJ9lsQ==
X-Gm-Gg: AR+sD10Q9zeCxdolfWeVQjSU4FEqVOqsmH1thUI/UVf+Iw60eQNUW2b7EytXc6ISDeF
	P0vZwIolBSIXbBxt2jr9iP+cI1quWfVolqI6BnHEeordb6C7pW+rqoYvsrN9Rn7PDkyXRHqmA3C
	5hYkNlw6nabz9uFXGrCvNAIILnqM0zKWkLEBLO5ssF51sDggiPy94irjWN49erfIwfng8iXKRrx
	YHB/PUOg0SA107q0Yk6AfHVeR4EtVHLsMFPYx8jUAvFeawNYHOrpmVUgtZ21MEi0wufy0i4Cf4w
	HYwGuLsQFYDRayk6YPpVY112M1+XgiK7Q2/QrYPGA4QVMn0CjOsvWQQO76JqBDwsDgRyyTm+wET
	fO/XkaNJY3aD1i+K72Djq1xHQ9VCPM6f1liVlqEZbivSDu6mBa/AiDLLs+ertNmOxxvslyBfoFM
	yK3WNDO6+J62yJ0g==
X-Received: by 2002:a05:622a:5909:b0:51a:1a44:101f with SMTP id d75a77b69052e-52b384a6678mr34046241cf.21.1785424857151;
        Thu, 30 Jul 2026 08:20:57 -0700 (PDT)
X-Received: by 2002:a05:622a:5909:b0:51a:1a44:101f with SMTP id d75a77b69052e-52b384a6678mr34045841cf.21.1785424856722;
        Thu, 30 Jul 2026 08:20:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:20:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:45 +0300
Subject: [PATCH v8 02/18] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-2-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
In-Reply-To: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vQzylVT+Qd6EO4bMsxm61SXivn49cya+liA
 Byv5vproTmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0AAKCRCLPIo+Aiko
 1WuACACNV7N2U75kQlThKqtfGC9WfxqLakJVFUt9H+sldp5IljUpopQY1J4vV0Ec+b7SKQYm55q
 dcJEOMCiF+FGYbDLoaf1CG7h7wwdVnpdh5g0Bx89IVqadCLY991JUsm/1L4KxZo2uBdC4QC0Xw4
 B8Yy+9SLIWTUZVECqD7gYryRzmf/EDYmBRBzkvv5p5ahd5itehzePExbA89JPipIiF707goRGx2
 QV5OGSntqFR2Vz6O4Tfb6J2ZmP7L486NvI74De4/YqbiIjYt6stZW1pT9jixQOGVXXxTwWvqaCn
 1mhz4OBVqWel6w1G94zIzXvZCKtZSfsEiUfnT7KEZ2VT8JRV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX/4+DSiw3ZSK6
 VfLvrTMUNwTzhD8cehB+fbyPFBmIaNEHN+LrNv+z0yxIiQ/XBUueKqBz2tzkXBpAIYyHNwRftR0
 RK80FSdGrNxo0A++s1jw/ZCnCOsWVNK9KqDEpjNQs0mR4f+tJhUUd/LDEamREB5rXa04ds656Vh
 G4TRzBiRHQB77msqTizV/HBUwfMJrnYbPfuy64ipeV9qsexwVVNh+A8RATUV0GteM/IBICiFOgY
 rhOK02gcWaJwGXJE4QRXaFiUMtAGKuhptw1RhElwwji1tEeMkfMTIP2DXnhqdM3eHZjpyJ5osdu
 6Xv4cc7VaiSvT57diXNmejwlPGpqrDRYiTU7bVVh/Nxc24MPGp3ark+J3oIjWKAFom12ohyy8cw
 c6MlF01U7L+5TGZpbcYf5cDvWgIZaq3Mmggays/nG0+qbjbSGT5vm1M0fH9qT/FOFkNgl4cY9ep
 IC3WO1PwC7pOEGHez5g==
X-Proofpoint-GUID: 0hRV7QzBSCJwJHlXLr-OUeTgN3nS5zPn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX1mYlp0F4KYdb
 XJAT8L+D+cRXjav+HaSDmgfTP7caJhMS9ioPV/TFmNafRZwvmXEf2ZUc4/NoQYi06cvRoVXHZwt
 samyXMnqwffTsy04np2r5nOM8I7kdkc=
X-Proofpoint-ORIG-GUID: 0hRV7QzBSCJwJHlXLr-OUeTgN3nS5zPn
X-Authority-Analysis: v=2.4 cv=WuQb99fv c=1 sm=1 tr=0 ts=6a6b6bd9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3

