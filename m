Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C574499BE
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424879; cv=none; b=euhFEDGE0DBwQSwvLwX42DY73KVFKXa0Xmbt56kb/B1Lb5c/u+cu+0Mp+y6W7THmlx3hfVXtxhcq1CkixS/izqosE/2+5ZHRKb/Gqvuns6V3yKPQNoesoNxK88WtZh78yTfYijPlW01IczNtppBYaEOa9UD6jJ3UD8M4MD6/9Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424879; c=relaxed/simple;
	bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ck6YhoDv1Itidcgl1vIQn08+npYtuFzApka00a1vOEkpNcnqgh1Zi/XK3T9rjEjtnqcN2e3efnMzopT2rtrtAhITdB/WvhnSMnA9z6d54ZCAfa13urCsfYOMOqeF79AMT7PFFkJG3LV/kActmwNo+GkarqXNuIZlube+ayMOvaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctd7Eb1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4rH9hak; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctd7Eb1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4rH9hak"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEiWTJ986919
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=; b=ctd7Eb1oacjC6giL
	puZyeltJi2/2PE1d2MFvWPlkBbaB1h6eyPtkGVZZhWxViqis4raGUE+1UaaDhumI
	cxoM17fzGzeIGwblaeTNUGQphmcPOxmMQ4MlxmkGajqn6C4uSvLNxbYdIa8bf3yH
	W/zGImq/h/kXOhsfO4Y2yxqhXP2E5YVU3jJRjDeOyuc1gBajLa9F13EB/DkeyFtx
	jTAVNFpvOeeOUnU4GnuagZG9jceld9yyXUwlZZr8kA5S8FbgtyqxNhWYNwVSJuO3
	wPP9m4Ppc2k6o1ZA8lfPWtkypTpdsAbrnDjyPleJBY4hnv2IOWwX577SIKZtlJow
	Jpm4xg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n386es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so87381885a.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424876; x=1786029676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=W4rH9hak6I1geJ8l9CJUczWXwM4rtQTqf2RAje+lj7YrnL0/4vJYBdokFZBmkvlCud
         eYtZidsvfRnOnvuctXcBvyFcbCkaMzxK2AUIXgGmpYwZdNfJWqyX/8lLFMvlstA7eaWO
         kSrDb0pAODOM18inNuOYQjjev762vLIFwVMcl9MFHgIShpL2C9vnEEAHNSH+7ga9yKwk
         5GWqsRlXEwEXWMpP86s/7S68aAa9pzHsyc9hjIPdjzm57KtS+3iru46RL16B/aBqRfyT
         9ztpcT/DGm7pFYwyk0JeosIMuK/VZonAHm8B+QuTr1lEMTLmRhZ9ItK6jINM58J9+ZQ8
         4ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424876; x=1786029676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0gyuvkccvtpcfH79fJjPBeyRgK2qdZ/uoYlWvMd7TM=;
        b=dDRZOtzC4j7VkQD9+GVu6NpdA2AjTunqaPQhnvYQCcDiXI1DAqURyFBd2pObvOnyp4
         lkuSu7+71jr6kdKOb6r52/IvNW/iHLaz4wDULOhPHiMB90ejnwz6a5BgT9FTKei4WveV
         L0WzuNTt7kp7uNZAXHp+UZ+kJZRfaGZ6+6tpellBRsnlLC8kRYe8bLfHr4/h2ljly81q
         9ZH0qeAVDYI9vD2BpfU5UaFwDtlVaPOCdQm0l4tHgGMs+rfuCE2KXtP8Blhy+efn0PaG
         yvGGKB0gxDla0wJr9nx2eTHQKWehgudlhqI2GQwVle4kjmoSxBq5t2iIT5568Me7FOjU
         YYSA==
X-Gm-Message-State: AOJu0YxJ4UcXC3Jq+ytOjqnMaG3PKrdoDFt5+qU1Y/lZ1GjgoUkQVrux
	z8ed+GbksZE6nTF3yue9MCKvJZypBiUUctN6Tb9i0sRdiVA5oDW0ZO1+zV5Kx+6Odr8pCXs7o2X
	qFzW6YbMhnX4FXuffRCSQjATBRRib53wmSvt5Cc+D01tgLRNLqA8cmZGshU71rAPLog==
X-Gm-Gg: AR+sD12XAtczfRgNlbundqTxZW0KtXYQOyaSHyqD4psMu3OdCeVZqyM75wjG5Xoc2GR
	QlEyiVRVfYwqLGhtcKaQLRwNyRZkangswBXonOPjdhNYuEZ6Uk8np8yZCOngH086aFjvFmaa6kS
	XaRhF3vXfFtfYjDYzvfdlovq+UIiCmd4T4aTkBfp2h1mReJrBHz1gRKCqHbwov++aXH5dTQAPDq
	UGx+5QAfNCagaA7uOf3zXzTnU2YjZ7qcw70FIZTxMorZ4Rc7QeqKwFPQIdEMT4KgVhOt/tOwyMd
	DNuYuOQG3ZgEQ+5WNm6sfaPmzaPZG9qpXeIXZVKsiJ4/1vsemK6lB/12vFb6GkqOtuGYZkdH9xU
	wsl6PBO5jSOqNWXlYPJs2Ht3vTKJOMmIiKQ/QEjJHL3yIhwqS+7+MkC/+UF9oIXyCFEm1UWnIaT
	d1aiYV8zPhHMbF8Q==
X-Received: by 2002:a05:622a:2483:b0:516:82e2:7788 with SMTP id d75a77b69052e-52b42483fbamr9160181cf.1.1785424875542;
        Thu, 30 Jul 2026 08:21:15 -0700 (PDT)
X-Received: by 2002:a05:622a:2483:b0:516:82e2:7788 with SMTP id d75a77b69052e-52b42483fbamr9159621cf.1.1785424874909;
        Thu, 30 Jul 2026 08:21:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:53 +0300
Subject: [PATCH v8 10/18] media: iris: skip PIPE if it is not supported by
 the platform
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-10-6597c08cea6f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sUPB9VJRkRZ4see9KcmUKrC+0hNnHbRSIZoFexQREuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vRCaFTWcCPMtYKlTeB3UR7kQbWr7BUX2t/c
 VRrmRA7EwCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0QAKCRCLPIo+Aiko
 1R8kCAClF7F/iYb87pNMUpWAN219pTqfwOqkReQ/sAGMtS7PLfNLhwW9iga9zwxkRojId6cLNxM
 AkG/KZDG5IpzParX7Myz64Gh5rHn7oStk7DVgD25vZ/pGyWevUus2zqPWaFqxphycnbevL6S30G
 X34pY+mChknZWP9X5Vnu2AOeSmTRIU4ZT7wSJ9tNduNZiYaHbK4TMY11kejsmel6XUfcjMJGlLi
 QPUNP+/qy7pnWVPC2HrKntGpEwvmcCBlh2I+BBcRy9cNW3brPPkcRAdxb1QpfuN5ACp5rk10skU
 hHzh3CDmV0C5mL83prT2b+yO/Y6ELuyesrwGLBUSjZhavkKL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b6bec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=9TuWGWrZIemhly9L:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DRvvl89rPFtLv9ObwM0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: hq6cbzYVOwwx_zeoouZPc4wHcjAFQch-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX9tGANokyM29A
 kyBt8FV63FZAETJApl1FAPYJRBa9Zum2mglsmOJI65snyqsUJekVlcow8jkMi3kSalVtxLzsM2U
 clHMPXyLf+yi+aGuT1vewWLxBvogsLn7S4sCcKG9wLMrJERPM4wgOZFvjQgMN+OqZ/CcXEBMzK7
 Pl4r4aZ6kcT4LgT/OPYckLXDde+BLPy10DQtnfUn+7wHzeBxgk7JwjTicdYb6gd3CTJdCfJsAiW
 NtI4CjOn3MrJ4/5s1xw33fdz46LGwDr0G94DZbFK3Bupos7nsYPin+p8hcC5rCY4/NgXY83hOaD
 /lrtkP8aHOHbll0gYNjcjzD7tmCx/uOGSpfjr5tVA01vbqxUZTw/NxJAeyqJHFhkoU8cz8yiELB
 P6otbUcCJ3RZka7AUUTXdRDhJNgXtuIWH8tKWu+zwhxqH/9u0MON/KD9nCDfTF8lvCnWP6Ia15D
 yMBN4G8wmub74BmFZNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX8pwWxcptglEw
 ikd/MN7DQiGzq4pA61mpOsb1ZlcWLHSBjFUZicEsWyxN5w8Z/peQbzw+rCGs6oXjDuhTfRPVv7g
 5qdZBOhL/iOcrNn1sPpwI7vM6bay6kE=
X-Proofpoint-ORIG-GUID: hq6cbzYVOwwx_zeoouZPc4wHcjAFQch-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33a34573391a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -534,6 +534,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 	u32 work_route = inst->fw_caps[PIPE].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 
+	if (!hfi_id)
+		return 0;
+
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
 					     iris_get_port_info(inst, cap_id),

-- 
2.47.3

