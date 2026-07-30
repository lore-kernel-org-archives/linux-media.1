Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088F847884D
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455659; cv=none; b=qGt7niCPE5b30Zq6PBGDEhotjLR+18mneOEJeQzyUMXBhhGnfoXZTFFAzekgpJnElKqeBDVN7/9B8phvWFEFsl7W3H9rDv2r6vlkZQvZGDQ0jlDKRRL/Qvx53hE0UAgSIAT0J1NeVWEFQPiqGicJicD8KwNDZS1e+B3/dprJ/XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455659; c=relaxed/simple;
	bh=7KJFUkK3IqBdyfiDVBbWS5wZfeNsRT8SMeMXT0iYUtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwBLrf4eIj7QfctOVq0yFmtr9WJ86s68w7Ic83v3MCLDEWObpl7hb0EOBMI+HJKBrYFAgDxN31uOsYaRz1hWREiBTZHC9+mGSaQQCBTU9tfDghgcnmrx59bXFQvOJfVgYdUqJMsiKC5eUPke1koZQiK7A4FU/nXty/uMZ5Euswo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xy19ILGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGfKmXLD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xy19ILGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGfKmXLD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UNId1k1759581
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=; b=Xy19ILGbmq5vULms
	UWzcO9c5tmnbvYCdFRb0cZ7zDz2Y5XPO/RAbIZzD1PkL98jilXxayFQdtaoR0uwU
	DLF8cvdqYVmnZtVgefrkP5IzdgWiRyMW/5lMFPjYJf/pdV/s/6aUg8AYQ4skpanv
	OC1dNCJ+H2RYN+J/FnwiJ3p4QKEEOljMy9H7ykx/Lwe1gr70uH2CNNKnvN4dfajj
	Y1jdgbkkFdR/y7AWOvjYqwD6a24MTjKxtU3OgpDLK9svQ3+L0uJ0x0RlvhMvnRlf
	dwcTJBngZJ8q+5eSTe/kQxi+jyvJEq/W+JMB19L20PH4DHwG10+KqXMNKc3FzGVo
	8Pksig==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frg5v8317-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:54:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-907ca5abf1bso3602076d6.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455656; x=1786060456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=;
        b=LGfKmXLD8xYdJNtphJXUoyAM4R6YNouRKYygpjeDk8TdjPSHAGT9o5i9bAmkqW8/kv
         Kz+qFKQz4XVVthI6x1ytpL0jULbAavjdEiZy0ub2Z9cEqZ9aCZlxIcA6Jd5HQRRk09dR
         kpvUdyu6HtwIZkJVyJDZw95ScRTovEKQdfZ+O/c3Rb9CiQrEaGJbtxScFlP1TzpQxdc+
         QGUUS/KwCye+AAdemn6Ghb+a4941adOjVUsfPt4P2itOUizIaOjN+88B2wROhS/WMPMk
         aZo9CYo9nNUYxAYpBphBL+sdE+FMTjEc2EfT3o+orhssnpahKT0U9dJ6+gbEnDlFS35I
         IiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455656; x=1786060456;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=;
        b=OwjR1ojTkEV8Nbh1boEHdKpUkUi6MRE5BrXOZcAx+rjkfiXY5odfUUKqNFzJKZiB/N
         1pu7QhojrbHV343A00kMCIRxmoAnvx2nPhRhdvbzB6ONn0yr8v+BZXSd4Alkidu1aaFk
         Pk9ZXciappPv+1sKT3eh2sZU3fEMLWAqaPQI+k4HmRu8JIN1eBB1NbOp/y2WL/AYvfjO
         8yhCM7pReuIo4EVOA6z4KVRtCKD+cVKB6ycLwx9UsbLTnnN+2c6XHMR1oi7n0fd3dp/x
         JW0T+lvx2Fpa3NiHEMEVAPm/vJjZ+DaG/g8o4lO4jnLSEDbqf8RXVivFtxuc+o4p8fvX
         IDRQ==
X-Gm-Message-State: AOJu0Yzr4DfnfbH2P/PIEFp5uRZeQpoO3Cvzgxr9CViMTXQYyrt27UwR
	4iZGPh7z1+EWmzTsgyjiOwWuen8zVvWOqt3mMZCSnASIE3u135qbxyLVwt1L+hfSYj1ykwEybHP
	B/McGxOicnKyCyljAWxA7dXtUtQKDbqAGOtcO8g0SK2PRoy5Y77pJTng1MEhjSbCcVg==
X-Gm-Gg: AR+sD11/BBvnDhzitlBHmYSle3vOQMcADVcXmnvEaUP9ElxsZWoyCHfXDfZBrGYkglk
	IerWJNtRfsjCyUlSIjoUyCKsfLk1yuc6mab+4icyjpA7tkZ3wF8dRs4ASbpEOLYwiQI01PvGVVI
	YNJPfd1JGY4aj51jCZ2+cUV8Jro+pEBj3c7tq0oRKJRb7d36uPgn6HDpeklo8tw43P95Q0IVOjp
	5t/w6SLMIAYWr1pMKddjl9a0hXtbgokHBFGLLOuHMquruWdINSRcT6za12eUvOhqvIgLM0CqVxp
	pCq1JxTM5JDRJnWSlMABM1UhmWvLKvi3mesbgW5bZGg0CjIXGWvEWNF5m0plTMQ0O+gtp2qkkb0
	kieeMu5OBV/56UeCUEmyYvidy7f4c5Dhp1Zfw50oEntuBmQ9736X/gDFcuLxkx48MUl4TGB3Der
	nmAl3qTfsNllmHTA==
X-Received: by 2002:a05:622a:15ce:b0:51a:f94e:ce51 with SMTP id d75a77b69052e-52b3867151emr49785401cf.50.1785455656054;
        Thu, 30 Jul 2026 16:54:16 -0700 (PDT)
X-Received: by 2002:a05:622a:15ce:b0:51a:f94e:ce51 with SMTP id d75a77b69052e-52b3867151emr49785091cf.50.1785455655609;
        Thu, 30 Jul 2026 16:54:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba855sm638689e87.49.2026.07.30.16.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:54:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 19/19] media: iris: constify inst_fw_cap_sm8250_dec
Date: Fri, 31 Jul 2026 02:54:03 +0300
Message-ID: <20260731-iris-ar50lt-v9-19-d71a782001c0@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id; bh=7KJFUkK3IqBdyfiDVBbWS5wZfeNsRT8SMeMXT0iYUtM=; b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+MuBlOl9n82gSaw7A5rRdOg6s6vZ0ThhgoXn cqdC/I4hNGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvjLgAKCRCLPIo+Aiko 1ZoDB/9shlctZEAYdOX7hh+LN1GFLylH8KEUBi5W88HbJCx91E/hyD3qZ0cn3RKpwC1SY2mXwZ3 Q/bFxzhMnQSUhcvGiX/0mJLago8Otc5iSd+p/Who4GxI2xLO9MJlr4mXtHk18hU2C626XvTMjx5 eu75KSeJZ+N/dPELa2oCC4nkh797nyEUWtwiiXWVfHWw2hUcRLkMOIWU+BGdumMK7Kaoac/+Ok+ qvu5O8FW+HVL1ZWmyZ1PGAt3LLoe2eGq1JVr39aEkohs5loALT0WHq87OPqYwj7Azq6KktBJTzN ED5Cz905F34YLSevy95JOQAySfi44oKDx1yExF/oDP59LoBv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp; fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fhJxtUxQMb2epxAlmu4ShY4Uae1CbiJY
X-Proofpoint-GUID: fhJxtUxQMb2epxAlmu4ShY4Uae1CbiJY
X-Authority-Analysis: v=2.4 cv=JsbBas4C c=1 sm=1 tr=0 ts=6a6be429 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX3mlMOvxepQ6y
 O81hC/4We1YdAFmQUVi+E5R8EIT7BdU9bvR6yTXIRTafgr9pSDQRfvXlRGb67QVxCjebWkAEcwM
 97yG/o4cterd66Ky0IzAJGHLcvk3rS9VtfblZzAieZ6r5aRebpjoMpyr6rdL8eyBTDWbntjO6IS
 f+HoFekiZD6L+v0tWqfQnBj+KDkpqMdOXNauVPRPOLH6Ifly7UaCtKXtNHqoyCpJslzEm5lGyk/
 oXYfOih5Z5MAWLpbJEBcWt0KdLHQXrSr1hvH5hDrrLIKVJPhTbfh4FFhLaxIksmOA36xCBmcOG9
 aNteeh1Ji16eAYyzzuxYZFnAToqK+VKd3uKjiXOieciy94zzC8x4JR8U9N6GBPmokXYUU6b6PYT
 I08ThTHDPorIjhIc0fBSZZaajKnW3d5eq2HxEQCG36ggvub8d8P8ESB5n9sqT3MdY3GxLz6eDC1
 6NtyNBdXK8gjYqE3fXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX8qUCnFp6AFhN
 HDMOT8oA8S5REuw4yTekpG/r81uHNdPjyyNafXIDzSsT7XVsVhuTpY63OzVzhW/00K345Nqzq85
 /7NQek/omUcwmj+YX/oVGwx75Rb3Q4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300168

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 548609315b85..1f87cef986ef 100644
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

