Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC66B4EC67B
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558177; cv=none; b=hvEUHAFWDzEuINCy/pMKPUiImdvp1ksHFjBESVg/b0wXHucmLR/SntylEclC6GtyzXSBcy/8Wb6E8Qoua0NieARS/YSTRzYeraecZAooVhsq/CrFJSI1RFvg/cPX4kDgAPsg5fbXRDkzvCwiS2DbRB4xe6iS5iIDlcQZKPSqtZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558177; c=relaxed/simple;
	bh=DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XXhIQhceMnUIubzqzkSpy1b0unYUB/4kOJbm5d5HFjyJihpOPew+sH9MCR5te0CtrBiAu2N9hIMIz+GV9T81OjkkqCXBY97LGdSJ6cUUmSZG1TOVezjbWI/6WkBENPQlB2+6iORxc11eX1zdnqBDRA6altrUlCq3Rf3B+J13Ics=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpaVmxwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRqbQr9g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpaVmxwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRqbQr9g"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92ump1721210
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 11:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=; b=RpaVmxwmyMOzIZR2
	kDtAUBfg0AgHqU/RCVmEPDCrMJeJojOW1JMJj6bcu2EMqnq7WBC0udXk2Z9Nn4UW
	8Cmq/9vRW1eYdIGR9/CTrlJrXIyOwHBVv8Ie7Y9cZZ1yfX9zfvLzAJ3tO7xo12FL
	GZwZDFYhxuXGaNmO1TZccEbIjv1vnzM2V+Fv0R3hv9JdvaBWxstghFMkByY4RQIX
	aCjUOWdgbJZO6o5qi+0odHi9CirbRcF4CZXtPkOrJ9NRQMy5OhfXGqXcXLyL5kiA
	IizjnMqkj76flYJdyB17ezA5H5HjLXjY1IOMCJhErwSiIQH/uRF2PwOdxt9xuXdH
	+KsAdg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkjy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 11:29:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e1bbe2c30so1203678a91.2
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 04:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789558163; x=1790162963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=;
        b=KRqbQr9g6uozhpNPNonaC8YUaeV1WNp+16x1ZV6eD8EwRz8ugkqLCMqKWsmofP+Owp
         4h8fJqssxjMtnWK2Eo+D9/OHvZTseb4sIPx1NFr64R1k3YjKHhiwDQIHROeNaMXbeeNu
         ZW2JC0h36WR2QKB1OysxPMBMzCeDcOyWKE6b6ysWzMybPXt7iQX/xQM20vMvAIMOncBz
         RRUORFIOr1ca9TQVZyCscNuaWtiWuBCcRKz2Sjwie/tJaJZdG88G8IhLv5AtdtCPsObj
         vxhKfrY6b005/mrFRa7S+26YEtb4henfQgHh5j4RQ/ymjDwxvxZ6LEVT2XzsRiT/LGT7
         VmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558163; x=1790162963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=;
        b=rgrBBcCDm8pyWKPIstW+rkWr9z7M9gFwuu8PCCeikfbHfDx1YQZhwsFtykyBYQhwJh
         kC3gBkBNbRKnOaC5Y86D7Wa7rb7Oubc0dBji5gZ0U7nSu5yHfZe5/cp4YIhN7ESyeTtN
         mYxASWJErvhtciLv+/+NIpgPXmeXMYle5M5WPFEsrq1XJHJPxegtlvjtkTTlepWscExx
         zeRVgQ1GRwqyI5O8ntw3SGUpD8YNs2XDJg3BzBi8gTptj4Ax96NpIRoTDtdhKxE7VVdP
         FeDsCRUc488bOAit8NuDQTu1Ppp4satItHX0b/7sCjOIZos5YSNEKduRRy700wZKhK+M
         4VkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQzIbx+CFOgHh0FQYIpcYXKWYnVAHafwhgeY63RHxzDAg8maWCEyF/kstpITZhG+GHgrz5SdI/9IfQKg==@vger.kernel.org
X-Gm-Message-State: AFuF++lB3G+a6C4W0OhGAkq4lAuKI8LIoJAnke/etTGXyoPyu5MmF+vC
	MspOqENyuHGEi4u1iFAitwS9vn6woJWr6xUHCLuaOQwnLgWNnWhboddjeO7y4krxlvY5mF+N/Di
	JwGUNEHsaKukvSvkiLGw6X9zoHkZ3c2bcdtRQmhd44BYodLybDZVQ9e6DhABuY6WvVw==
X-Gm-Gg: AYBFou1STSCTIfJssNNVOOI0TI0wEYTWounleh8JMVHganlQ3cour4g+78Jw9LiIQf6
	Kjq08HzKrpw8we21Vl7hH9vVK7abmXBP1Euy/R+ZGhI5htw/qbUkujZJylZZ2z5AvIB/3To1xBv
	19XB+2hXcwhsxU7Ujdg+OH579vtEa6TPwvNn4NuzjaR+iVm9naCGfABx/S0H0KkWL1d2sBaI/6p
	LMpFWNTFFsYjvd/v6HRafV31ZfraAS2A17+plgW8JUh8Naa9xL8TR4iRUJn8TA0abf5bbFcjtYL
	FROv/xfpHdieeCyEFNWZ83W9XNPaHuCUmiCx8yXUbjvmMrZm0bEm18HToldtn/jrcSg2UGcm7yl
	hTCjR55bFo7WSaO7vqkzVGjVsbuzS
X-Received: by 2002:a17:90a:d444:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39e1e314c60mr5919074a91.9.1789558162622;
        Wed, 16 Sep 2026 04:29:22 -0700 (PDT)
X-Received: by 2002:a17:90a:d444:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39e1e314c60mr5919013a91.9.1789558162159;
        Wed, 16 Sep 2026 04:29:22 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b71428dsm4356441a91.10.2026.09.16.04.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:29:21 -0700 (PDT)
Message-ID: <5dcdf9e4-6be6-4481-b5a5-0d3a7784de9a@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:59:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
 <3a2f535c-7ccb-4b50-a6fc-f73ec02d4acf@oss.qualcomm.com>
 <78a7700d-32f7-4592-8a50-c90175338972@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <78a7700d-32f7-4592-8a50-c90175338972@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa7d93 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=yuRkgBCuwwUBbEn3D1QA:9 a=QEXdDO2ut3YA:10 a=Qzt0FRFQUfIA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1MiBTYWx0ZWRfXxTaVrsOIEWYo
 Zw2xEp6wr7TwwzgcBLEHN6icTDZBjC8+zVJvIZmtMQGAprw0RW+D89FfRR9VdIrdCT/LxvIAEF2
 qsPK68IJl3z7jtOMju2hDzRLby8jecyMwaxd0b23jhmN0ZjWh77W1nyTSNyY0a1rS2MWF39tvp3
 +fZv/7R2PyDYjB+CHAet8D4fuUiOUYHkmCc0jDA8Syn0HaNy5W2fk75wo8o2Oe+HbMwe8sec3lD
 1+jlqKbJLbWvbTsAYvt3Jbya4cg44mIMQmCOnn2c3WiMuGo2sg9sSeIdoVwv5AvFFpXAj6BEg9C
 1LF6MVptcHZ9jZtLSIRKioZx+WTaswT+sBPGQXnI5JDAGpuFPmwiCmOK0eaidZJOI1GMIuLduaM
 6VIei9gqPqNu6aOJ41Lh8eJFZSKiJPLVZ8fxuHS6AvB+4yE4Of+tU9JR5Tq8rkzmwKsM2EqsEo2
 6Jo5BEdGWpyMWqYuT/w==
X-Proofpoint-GUID: NEpO4jaRWsBkzcGRzaH4-sqkQvx0LS-9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1MiBTYWx0ZWRfX1Xmsw9KAGBCG
 INk2VZ7kA+Lpgd2A/qx1+wZlF0HXTLOjF9Jxnjkj8W4L9Yd2JxZVka5lhXVTGN+M3e+CJIAw1g7
 /VuuSePLSbQ89MRlUcVWHLBRhB5cbn8=
X-Proofpoint-ORIG-GUID: NEpO4jaRWsBkzcGRzaH4-sqkQvx0LS-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160152



On 16-09-2026 15:47, Krzysztof Kozlowski wrote:
>> For the series:
>> Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD
> You cannot test a binding, so why replying to cover letter which will
> make this tag 50% applied wrong...

You are right, apologies for the noise.
Bryan, please drop Tested-by from the dt-bindings patch.
---
Regards,
Nihal Kumar Gupta
