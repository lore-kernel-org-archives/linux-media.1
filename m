Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716562;
	b=omVHzbzhHheMbNjRxoHvJ0CRMDmyZW+OLbUdx+BDsVvGYhcgNvWrL9aDqySm3+5F8DpI
	 CJ8v3WOBLbo0hsggQ9AjXDEMHOb8dSE+sQX53uXuBVYuL2x6dwMgKONMrZ1BkHuxMIqrT
	 K+kTFPLJV/8Jw+xSCrkgwRk9OC//RUDTD3rsmTw+x5cv6VeHHwuzLqGlWMrPIpBmZDb6J
	 3xeKEdkXlZVpL/P5aLkuU1p285VWqN31CPSYq6RSlavUyht1ji3Kixm1X71Lmei5qzA1n
	 eDdh+2vwulvt6o2XmGJFUibprf9+0Pb2HfdStMPA+pyYps4i8IGT84jWkipc+Kw7cLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=;
	b=bqpVRj8oM9P3w7vOlS45ghv41eQSv0O4QvSGEcAdAGwQgaBj/qYHesf5+o6D1BT6eN+i
	 Ca7J9sFvJOy139jp1fUM1a5xY4nm8nuGueuzOCIciZRFh0JQZ699/zfHOsFCa2HOyngyL
	 fVi3JgJ9DtPZ79gbyx2PGggftj9BiO+3bde2tylhBWbztrVuESQtrATrsRHxfR8mUwKhS
	 Pf8X1fPDZE1JO5Cjdc4sHW16NhwV+n7Lss2kYOAOBaOV9TKqHLpAB0zh5tTjImE72GnEt
	 UZQ2P7j+NZU5V36h1SpsA9QxBvIIEZp/fkDOZFEJ0aHaXm8cZIx2EWIeNT4NP+fbYaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Demgw1Em;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+4Uq9pM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36658606A328
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 14:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36658606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Demgw1Em;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+4Uq9pM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EADI63689953
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 14:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=; b=Demgw1EmK7stCnoS
	tfhgiEnrI71eLw+kfQqZTlXBoMyQKuvgsiLHofy6AkTlBVOc7fByasyaF687IUhs
	TkxpG+s3HcRAQ6JD/3+uFWBEiMhF9G1zJh4kV5J/I2OiRgEOqdwI6YYvEc3C/+1r
	UXwzrceW//VBW42qNuoIXqF0BvPpTjwLe0Ew/bTyfmErj4x4nDxr3MRn5JOyHCkC
	MWfiTAO8Xzg4ZbioyqoZC0G7EU1F7NOCPH9SdGDFqz83pJ7RK1sTHir72wj/Au0B
	qssIv/2GWQeQN2THbwx5OU5mNX/WC00gE8siets3dOwLh8Q6SBboV3mDiExog8Cr
	FLRluw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9aqr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 14:36:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc0418036bso594403137.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 06:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793716560; x=1794321360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=;
        b=H+4Uq9pMhuoYZVa8NMW2JvzoHk4/iLwq69I37ZCTSyNjxTQNpiDHWqpGs1YE1ytz8T
         JrbrNwhOORS0qwa0bjBczlElFFL6zU2F7w52t7xLLI1kBq3dM7I2aqjbQ56CsLgpr6iI
         8o61/JHgVVlFB/RChDwLBhTn8iCwl4NY9uHRGjdFdqOlZnVnm+E5gIzKVHWybIPdZHhD
         iYBXZrrsbPjkyKhqRXXP5+LSJc6uG5fT7PzCf+T3/i2kmmNR3e5JruHBM3vQqUG+MOmn
         ObkL+yze2BublLJDXkGxdEoH3gR7TrKefzrl3ReR1Z+KTH2cBbzdzZHaxNg04GphpcDc
         ItxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716560; x=1794321360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=;
        b=PeQkg2k9LDeLRwQjnAz4l+xIAH+lxaTw60qTk/5UkT7dGDdObogrsjr4qIkYTzTaWu
         cAuFQatd/+oRcsYmmMBaIt4iTSmFOZJpfOfgaExtI5FymkrPrqlr7Qabxvfqpw8sSINF
         w8v/JEilPD+hAuD9+pkpgpCmjlw0cnfnIch5/M/BfDjIkDoDjrTdD70T83v+6dwK///y
         cbqBsRc8S0/1PzZqOxd7Jfr1ahD9TgMqp51ueJEx7JFGnvmeYheyJKUI7GGCFkrWiGVF
         THMj1eJ35r4iu1vVP8rqj70Zph6OkXfAFDz7qBF1Lw/hHWS5rQMsfc4H6IZB5c3I/eTg
         pXCQ==
X-Gm-Message-State: APuU4Z+HuFEZ1jjIhh9QsJbGsc61NIEyXvbsYowIzQPzGZr6DhbC4ypn
	emwtqQ+nJ704i4LS7MLUmGNN1Lj7UAFhEDc73eAadhIAxiBgsL3VQrkEWsG35q8Q7HsSyHNJ3dj
	zO6HJl3zGTJpypoYNzugQI0251JTxxBOTGHYWWXqWIXXOqSDY+rvUgRRKr3dFwz7uog==
X-Gm-Gg: AYBFou1uMuxvvH+gQadt4L19kHFIRMkhZfbPFfMx/ZsNTWZD13MWLJL3+p8YJGe9bmm
	xpO6zvdf4bVUBLgrQXPZpNNYHdoEgPTFNZ/VjZcp4gHuoFmXQ/izMRmRKF/yqP48Q1JTAql/HqL
	I5YVJskSb6949yfqKaLoKA7RyCjkg558OXn2v7AKwiijvgGtCSFCPnKy+pkF8kQT1jN1AlX2AjW
	pxxJI5auE0T2p9FxVK1oWVtqziN1m7whyhGo2TsMR0OZOztvwsrAvmCX0QdBS0VL1Wx2EmwvaR7
	XsEwezbCZr7IYl1pu9R4IeaQnYrRz4YlDYxAJee+QYtdbDnxServ3LR+ZCfR6JTtO724NzeBU6p
	Q1q8NVpuRqgHLMRxVYHsbHOF7RGOl08AU2FLZBpAJvm7RsHsGtF6pCbDdXEPyoxP+ItGXbtLEXq
	d4MMQbtypCqovP
X-Received: by 2002:a05:6102:14a3:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d07272efedmr4647353137.24.1793716560001;
        Tue, 03 Nov 2026 06:36:00 -0800 (PST)
X-Received: by 2002:a05:6102:14a3:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d07272efedmr4647338137.24.1793716559440;
        Tue, 03 Nov 2026 06:35:59 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7246fsm25764805f8f.19.2026.11.03.06.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:35:58 -0800 (PST)
Message-ID: <d4d0161f-37d1-4b93-8b54-202e691d66b7@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:35:56 +0200
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
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: Bryan O'Donoghue <bod@kernel.org>, bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
 <MPrRsE5vvB26tbMAT443IrH7Zr_tyIPaFwvQfnZj5TJUaM5uN8MyHB6kU6Y7rW92Sy35A5GfNcv95YOt-4YUNw==@protonmail.internalid>
 <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <7f3e822e-3749-41c5-8390-e6d74b203927@kernel.org>
 <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
 <JG_h5JjMWB6vy7eR2AS1dqGGrNxZZgcte904oblinYLOAtSNIAdesLgsGrFpYyxekmZ1_FdEON9Uoua7GmkX-g==@protonmail.internalid>
 <d3a7c0c2-f5dc-47da-8466-d0b77aae9b9b@oss.qualcomm.com>
 <57a326a1-81f8-437e-bd4f-25f79e0cd1cf@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <57a326a1-81f8-437e-bd4f-25f79e0cd1cf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cgktOciFm0GePFvenL61O6J4p95LpzEJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OCBTYWx0ZWRfX4uJxdClumZG2
 T6tMy9GyWZ9zVIveO9Nz4RKMTyQUzxm9lW7dhxbM+zs8QdanvTYl/VQ9LGtH94H7FfNiPLxGldF
 aVb4XtthCeN4U3A9IGyLai4MuZylvoc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OCBTYWx0ZWRfX339ueC7MMDj/
 hgDr3RnxWXzwHpzKMYrfcVfGb5DbB+3uShmpbyaKpZTMQOjJT/k560cRnZKE5nEJoU+Idl3cXaL
 BAAdrjs1k+0K5lmF4oU142uahPCbs1v20Gi19zkEv9RAd0189roXh7JjO1riIeG64Z/es3lOG/a
 xO21pEy5TnltHmqLAx8xmy+0V2S1MXFm2+xs1zi9idK/yNX5u92V/uR/KMD6uInjjLtH9X6GM/d
 1x+AWrUVoj7dxCQNfDL1H8gnMkassgpI8IxbR0h7c4tt5ddPjCQHR0+vx/6/xri8ZnMHYFY2sio
 INZmn4DmIeAE3ZXzl1XPGqLoema4Y2IkTcgC4ghS7I8npXkcWRJL7fUP03Sd/K1vORkH6B1BeOh
 A8Yqn9wuF9fSmXB5lLaa05EaKJkiN3XqCZYy9IRI23gFF1UXpdJv2ZnBTaU0hhpCFIljovdlfTY
 KDyReFGm/tCH03CyFCw==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9f150 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=eFg4IZInNbfrhCL20lQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: cgktOciFm0GePFvenL61O6J4p95LpzEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030058

Hi Bryan,

On 11/3/2026 3:27 PM, Bryan O'Donoghue wrote:
> On 03/11/2026 13:13, Gjorgji Rosikopulos (Consultant) wrote:
>>>> More than that though, there is in-fact a VFE specific SOF/EOF and EPOCH
>>>> event but these require the CSID feeding a frame into the VFE pipeline
>>>> and the VFE moving through its own state-machine to process that frame.
>>>>
>>>> So they are separate signals and separate logical events representing
>>>> different things with different timings in hardware, meaning different
>>>> things to userspace.
>>> Well that make sense i agree that it make sense to be part of the csid
>>> but it should be documented somewhere, maybe proper thing to do is update
>>> the comment in videodev2.h and update the documentation for camss driver.
>> Just an proposal if it is decided the id to be used, it make sense to contain
>> stream_id. Then userspace based on the stream routing can map SOF
>> for the stream of interest. But the API for retrieving stream_id is still
>> experimental and i am not sure if will be well accepted.
>>
> 
> Ah yes right I didn't really grok your point about .id = <integer> yes I 
> agree with you, the assignment of port/line number should be dropped and 
> left @ 0 - also what is the point of stuffing the line id into the .id 
> field is not warranted.
> 
> Agreed, that's a mistake.

Maybe this is a good point to raise. My concern is with the multistream patches: 
the id field is also used when subscribing to an event,  so it would be useful
for userspace to identify which SOF it receives in a GMSL use case.

We can leave the id as 0 for this series, but I think we should discuss how to
handle cases where two different cameras arrive on the same PHY over different
virtual channels—for example, one using RDI0 and the other RDI1.
For sure what is currently missing  in stream_api support is the events and
how they can be adopted to be per stream/streams.

I hope that clarifies my intent—I’m not looking to hold up the series...

~Gjorgji> 
> ---
> bod

