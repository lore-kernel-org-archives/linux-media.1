Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A52D1911
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 05:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785822274; cv=none; b=l81Dhmq/IO+2nWUK0ZNXuizz62V4z+DuzGzbz0Prdh9Hw7DQdRDcaPwXMYIEr2XbeYxMiCflO+SkGLcP9Y43hoLVO/iuz5HnCFbZPuBaWBysnikIUS5h+dQ6q5NS+w1ayONWzWSUa6opI6jYljcN/2ZyneYR9YB77m+mEXk1uPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785822274; c=relaxed/simple;
	bh=8e13T+HKOw7TVI5KQwQpf9L+RgEH6OJxg8EWPWSmD9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpZieQO8JyZoNFTd/i8Ymz7OowaGOWkbFcPF/fS2UtyjBlq9xgoPOsYMxDWQscSixrQqat2L8YWlfr+pnVTFJKsZblpBajAVIxcTA/PVjBdRub3ydbEkr0l04xzvak50vNV4Uqpis6Oe765ZYOhIgDUN/hZLJOJNejw8O2znUbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwTBLo4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iyVtBVzY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwTBLo4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iyVtBVzY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67429jVF2203758
	for <linux-media@vger.kernel.org>; Tue, 4 Aug 2026 05:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aawYV5kAKmfenytDI/U9JzQyVoCP49xyxhRjF2TNj/A=; b=OwTBLo4VFEKg1Ofe
	blx1j7JINANM8PRhjWVoTr0Yy43gzYXJQJiDCq4B04bN7BGjC2O/kDDJah5cu101
	OT0bEGmIoIWSKcsBT+ObPWbgDELGddGLsP7E87Hc1VCTY403HbO/vIOUu74xRb9v
	3pbY3Pm5Au77E0+eA599PYr81V1N3MIzKPXIbLSRCVsgGWWJEZCd7dV63/5q8chW
	Yt95R7C+eKiNBfYmeSi7Z3iwdVbr65YOLI//B13eDhh+BozAMmhCzftx6/hB3VQd
	Z5HnsPBwxNTvHg1UWtHL5lQTeceFmUa513ZUb2UWmbq+XtoEsZ0XefREoYfYKZgh
	pt3IXQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu7270q5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 05:44:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so45935356d6.1
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 22:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785822271; x=1786427071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aawYV5kAKmfenytDI/U9JzQyVoCP49xyxhRjF2TNj/A=;
        b=iyVtBVzYTDTcsSQnk0A6plAlU42L8SYSCnAgUzSFmj4Rowrz5WaCc7tAMOmFdUyk22
         R94Qe6hP4SejyyWvPD1H8ClbGNSB+n1c8GCQxU6z3Db9zZQ9OGJ4E3jnq0mVLVy51GFH
         bOxBICnZP7jnP4NmCyucaojD1XieH4flz+az8DinSCOZbN2lYRB9OmDrbMPuqx5VlHm2
         4QxL6qgnCW0R0O1wdsSLOl/LK8VIM+PgYokWRvhwABdvQ1vfX3evykxCXyzBM+RttX8N
         m2GQtBSusgOS252DuXqSz7XRv4HjvhoZNS7aflTXRRkTSdNN8CLYpyf4Lz6KkelVwAZp
         zJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785822271; x=1786427071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aawYV5kAKmfenytDI/U9JzQyVoCP49xyxhRjF2TNj/A=;
        b=jSVAt+IG/qZ6tTpY+/JFA6qMor5nRg1CX1bfFoI1q7ZSigCVg76TQgnLXGZYb9kozu
         CURHvuHbkzYzuiCfAkCWBn+P9BtZ2JKQXayYM0gKDUFfZ81ev1Ujh6yJnJupVp7M83WR
         E1ocZu4tc1EObMj86YymGIuYaBgX0jwYUA213UoGjxmcpUiTEVQIy/Dw//kLVx7L7A/2
         RXgcTLwnF1/DSQJppQ32N2KigdIRBB+1sZXzcpV0Om5Hd5QluEqq9ia5He9yJDwRmm02
         wPSnupo8BKjY4STxYEg141gF5/yEfW48WwwCJoF3rteYg8ft3Ws9wnb8+cF1NeAvevtU
         vJRg==
X-Forwarded-Encrypted: i=1; AHgh+RrX3BxKPJrritLddSO6YNuzL0kYKvI8G7w3GQaZSM4n+evntT50hSne/iz2C1ycjR2wj1qLSv1vIxYrOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaglqp3J2NQoNnNMtc59q170gb+5dQcFPCJrg7XM7nYNJOGutL
	Ewr0gDMq6v7pnXBanz4FTieXBKHwf8BVzZ5A+8o57KMi7Rxwto9/qImrT5+RKvttRQL9zDb2cHG
	PF6PtWiGcdE1bYz9va7yXBSaISWTkVHKjwAHLmNr0OxXXK7vB0X8fRE5VZQv68/VFLg==
X-Gm-Gg: AR+sD13J/te8iDSLs+Y/tpalvgjwDFosTLmSAdUZWGoyUBR7luSv43u3e6InjvnI5Dv
	sJVzDDL80eNI07nB5wHpouyyB0f3nQlhOP3j5vHg5UWFreYNO+YBhQPnFMo+sDJVFwG8nU1wWaN
	+l16RiFvAX3r+WmiWIHODxlRNZq0iuW8K0yEG0s/Dryhli89NO6CqisdJfWUy5vyf61xFHe0Hj5
	lZEGC2Zb7VNFWMIxOijQCLrM1yv/QFdl6PdHqaHeoB4B/HyNtA8do3xdjOobQT5g+uCkJg5QWVX
	zI9ryds5bntMpbXyzJ1P2d4tIYCFUCpCfhElgrjaplD0cuxkNpi75rNK28rh90WF2siyAsnZVN5
	WxQzVG0j37Ag59VKFTLmz6YEuRj1HyQcuCZgzG7ouXiLBoWEvMKWxpjAua48aLBJ/bQ17fcGx
X-Received: by 2002:a05:622a:5c0e:b0:516:d699:a99b with SMTP id d75a77b69052e-52b567d89e7mr277824791cf.40.1785822270906;
        Mon, 03 Aug 2026 22:44:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5c0e:b0:516:d699:a99b with SMTP id d75a77b69052e-52b567d89e7mr277824501cf.40.1785822270355;
        Mon, 03 Aug 2026 22:44:30 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5ae9fsm646835966b.7.2026.08.03.22.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 22:44:29 -0700 (PDT)
Message-ID: <cff2cfb1-619b-4f93-b6dc-f7f34a66bdec@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 08:44:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <qje2bZKWSzkQQGDw0traOE7SqoXhCBLeDrilCooH6Vh6cYeFWAh_VyhqspJuzVs3iA4ye2U75aZHsVGorNPjPQ==@protonmail.internalid>
 <476aee61-015f-4793-9be7-a102c1c3e811@oss.qualcomm.com>
 <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
 <mpiuqkxaq4bvz4pc7iug3aoar5jkxz4tpetbg72olrzfar4zlc@w7sgfwfksl4r>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <mpiuqkxaq4bvz4pc7iug3aoar5jkxz4tpetbg72olrzfar4zlc@w7sgfwfksl4r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA0MyBTYWx0ZWRfXym8Hv0MeMsXf
 7OkPomUlWqeHNMczbKZDWPhwJZXnr6at54hzyQeTnY72fe0BiBqiZtTsBliDe2PXqEmWzNdauzq
 mrMJP6cDO/vFGBPLXFV9xTh72CYv6+o=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a717c3f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3JPs_qAUubFRTmJlbQsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: N54TDPoCrSwdaRaHM9wHJnPUyavV8lyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA0MyBTYWx0ZWRfX+UqMeog8mfJU
 EN8+DnOJtvsuHyoA8qhsLlGeDnY9SnHGYnzOete/x/KS/WR0aNAwSXkmcgbDSgsk90H5zRULqgh
 LgH09dDXsy0hrTQ2ShaWpR1A3nUW5u6KeRcK1Iyg827Wq0VVu6mrz03ctlf80wuEx+PgjOSXfZZ
 9ZVwOqaCw1pfQFyE7OVnxMPZXix+/e/4ukGRrdTHiunsvAarNetHhZYCYfTMgM9jXnpDuT2lJ6z
 lY6EgxJh0Jyid4GMMcIqe8mZnofou0Zl45el6zysyg4hJIJy0K9qypCMPI1U8HOC/NpD7UGRE5X
 zItzF7RVSnl1TWKmxCwdyNlwT+2HLlq7SAu2tSCp18z8zjg6eUxvPv7gvcbls4nzutr4zNeKfWi
 I+5QJPeZj1C/EiJEyxnXd7l0lsT/TU37gNugAHJF8e+Ga118MPZ1DsVT0GMLb12DTU4S7SsxvDF
 V5jkoR4AXyoNiwxnmUw==
X-Proofpoint-ORIG-GUID: N54TDPoCrSwdaRaHM9wHJnPUyavV8lyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040043

Hi Dmitry,

On 8/3/2026 10:09 PM, Dmitry Baryshkov wrote:
> On Sat, Aug 01, 2026 at 11:04:10AM +0100, Bryan O'Donoghue wrote:
>> On 31/07/2026 20:30, Gjorgji Rosikopulos (Consultant) wrote:
>>>>> Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
>>>>> please drop separate mmcx vote here and let it come through the
>>>>> titan_top (it might require camcc driver and node modifications).
>>>>>
>>>> The change was requested by Brian, most likely in connection with
>>>> upcoming migrations. I think he would be able to explain the exact
>>>> reasons. As far as the facts are concerned, this is not currently
>>>> necessary for the driver to be functional.
>>> In the documentation we have this jpeg block need only TITAN_TOP_GDSC power domain.
>>> However Bryan request to ad MMCX and MX.
>>> As i can see same is for csiphy. Maybe is better to sync with Bryan.
>>
>> Check hamoa - I believe it is the case there's a separate vote required for
>> MMCX/MXA.
> 
> Assuming TITAN_TOP gates MMCX to the whole camera block (please correct
> me if I'm wrong), why do we need a separate vote on MMCX? I might be
> missing something here, sorry.

Honestly i really don't know, i am trying reach to correct people(find proper documentation) 
for this. From what i have in the jpeg documentation only power domain which is required,
for jpeg core is TITAN_TOP for sm8250, i did not check the other platforms.

~Gjorgji

> 
>>
>> I'm prefectly fine if all that is required on kona is titan_top_gdsc but,
>> basically I'm asking _you_ to go verify the difference and come back with an
>> answer.
>>
>> "Not required for Kona we checked" - its not about being asked its about
>> checking what's actually required, I'm highlighting this because sm8550
>> perhaps and hamoa definitely are different.
>>
>> All of this is in the power-tree documentation. Please find the place where
>> the power-rails are stipulated for venus/iris and then check to see what's
>> required for the titan block and represent all of the necessary rails in the
>> jpeg@{} such that jpeg@{} can run standalone without any of the rest of the
>> block switched on.
>>
>> I'll trust your diligence in that.
>>
>> ---
>> bod
> 

