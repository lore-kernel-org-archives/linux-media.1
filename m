Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7CC450408
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424894; cv=none; b=m3OssxWz/13L7PAMsG15k1JTIUK9x/HfznLLfNugYK9DLSjHXxdPVSqxGjAfl1ygT2m79JEVNqO9S3cIFKWEpULls3TReijJ5dn9iVww8K74Ywr/M5P0C9crEewZkyBIvJNQTzPfTNoWlzq2R5ACLn/oqx+A4WVOnyDZzEDM6FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424894; c=relaxed/simple;
	bh=iLrkaUGF2kv7EppzouCmtz7uCkkhgBRWggynLlAnH5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jrh1G4iAlZKH5/ceC7g87xjD/cUjfgXlG0BNEWEdThpNnYrFQ/eTse5oWE1CVS2JW2bKsJaYh4nsHLb3vz9AXQELyJnvJ/0iCTTzT2HdHLL4oIRgcWDhyjPQQB+h9PFHUj65Q3FzqaDLURnYYX2bwf6/1p6rjZjFUbnw9v64JOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dlbO5hgg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FL4EMX8X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dlbO5hgg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FL4EMX8X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEfgwB1117920
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+lonAlJlcriw3pD+O9BnHyN+0SzW0bawUl95sO1Qeg=; b=dlbO5hggWbiT/zlU
	OJNSkpOpBuiO12wTMs/KXDZtL3eRgGUmvE2zz6Ktk7g82ex0JKRvUu63Z9OLx/l1
	9a4tZeNbOsoC6oi8hVefcKlR0dV7M1191K9e18kiqgux24lsRTxYyAiPSRfT3kpr
	b05KG6ZkxbZmPrNEnSNd6yLpLrcRslk3qgdVOqo/8xdONxuvysHbk1aSFtd6djSV
	85Kxa6WHix9fpF6mdyjQzqcdh0mg/uw2wxajMZiNZw7h1fhyAx7PSVZUs08vpMEn
	yIQSqzrxlToa90pREEK2YgOPi5csq0SWWRSGvsb6ohOngMcec5iFLZ+IRzC79Xps
	Zji0Kw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8kn07pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso23393821cf.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424890; x=1786029690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+lonAlJlcriw3pD+O9BnHyN+0SzW0bawUl95sO1Qeg=;
        b=FL4EMX8XHhsr595CBn5rDYaAepzkGJm6rOHbl/7NDVFJZa+l4yOAXNnhpIEFx8bPlt
         H1mBoXSJ28vT2qDE0hwovZ+t6lq7wSDpdlMKlBE1AbECdgaOZC2nUrPFoE7XhP+ad+I0
         7628kGOymqHZm2UHhEhYlQUzKcLEOXsKgaW+YAvwpjJzUTtoX7j0QL9KcFz6t0dR/NNf
         pIorLfUUQnYCCRbxS1MM1I60aPjYsFHsFxEC7eljQfggf2rY8x+P1xs5FxgUgCjgDAld
         8F9UnYRy4GCI9PbBiLYw2aFhziWz8B0BbXYxVj6XWTspE5yY+3XbhOk1n9/sefWqT/lp
         19Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424890; x=1786029690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+lonAlJlcriw3pD+O9BnHyN+0SzW0bawUl95sO1Qeg=;
        b=di3Wt/9acBejHV1N4lY7CY79NGg0GYisigxTjX+sP+yO+Pl88W6R+PNUL+G2+ufHyv
         XnsNObUSMzhsRjzdQ4tUHrGXIRR0uTrDHYJOzJF64krgyU8VIQ1SR7US2OjGyz7qj1K0
         l7fo468bWj7kShwo/9HThbDjhscBYdk+f5pz9IbYl2MQN7jQw2JvyPUeYo/FZuKU4/J4
         qCJ6zaVpKx1ju9jNhPGEbCGR67iwmtcC2/IJH/zJWZt9ct+a/6o6NE2wfG5qdoiyR+TC
         u8bpsjvjy/Cbkv8IO06qP1hDU7hiK1vC1czz25laPHaGzVmExxmse+pFWtTBEbYaMBOP
         +o5g==
X-Gm-Message-State: AOJu0Yw4Q5GORa0j8Z9OSpAL0x8+rbnnn3Mxie7q1O2Q0E91h8eQWbep
	gL/wRR9mVEVIa8FVaQpt4bEIIiYkne8t/0rb9xNc9MLYt59Wrb/QFhemR4gvpsnsCavGYrsAaXv
	dVJ9UU5jBX7Uu29yjrXUmt96jufeiZp6V1+bwVq9EpiHHVQP7sFj2mE61LPw0V0NFORikLnvBaA
	==
X-Gm-Gg: AR+sD13YNDycp7+h9ANacS/wz6OHVkuw5X661eAzA2I8ZOEieLByCiC1H5l4vKb5L4C
	BYgEkqeen5VPg02rCxk7+WKYZzHEOUvCAIa/N5s9Hm4xu8nkRUdC0WZvTH6oMjJNT6RbLCInBCK
	WDmBo+GaiLwADpMliUE8bPat7bFLp/6qeD80eIfWoNq6YRYCHrybcShvpuo1d2MMVCeDNWLi46k
	uj5xesy0HkGa2x2lzShaMUeaGMufYqo1GjnDee6jlQCwnRBcr3JgBT7HFUq6zlaAymop6c9Lh+w
	SXN1/sDhswSjFOvS2rX8QD4zbahXYMnpPdHbZ3DEIrnKDjcgx9lF9LEPCVMgog6fVPfYIlN3868
	tcZf4VeYbAWppG/Cwae2tY5xFVOFcEu2JntJsAr/0u4H5QBAHfv7taGQQBL1VFJJnGCki9IUw1U
	Kc3NUmljJYWEuKog==
X-Received: by 2002:a05:622a:2515:b0:51c:7b12:1205 with SMTP id d75a77b69052e-52b386e3c79mr33732501cf.83.1785424890101;
        Thu, 30 Jul 2026 08:21:30 -0700 (PDT)
X-Received: by 2002:a05:622a:2515:b0:51c:7b12:1205 with SMTP id d75a77b69052e-52b386e3c79mr33731911cf.83.1785424889452;
        Thu, 30 Jul 2026 08:21:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:21:01 +0300
Subject: [PATCH v8 18/18] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-18-6597c08cea6f@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iLrkaUGF2kv7EppzouCmtz7uCkkhgBRWggynLlAnH5g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vTsUV7LmuZ9E8hql5wplfmmY9zUwu3DXEqk
 F1jk3qLfLOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0wAKCRCLPIo+Aiko
 1YxyCACT4GSTZ5bsenhLNyp/AwiBJygtjvM1fuJGGmeK9A2MKDAFzGDGDjgr0PSMcOAB/rgjO1O
 k67A7zycCOnadRq0ivHPM/AhgyPWZgvza3xe7j+Sjxqt8e0I68vF7g7xY3DDJf5SA61LGUM6o3Z
 V5RI+AeObhnBHzssJLIxR5JUl52QhPnobb7d7ZQ5GCyyCt5moFRGSwbCXL7vf4TTknEYYszYpTF
 WWRCs5SKN0T874nb7UBWc8RCmTlneBUXljWb78jF3y8MFMW+OH1zqvsLL8yZeMdr+hY/0tMq8sn
 d7hQ4xJHlKy4pyLnkdbyozhhVenlk+grBk06FT5spHD5a0ie
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX65XBaHkUnLrG
 rURMYdMWV75yscXG4pu8bM+0+VqchvmvQ3bru09HF4NR9GnBHL1+2zeHO1RYFNaYi1tZZmqJMTY
 AQ18L7yMavNuz76pIk78e5GWzisFjd0=
X-Proofpoint-GUID: aSWD5uqS8AtmfzSvpQxyDfy4PP9itpi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX48HvFxYhWxQM
 AWd74z4r8zXds8Dan1P4Z5CEDenOAhAFCEg94fhe1yv6TFOA+ZaZFptKdfmRk9JiuLgPwKr0atk
 JirugshK6mVLOV44da74Mp/qWdrWyxEL9V+11P2qhW4IUh5GUS8jUGOryaPiZaCt2GFbfOguOco
 4NsLUa+jyjIvED+YcSC25EE9OvyFjx23wg4ZRywDT7rPkJNf8Nmhx48HEjmXcD8PIyOs35FPrwB
 MZa0EvY3goho33o5OJo/+/0MIwZG9R04AZcpyZbWAFQXLLCb/PqhZQ7NEn/x6dtHTwBK1FuNfgb
 XpZmsViIFtlLSmFhA0ImLauC+hlW/pLa6vfur8ExUo3ZgJFUjmVAaZ7lexP405wlJEp60hhHC3i
 /lFqIzWHpdxyOuGlvIDCegvkIBrtvECr9Bb53eMBrP68S0Ei7HLRpuy777+SlP15OjwijDS3Chd
 KZFy0FOW4epQ6JgxnSQ==
X-Authority-Analysis: v=2.4 cv=V7NNF+ni c=1 sm=1 tr=0 ts=6a6b6bfa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: aSWD5uqS8AtmfzSvpQxyDfy4PP9itpi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 020f55092737..b7b1b852d45a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3

