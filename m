Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B3F496D3B
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101781; cv=none; b=II01WPc4TQE2TXnSr/XI60m6ncCVySIweXCzvAaViT7Ui981fElTdIbakIWpxwQtHndEQOc1+A5o/Tdp+/PzRwaC9y+/XI8r4szITqDzWQpv6a+hn5bSjd5aGp1LFd467gh0/+B8yglOhspnm/t01rzNI3r/f8AqdvQlXh0ZU1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101781; c=relaxed/simple;
	bh=z6vVIQROk52rZMGJLFlybPY7chX0rdujZPO2jegWweM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gj0Ikl76AHG5n9cU+qbZ5Benre+9egjA3N4AtWfmnc8QOUjbcm6LIPdmejT4/iW1+QnDrGjdg7YX2VP+ATBZpA62tSrXXM4+PUK9cxDyLrloMUIT50e02ELZ3rb80L9RX7xsifierEYm/AeymsdJ3JnjXpOawI1YpfD619qUxhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUEfJEia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XG1XVcZC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUEfJEia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XG1XVcZC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7vs9767703
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=; b=QUEfJEia/PgOT1KH
	zQrOYm9tNKssdWuu+TKixH4cCu+12ET9VihcJGoqbTjtB8CJgK/6ILBdArG5Z/Ry
	A6KuwLfU50YKpUtmgWHn6+/xfh2ej8786g0e6k+eyhUeuF2bJANZ3kAJkkFuPNxK
	01WqcjmSwk7jHiWCPTzgBwaD2M/3s51Ifd1A4DJep2OEySOY2IxDdDMAtg7dttPK
	la3M4/RWxevrtQWiEud2pW+6Uyb01iuvhO6V69QqD1xK1rQ5xWTpt+PkV44ATIWT
	t4R6LKlwrD2aiH4E/wg02lPoMJC7IGFOOB2F+pQ/lky5EpY3EkfNtlS2p5hLvfS3
	5sVxvA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqjrk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:29:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so110954eec.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790101777; x=1790706577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=;
        b=XG1XVcZCJw/ABTPMuRx1NOlYaLc9GC7SJIM87lkFhhLripNk8XTsn8V8pvejwc0a06
         +7LoZ7p5c3W0RQ+F39s14hA5dnNHW+B6SMDv7SfYN5xWDWzHIqn5cGydyUVb3JqSp/7A
         niQTjHnrZ7QmMMIFz2cLEfNsrmeIeODcmiMrLm29ODZVOZHENdupBptzVq6qJyVyOaZw
         MFau4aNobc1lrpszEQ+fx0qPKI/mOUN2NYM+OI/ULk8BllRfWAVxtI1zKbSK26K/XWJ5
         dPZ1BtH9265q1uQJtiZW6jL6vhAQNCPI3uwA/lDi6Ytrsf7r6umtCJ7M2tNTZWJkvzIY
         70DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101777; x=1790706577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35SesrfLA70Pb575Lmwz3KSSxa/20NLRjs0pbwQY4r0=;
        b=T/pVQ7g40ONjrZZDuesHTm66KGLChUQYyqLSqj4Pa/gsAcIhOh0P3hsbaBabQYLp+L
         R3xv7TZ7O0BMdzz42NVT2g/QnuZt8FeqQLVjn1aK9UKdnqA7XMb+jctd94rQykMe1ER9
         UQNrBQ0T+yblJkYeOvuNH82L6LeeVhdmRv5VKgGml4q12YzDtAw6i+Wi4FYO316q1FZ7
         KFmd+VDX74OckuWjIOcPaa9Vn1yFFPyTT5id0qajJxAm9z9s+6jtWT6BGptQ1ipbhQBC
         U7ss3dBJ4S9lIjoRmufFdio1gg3xks6Uz4Th/EQ7ORxj3NlMTBDusHyziCgLyF/F9+mx
         wh3A==
X-Forwarded-Encrypted: i=1; AKwUvBxsjk0kS4R5ZJr2c5lrTbtV5FOtnOj+Ig+rjjufF/8RBywYAPmh1kO8BMJOfYQPcuYLtwPYlCY9BJwOZg==@vger.kernel.org
X-Gm-Message-State: AFuF++nqB3sjdKdr6SIABZeE79dEoodDbMDkufOBWoeqPYR7ncMGuP9H
	xmY0sL74J9uGDaHcJWu9Qf33VN1x4hYese6Dk+XJkVCHlFugr3xtYJEjxzkR4oaHNV6jdTQETH9
	YlErNPlJnuofPiqyTwPp4w7Ig7lkwEKB8dRS5gDofUo+ndsGO7RDRiB891vYXsjnjbA==
X-Gm-Gg: AYBFou3CTuhzVV9lT1yX2da9Y9bYFQ9btomfGi0x+S5Wkf3qNliCWmPShWcHOvulb0Z
	4Ptw5rY6CW16oEOBGAkoeHfrSfBSulQQ14nCAYFrfB7SoYKf5ICdrRkt42y2/q5pX4KGBEYkoXa
	I+SRpqd2t0GomYVRtwk7gI3IJfBDHbTO2QSkz/oJoGl5LRHnkoOxXET3aDmeF18idJ6XZIvUmaP
	FALrehiKmc6W4/9RCcj0B6Hydg6avf9tY6n78F9hy0QAYLYq51OIZJ2/FNGyMoGrXjTPrcEgMPN
	DA1RuEUYeD4QNDG3zMCejejpLqpf0nVlRSislhFzeS8CrUoJZbJqFv+TgYiTDybKNQGB4xbuOk6
	CDKVDr4QG04qTrP6O+f6/bCVheS57j8OWtA==
X-Received: by 2002:a05:693c:41db:10b0:33e:6b65:5eb6 with SMTP id 5a478bee46e88-33e8dec45f6mr125668eec.30.1790101776337;
        Tue, 22 Sep 2026 11:29:36 -0700 (PDT)
X-Received: by 2002:a05:693c:41db:10b0:33e:6b65:5eb6 with SMTP id 5a478bee46e88-33e8dec45f6mr125637eec.30.1790101775697;
        Tue, 22 Sep 2026 11:29:35 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625921asm109954eec.15.2026.09.22.11.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:29:35 -0700 (PDT)
Message-ID: <be1ca5fa-e537-4b77-974b-d0a0ab0965f1@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:59:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: eliza: Add iris video codec node
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
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
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-3-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3MSBTYWx0ZWRfX6VpToINaWv86
 i3umdqa4IKzZP3duTiJXaeySSMIJRACgRtidUyK2SuZ/HL3nrTGF7EXoi3H1dsgShgNbr51BMup
 bQD0qhwGIyf2WnGX9Lc9GBU9nNPBtbdoXc8DPY4qCOrt3GzeU2/USTeZZ/tD1pfMdPT9GzGfZvr
 Y5dGjHq5sS39mrx1lSZ+whjmCVVGyN7GrbJGddN5mzd8axKLR71jjJIVbeRNtw1fAvDiaDYymEE
 CrRtOyLywDi79IZUfmxoqmHq3Xqm930YdefKUnXce+rGm6uZt7sF+FgGOh6sgE+Y5heeAGkurGL
 ewf5DIfi4F9NOcJG/TPw/ahAjLzA9bx3bxKy0w63iFJRLH/AsStg93GfdOWRj5UE1623ktmw8co
 OUbVmcabdG2FrjoE1++dC6XcFwcZTTNdfT/fCo0LO8PspHwXeIs2rKvHQjEfWc5/6r5maRJIaSa
 mYe/Y/w9D5hRT863OGQ==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2c911 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Db7omukDTCqXEX29fTMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 8_JSf7RxomrpKglv8SidrgPSKpgeFoWd
X-Proofpoint-GUID: 8_JSf7RxomrpKglv8SidrgPSKpgeFoWd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3MSBTYWx0ZWRfX1KJ/Sm2Uqo0G
 ahLfS32t/BLKd8GTM33LR4FgSOHKo2alhOGxaTmxuFL5pMkIdok0z/F+phscCAGPHeETF0+W3Pu
 eTDiP6TK1TmDlYnuIbcZBSVvh0VullE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220271


On 9/21/2026 3:21 PM, Wangao Wang wrote:
> Describe the Iris video codec hardware found in the Eliza SoC. The iris
> node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
> GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
> codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
> support.
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
