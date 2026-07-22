Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBF9366DA5
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701664; cv=none; b=fAaSDM8XNTNaqCLA7J+2BC45F/yiepi2+Q5NZj+bc8pTlRpaQz6S7FNGu3ZlL4fkoJ0Z5G2k3cf/NTWx3q9VhgkmiNQbZUuFfG1QKjHsFC/VAKr4BqE6Bl6pc+SxvEES+Xi4IF5Ox0TLDJlgl8NcezgP2K6OqSXOGdkT+9qjxfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701664; c=relaxed/simple;
	bh=M6WYDLfeOUBBXgMsP6wOPCILnO8oRhz06ehXWlYrbAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rlhp5Ls8X9KFnf6aHgxD1tTa7FPy4x16mXvN03xUoGJrYvjN0G4Lo0e0PXoXBkDm8FctDSNyqgOagXd9JGdaQhG8ZtXQuAy6VZpJELYBnVtGofxUmJH1HOwGCgTgROBQ4BwapK5YrtaLW9XkyHnCcq40uElYVcbypRwHlwGCnAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSNyxVgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERDWnD8D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSNyxVgf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERDWnD8D"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M61pt0984376
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CHunJNubtfq31+Afu45uxX6l
	3Vxa9lYRWxkmXwWJHSw=; b=fSNyxVgfNOiG5WOAKyJhP+lFEiEQaXQZLaL8Psjz
	IrzL8MChovu3B0S8w2sm6C0le4DE0agRkWw3/WVrHXSPuE8VG7i9Vpk/iTWCoezM
	GJnEGjO3YXCa13SQGtbI31nCrHO+CKbvMWHtpSrwFUl9SfMnQ4x0HoC9syTjxz3P
	IL+Yc6QmBo1eWV/K7LSLTpjm1rCk6ZEVwLIRVh1csmN/DeY5BnrjMx7C4KJ/NVSZ
	DIrmLf0dqWVo1rFtT0WSjAGO+tn/4LJpV27XAUJ3qXIRvBpda+k07Y2JdoiNGv1e
	oS5E+nvf/0CoolRbag+rXWoS1hJOgVhydlbvBWHRcLesVw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr838380-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 06:27:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec3314f65fso245328166d6.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 23:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701661; x=1785306461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CHunJNubtfq31+Afu45uxX6l3Vxa9lYRWxkmXwWJHSw=;
        b=ERDWnD8Du6C2uhmP6XRvlVhbrI7qI9pHmeVkgSScaH6AAsneynPVBsCAOgEQQqxMgk
         Z+T+4landy2VPFRxv9E9A1mefRq4V+/6AXxYaf2xWvOz7Ut6ucwkj0ikGi94Dp+zjlJz
         FN55Hz97di67uIkLEq+WLohHH3oReQ++V/LR/DgEcGMhKVoQXPqLGcsXvvklT9UReAls
         jmadu/2zjRlG9FP3PFdqfv0r4WCgcJg3CBMdh9wVkCtk8fqz7Gm0/Ui5Dn0yGKHtJCnM
         7juZDNDQfq7Gc982EPVRV6IO3E7YAy8pxXfWompTR9uh0SjXd/vFSXhXNvZfe3UcxnN5
         lMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701661; x=1785306461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHunJNubtfq31+Afu45uxX6l3Vxa9lYRWxkmXwWJHSw=;
        b=dSODKlr37HdHZ5YBThzrefjHzPZFax1RoMrKTOMyAwdxtjSHDhwvyl65bC5PS+yT8y
         4FGNLu0DYTUfcprXPigTNM+A4uqR0bT/L7xP4ilaLYKh17/DtaJpnL5xWyg9hm97Sb6P
         xBr1CNjdJ6GhHBhw0PexvNBz5ISgTwpi1lCKVscukoLmbGNUpQEmj1vgLR9F7L6PGsr3
         FSwXKAa9hzGhY103xQINcTdMg0ApZs+psbpIuya0QwFi5fdAeAG54kATfsjBvqFeBeaP
         MYqAEPuRkL+z7H72kajyK2p/LCW+6lpvCWCI33TSXhGrbGEUXQEVnT3kLhM5YJURwuoK
         xojA==
X-Forwarded-Encrypted: i=1; AHgh+RoSnj5Lk5RNkCBBmOEzZZDOI7IDoR+SI1l9BtNMIR97v9Ie30Q1P6vQtlG3TPRM/IFn77p+hu8NzE3ffw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJtcGPD/cqDkYiMFnqY1PHveETTZy5AdAPJFTlgLUmm0gbOQtW
	TYWQLel7Y4sFrkuc7RumL3zJp0iASWxQel4iXtznzKaMuh8o8xAsjfgrGbI7TsEPRRJddH+hE8d
	jWK5OS8QpFrbCcC8+/zxGEq+VraumLNCow7eGgxCZ4z7+Y6PL63VRA0Q/41v4VNHwRA==
X-Gm-Gg: AR+sD11cXeAz1F1ZmmymHuUsIef6FEMcf16XE6JRaor8T5N8cgTAiWhmg3UdTXuNBY/
	ONgANe0O+006heJXXNzdLPRLUpi4DC1WTHbmpbON0vW4lMcfox72Dw51kzizJzErqiO77OEnC4v
	00/HydBSozhU7esk6ZrRUlT9szIXQcY141AyNckmtz3U6iHcZ0xzk8iGHCTdbDCwBMAXEe2KXRC
	GW8XgesB87onqFtXk4Sb93ktKS9GIYltrfvazprBgQpdSP3AQlCMtXTCssMuEEkQVRe9a9RnGoC
	WI5jqUHv4LH3hZW7JcNK8VtlvyRWEeBsGGk+3/QcTjDADgONow6zi4PcH7ix1cHKhq77peVdRSk
	IAFYsYBmShd/T1mXijQWHRtTI5CK/1XHwJqWQln8RWilwR0MgOXOJst6Bo+pwkFKPMZw1EFjONz
	4mtKQeeblz33GvVQ==
X-Received: by 2002:a05:6214:3187:b0:8f2:1d56:3e8c with SMTP id 6a1803df08f44-907783913acmr228719256d6.29.1784701661214;
        Tue, 21 Jul 2026 23:27:41 -0700 (PDT)
X-Received: by 2002:a05:6214:3187:b0:8f2:1d56:3e8c with SMTP id 6a1803df08f44-907783913acmr228719126d6.29.1784701660781;
        Tue, 21 Jul 2026 23:27:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68bc347sm2908631fa.16.2026.07.21.23.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:27:38 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:27:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
Message-ID: <sbjyp2jkzry4hsk6daea5kiqhhw56po5xoi3ahgemctkx4s5vp@m2qrpdkulglb>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-6-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-iris-code-improvement-v4-6-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: iVatJCYrHvIoVGOo8ahDg0txdwAswQOM
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a6062de cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=_sPD0ODq2fXVNPqTC0EA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iVatJCYrHvIoVGOo8ahDg0txdwAswQOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1OCBTYWx0ZWRfX2T2+xu3i8vNQ
 r1SSxYLpwEi2886ukceGKrmdZWcVuXd6zi4KnpKj91ySR2pmYgysx01GbkMyfVmXrhVvESNlFzq
 uXdzEcjgmFbQggtsez5vJAqwwkYGeP28id01LsPVMLWrCWNJeXUDeveN77XVFQVoQW76amtQy9j
 yC61rqVP/oTohIbFtZOTnilqah3qimYIs/l54RsKYJPicmBk3Joe0SVeYRl+SeHMOP40Xgg/1qU
 TGANdT1J9KSf0axzEbU9TFtuQtz7dipxwzw3aP1hdzHxCf13nr3lz12t2tGyBiWxtlY3KlRaRwF
 z9ICf5gP1RVarVBzOlmcsB3NxFrBcaH9lkDw5RXFmObGMCdjxB3EI3NBf621aYKJy8avHEKvKNZ
 7MPOUhXleaBAj9GtWxi7Vf5sI0dFVmAzsHbST6DzuZzHXSZmRmB0RomqYtD5ZA4mB+vCd2+AJxo
 F88joxp2MWGoJZJ4BVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1OCBTYWx0ZWRfX9iAbmTTeVs/q
 eIyZ+MG2eVuNr/HG/Gzl+9YeCqtfRCkjJktyW5IYUhq9QwDGKvohbik2kfiTy938MLAtalUgrHv
 W9HOJFwbhsuDmc6LIdlRudZHYPr9CAA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220058

On Tue, Jul 21, 2026 at 07:50:39AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Without the break the AV1 case falls through, risking unintended behaviour
> if new cases are added after it.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
