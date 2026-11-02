Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626371;
	b=lrefdr3kcKAPTpx9QrjW+waNWntedOD8XVD05rhOmCHsVoxt0DN0Epb7iwC4f5qHQVvY
	 HhCLuVbnmH3zz+8/IoMqlZqqdoNMfXqsm+QX57e77nmITn0jvxsvTqtem3BWcRo5cozbe
	 BdNMWw8geT4gogN+KPv2CzpQiXSZ+/fMHvwSMl3qeJBfgPK0mlyc0AiEFDtFZjfFqlnPQ
	 GLpCP4D221roB8tbhBOSeoSNCSu+kjYpVGmyvX3/Pw2nKhQqYD2us/pio05/MzcUh0rQw
	 9sIHw9Hnm2h8g/5Y1GtiBczC0s5oIG9aWWSKIgjPurqKlii+6zbBeNWidwskSzet6qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=;
	b=mIL5jhJJyRc9Czl+L4d3XmiN9fuvDEl+cM8beYK8lY3vL24pNjVENyQGYBx4ubWobCUp
	 pzr+iBCJIg+HKgRT4yk9/Qcj2NuSuDZfX41fYSGSfiPbHzHEZ0sjskUT4CvDB3YnW9FsK
	 YrEsR0SUfmxUthahRgILMnblgJgSodL7cRRpTNOA4eF8D7kYmSBTWOeWmd+L5CCJU0CoY
	 fIkeJ9JpsWK1y5dyqNuVlarBmmLqHXfon05PhhUPO1MqPfGFknkz4EsPsxP92hS5OtNY9
	 jab19rXBgSR2RcHW89HLENzFdQ6XweB9LCAjVXjOWye+qxVONRM3kymcfV2MpTVZi0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGqHquVV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCJKjvhc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A9160A2603
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 13:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A9160A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGqHquVV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCJKjvhc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAJ3M804649
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 13:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=; b=MGqHquVVfmYGpZUf
	UHJfPKtiltdD0yKxc2fIXQfjt9UTfEzqzFKdIUbRdGKDQMSFaJShA/ae4wrTmx4E
	+v/G3O4Lnb4ar85ZF397Wvi2Qr5JOoiD60EYPbKlJS0H+luWBfkr4FXboqs5p2bD
	VtmWiW5Oqr5/HKmXFMaLSR0gkR/BMJ4RtYj6PXW0LksE6zjtLMSrypBGtuUhFPyL
	XW2i4+3qXHUCV0JMqVAKAft5qHgbmkrW3Zm/RH8pkI+v8FNgihIfWlGZcmFkzxu0
	PRq3LudY6pr5Dfeib0rzJ/GBmbQ7IDmGS43TNHIG1afdhJytoRFsbHYyL7lWK+KX
	p8arDA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvs0a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 13:32:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso3703452eec.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626370; x=1794231170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=;
        b=gCJKjvhcA+byKOSpmFteUfTaQK7HOsStb8s5XEkLXKKDjKKDLnEyNqnpp2nz9oQgpe
         WYdscClccfWvfUrTt+9nCIvZi7TpCr7+S7SJDFuI+6YmrYXHp4e/R2iRkUFq/5S9rL0A
         f5YQNSPiQKTufq0Pw5xUuqIPdmOpgKVP8efzmvxW8WeZdJWWeZHV7FcaYZ3VP7kqcIgE
         oY0Dplh4ghpAHjGZPOgHtuggZV/hFU3qK45PhpzMbyKbe+M58/Aao/OCsjAHEB0UrayV
         F8Bzq0d9ELb+ovJKi9L7arYnkqM0YQQaNoI29s8TcJnKQ8q69O90Hg4bq9b+fmJIvAaM
         vpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626370; x=1794231170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=;
        b=DL6hW2yv5lWL6DCpxIEC1Gy4lmOcmr8ZsObvkLjEfUa3oYekR9JuYY+/oDx1VirHjw
         5wVOXRx66K0wMHr9Zn9CvN0fEkvTBeZhw6g8IQYE74f1yjEVnV+dcrC280E/LO2+X908
         LZI0pAXqza1H7FidvxnSOO2hR2ZFbxYxszOPdt00jfzXBZi639FwO9dvEr8mMJ2tAazg
         GqF7Fhp/jsV6sJ26T05yRXh6G6GWPQCyhPkbogqzzyfPfrDD4rMVAuBZOPDrgDcp6KHJ
         NUvAmbkkpu5ZDmu75Us3vyYPzRegKDWcejHkzUsZyUvZCmbjIrqnlNxTP1dCT3VJSAAz
         qEgw==
X-Gm-Message-State: APuU4Z8eZtGrqqHgktJX/pWHKXGzt2EvaqWM++Rc30BfZHjmsm4jcHxx
	FGZXXPe7M4ZlsuL8KBGW/mWeVJlgpHYbYRwNSWPsnHdR60p2LdR9HyL5hso+EMpIKrgPDNqk3gA
	kjufyMuFOTj6wkcjLbJKxhFWON7TNOCEhghjtJyvAuefevsXVvnlLTRkvNA4d1rOoUA==
X-Gm-Gg: AYBFou0K/VMAE1WSE8hLSEMhzvJFYW7Q3pFICTPzff/xEhc9M1IlpRX90f/d4X5USot
	DWIZ1EBTRHJd9k6CeywVlQXN1unD8PLwIeO/ywcKoIJhRq9Pp+mzrFK+bzbv0rSUuiJXABAjitx
	ku7S0gjERMyZVjqgx33X5+e4tE5U5b/wxNN1PMkVBelZ3Zw8eOdbeGmMfpDomRNFUjO/Ax/RztI
	togcSkLkNXC+iu6oYgIAfBMNVfw77ay4JUKJ7a4DHGKv15U8QKZM5An0nxvdPW3jcLQP9kyOdr+
	FameXEEzZl82bSbU87OxA/qXUVb/U7SvTnPZEwsxIod+Sm+5y8KUTzsJVAmPPOzmQmsNS/gbMlf
	rqUkkFll6D8MA6Kx30W9AHW9Hwd4JF/nk9pMFlixXO/4iH4aU1U+mXlODrpnEuSoKQ6ezV5qwLu
	is/s2arQ==
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id 5a478bee46e88-36a423454b2mr17425573eec.12.1793626369472;
        Mon, 02 Nov 2026 05:32:49 -0800 (PST)
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id 5a478bee46e88-36a423454b2mr17425524eec.12.1793626368612;
        Mon, 02 Nov 2026 05:32:48 -0800 (PST)
Received: from [10.204.101.201] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm17186741eec.17.2026.11.02.05.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:32:48 -0800 (PST)
Message-ID: <74397996-99e1-423d-9a0c-dc17ff013239@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:02:42 +0530
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
Subject: Re: [PATCH 1/3] media: iris: Fix runtime PM reference imbalance on
 failed resume
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
 <20261017-iris-handle-unbind-v1-1-7809148eb90f@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261017-iris-handle-unbind-v1-1-7809148eb90f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae89102 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fnL9iuGchlDLWTthXDkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: HVx38mffJjtsP_XcDXhAQF2B3N59apEi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX4H8Yx/qYy2YH
 9lGwShrVCs99HvqgM7FcHJRPrnwgkW0O2TbThdTjDkhnjftoZkFSAd1NUplO6zEj+bGTieDjukH
 EEG1HzblsdGhBmNmQoqWq6HvQSvpY8A=
X-Proofpoint-ORIG-GUID: HVx38mffJjtsP_XcDXhAQF2B3N59apEi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX/x9WgvVJXdDd
 wd2+ExxcYHCCaaZChCeqndfxW7vXf/F/S1B4BVsZoeoox6L6sdpJiiyH4XhN9/9BlrodnVZWevv
 3sqNRW2a4t+GepcLpTx5SDyxf4S/EzGW5CmryHUeT7LkzkTabT/G//6m2aim8F15NoC3VXln//T
 tAqM/yFrYa4Gvmwp7FqgF43taoaUv5fSAOM0KkjPed7ibB1OGvGfr1R86cCa1QHalLTCJRmLXF0
 nAdE0XcBeidKBXmcsn03ex1zyUrZUo6bys2wVKLzm9Kf/KMdd8WGVh4yjGflYqTJS1oPSjHWpiL
 ravJ1u27GbxpMSjdN7xdVo1cUnP7Wem9LMHBBwCPqCQvLoGCM4mBEVeQwMOg9yr3QwIc5e6Jzsb
 4aOovmHY0JSHXIcAkjgqjA2nVtFermwcxT3ILToCMUcXwSptQXOq1v/R/9f2EQ+MdeUeOEzReZz
 R/EPAMOLg+Xm9sl6V5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053



On 10/17/2026 8:46 AM, Vishnu Reddy wrote:
> pm_runtime_resume_and_get() drops its usage count when the resume
> fails. iris_hfi_queue_cmd_write() dropped it a second time on that
> path, resulting in a runtime PM usage count underflow warning:
> 
>    qcom-iris aa00000.video-codec: Runtime PM usage count underflow!
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
