Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A776540681E
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764376; cv=none; b=ZWudUmdNqy6UsPDQmer/JHxFIsRzttPwylCGik9/bBh5l/JsBtohqnmlYmsL7rKdaAmU3WRnZyl/lwES9oJ2BzIJEYGoUTux92IPlYuPS/aLT1tF5jQ1r9dvKqqQDCTpAngTNsLjY8rumL0PkiTVyBT54n1SffJOfGgLwlNux6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764376; c=relaxed/simple;
	bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3BH/BSPVCMoGTa0AL3wJ9RU+C//YwRqdLl1gglEugXiG1oOCudvZKg6YIOtlKxPlOtuUpbVXxdjQlxCZpD6j0lN3oTWKFFFGPNGO2MgD0s6rsQzI5L6Fkg/ofglGs8ddy9z1X3xBlocx+Eh16oeg5jfROwlpz7y5zUHK6ie+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYmEqs9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WruygaGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYmEqs9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WruygaGA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dR581556141
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=; b=HYmEqs9WutxOa69a
	OmWATf9BkDwYYv4FkJDlY64AaUtirh84PFYtB+CNWdzGQcUhE7oi6tCqbiaXaqb+
	6r/Xc+L+lt5liw4SbqvkO5r+SSOsGmIghGx1H0xv6oxdeNOMZM/BiCWZISknnGv/
	gWdH+Qfj004GR6fOl7WaOGuIEHJy8ysn84IPJvVO4VP4QfIp4sV3izuSWCG0cP/X
	1LVXk1wBT6uianUh4/6lS66MH6B8QrVhYioNYoUC2ptvJWLXI8vG/A7S7igPK0Im
	yQZJtRCpvYyc/ivq1h0nRHQNiNUCFPbCTh/+0HU17sKCFjBpbCpak5cHDegT53kE
	7U+JcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c0sun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:32:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c9a1cec69so26815585a.1
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764371; x=1791369171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
        b=WruygaGAb0DL8RpebvJBnFCq0p9dA2bvadk6O0890Q9Uta9mIR3iAK08j1u4BwNhHU
         BDhghA6ZgVr6gFrhSIELeJf1CxU266c+B5PzDLbGDb9I+vKwbVyFaibjvzILwRVMCLJH
         SebaqIXByd4/dmngAGrjS3+ClZMBnhSs1l4REtVLK0RxtmImRBXM6irA5sXxmlODyRnI
         L8pv+/1b+wCn9xEpr8Fl51889volJL5QD2bK4oN4Nuz7FsqcqXakFBvZ/jupAF+OqdMh
         OH1RvRGzV9jcx37IznOpelvntjB12Yy++lHywdxiWLpVTSY46Tnf3BDHSEtShMN9hB8n
         8dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764371; x=1791369171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
        b=fthoaFF8YHcFRLi2IiAjVcmdrqFgs18yA9oNvS8ZMAy9DfWboZZjgHJlYlkeWUTUiw
         JS6M6KPeyObjcMsnmVYjbKi8ZOp5vZ4WrnTg7mKHve61O2IkBQu9mdW60aQjMJEusIRJ
         6aTx6Rzw3dnoy7gcUWLBXalI9upQABqTTN1UxjjGvaJ1Rmt5n/cVGZ8xnx/KxgCnHmyY
         Wr0QxcnvxSpmDG6S9lU1xnDjR3dVryc4sSL95ZgrWxOUPsv3KwYel50O0s5jtOFRO7X6
         SD9czlMQhCWeYohD4yR4FD1Xlo7y8JZxHtPDs+53NphFHYjKbmM6lEW+QkEnT3K00/jk
         8FKA==
X-Gm-Message-State: AFuF++k3TyrrJ4Mc3TYk2xOBlc+dh57rgfnf5GI70D+7puZK+8anI+n1
	w0tkE9Ve0yD+RduU2ElIYOl5Qr8yvPcCDH+guyksMqXALH5RSlcQMMXbbZ0yPY10mdBGHfMI8CJ
	XQurEhtmIVwQc+UZvcFPK2a43iojDj2OjLgzjvECz5fQVCUhCBiWDhYwQfZu2xfrjWQ==
X-Gm-Gg: AYBFou2OxyUhjl7n/dqFUCdoEsLvvTLc+2hkvEOutRulaubv0OXW5hk8Twv0Qi3eglr
	lvRiAx+lBylQ0hMTND9bE1VfVz/C6KyMAOl5i79KE48AJcgw6JY5LzU7/HnFHVGMJB378CHwdav
	WiTa3ohKyc9xvFQwI1gTmnY6keBSACsRERge6BQaEeR1zRqMZGW54k289FqLEGpTt3fwJXVyskg
	MOCTNyeAtRfaZ4OKb+/0UmWAnDdkWIaOnkpx9buuV9DPF/X6UfkqSl19n83CAdrOx/rvbKopU5G
	SugtH2EuA3Hc/sEMxLvC1NZHHr5/Zml9h4hxWFMqlb53zxJ96RKobPDc/CjzTwiaqIiNZRnrepd
	zZYAC+gzMCwlSz4JtJZLqnA==
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr131780385a.0.1790764371111;
        Wed, 30 Sep 2026 03:32:51 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr131776485a.0.1790764370645;
        Wed, 30 Sep 2026 03:32:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7f26asm44710266b.42.2026.09.30.03.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:32:49 -0700 (PDT)
Message-ID: <543bd0a0-e0ee-4bc6-8988-00f595334167@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:32:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-8-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-8-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX5ae7V2bdqTHm
 DeaBDxaY0DdAAUSkuy6wPpkikj0eLVl4OVz/tkqOeJFlPyglOhgUyS3bqCApf6P3CwFQaPRL0S2
 FTpYttEsgbnww+ydfOpcVKx5jP3q71c=
X-Proofpoint-ORIG-GUID: YHZQxk3uzC8JvCcGcCqby89nNC_mkl4D
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abce554 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YHZQxk3uzC8JvCcGcCqby89nNC_mkl4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfXyCqnUc7/qyi9
 hg+RZWh9ct/WngCfkExspHW1xPF8GPGoUuzK+B2yYc2mPN2LYXJALOKMmXUnCvRdxz49UeNNbr2
 aB2pQp5oBF90bgckA3oeFLTZ/wZJRpHS51CA0p+PxTMLzfGhbJs03L+WN35FiiuWg2KvYB8Ll1Y
 hhrora3M0oQBkwYbli/Uem8XpHzyYUn4vQeD3QT+lnIZFHROa7PuRAmuSsAjQs3Jk0adeGoTV6I
 P85Bl2wXhY0OY6x2dO1KTGnTGXvAWv6XISghrYAC2wh2zRD6zoSlmGIBgS6yfvL8e9l1bZGcTrk
 swEGs4JMWsGx5KJySNY/d7ghTTyzh5LOKzb4vPQePok5AEMvZI9h9wTUeA9+GvgPW0nwORv7SyZ
 8ahpmP79boMEj7XS/YH2U6/8RdttFFFKDBB4gcIEOUv1MMIA6tyRiIjCGLCCfXGh3xjePvHkiw2
 MQ6Uw8CIOaLLNLQ4TJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
