Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C12855C33B
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 15:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092292; cv=none; b=l2AZ6BDaAKe9ucXI5m6Kx4Gu0z31MXRGy5BQG0W2cZASnVO/SrRaXAGfi5DsblZ94+bgsa3Oyt77O9LIZM5aydVbFTPTWXvrl2MDjTBT8aAZYVNT9Vcgevdyb8fcvrUmpkfkvAPcTvpfRjqN+e+lbbGUoju2sV0NoXRHQ8mxhuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092292; c=relaxed/simple;
	bh=CoyYTnZ8DJVM5eZTTyQQ88Q1PAuHVEJ7jE5IuXsp32A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EeleauzdnpxjUY2OXg3BLsSEe9DCpP2Af3sKZgTQAR13yOBi2B5StvFGLnqj1TmQOTUIOhtL7C3jBtpnPmNTSbfZucOtGrWqqw9B/e6FNw0y285x+IlZbMG8S5nO6bhPu2UIH2cfj7ntb09T5Q0QERsBJ/fZwLDa9bHyrP+T3gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSgbiMZD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWHpB/5z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSgbiMZD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWHpB/5z"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjCFc4109967
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 15:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=; b=VSgbiMZDKXRJDmXc
	D4ULXJkDgfpS3i3YddwY4p1jbbc6884X4j2GHj7YPBxODjIiBJrn0cu+L4EiyN/f
	GIlqcZ1IOHG3KehVShBsBcnpTdfpvutqtWmajzgDYxMn/OwH97ROdZOaK1h2ZaFd
	UiX0PAPLu+ukh0Z8hwWvBZ0D/ms1BZkqXkxWmZiwMCso0HPEeumig+E/u+WHAIXb
	le0dz3LH44A65XNnt1HTosj/HvyG5JuHZ32SYtCem5V8H5RD43FX4ivkDFL3mG4z
	XnjvJ4GxGPoYjj9R7mhctNT54NsTfJ7+QAiO5jDyqAxiTrDJPIhZ57CdWQbn0tkA
	wSWeFQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnt9a2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 15:51:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fcc331099so150745137.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092289; x=1790697089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=;
        b=iWHpB/5zzWoXcl4aIEVAUwb6iMA2NFwRfFVe8hFe7Mld5dGMK+QO4fpztIoIgUW/ME
         vHqX9fH4aKspVxNAoCV71cDaACA+SR5RwX3FRYGvvY0h6HZVpusaRFD7TWHh4GHHbgjn
         Pq2Ryt5S6IIF8f/yIiBEfAM+T6O3Wcf3eKKAfBGWvYJZbfHy63k4DdWreNyKok+HVr6p
         Rqhw5/pi2HmTFRDsy5txoJrFJ4XaOm7LH7O9sfzqanavZvIdn/BKS+ak1DpxrLHFRu9m
         aYuH8RICTsyAEN7Ksv4uvrrBmIZiS8fwAlvhZesTujlr7hV9pCOFg3QZd+W6n1Zfj9I3
         +dRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092289; x=1790697089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RnmPg50OEmv8rP96wxGaZ+xgbjo5u5huRl5f5KiIQ8I=;
        b=C6SFN5rzOXdyUIcJbZ/lDBO3YtGOT/9t45KbnGzDfTOsjfSnCzLn6ytuxp9cb3kSOs
         hxhKeM3Iv2Mf7svo3rayVA6QygJWlzTcCo58uGDRpk3i5AqXaNMxQGvBcEtuCOvyCMGe
         IV26ebJhpxg7dyuMlfiNtLiZbAXrtLzgimnrouFirJEufEVCa69iUXDZzuYQK1+8eIrI
         XyONBCCt+isHFVWnm+ZUOgtEd/vubUroYB4wpBsi6n+dINxscBchlN2tQBwr+WTzEmkh
         7QxwzTn4LpR58+1GjlfmifEtkbGfy9zW1bwDCKH6HBE2n7V+r748JpVANZiItQVGTZMG
         U4pg==
X-Forwarded-Encrypted: i=1; AKwUvBzOBKKyXK2Jk65fvMLY3+PEUqujqJ+nSnZ5JQb1KplMe7PBGCigD+Umq3JD262jR5gh7XyqBFpoAim9wA==@vger.kernel.org
X-Gm-Message-State: AFuF++lp+Jh7iRxGnoYaXWlOBfEGs7JV9vFpcOR04DkdoHPBqi/nfJLP
	xnre3CDd/3sfnCXeED5OKwmP+GA+bLxp0Q6+e+MUdEGMlZ+dnoyoApY2SkMN+dy5BY2GONMaNP1
	RoPM1YnQJh/QX3KqFZdL6yvhtAp7jalwykQHwcx7al/LqGIx1TbZPqspFK2YJ5TXnGg==
X-Gm-Gg: AYBFou20/7U0lJWcB2g1OsZMpd6xeglv866PAvGoGI4dEWwvnPTsWt/mfSo8O2ragfe
	R/SPCaEA4zbB58DG0wLFwXY0p59yH66+x4OamHjXei+NICQzqQDsSexxmofQ2MiUnSklIo42pe+
	aJCpDL0bdET5/DY3PKaECflKwhaghKBmfXhDgtgncdOQsAVdJeFUGG3Ul7OfJK6u3wMMCsl8Cs/
	x9cEArjRli4Ldee5q6DMHFFnUBtf++QYcYbJzaW1CudbxgWbH4NI1Gz4Lz+5r6YlRFCfLGRHBb9
	q5dvNimSWyi6QD0M0Aq9Nz0iseoIq0s17gJdIwKt8AwjBYkaPdL08p0QXxzrZaJ45dOql0haeWG
	TnE4nql4IHWBlfiKvVi6XmA==
X-Received: by 2002:a05:6102:b0f:b0:791:33c:9d1 with SMTP id ada2fe7eead31-7a59d45b711mr8581236137.1.1790092289158;
        Tue, 22 Sep 2026 08:51:29 -0700 (PDT)
X-Received: by 2002:a05:6102:b0f:b0:791:33c:9d1 with SMTP id ada2fe7eead31-7a59d45b711mr8581185137.1.1790092288703;
        Tue, 22 Sep 2026 08:51:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c2a6336sm113065666b.0.2026.09.22.08.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:51:27 -0700 (PDT)
Message-ID: <27810459-c127-4b85-abcd-43d8f1e25c15@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:51:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/5] arm64: dts: qcom: shikra: Add CAMSS node for
 Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gnid6r4uK3OO05dL5C6jvembBBFzDyIw
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2a402 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX1Y+eohM6zDLp
 jKp496zuxp9Uvc8VIAB7fbMkLbe9fG393liYQBZQLmQMmR51zVq7YlufX3N8Rn1Cxt+Kk6CzeW1
 61ksGczXSoIh59+RbWiBH1r5IQuqmT9IV6oePPM0inzgWv97wVv3iLOBvW8MI2dRlkuwcYBoy9p
 yegipYwfpNoSvGxbBVY4cyHhobxta6jQ2eCC/ZbiwBcY0iHQUvToIszDqgrtIHeUtC7kMIHVgdh
 urkXmDhUCVwnvc0Q1GX4wQwrgAjdsjCpoNU7x86rVyrLCd8qzESVdhm6q8ZOOhNjqyGFI7dp9fr
 sQQWuaeNd5hUo84C6Iec0NAyOdhKVw3wUu6w2U2Tq2dgpdKWmdrysfQw1EzyZxSz3cl7wFwr1SQ
 VMI0CyZ7lWrnVmYe1HHT/5NiC8yPqmxVOKx9CpMRbqB21iWyGj1RB7Lq5mdBBm8qvGivmdAXjg0
 EylpKhQoKBc2bBzl7wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX7ReOpykPlGze
 HEDPoz9z57Z6v84ymwwwLvUxtk8Rqp2Gnddyw7kUyUNPFObIwtRw4OcyZtPr3l2ZC1fuE/YWZNS
 /vHPyVF8XqAC1BmirnCJ4Bt88TR1skk=
X-Proofpoint-GUID: gnid6r4uK3OO05dL5C6jvembBBFzDyIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
