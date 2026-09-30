Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C99B4BD373
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766293; cv=none; b=Cd+okPKiDNxCcRHXFMHrnEBSUOJzkZycV5jJRmjB+ynXrNK+BRzuLosdyq6UfS1mW/3W44sFEdEp6jHkgYWn29U7aKepc5kOSin6pgJS5K+nrInKJ4izZZXC/6Whi1f/dBxuOtL3mb6o4bp6irXllacdcJ3Z1Gf3+DMPyYmkzgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766293; c=relaxed/simple;
	bh=n/22CJIRs3FbTQ/EXxPb6QwR4RlL3xGqhin4YyXX/X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tl6M4AJL3pF5iZu7L/DTPGllQ6mnxHVAFZyurEVXLFBNW/QmIsbnRxmpSoDOQB6Cue7Qzkqtu4u1ww0Oqxk+AYzyPk9HOEsz1ptjS8EtfLfXC4wLnspctVnFXgRo5/yjTmIxspzuBGNxyBU4j4QVsfDQgyg3sHBejFCsGGWwhzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=my/5kK0N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJf5fC1t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="my/5kK0N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJf5fC1t"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dWkg3489199
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUpd9+a72DFNRMumj2W0ENVQopg4yo6onCsGEdVnGag=; b=my/5kK0NPcYGPUMl
	GwPINqpVbrConduOJeWQdn91NGpRbCdMDaiI0IDliWmraW876kpruCsjk3/EdsTG
	b81M1/JGMwU6QZL8lTEtRZFZiS0LM7B4ccPkcIduhuGIC44XQJtsmdGV0YKvjEUe
	BXkqrA+hzOdFFFBIw16F3aS4mb67zhgQy9Ilt1ZRcL1TrbD66PxGC2UijdwhwGOk
	7nxafei1MSj5rJ4iQGceK/uW6NabTx63WXdlACOYfZSVR3MGY83zhrQ/dk73Z+sm
	B6bmHL5/rJ/S41V4xC+p84Mn0NEekeTT28yUwlP6TUqQ7DCqfoopW517Faf4pDq8
	FWLeJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97ux9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 11:04:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179ef12a03so1283436d6.1
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766281; x=1791371081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUpd9+a72DFNRMumj2W0ENVQopg4yo6onCsGEdVnGag=;
        b=JJf5fC1tC9EUtPplbmE7+W54J6er+AMN1udgFCvTUFzz5X68YbECln53L42vgIb3og
         I4DQM6VwdHwSBkhzr2fxNDiOiFVT89QVJS/z/Xt6G1lXNhvbelzkcimpwBxYrL7zxYsN
         mZDyjPl6uWfqvpSdcEwLQHS1qaMZMFCHgizOg8KrzAb+f86IKf+2yijpaeO8Paa9z2ws
         yGH7qPPuay5jv+V4uH3gh13KkSJfCyoxOtMf48MPd0FsS7BwtubZNzYsccQHPhA+ki+5
         WhsU2TCMA7U34oj6ENUyB3p/xMx1HdJyuSZVB/iBZCqAUrnAEQdI62cLgliynfLDX6Nr
         6hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766281; x=1791371081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUpd9+a72DFNRMumj2W0ENVQopg4yo6onCsGEdVnGag=;
        b=cUf2ngoakPUw/3QBss5B1BhnsMOFCf3WnVoaaubbOX5GSFVatA/pGoiSnjZIehCj2F
         rfA9Yv9CiVkMlyZj1QesGHvbD5/EpWYW/wnjnWoBe7h6mEBSodJceU3FJQ1N8h9Im1yh
         QvOyK8w2XEXsjv2fCIWwz+ywZcCQwwIw0tO1ytISUWEVuyIftvhLS5MKNS3uHxB+s+3k
         UDNU3oi7FDRr9BFPNis19TL/lRn1FyLRZqm83iBVSIJM2psM/+H+irhiK/aHVKRWEUfB
         Yv/Xkfv9/d5rdhFCfeqemgeuqrREQUtCPHePDQ1XaS1lgWuCD0BOABIERZ39pheSoutK
         8Asw==
X-Forwarded-Encrypted: i=1; AKwUvBxpXCNxi74LFsMCNLFPpFWIpbHuCaTjBevdDXU4pBM4YPsKY+hgeLYOq5gWPF6udDt05YU6z4rw4kPUCg==@vger.kernel.org
X-Gm-Message-State: AFuF++kArlUCLqWwQb0u9IJU7M0u6C7xQGm3WFtk7Dki/XkbtwRufigz
	RO7RjOYYNykE/YG6HzI/48malq8nLHF0SpxiEaxKeXGHcPXGN1sWMzT7Tltj7VyrO5OS8oIEQ5f
	4rdSjMQg8wl3P/1QCyvlnIJZXVw07sNHj2bJjbOOZRscpu2uXHZZIIeAzN6XwyjpHow==
X-Gm-Gg: AYBFou3FvuuZYxf+CI5dL/ITfewLi3ox0b9mo+P+MQWkpQLpcby4aRM0uUp+2Orj2tz
	5ULysPJQzuLGtU8gmzPU++Xf3NJhiLln7jqK7e5dl6HnEwf8nG2VxM2VDy9TiyzU+1wfST/hWAk
	i1LT2n9PxM1Du80MBq4yuy1+nHcK9yrF1/oFvmgDcmD+AsaH3oqHJFtAxbT0c5haa5VXZZp2peI
	F5DkutXvNp48OcsKXZ+8erTp/ns34PshKERkY4qYFziXFUjWUJt1avHOChPf7NlH7TML9Obiw5Y
	ROj0OP8RrddtDMvvvmP8E77mZTLk8Aw6Yk80RpINw46ZrMiUkAS7yhkwJ13YMxDIQUVDUggODCL
	Fis3hvxOI+xWW8ah0WpoBBQ==
X-Received: by 2002:a05:620a:28c1:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ca9523518mr139808385a.1.1790766280765;
        Wed, 30 Sep 2026 04:04:40 -0700 (PDT)
X-Received: by 2002:a05:620a:28c1:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ca9523518mr139803285a.1.1790766280181;
        Wed, 30 Sep 2026 04:04:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9a39sm708830a12.1.2026.09.30.04.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:04:39 -0700 (PDT)
Message-ID: <2b8045d6-050c-46c5-bbf2-eab7544b7070@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:04:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm64: dts: qcom: hawi: Add camera MCLK pinctrl
 for Hawi
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-9-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-9-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Cr6Y5EM8lQ3SY3sEBe7Dj9oXMRCA-UHG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX9PSB724dx9DV
 6pEHV0yhY7ajIBOuvSdhs7FSloEsyJl0ltRJkh1OFexpq5i0+dtgEya7a0JPW27EQywO2YSWMtE
 V5adBPyCvVJ3bQHqy8mM6arXbooPtPlWokY1+v9LRbq3ZS8Lr+Fll3L1A3tcd9Q5Ath5tgeJadG
 mBZeEeWNx7Zhmh0VV1VIGx3OnsPRjX0j34zBVDCi20G8xwkfHTEOofG5KFIhX4IL3+4yxOoq+Ib
 NDrbHx3XK0Dq8IiiDBk+YgBn3XtcAARLOKwAHIPWToQ1T6+nrxpUzxHJYg+ajYp52z9HUlyF9d9
 ZO5cXifhPEe9GeIZOZAqwFTHx/3JbBJr06TTEepTQ451yfMjcIqX0IzYgzXOoQNr9y29P/UR9lF
 KHXQMqQxB8kInVb0eCb8gRjObjZBSDRwZmP4EehAzR2FN8KHuj+0GqReIc7QbuzK30wfrDfFF3u
 YdpIYrxhcURxUc4HLzg==
X-Proofpoint-ORIG-GUID: Cr6Y5EM8lQ3SY3sEBe7Dj9oXMRCA-UHG
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abcecc9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bWtWBUCbUMvqLY_lKcQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfXy00XVPN1g7oO
 RZTprZKKh6otfTZRdVXBHCkG4cjPTy+7+7g46vEcmP5cxIo3VNWX8TdwFIJ8XD8vQR/cf7zXjo/
 gbhuVG5Eg5ru8a8PzlFxWV7g8Ft4aa4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300043

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Define pinctrl definitions to enable camera master clocks on Hawi.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
