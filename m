Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC24E06D3
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645312; cv=none; b=tug3GVecCquFmKaS8JGMhDGnyDZ5p4j9IPZvNUMk+bZ4C2hnOBwwwbAFgDBTtuxF3xVTltfKBnqxhkI8UBIXfwNSZMK9zntIkzC2f403khPgDXx/PQULuXufY2xOJfhOIUF8l1QnAMi/54N1JESogiZJnWKi8w2HMCjHmUTCuP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645312; c=relaxed/simple;
	bh=v2MHTBzON2DK0lgcpN2sk1eAnI/V6LUGFqU1FW4ihmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3Se4Wa/X2sOosZPCwNciwpiES6Mh9WQCKyd9jJ6v6R8eBLlvk9vPS0qpn3HncSAeOmysJ9UGS4GiV3flHyZDoqyfUXeB9jOsSqJhqb+qlQIwIv10aMOLEYaGULx23zabG3uTLIqZhYeCZoISwNvsPzMVF3m8qNmE4yTgVGOOIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBFjUsvi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyeYz7i/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBFjUsvi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyeYz7i/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZbpA612951
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Bs8osBMXoukK4PFadPl9cbl6mgtCbhoAHX5DtiwJoY=; b=mBFjUsvi/If+6VvW
	pzTTQiMkWV95L3uEH0j++5bGI0ay/3pnzF2QZoN/PV2yIiITPSlGWb8gwtg6Zovg
	QAKkOFlKl3jx8UgcFrGXoLAxsVJHiKlXpb7KXW0nAiK7UM6hNJJ+G3k/1glgv19O
	35vJxdETkQrgyLkrZ9RT3HDCCGt1XnjNAYo5aShWH7C95ByciB3nhm2aO8epfd+e
	2mJgjSrF0yeGTiNRCHMU2BFWfWL5yEsD+mlkIyepGpgoj79e+/RSm3LXtv6m5n7h
	M052MuuLGN66mnc1fSGV7NukyoCJAOPUn/EQ6SfcbJ9pEsWhhbDAvt2Jva9H7yT8
	rSiuKg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0rvvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 11:41:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6fb956002so10618775ad.1
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 04:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645308; x=1790250108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Bs8osBMXoukK4PFadPl9cbl6mgtCbhoAHX5DtiwJoY=;
        b=IyeYz7i/KIIHYPLa1S0haaOdFaxZls0HBjlYoOp8r/vTC7H0v624iH+PajIw6m/hT6
         udbBhK9QTZmhi3Tr9NLNS/ysGl9nJHWhE1+MsM2uLw+hN6g6ZxFHBpuP9PM4yFnJy+8X
         V81+ms2YXBodcL/I7RQsV3+nlDQYZSS6TIfX2vsZZJjy8Mp0aPFMYDr4ourhssDZFXk4
         jz45IRLZnoLFveJvb53HHiUelpMdFZbGFefkYQ7dBNxYJU9YWGvuVxtbNRuuM9vlnq6T
         87mvVNXEuJTdKGE4fELTLDmvCnSC8K5Sg0ds4c5jFiSP9CB9qnz3qCZHDOClU0YIrV+S
         EamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645308; x=1790250108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Bs8osBMXoukK4PFadPl9cbl6mgtCbhoAHX5DtiwJoY=;
        b=VLocSLicZBLDbrECbGZi5/7F+SEDZUNTaha1KQctAeGEbx+MaIZ1af3UfqTkQup3IF
         ip582kd/qWL9IO+3QJj48V8d7DGWc1Ddy9R7hXPoKh41JnsXUo8AscPlJ8cuhRjG6P40
         oNXwunip2RCIvDEzUhcP5/aiGJxJ9vbEGISWQw8BguPqlI2tuY7It5Xv93yvN14Zmtyb
         mWOXrB/WE48RW49kR8tS/KuGxCbEchAArbGajCE6HdHPmpvSx2qQ/sGEWzRcAVzkQZFj
         dCZFrAXHJPQvHWizNyiBhIBsWNax6rpI5MOjZz+gHjac3L0+bKb50vwKIWbQcBf//P3h
         mjJw==
X-Forwarded-Encrypted: i=1; AKwUvByl5zigGLJk05db3JIZD6VLVNgmMHQjD/XfTRbLs0R2yax9r+ikOVFiS/pvqVJN5h+FqFbJWxrqBs3PYQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lk37SiZ9oFmdov9PRtUqfx5ifAkUrCZMlEFkD3li+Yws/rOj7/
	CPW68L6nn8I9h+Pr8ke0GVQj40zpJyP4IoQgtwPjzlpZMKHhQ+deiBt1KOlLHerOrtjwJSlZJg5
	QebSGW1mnrQCY/GwayYUJTIaFn+7/kwmu0SzEyXXZTxSOe0Ue+BB9XGQeN0HHWPZO/Q==
X-Gm-Gg: AYBFou0R62J0+w9ak011M/c+inm79BoPL08OX8j0dS+cjZ54NS2ZmgdCTyKCAV7uR0+
	WagwYTkI1riTz+2NL08MDbzUm9H531wjlscyGErAUGIuXcH035+B5xMc2gUrup45o6fhtW45T7C
	YQl1iGIe9KTk1uLn+gAuU7t4O8eQsyjxmbM3mo7CbY64M/WoS50b2NRgoRzBRBx1UqYyDFHtppH
	7zCnmvUdMHrwH6SgPlN/ZJ7BtP1d5PlL7Gc5lXRRRDPexJJO1N7piYVLevieNYm2W2oOecINxnW
	yPj4acXVlgpTB6ES5NpFvOeWa3NTaESiL2MHwK0Tf3NLJfZcEE82s3PuXx+FIuLJxoeU+wW2mdz
	FNp6DBsjEEvdXV0pL3R0lUNGwj2c80Ds3uvE=
X-Received: by 2002:a05:6a20:918e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3dd5f7b25d9mr16200129637.28.1789645307711;
        Thu, 17 Sep 2026 04:41:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3dd5f7b25d9mr16200066637.28.1789645307271;
        Thu, 17 Sep 2026 04:41:47 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.137.165])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm16363362eec.16.2026.09.17.04.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:41:46 -0700 (PDT)
Message-ID: <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
 <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
 <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ec1MX4E4YtrsqGf67YeDTI-1wq303pO1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXyDsIGmtrIdKq
 WRSkuZaoCqBaHiWDF0EvI0G+m9kmmMbtIA0CFMBSHVUIlZspGmnPcdab6jFrq/kaq7IN25grZ5Q
 3Ay4pPr+fB9CYuKbC5aVkXI1hi2/NY0=
X-Proofpoint-GUID: Ec1MX4E4YtrsqGf67YeDTI-1wq303pO1
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabd1fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=/MhRiX8TZM4BB34AAREmLw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uP37DjD_T1UKT6mrzMwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXx01WcvzUYJVF
 1RblVLvUkiOME1eLtvom79tuO3Ub1+WmhYJtOSAHJVGFlZKfqYzsEnxBGyFhCY5vXbhc1gk9vHD
 TVS5nKcbAySqR6LMk52a+DpZig0Cf9FKBgoE8ZMFqKxrMw0fId7jkgpy9jD5FlBMacsi1Z2F7Fn
 gecbS9r4Q1HR6hqkM0wpjdPOdN9ECX16nSLTa7rcZkYOhtMperl/jO7dPF3YnVrB7Xf5cZbdw5P
 bNrYoWINCSALcat4gqWvIDUPeYj/PAIL23clJxbDYFw2N/4+qTiIsU7vFU80s7OeTzMXy+M09eU
 9VT3RylHnaDPTMXmhtaGPXjtU0NUXrcu/l1z0JN7YZdAb+tL4ghKJbW3aQ7zPkBAGo4WVjK7sye
 V8woslsrCnhhbr+1LbB6/xBhSd+Mx2fgc4N0L4RzpIUzEIkdSc3Kngifp4iRooDQz1qzf7KppJq
 WEXNT3M8OpVVh6Y0ERg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170162

Hi Sumit,

On 9/14/2026 11:44 AM, Sumit Garg wrote:
> Hey Konrad,
> 
> On Fri, Sep 11, 2026 at 7:54 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/11/26 2:38 PM, Sumit Garg wrote:
>>> From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>
>>> qcom_scm_mem_protect_video_var() is only serviced by the SCM backend;
>>> with OP-TEE the TEE owns secure memory protection. Use
>>> qcom_pas_get_backend() to issue the SCM call only for the SCM backend.
>>>
>>> Assisted-by: Copilot:claude-opus-4.8
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
>>> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +     /*
>>> +      * qcom_scm_mem_protect_video_var() only applies to the SCM backend;
>>> +      * other backends (e.g. OP-TEE) own secure memory protection and do
>>> +      * not service this call.
>>
>> Can you not just stub it out in TF-A then?
>>
> 
> Please don't, we don't want to support these random SCM calls ABI per
> subsystem with the open boot stack. All the config in this case for
> video is handled by OP-TEE itself.

Could you please help me understand the demerit in stubbing it out and 
let that be a dummy ABI in OPTEE world ? that way client driver can 
remain agnostic of the calls being routed to OPTEE or QTEE

> 
> Instead we want to mostly support any subsystem specific TZ use-cases
> as proper client drivers for the TEE subsystem.
> 
> -Sumit

Regards,
Vikash
