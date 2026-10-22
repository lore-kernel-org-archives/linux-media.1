Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637516;
	b=SLK+QMdMSq06Y246aRG+SW/3eOHHwXf/7aZVZkNT0B5wITpT7QsVUphNT9DoEEjYb9Od
	 b5JbmgwbB+BBdgnwkhugLy2Stmx+GEyJFp+rpcHmvv/gvlkVI+E/CAYUCDOq7T7dgJ+C1
	 z9ZSRqVDmJMSev3RlfFN4ppdp3032BZ5GWqUg+/tM81IDM2+2j96nuz74qUBS7LJkHwrR
	 6vRzJhJ7BlJdZMt62A99Yj72MZeMYi9FK+hLGLDgWulGLvDVI5EKdBXz1trvw/eOL3QkL
	 8eLFpeC4isM4ik5awpx7T5wFDYsXbSF4ZccdZL8OHFy87QJqK3ZedH1MVPUzPvc5ovQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=;
	b=mckYfXw3ZpQbGttSSLiyY9qSAKxWY4C3JSUvaDWRvB/eXo1mSo9p15FbxPAI4hzSE54t
	 aFjypBxuWEJZjEisUH3p2RpMHt0GpFDkl38Kq/Veg/yIqQ89d+F1oSi5yVRz2D9GQBCwv
	 lcULI5iz7P3x/mq3JJYX81mFBrzuP6OxoV+m3G5ZYlUuJ2yL3M3cesvz3iV3oHRmWmfsD
	 z7m/gpQRJ2U3Vjml/1cYy14xeXxMmdc0I1QZ30wRTlxbgk7MZAy2m/gtVN0mbqQ9Nmzrz
	 GQXGzfvnqKcU0WWsnFmLim6Sv3tx07TSdCsmocuWts+iEQai6kTAYy0Mv5/hvK5WiNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CNJXcpTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNwbPXru;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE37606A31D
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 02:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE37606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CNJXcpTA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNwbPXru
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1iMjN3412346
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 02:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=; b=CNJXcpTA2NqGIjg8
	DsF6XL5RmacyN91f/g5iMEcJjRP9UzMQz1s1gxJpNOt7Ncx6gpgj1tbHST2S3d9n
	4tMii8WolkF8tV/Px5C5S2L21+gk8PSVvSuEEks9VruAKFb9hYsR2cJh8VpNvfUF
	emFOiFpiSV7dFtoaPs++kEL2gi6ozsS6F7fF+svNdIa7g4x/PZfB5d0UrtGEWtH1
	hNECfQS7QN+NFVxtR201pKjF2Dk6VaK06GrmIdyR+tkjY35OGFc2Za23BZhchuvG
	3Vr+Pcy+h/7C+eF92362gAsIV7wMh2WbXd1NkA3NWs7Av+JvEykTqghNc6f2QF1Z
	2R4ZEA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93agcq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 02:51:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9501034c4so21576065ad.0
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792637514; x=1793242314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=;
        b=dNwbPXruhGc/r24tp5UBqqV+GU5qX77/qPStdXvSW6jx0bqFmmAGVEBdwaG5xuMN7M
         5y/SkuuQKfYH/r1szjIZapFyufmdsyMMHWIibl5dPxI/b9/oFZbtSSx4ioEOKy9E6Rmc
         Vt9sMTUQ+sfXnin28tMY6SA2tnYEO18pI84bAxOkDBul03jKaH60kTtNdjKYGbtHc8gX
         4A4Geac7YQaNNxAQcmEVdHioiXNGr50IDrGeRWZA/Wp17nxjf8bVRJzjOAxjmEU8VE5P
         /J8r5f9BegJ8HMu0V5+sGDPTUeYCuYepU/ocmtQYlajvSFgp6PokD+cnsq8CuGKku8V+
         VhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637514; x=1793242314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=;
        b=MkLP8Rl7bWMRT/ZjwzSfMIxUBsBurpoo3u0V4lJlEXDPxbBf9Pk8kl9uAHgVAJ0aoe
         yX0p9VIzH+e6COAnrck+xDS5koAN3YdWGvenk2EEpyL0ak7wUWSYBhkHTVU49LZwQ5+e
         x9n/1OSTuQ2yvh6YSnkIe1M6L+qHyQ61HhcA7QVSdk6mPqib1bk9JAGekoT/AXKMpo4M
         nU8mXQsAJGe8Euc5uHjaTRgctLccQ6ir8+izZMkHAop/NKwdl3D0XuraP0Ae4OnIst+o
         7FsvzSuLkupfHg6XwDufz+h+1SGSrxAXgPJsh3y7rnc/rmgL+9tn1sPKzDEaXuXsHJcW
         UDTA==
X-Forwarded-Encrypted: i=1; AKwUvBw2cbL6+47SNxcUSrszwpE+6nlrJOholBZNMG7s2jX+LNtIK6ps0TBujDQnb7iO4RGiAw4YgaNFh/cm7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhYJuTv2IhdCb/CifxswKtuy4Ax0TZQd9JhviA6uyYH6XE0qjz
	cncOJcD2eJBozQzTVzpSMKtz5Lgm8Po6AZDnwq7ly7r0M21Wc9nPAGGvmJ6SAllPH2DMefLdtv/
	jceguRtTpZH/9GWBBoUfbEHwNpXC0TWCvZY0Y1H4dDufAuXZQ/UYiX3MrAgC3fSYUBw==
X-Gm-Gg: AYBFou3a5wrwuq9EMX0E/NnyAxiTmcW5V3lueNiX4L9e+uNxGpJWLPIhGWXXxm6SO7I
	KrqZnI1Ny5UYj+FlRf7o+VgK5/2CgVXbG9mlwltB0NthrseSb7ehEBugqEOw6Qgq3lePtoUgV7b
	g5VYyXEF5Aw8DRKJKiC8yzmUedAtAvOCxZ6H0rpnUI88175Ugp0UHA2sm4z9v26DIQn3BtWfdrf
	btf6fKAHPecYVrGh6cUd/fKL1nt+/jZaXQSgEAmfMN4casb16rkV/6dqhkFqwcnQBVOqBRnzWbA
	rpr8xMOkoc4D9LQya34I/Kc21WKIg5vS9mlL9uwMsq/ePzTTX6oGaNxjXUPYZLooGq2BeLCQKU2
	ZdKPWmyIoho1nfzunFdSUqhdtJnL261zyJ2EKtLxT2Hwl48ARg1fPzCso/JAs
X-Received: by 2002:a17:902:ce83:b0:2e9:3d65:22f1 with SMTP id d9443c01a7336-2ea439fbc95mr34017635ad.20.1792637514134;
        Wed, 21 Oct 2026 19:51:54 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:2e9:3d65:22f1 with SMTP id d9443c01a7336-2ea439fbc95mr34017315ad.20.1792637513713;
        Wed, 21 Oct 2026 19:51:53 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4113b6sm17063935ad.19.2026.10.21.19.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:51:53 -0700 (PDT)
Message-ID: <4bfbd19a-5fda-4859-89d9-60e40950dac5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:51:46 +0800
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-11-04fd28d815c6@oss.qualcomm.com>
 <f275d9de-a51b-400b-83ad-298d0fc9eda8@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <f275d9de-a51b-400b-83ad-298d0fc9eda8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfX+nqV3MvZwsw6
 0dOX50updZCs7F9ixOjpXnzC+bSpmTzCifrZXN+8uL8Ky/sExsAIhttyMftAaE3yqyGkdIq6y+p
 fJQTc6moj8RB2HzR8Y/IsDYnFbZuevnwjDnlzDh8snosutmg57uVkPyWXNV+LfOvNk5z1j7U9tZ
 u0/pj85jzFeR5GHvzOnuckEYDdplvXENQvnpGwggdpGvP9paoCfJ0o0QP7oGNKE3ed+DX9sMi0e
 xdiwn1N4pJhs9NfS1+GH86tIzvevmqgvbipqhWMo8fwrhy+Xq/GIr5Tu5deC/lX+a+Ih6OW+m/w
 qU+7wblYaPexzSGghMnpp6jLySzmpC3zvck+yBLvoioMFdEhYavLtfRMYksEPGZQPvPlRVM7tfe
 4Obm1H8aTEkucM24ibvpPvNTTqgS8qH9PBeI0BNNJr1qfW/x0MRVAjpm91dSo3rA4daesE3Zq2x
 bOfBcMn4V7lN6jZxiKA==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad97a4a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GmJ2lDigl4HxMnUU5kcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 5KAs5l5f-JtFdqGbsKhsfFT5ilsmD__A
X-Proofpoint-GUID: 5KAs5l5f-JtFdqGbsKhsfFT5ilsmD__A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfX8z0Pq4sJJL+4
 6t1fmWjh7q2By7CQXzk3DQANAcfoamgStGMuEKFZEUskhp8XBXJw6HGRHm/gOyq0Ze+QuJw2Drj
 BTJd8FuqjlBYcnxrlAXcnZGSXRPnPQc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220011

On 10/21/2026 9:59 PM, Konrad Dybcio wrote:
> On 10/12/26 8:45 AM, Hangxiang Ma wrote:
>> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
>> can be enabled by board device trees.
> 
> [...]
> 
>> +			      <0x0 0x09191000 0x0 0x20000>,
>> +			      <0x0 0x092dc000 0x0 0x1300>,
>> +			      <0x0 0x092f0000 0x0 0x1300>;
>> +
>> +			reg-names = "csid0",
> 
> Please remove the stray \ns between each pair of xxx and
> xxx-names
> 
> otherwise
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Ack. Thanks!

---
Best Regards,
Hangxiang
