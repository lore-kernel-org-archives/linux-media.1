Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8083B6364
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792258246; cv=none; b=OxhO7lgZby8+izUZgi4flPRlylTKB1Htb2wGgsAF0ozsrtVH08BJmfMFgU0rko5ooW30bHyqWoqMFr1K1455N0gEScPDcS0Lbh16byF4npFwVvF31M2RBdDbDOdDwqiez2bAVONqFagcj3vkaS41AmR0gWYmD85PH97FW65yICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792258246; c=relaxed/simple;
	bh=WPWzgn8BzSTLXjT9VD+9lO6sjFQsNwDPrAH6pqJv6LM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9YFs4L+oJlJqPczOJK3gZ4WnAo+ucSwNJfYnlfd9cso3/HpDjOHQ+cPXJVVGhisjFE3+TBKxfO4yFIGpKcqUvgobl8VuGlw51T3S8ekJey6ylvIkL6pU+y1zLYv8yBCaaHtiU0BBxNxYHqG7wmAkOXMCVbASFvlt4GohBXXSTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAe/ryk8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDLqt/L8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAe/ryk8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDLqt/L8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9xZ4465697
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uurq7etXorKu9OdwHqi4DWDbEo6EGEBHxzN0VkbXR/M=; b=nAe/ryk8u5B3FWhP
	/jbFnH6FSU+jOiUiBTd4v9U7O8WAwx3cVeZl2PhWAQVpS38MayEzG2nyiWtPI8Vp
	PoWdgbaNo3l9Rt/pWLDyEKj+SUAu2Mk7vqJADZLjGOLJxYzKc5D8LLSKYrVusGZ2
	8kJ46fkuUwxU7EAkcM4KsBN+hKFVtqiZsDxZkTSkYX6GJmw48p15uEn72+JbN87w
	1yUaILTBN20xlhJ4Fx+U4BMQzv7WYjP6ZH8CmetaO0PHCrnu1fhBSN6FJAg1yyAM
	LwuMoTVZn8wfZXPb+oRZZSHS1AqF6m30Frqm/Odjf9AWy7qrfan8rQmtA0NuP0Sg
	rTEnXA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7sck3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 17:30:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so3918952c88.1
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792258243; x=1792863043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uurq7etXorKu9OdwHqi4DWDbEo6EGEBHxzN0VkbXR/M=;
        b=YDLqt/L8nw0wPr8PVb30pmDZGu4eJjIHho6xk13GahsvGvYbOyU070cPBaS6z/Xnhk
         fpHhrIjedF2uSMDI/uLSe+fnuXCRlYxFUM8l5mdTXzH6+tys0TDJUzB5nFEm6OtwydVu
         Skl++q0rFoUIENBTv9nvEiFKsP/nJAizkhlJJkJSnM7y41VZlKsJusGFrt/CiEDHfN6L
         xbYnQJfURjnifQh8ESLYeMZUYmu8Bfgz0+a9+pNL2SXQ6j5S5+6G0mw8wVQ3wxohEis9
         uytt0JVCbn8YyTZ3j8NHvlrNHREUf0PtRg6CHaY5BVdaCvMyxD6aYWy3O01GusHB3RBy
         /9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792258243; x=1792863043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uurq7etXorKu9OdwHqi4DWDbEo6EGEBHxzN0VkbXR/M=;
        b=XJ9f7abdVqN4tGhWey1AzeK7l48bZjBh2mrLQTn5QlsCRXxZlacBFfCX96qilyGpRt
         ELqXEIgndSAL0cdKVgMbA956x5mDvglCXMx6Ebs6lyzOFcBHquE/GqZIUCGLEhOpc/Km
         1wh9I+D5m07+7Gvlf+P/7fMRr58a3p2VuI2ufJ4bJqIC/zfJUvRVyhE7YxF9UB1uwvlv
         2IyUgs1qxQ6DdI6N0mDFM4YPgtdZXb0P3nRkhKKlpe+Re68/9nfRxW/HLIzENEq5p+E+
         kwV2m8vCPD2X3UFyI0nLjSXCfgJk0QLHjCCJ8WHtgV3op50ypS6d7i/XGxh8SgfLe/z4
         FY8w==
X-Forwarded-Encrypted: i=1; AKwUvBxKu936thmOYqq61thCDAjXOZEp1TTtP4K/IpK9rG56L0TySTy8Qf0l6aYTDioBxgEJRTKkNVy+YwwDMg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjCr36V1EOG5D0bu5pmZZBBtWUy1glhlMwMNnPphFqw4iXLGIB
	nY7h/boV4RH7r0GiXE/IEwjkSlBmW62igEcv2Yqt77yYCl4WawS8ZzDanSRBrnTZi1KnNOGtwn3
	XzrRNQpPK2uaCZAp5qFBEhQQQ32IdSKetBPsyTH81xXyRhfJ9kwBWy9c7UUG8dIp/hQ==
X-Gm-Gg: AYBFou22b+CUEC9SB0SrrWIiqMtdXv56MvKECZ4UNSms949GIIa0th3tjUIyBYP5Skn
	4XVKqJ6zj6R1KBT25VvJ/4idfJVg4GZhCFQKMmrnOwcC/dFM7iYR4wTP5DSDxl5s1WY9CQyXcUv
	y6I1BkAWr+5+Yd8GPkUAe4CuJSt2Jx414rENm4xGaNaTt0oEc0XaNE7tS93H5GKK0rX8unjhb+w
	86g5a/BMJX61em/YfmyxPnfRtrSkojO/y6BaSeiQ+mWPTbhs5pBu5BoUZzCX9zNoB/qgIyoqSqv
	ysCiswBvVpY0+CtxuqqND3n7xOYuOLzeiNy0ug0kLI6GTpBQCQa0i14mHGc6K3b8Rb2tNsjhgh/
	gJgqsAZuxNqboMlrytdV2NTumJg==
X-Received: by 2002:a05:701b:280f:b0:17b:fea8:1425 with SMTP id a92af1059eb24-185138b58e0mr4379118c88.30.1792258242819;
        Sat, 17 Oct 2026 10:30:42 -0700 (PDT)
X-Received: by 2002:a05:701b:280f:b0:17b:fea8:1425 with SMTP id a92af1059eb24-185138b58e0mr4379078c88.30.1792258242242;
        Sat, 17 Oct 2026 10:30:42 -0700 (PDT)
Received: from [192.168.1.8] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm17247527eec.10.2026.10.17.10.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 10:30:41 -0700 (PDT)
Message-ID: <31bec5eb-97e0-4667-ab6e-0de662f97633@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 23:00:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: qcom: camss: track PHY type and scale link
 frequency for C-PHY
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OSBTYWx0ZWRfX5tG2Ndw6U2ZF
 qDRFmAwLTkCJaXiuCkajp/JhPq2PjGrh7mMc1Vcqj+9nC/UUQaYPqLxj3I8aQ8C+/H2lfcoHoEe
 5Q4N9OFxfqak4fj/gRnSMH+tCpfgpk0=
X-Proofpoint-ORIG-GUID: Y3DBABHc4ZHq4dEzo_S2yZ1epbiVq6dg
X-Proofpoint-GUID: Y3DBABHc4ZHq4dEzo_S2yZ1epbiVq6dg
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad3b0c3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CCQDo4VjHF3mKuCWjr4A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OSBTYWx0ZWRfX7dedt88H2SfW
 bBgyhaO7vCwCiJkFR2dHopykOBl9U8mI3zkqI5IIAWd+yETdSgDBBYUPX+9RYWXmjhc58qZY7Rn
 SS84WTAEGHx7YwXV1ED+n/KI7GmUVj15xdOKRg9dXfAdJuTZxVB20g9doEARcHmtO7YN0I6vCEM
 BU6SXvaOuqdXCyARp5mZaNkCepR65ZAEn7vyujyDioOc5Va2L4D7cJntyS553lvPRnw3o4vnKoy
 FqiHnspre4jDogiJmmtVJXhha+iieLak+iEfhA0pOobLMOh8n1X4kmYK8Xh4j6Xpo7bV+fwzFEh
 krVxLfehEDUohpxiFyiXcdWmu9zMrVhqA/gjlD8s1zfDlDUgrmn/IijUiyckn+DxSZe+qYBXiZ5
 QQGvI+Y6vXHcARio4lByBABWUBdTY6+rba6MafBvTpXEucktLh6a3EfBDVdTShPjwG9cz98tKkU
 HOgp8VusV8OB9rymamw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170069



On 17-10-2026 09:22, Anusha Arun Nandi wrote:
> Depends-on: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/

This Depends-on is in the wrong series. 
The driver should not depend on the DTS.
-- 
Regards,
Nihal Kumar Gupta

