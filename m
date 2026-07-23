Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE8C2F83B5
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822864; cv=none; b=Q0D29LoDe1lReXKQP1JojmB7rP5WnRd0ojXuwB4hKtUplk9+/CVWe0t1HDQzCMrCrHgkyrPM7g7Ve/VZrJxghzAhxLNDKTMXoAzOJyiIJBOVXh0oyS8T3ZCdiwcw4zotj5Zfc8i+HAPEUwoXllG2kN3/pA1e58mCcb+7WOQJ9h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822864; c=relaxed/simple;
	bh=jQtRW0O5nwVNNT7XofY4i+cPCBo1wrZ3oTkdn0RIoPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7e9igdXl/1ktjHLQbL7LGqkamLSr/oR6ZkBvF4Mo2vzwI2/1MA+4dRTOLiuddVC8J/+ke++jEKHd8VaynAy2Ob4EK97ARlgtUCoQ1gy6tyTxWVkoHIiXwcYhKHXKU7qV1MdkXR4YHSrXPaeDNjXQX5AVvjJFsmsfahDFpZj6U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0nuE272; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hm23Y91j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0nuE272";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hm23Y91j"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NF9W4q162561
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 16:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dMSh+AFMvwZ14SfCMbaoh4hyPzA84eMxFNhAjJ6ooE=; b=o0nuE272SCczCe6A
	VHnAoSSguW+DcHFSGpPg2eVm9BGfQ/VNpPjpVXOoTEa5Fk+MONVMk9Di8wLlh77Y
	DOKb1PgN4ca2D45u5mJ3DSsX8LIQv1pADJgRtbXMaHQysAo2N/rbN0jBJCZdVT5V
	Fe/NS+9ipqvuDut9teovwHn3R25bzIn02SbAiPRNfbZVAfg1wqHEBIrI4/BDYvn6
	/6lOXpyw27ciPOtlE0bQDEh/4EM9HovjxpHMdajfTbcpjUbGCpDjWk8XzvbZI0Du
	96fjHTlz7kgvGgO46xaVaQ63cKkHV5dyksy8JJyMaOOpxMyy4+CBN5gaI5lOr1R7
	7qrtNA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fknbmgcs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 16:07:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e6d253330so715699a91.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 09:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784822858; x=1785427658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dMSh+AFMvwZ14SfCMbaoh4hyPzA84eMxFNhAjJ6ooE=;
        b=Hm23Y91jm4CI7npYAm4GHFSsKJhfjxpJ7iRN3TZR2xqwuGqmm0eIexe5HY9+qkV+Es
         6w1ndDTftm0IaiqtauPaeQJKDB5SQpyrBi+NXCFJSkLJfZniXgome1z5678EOJkjHQ3o
         TGNCrS93AeyFMDzRsMjp3Gw6638r9Trpa/X3Gdtt6LeY4b3UvYQlIcIjYV0scK3ZcL7K
         M4iZY+CRLQ8YsyQUzyaHPMZKbeBlFkLuln26FLSLejpCoay3KgJBrkxXnCjQipERbIU3
         YyWgDQs3pA1QNVkOH9MYnLwdWE0kpl4C4EYnoi4KwceDBCIZ3W1Ckrm08wmLPm6wA7fp
         1JXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784822858; x=1785427658;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dMSh+AFMvwZ14SfCMbaoh4hyPzA84eMxFNhAjJ6ooE=;
        b=nSPxZjvW4Q3u6CZdsUhh/ZU4bU5sOvAihhiIayGD0X9Yr4qWJOKz9HiQ337INInpzk
         lmj8rTyFq8ccXOOh3WpxPiHk0cOKIqAb9HTwROVtdIMTpFNzyDSuT+vw/sq5b7FppSUx
         kozn04aWCgSoJvhRbayqJkwEdEjfJaQs17j1X4Pwu34cY/2JN/d1ulbUKuOgh0yNteoG
         EOeL1kpD3RfUXlsXkLJ2v5WmNFK+DchNIueqH7BLeHpex6v88ponc4sWVR2GPWhI8XzE
         k7kV6yb4XywudKiQ/gcwI1TRL7pmuZCXBPdtHOkPEZudB5RqqF+9ds7wLA+CbdF1smp0
         BObQ==
X-Gm-Message-State: AOJu0Yy3gArMx0+xa0oZYvroYh0+vfRDbA2KUUBhKcN98gcFtFjzZort
	Y4FtSH/thpPcw0P/80kieqB5wmm/jzPt/Byn9u23m4WMqgClPx0CIlLbvNfmztCP8v301mDGb4K
	lUTGyssN9bRHNL75ht59LAGyDaf4ltIoQ5a2JCQdXK1JEatlCGKC3umDojAfjXYgCDQ==
X-Gm-Gg: AR+sD137/Ww8fE555K5q61eEgb6ud6slCOXVTBU1sQeFQf3z82Ka4M9NqHc9qsvpj5V
	/RExG8KFPdTe3+458Y3yhuF+XtPNmOpRf07dX6Q88hQaUCtTLTebJW4pMXzOrN4Y5LppQZdoHda
	drH3m/+l6w7ywKwh8hZeRmzMgtmu6luwk0w0+rVyJlTciAmy4pvqfI9RPhzLNcuAihdaidp8KnO
	b6d8LreU7MFCYhDKldEyh0AFv8jBX3ShtNYA4rDK/ZkLPHUSZIaI9wxz7tjNaKZgLo3fD9I3wCr
	mOlqmZkZvMa9AdGNg3Zl+x88IwRE1fg8p0GBhtZcu3v5C+N6QTTh7xvz9uAQqSf91fLktqqIpQw
	L8J5Q8aRf82CAwUi3xtbztzGlseGyLdqkvjQ=
X-Received: by 2002:a17:90b:3c03:b0:38e:7e9b:5fbc with SMTP id 98e67ed59e1d1-38ec8405228mr3812767a91.7.1784822857017;
        Thu, 23 Jul 2026 09:07:37 -0700 (PDT)
X-Received: by 2002:a17:90b:3c03:b0:38e:7e9b:5fbc with SMTP id 98e67ed59e1d1-38ec8405228mr3812712a91.7.1784822856500;
        Thu, 23 Jul 2026 09:07:36 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.251.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13014d27sm17979574c88.4.2026.07.23.09.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 09:07:36 -0700 (PDT)
Message-ID: <302540f9-f784-4852-978c-f21941982164@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:37:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: iris: force stage 1 work mode for CBR RC on
 encoder
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260723-iris_multi_slice-v4-0-45f0a3fe7fce@oss.qualcomm.com>
 <20260723-iris_multi_slice-v4-2-45f0a3fe7fce@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260723-iris_multi_slice-v4-2-45f0a3fe7fce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e742j6p/ c=1 sm=1 tr=0 ts=6a623c4b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Am0+rXbGVt9FyytbsJdRwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=W2-BaTU1wbAZhcYxqcwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 0pS8Dk6azV7_4htDjvd1dtr8TPuL0Um7
X-Proofpoint-GUID: 0pS8Dk6azV7_4htDjvd1dtr8TPuL0Um7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1OSBTYWx0ZWRfXyqAHxCJ0LGXD
 ecEsROoyET0NFmpQy4HuqWCd6xmKr/zJAW/05TC+3fQM8vYG3sAD38Ty3VU91Oj2Sau1zvIIAn/
 IuZljjVxHqbtVOSWZdVBSNOP7CUj5RQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1OSBTYWx0ZWRfX88jWdMHINS/U
 UnFqVjmwBsKwefxTXj8iwvsNqqb3DPyvBR7ez/n8w3OkMjZ8QVxQySEI+ZNvZpLLEc9QCme78MA
 YlAdheF//LZXI+KrXqQEVKPvLnu1zBFVZqtz/w4bVr+Yy6KZQP2hs4uXCcLQrh3T4mJomhe5+hf
 wcbXUyIGEZUGLZWFcYYu1XT0YB1Uv4VM8GDywGSRxr/qPFCCPqr4ecvD2LYe0P85gp3hOdXSd/a
 H5t61p3KNAt92xx0OMEk/VxexmY/mFIuwW7Vif9R4zdZ2Fh8edTPc+CBv6yO3WLRV0eroKbKTeA
 ZAZ64s5HUgVapLW1rVnicUkKaemYZJzI/eB03SIhl4eygZNsGYlgaoTehaAJmstj2BnAorrRT0z
 MX2YadXtkvqXrFH4b2AcMlpznSAEV1luzxkk7VEgFRXp9DPX4pXTnnwTiz+VYg7WD0weyZtNhNF
 2jWLQq2cgavzVmJemog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230159


On 7/23/2026 3:51 PM, Sachin Kumar Garg wrote:
> iris_set_stage() currently always picks STAGE_2 for encoder sessions.
> CBR rate control requires stage 1 operation, so force STAGE_1 when
> BITRATE_MODE is set to CBR.
> 
> The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
> since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
> so iris_set_properties() would still see the previous hfi_rc_type
> when iris_set_stage() runs during initial config
> 
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Sachin Kumar Garg<sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
