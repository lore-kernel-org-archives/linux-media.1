Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEA64848AD
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764423; cv=none; b=Dp5oW7cvyUQy3fVLSoZ8R9ycSafTILHsNs8wHxaCw7JhLPvl6s5L20LI0Ks6WOSTWQkFRtsESbqS0jmxoYZvLtQwNi4mCfTTXx/wAbjLwtVgxbAo2epVwe9v3W/4RXhJkxn/qFt48GvfAn72XDUe4OV0GP2dowI3KevoWg6Z7K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764423; c=relaxed/simple;
	bh=7R77TQqIMmdGoS2eO0kXm9TNz0zOrN2y4HHSkA/2YWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pu5QhsGCk+o38wAWFBz43nQGXdFKivzVQ5DGLIkTWeQuFkDSesXlWVR+bjo7P8kI4V55zmmu73bpPM4DK/SdekQZoQD+9p6038VLi/tIabNdBQ6hAvEdIK4rS5Im6gs8IJqga2rP3txcjv0YDxEsJEE44CKIpbalwen81ogGZDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XI1nt06I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPatqYKL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI1nt06I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPatqYKL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dTgq2119122
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGZvKGq2A3pM90buZ2VNpRfUMGSk6SlqzeIIAOV+V2w=; b=XI1nt06IC4Gfyq9B
	JaF7mWhGVLDxYdGSxYjijvlM8YeKzgINZOmi8J67i8aHtGJWksB1hEPIV4ig8K9Y
	7sp7uM28bWnzm8YEbZG+EabfsxVJ5gmmuwl8NQPz9WDmbJ0zje11WAEEJyAkBHVJ
	GBnhrWjuTBdj+8llu4FsgTfPySBU0+56wp9sTVcxWv5epg02/kQzbDiyKTKtWENb
	4neqAvUEjWOvc5nxH2sZnbcqnfMiqX8dYXTNJz/PYEf9XewTJlmpt1ZbxDTlJv5c
	ewy6wCextAHBTubv1xxsUA9LSABrAESqb2b1F0Fff3uh8ug/Au7ScgXVwICz539D
	8V2UlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhej9dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:33:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c9a1cec69so26834385a.1
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 03:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764420; x=1791369220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGZvKGq2A3pM90buZ2VNpRfUMGSk6SlqzeIIAOV+V2w=;
        b=KPatqYKLTa41CEXSlNOr+4zirS1jeOzOrIvsT8dAbYQJjDACdlKzsFDU3kvpa4okVZ
         3deEjRQc1O094UB3uuuyfJr17RWobZLchQnb+UTt8jipfBTy2yOK6Khtqghpj8LlUwre
         hBXXTWaNDsqTPMV3+zDmzEvtvSf+XlrLdJyIRExORHBeXBi+Oygtt26BejwW3A8QjfIa
         727Lek7HlK2uC7AcxATow0DjDw1yt5t0yeksYGU5ZezGHZI/kMAalcnjIKc4CbPgEN4D
         A+hsesHIt39/tih3aDuA5pIp79Q5Ek+inTad8fKH0acxme1/w1ELcEDjVCgbF9aqE4LI
         jMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764420; x=1791369220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGZvKGq2A3pM90buZ2VNpRfUMGSk6SlqzeIIAOV+V2w=;
        b=RNy9f8LeV3+TC/gXHpIlxbSIIKT9kTnOt8qPxt8fT27M/E83D+OnigYxgKhh0soY+f
         RD7LCirITODvMGkkJ/0rd1njAAIzk4AQj6AFb0YET0R9Fi544L0+LeHbilEv4w6cwmRI
         90yaIghuNNyzHioNFx8hZq1ybVFJbBniQfDlZ/RulssYPPssNuPUunrWAM2r2Jk5CLTk
         ZmqDKwKojm19Pub7vBC/+A1k5WhP9sKqEtYA7jWNfg2vwoAzhybxRY0nwnXFXVtT8r9U
         LTemIuGp9/8siL3OAYdwI/nW/tW8oIS6MKkjGJ6Wb6HY0PROp8B9R+Q5ybIKBsMnYruw
         fSjg==
X-Gm-Message-State: AFuF++n0ME64JWRXhKIN4ft5z82DLxRekuYOAA9ZCQcdRSktMTmVk8sW
	NsmMQq9vbLG9Pcm9NP7mBlsMep5pfN6Sj9y7oW+3lcUlnySIFGpY5LBTeNdGmBkksDzgLO27Pan
	ohET9w0rAipIRYXQG8D8hbh38sDu2oXGYiHnhVQ9tDPvxuFbgM+++pU2y7Ir5isyGtQ==
X-Gm-Gg: AYBFou3diEgg2+rZ0J4jN6hWcPd21ylo1ZgJjtzXImhOL/JlOAidzyr2wWHZWiXER9I
	c83zInkf2g6RBEp4gJnHUK7JK+SB2A91zsA1OfQFwqRCEfbd3A21BjgyNb3JlIrvaMIGnW7ZC1F
	4F3hOm8tHleFJMDmslZwZFs6gluu3SeMXO/BHU3LXnhT0bhUdMvzBwzhhkNf+4eIh8/vIbr+sfl
	/wEKVFQ8KZEny/Y0uJQfNGRY0psGW/awlFBRzRWc4l4ThGdnvkMin3T+lxnz42VUQAVAaSvM5zh
	jrwSyReVD2dMNLm242O07ddlJvoA25loNuPoyJtEGhBT32YhISZ+4EV5QZUdXVWmjD74xjDqP3n
	6Ovs4oyYWKMwysblbe+cyYg==
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr145340685a.6.1790764419733;
        Wed, 30 Sep 2026 03:33:39 -0700 (PDT)
X-Received: by 2002:a05:620a:3195:b0:93c:5bda:9711 with SMTP id af79cd13be357-93ca980894fmr145334485a.6.1790764419199;
        Wed, 30 Sep 2026 03:33:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm671766a12.1.2026.09.30.03.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:33:38 -0700 (PDT)
Message-ID: <255658f9-cd6b-418e-989e-60daa36ca498@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:33:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] arm64: dts: qcom: sm8750: Add Iris context bank
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
 <20260926-vpu_iommu_iova_handling-v5-13-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-13-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Mc4_aCpFTe6wqaiuU6aCEVn_hwCi4lZQ
X-Proofpoint-ORIG-GUID: Mc4_aCpFTe6wqaiuU6aCEVn_hwCi4lZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX+SUhFkWgYb+1
 8nPeSYV58OAP9Rc1KFPPCfWfGL1koMtaTyIGoKoCI57IQm/AzV9wFmk8zRKkHuFFOEwZ+bwawlp
 iMZl8rp/j8gWL0FsYm9axhR42ujRZmhUjaRKYjMzcG0mnGuKV0KKtkhNx4cU6Uy/kLeIZJ2c6B5
 JMrHFjZYijhMTXOyGiD2XNSd5SINcgjtwpYEeCXzFmgxdYDIVDWDeZWa2nJkHDfI3YlrGtzUG75
 MNJz6z8DUSJh9cnGxZWCq4BewE0EZ1k2ERph88eQjo3HdqXDguK00ZTTQjOvikh+IOYrUBwHZI9
 5sZ+4uXFLQhdcMIFE4BfplAAkhORj8VrrmtFdESEijyXVkwfhcDRP/lHjkds9Fca5B3aSdzWLRb
 HCeltpkHnh0l+YHs/mjcDZgSxZ3Rk+VEvFsRfyuiYN9nG/Vp5n/8nuM/2iL8UKjhK4kUaLaDUlg
 E7WFPJBnDhNcXf5Bz2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX+aSBHAN4lMuP
 tBzYaqZ2ght23aai2pdUGutAgpodtrVpLMlmkXqZQXfEUq+fZmEw1NTVIqzheWm/lTMS6d43glC
 m6hmw6dVVbBiKcxGA5/voAd3qhCy8uk=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abce584 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
