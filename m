Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2410D364952
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640078; cv=none; b=NuqDjYSaGIpHD/c/x3uPfqHQoTZZHNynRvoTNFjPXz+Ia6qCPkyyoaS9C6yawgeFRPbNOA4I+a9YoYNhSNJ998b/fuAr34/8TM4zgbI7sNCPhXQWApWoJKvhqjnsN29xLIUdQxdBQHkja6YaTwsEHWwlZQhPntlcq0s0/WLMnSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640078; c=relaxed/simple;
	bh=0HO97leHp75Uk5lDK7e236r3uBIsuf5TqmqiuNpXoPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ce86ah1CNlusqZDDFi/UFkYdqzR2m/wGHEn4xHU9EQ92e9HX3Qevvp4ahPVCX6HSXuL9rtUo9hPRmb1HF0PMAWJQjmwNsiNUE5SCD82r7FZjBeuVcX9yfj7WGLY1N6ZDbQxqMSqn1dziNffRIgbapCfLVueN9R4MbpPYfUOUAxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6Kn+zQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBJ7GrEb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6Kn+zQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBJ7GrEb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAQquY1611726
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	En8rHhEFa2AQPtYmloWakD56oM4Ac1MosqTfK028sLE=; b=E6Kn+zQew6xbmfVS
	dnmqx3lXbUHKIamYHIqpOEaBzvTQKXd6YusVtQT0PFSNOW8twJ1lE3rW78t8VZ6A
	j4kbOsLqLpwwBPlTDJ+Kh/BkOQSRBEzM6baYa+oWh4nIb5Wugr4hnROdiO9P2SMc
	KERCBtmjJ1YthzP0ydGw1lJsISOsYIQpiHqimN2AVeNsUm6j8U7Qpw/0rxmnx7fc
	tVT9Fk0Pmj4OW5j7q1s23S0fz7U/obEh9OnnayyFDMo8KQGKXbFuMte7HOUQ84YH
	iauaKkWNGmXKJHLBIkgV53NFuL/e3hSvW77219VT7ts4sXHmYjEEaSjCvK2w/kej
	tWfQRQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3gvuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 13:21:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso11604041cf.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 06:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640075; x=1785244875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=En8rHhEFa2AQPtYmloWakD56oM4Ac1MosqTfK028sLE=;
        b=MBJ7GrEbXWK1WZslDhM/6B4w9h7HUziYhvp/xELYQpt5LSyO2BBjLQ0O2+x1W9wDXA
         UP8FAM/yRAvqXOvjXxvf7CFuy2YXcB7tm793Ti/S7JQ+BBfEE8H7PLFlglVHCEFhnFAZ
         tja5q2T2C9nae3ACrUpoiPFbmKefjGTNysR4rUjosCI8uWYZvP9N1IBNRA2JIus0u8o5
         PaNQKXy+WOUwFlrIHwJhuXJqnsW+tdjtPRKWfptNY6WdydVBzZpLHU7ilgzVru5Xxof5
         5zZ51r92B1xdIwwHzuqosi4Qvoi118L/HFBz9/EazpswfOMrkSko1DnbIg6TBCTl8OaK
         ojmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640075; x=1785244875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=En8rHhEFa2AQPtYmloWakD56oM4Ac1MosqTfK028sLE=;
        b=HVhUVI7BtO1EP4/6ewFt1x1FxFjcCrgTQgn7ue/UUKI+GtGgP3QC9GnSDx7rE4Zevf
         XkCaPWVy2mnZMQz6j/4ukrDaC3Oux1mJPnoLo0Ms4e5GA99y+n5YXhqAgl2mOFiFS/0c
         fZ1Xa/JTasaRN6xa9YXWtuSxQp0ynN+Oqvz05mXUt8SZye3K8TZMzOzsGct6RV+be4NU
         Q+YdFtVDYBLcUQVrfbrcPkFWqbG8rYzvwGuE+g53UZyzickFHl3Y/K578Zbwl1LHLjnR
         uak8VIiV1mIYQuPummpppofYUCsw+A2V7J7yOTJzEXyqUg8iLWJwYnEOGU25BQmf60aR
         4Cgg==
X-Gm-Message-State: AOJu0YwgieeNWI0nNAe9bSg6ZCr/sBcx0WYXgc+mlUux8Z3cZS/1/RTe
	7X8GssDnJyRIhJH42TcHYcFyvmibaxhveNaY9/eS9JR++rhk2MxHmWFTB3JPaz+GwCAqtmsFGyf
	QtxpsFRKVSRRNSYPil2cFJNp1WNYwO9WwjxstYRRryAOkZRMMaK0Tah5uBBscQIYTBQ==
X-Gm-Gg: AfdE7cnXz4LPyxtnVuUTNkUTfvqcqSw5NbUI3FtpLZa5kFFkg9DpadIr4PzEJaZK8Ki
	1g0L/Ib0/K57bPFKAJ+6OiLpIjd9R41D7UIKgzU+bn4n/Kh/g8OUWM5ricUfvqCbEl4YexW7/P6
	TdS4O4RxygsajqlvhufJZO5qAwzKFs1E2rab1VhdH5BfpoFgPB8J5HDK2sh6xzS8Ghj5lQPpOyO
	hNxiRaotTojc2FMPxEYxRfE8Pwq5fCAhRPQJ0gQZNzrw7teOmT/BGGHuk9XtpdHPx+nBReNgv+l
	Z0CxYsy4QAOz7hLTfUZXa+7mTB9HvNFnd565CR27TesSpU3/VvJSX3oeemUcWP2yWFTFiTKEedo
	rq3hMz+wqs3tPd2r6fsiQpwubUmjBJm5lDebvlxeGMBc8tD7vUcsrbQOpj0cHk5BTWb8LfG0TkY
	A93TYt8XMyv88VsGJ4JMnk/2o8uTC7NpiPBHSVchYGtUrzlQoyknc=
X-Received: by 2002:a05:622a:aa83:20b0:526:f9e1:9e4a with SMTP id d75a77b69052e-526f9e1a225mr8883891cf.48.1784640074792;
        Tue, 21 Jul 2026 06:21:14 -0700 (PDT)
X-Received: by 2002:a05:622a:aa83:20b0:526:f9e1:9e4a with SMTP id d75a77b69052e-526f9e1a225mr8883681cf.48.1784640074384;
        Tue, 21 Jul 2026 06:21:14 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm598326066b.34.2026.07.21.06.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:21:13 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:21:09 +0200
Subject: [PATCH v2 2/4] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-camss-version-v2-2-b2440d99085a@oss.qualcomm.com>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
In-Reply-To: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX9zSGt+96h43l
 tAfObei5DddiM9m0tWaGwXor04CkaWS4SectxgmrvKSAEZ/Sy4057b8QAjQLgpm58TzdCg8Hck8
 r6CZtB+LmXz8SDgdN1wAf07GtXqg4gp9Z7FQiBGPzs42tRrER8LKPx02YA39sfxailnzuDf5Npy
 75RNvp9PzXSoXzMJEXf06oPYlywqYJvsER40vTp5ZbfVVKfHlRcjZCE3I01W7pJFW0jY+wbxK5Z
 V6KL8TRGCCGtWponVjWDmQLabyz10hXr2/diRkytKWeHB8ht1cuNnXLlkvo3bjLDhTKILFLGmkN
 Bj7GX3uJQslZJnM7A6FXCbtSz59f2m6miBbZMIlVxkLJNdM2J9WpzF1Ms5nhMVgKA8fTl9U3LzS
 SzNYIQ6N8Pa/waS/p3Gz+dEkgM5NKKuqTQwENUnajPPFJH8CpVTtPteZZOmE9diuthWX8xqsQw3
 0KPMS+NaeojduyvuKbQ==
X-Proofpoint-ORIG-GUID: h4RBFRHOYFfhb7V25kmEz4F7ilSbS5ML
X-Proofpoint-GUID: h4RBFRHOYFfhb7V25kmEz4F7ilSbS5ML
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfXy2dDrEJzIaSe
 G9DtP9uSLvOGbe+vssUGWS7dKfskD5gUgu5R3KXAMst9v0nf09mXBf+kW4T8yWSIhSFNq1AG2rK
 9+waBjN7B6dnPkKxTTs8OPc9nceST2w=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f724c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=6k50daf3fveMbYCwvhsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210141

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb, ahb and axi clocks so they can be
managed automatically through the PM clock framework (they are part
of the camss-top group).

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 01a9d4f780fbe130554601481bed50eac5978bed..a87161f3d5524a6e40a7281e28787538613dd9cd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5591,6 +5591,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { "top_ahb", "ahb", "axi" },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1

