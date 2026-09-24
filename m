Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274412D8DC4
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 06:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790229682; cv=none; b=B/2ioqJSmPWuYLKkIsD3y5AVTOtgPDEFUqrMufOS/1FU/RuhULhdDTKEpp/KPi+Yc0d0uyhHW8du/C9hx4aqp81OksQcW33KBYRQthuVVbZSJGIELSZh3OSd7ozVr24WZ+vXTs23tTmrdxexiXqI4FPzpPTgAZjUP2uZkTOTL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790229682; c=relaxed/simple;
	bh=sZH0RG9xYYcnMn17IqWz91Mvah4dkJO5Tvq7b04DPUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+QAKr0aSzYmTzdZCD5RLcUquOLBj2/ATnbKXTV7Nry8rrBAsJF4paKbz+or23hSM3e2dmHTlAbOtKmx+SEhW5yY30SQOimxw9gGZQrrQ/TsolPrLaV0j+arWE07NJVZi3+u2SyfzILmOR2TGlfJXAV06lhzF9e/kSExy2gXcYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OyPyZurN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JoFx6YLa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OyPyZurN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JoFx6YLa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eIo9772563
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 06:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36SCu595fBrAhzUja5qO5b1ec1y+vrmrZIti2coMSts=; b=OyPyZurNVLfEgYX7
	baIy/TY8ui3COJ1XpoQJJjMyEFxEU0uoY9zx8zNH7KrXnIqBe/eRJISRLj6O0WbB
	HdwfGHemPvsozsij7TzrIX3gLVFq6OQ778FFMReSHE1Hb1sgdrNg6YuVy9G40x9X
	uaD9A8gVSAZCdU124e1z2QlxNKehVEt99yXwdBS2UsCuyalZAjFnIImc72x68Ud0
	xP6J2qQQmnHBZa6KGB5MUfr7KRISJ9LMnzXbRpaDsSORs+2G+esEvtFzVXf17Vxz
	7SrjtHMYLC1Pt3tJgfGJYc+4LwFSz789AQQ1pI54Rr8ZJWORaYDzttrsSr9PEoBX
	nLa8zg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90977w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 06:01:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so3843807a91.0
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 23:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790229679; x=1790834479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36SCu595fBrAhzUja5qO5b1ec1y+vrmrZIti2coMSts=;
        b=JoFx6YLaJxvXKHMwbjYfxIoCwQRIogeH5KErtAS2mIPf8wtMHhGBgKIPSfY60pEiP5
         TWlGARlnK5Xaws9Zo/wq7/c8Rg3YKXwxX4EIaBMRc3Wox4ib2F21SujGv5Z4kyvs3kxn
         x4uZmoDj5tPjUbXZMZ1QZNXLsLCsLxaGNeIT184wNtlwzcR7R4KBkFzFzqSrBCOszXKU
         vEo3CBfmRQxfgE33z5XAaDHgk36Xom9CqEn6wCVOyYbEIisAmtb3Gnae49PnrBU/ZffA
         9DPf1PuVsIu6KObIpvZMfMO+90w6w1RQAu2Hs3Tt+In8CpaacsPRBpY9vHlmxtjhn6J+
         Ajzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790229679; x=1790834479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36SCu595fBrAhzUja5qO5b1ec1y+vrmrZIti2coMSts=;
        b=v3Ve9Rga7kTfH2vVfKQIPSPTGXlt4CPr9pRy2f6QI/E4CUvRhwmvcqqdDI0Orpx4Hu
         jpbPBnoPLbDnEBUNmm8v4HUL2RK1asT9+EaMAcsva8jBLsvLqDu7E0ji57MCml47E7zx
         DftsL8BVBuQJkLYBlOwgXdQZBnzVam4TouPdtHa5fnhCNFV9cbHNa2gGR7IIwtQJojdS
         vesccA4bsS89kcoBKQPfMh77ec/fMOkZ3aU6N90k2vBaS4M9QR3GH0hC0V2Jjv9oF3OA
         Vs9+QTtyBrFR3jl24idYPMkq9/ldW1JdhmNxSlmSwCakHc7mlQYsHC10GzdwbizqMaI9
         gzXQ==
X-Forwarded-Encrypted: i=1; AKwUvByk/wfEk/78MR7+qtUaUZvdbaU4HEtvygbu8wNhjFPAZJf/aLURwbEjXPd9rF5IwmvBWRgGQUlY+HG4Cw==@vger.kernel.org
X-Gm-Message-State: AFuF++lkzVQ0WZwcU1afjVytT+IwOnGnbtc+m5+rEyW9SywUj3Drugm3
	KSu5nZ96ckR5WHO09JddAQrhdmEUctk6phcP3JYOJY9E1quzNXgPNIKNggBw7hQ4ZN7e7lsobwd
	kMqSfKTsaP6i1bz8SalVAUwshEzpVMTECwulSUs5PXpJScql8Pu1taikdR/t72u6/Pg==
X-Gm-Gg: AYBFou2ra6SgX64nAIkWsk7xCX9Hh3LS03sKQMRmNh+sX9jlhgDJHndAN4HIJeJLv0+
	mdFzgIghcFlM8xcS2ePO50mUZ6LLzl4t9+XmxnLeRIBOvphaYK4vhvyEiQZHSiINaisCLHb//+3
	2Ovn8ovSDWLGzr0S5ZIJ7eWN0oNA43f0O5D3449+arjRJAa3wnnrqQ6g7P/N0IJgHEIAylI8XDi
	G2Z7XOqbqM/Vl34CNWl33P8ItVVAMgwe2wJv9RdbU/sx4IsYFq2ADpjvP+SPAfN9Yfx9hN7Mopa
	/ez3YljS4OhNwGixh+OWv3I5mQFuFp5WNQSO7Mh8+M3jYDRvZcFLcpS7kQnpjUHCwNbXnroPzkr
	DJ2p7f92F+kCgLbsZbhbLzU0esqk=
X-Received: by 2002:a17:90b:3c0e:b0:39e:4c81:6c95 with SMTP id 98e67ed59e1d1-3a098dbb040mr1336693a91.27.1790229679590;
        Wed, 23 Sep 2026 23:01:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0e:b0:39e:4c81:6c95 with SMTP id 98e67ed59e1d1-3a098dbb040mr1336662a91.27.1790229679096;
        Wed, 23 Sep 2026 23:01:19 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09733f48fsm2861152a91.11.2026.09.23.23.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:01:18 -0700 (PDT)
Message-ID: <233a246c-1cb0-42d2-b752-aaa208e1ffe4@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:31:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/15] media: qcom: camss: Add Hawi compatible camss
 driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
 <-SfKe1h9v_GKikJ1GpSP9vCzngJ7rE-jLyFCc419KBCuxpKK_kH33Xd65VtCIyoH80D_SMZP306pJZ7aKnpxdw==@protonmail.internalid>
 <20260923-hawi-maili-camss-v1-5-cbbb42e534ef@oss.qualcomm.com>
 <df6d93bc-b0c1-489f-9ca2-7de4d355ceb6@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <df6d93bc-b0c1-489f-9ca2-7de4d355ceb6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNSBTYWx0ZWRfX40Kp6bQ4VQx3
 uh9poNijYYKubFSCfj+qootmrhqPLiflg5EIjcBgeN4j1mIuzkF7TdypsztUs3sir4YhHtcqAGX
 +RZaA4MsjZU/O1U++pRKvN4WrEZXNFY=
X-Proofpoint-GUID: UOaQrYdFmr2NntSKBYsIG2y3CnffWvao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNSBTYWx0ZWRfX6sNw6vzMYD/Z
 Iupe8QVEDpXZplxWjKb/7tl/poGLKCwDLr/hjJH2Elug/8PVOBhBiy87dcpWK0wq0sTWAAK5gd+
 Loz0eQs7C8b15L5TzA9VGab4N8OzmnyRnLQCp2kEyHMNclpEseZQnbq9Q7TDohfsv2R/jTRUfm5
 shfCdRLt16NKFwhHD8u0wGBTM0GpgDumtidepIFfdYIckgMdI3rTYWcKHTgu52ypDC4N1GOpm0u
 JU4MYlMj9MHowvirY9lh2RC5F9Hllp8WHX7GbdeqzYYJrfE8U5ubCKVq0JlX8mft+N1tP9xriRP
 tN9nhhR2urVc/qHp3xuSBxOwZjlcCBp9r1naQRim2Ij9tRZ65YWiEORlDalS4tvt13mHcQ/xAm4
 +ZCRkHMp8Zs8iqDumJCFoHZVLRtaeG6HRhqvo5zULPBmRXEI9A1OX6oDTznibZ+1EDCK/74w6mC
 MkAt8l1IZWLFohx18Hw==
X-Proofpoint-ORIG-GUID: UOaQrYdFmr2NntSKBYsIG2y3CnffWvao
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4bcb0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1yR11Y51etnruO7JmzUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240025



On 23-09-2026 18:00, Bryan O'Donoghue wrote:
>> Add support for Hawi in the camss driver. Hawi reuses the CSIPHY
>> resource table from Kaanapali and the TPG resource table from
>> X1E80100. The CSID and VFE resource tables are Hawi-specific.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> 
> Missing Co-Developed-by:
> 
Co-developed-by: is for authorship only (submitting-patches.rst). I didn't co-write this patch —
Signed-off-by: alone is correct here.

For patches where I actually co-authored the code, I've already added the Co-developed-by: tag.

>> --- 
...
>> +                { 0 } },
>> +        .reg = { "vfe0" },
>> +        .interrupt = { "vfe0" },
>> +        .vfe = {
>> +            .line_num = 3,
>> +            .is_lite = false,
> 
> You should only have to set is_lite = true when it is true.
> 
ACK

>> +            .reg_update_after_csid_config = true,
>> +            .has_pd = true,
>> +            .pd_name = "ife0",
>> +            .hw_ops = &vfe_ops_gen4,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE1 - TFE Full */ 
---
Regards,
Nihal Kumar Gupta
