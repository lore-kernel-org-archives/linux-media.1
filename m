Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB3B4ABBB2
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718905; cv=none; b=UDAhZ+Z2fHXK4+4ignyC4FUD3WxyTyi2Nt7/DSWXPj/ezoazzSMh3unCooOrsCuCE5TmYaJmuYABeFW4yQ6U9D3pND8ZJL6snUAdfoZIMXCSOLYEN70rc6cB5y+tZvOFqwfPz3aQcqnyi6JJ/R2Z8N7TaxAeqWlrhzkBrFMi3lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718905; c=relaxed/simple;
	bh=gn/yrZiK2zbBQT7QtevvoxhynXMbVQs03+RazK8qInA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=iHbD51Um/XOxDt8740y/gVoQ4GPDOuaBt67ELzv9jOh2pEqVQ1GjE8qnpnNF+Z4y+5xI8MmdgZkkw+x8pX62MLzPJI3qdiRa2b+kkIsK14IS2mJhKP4bsdHw3ahXOfJgHmhGVwNWUcQWCZs3A3TfR50Ooe2EVFjpJfk4ylQnNhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvG++Loq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6KG/wWy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvG++Loq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6KG/wWy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I601Cn2660359
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 08:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99YQ3DQG7uZXx2TCzfhu8/KMoLrbY3OU+4ye4ZavR/c=; b=LvG++Loqd+PIJrAM
	1F0pWj42Z6efAqzp3Q7SA+LqvX/l8iMYC9Ld6izncjdCRGh+HZcON5CngrH+IMWY
	a8Ck8Ddnp7AztCHtjZpd9k3k2C0sPCzYLrQicVUY6xfFurMafKGsaOZ1L8UPAwVh
	EvcGwTriEazaG2EZ3VFoPFpebzqx3RvqZ+gQxN4MUil7FjdruOEGveg1pZSJcAEv
	uWt+/ADf978n+VtCayCmNGq36Lmh9khui/OmepPhkUhv6e7v/ezpLtZPpy7CXjtC
	Yx4cVFbvSmaGH4MHWEbM+BUUoUYypsc1WjpFWv7CPiZz+khprEX6NNMx1X7oBnB8
	JLT0kQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttuu9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 08:08:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f3426a7cso92487685a.0
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 01:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718901; x=1790323701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=99YQ3DQG7uZXx2TCzfhu8/KMoLrbY3OU+4ye4ZavR/c=;
        b=g6KG/wWyZCkU1++FpQTAdIHD+ytBUyOV4j+N+sFaCAaPuU0x1DrjWmNrBLA6WhEnY0
         ZSWhs4FalygSZ+9pI4k/BxlPo73wtTENJCFmSDGsTkGComE64RXbyB7YdrgQBQ25hGmG
         QoAZ6+bkv4WY5GVqYCRkUMs8m91oZJXrEzGSvF5KBTPSB1P5yF32ZMThuoTfCrBlctdZ
         nX2piR7bAmAbIMJpO9hOlRZMZ7T8h+SdFD3bHM1Aem7gxYzaVwHC2tSeAiqtl5VsnPhU
         4oMMFOGjFslWBs5lT44ogRCiqXGnHSIXe+4+ff0T8aFWqiYqXkEarYW4XwiWS7jNYDh0
         hQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718901; x=1790323701;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=99YQ3DQG7uZXx2TCzfhu8/KMoLrbY3OU+4ye4ZavR/c=;
        b=lLe2j+CYn30GIdPy5pqGoLtc6CkbhDOVIBMvd00zKPYy7yxkL2rGe7MDnzXzFMdWdJ
         OUAMrnzgo/QwgtnRnurffwFyUYZ+yWwfEI9TOxoGWNWzFeMcqRHBboo4lCm3mAkB4NTa
         jp63thFyX8NJehcjbmRH1PQXSppC7zhGwhN67h7JYYbbhDjSlc532HPemqAwOgW5uSDz
         TDlZTgvN69dGqQ6zoxs7aNZoIkBM3VFm4Mzq5kdc4kJlD9j/0Yn4XR2ymLxXuL76ffA0
         Swh9/XXOCAHVkxRD/SQiwhVTPOP8FcPO4PnLAR7tvi+XFL2YMmtLHbdAONnVjNbXBZQd
         q0Tw==
X-Forwarded-Encrypted: i=1; AKwUvBy9Ff4mUAqNWboQ9XUCZ6BFaIAYlsHeBXMXtvzoYUOZyVm0GpBydUVz70JCAXAvGUBmd+dxXPXv4Yrn9w==@vger.kernel.org
X-Gm-Message-State: AFuF++mmae7ue4xXiIwBGigPfn2WBVy3ikkn7nMKNaYsomox3HqjOs+P
	DaLgHE0KPzt2mUsPMQA0QkQRnVlkv0mkGTGTrYFOCxNReUsvqQBFK7byyob/P2e/KGnjG4iiVpF
	P4Bbmgo5NnJPo68F9ST8ombi2YHfs6KEnxQxXdCIanke/nnFEIBbqaKnFV6/YAZoOk2T4Ueumvg
	==
X-Gm-Gg: AYBFou126ub727qfki2uowqGL3bfWwlr2kWExUcHgz4wNyzxI8KlZdamLWe1ae1OJjC
	zNYObwsYAqKb8bu//4xyKB3k8MA0lqPJNLosbmR5RMxVv6552zX7U3ZsclMdm2o+jpcchLanErc
	fcGHOI5/u0MjKwxcVOJRKyLXtXdg4wNKzCnyr0r51o0LTyLe1vhwdFRhPcA40WBS3YNp3a8f4vw
	pEIWRjflFpsJejqgAbxeMDlFaEXtHfqldz4aIe3tq/2KHiOJFtu+k2bV7KJDnTrEAIv9g6WNnWq
	x1/94DUhvIZd60Wz4ZZAGhop6kwP0f9Q+rC/eG5OR/o8OElLeWQUrNEkfd4tK2XWsq6JZd8WU0y
	v2uoHg6YOduY1afZ9ANHQGVtpcrBT8DFaqLQHXAsHbHeCRS49uZCmf8ubfLs55xvlUAg0MrfH30
	yNWGlcjX+Tdt38W92pvq1GYuE3Ck/XshAdCeoP9BjExVZxyxMyd5HL0jLJKzm2H33Arp8=
X-Received: by 2002:a05:620a:648a:b0:939:6dfa:48fd with SMTP id af79cd13be357-93bdc8cae3bmr213647985a.51.1789718901059;
        Fri, 18 Sep 2026 01:08:21 -0700 (PDT)
X-Received: by 2002:a05:620a:648a:b0:939:6dfa:48fd with SMTP id af79cd13be357-93bdc8cae3bmr213645885a.51.1789718900634;
        Fri, 18 Sep 2026 01:08:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa597558casm478677a12.22.2026.09.18.01.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:08:19 -0700 (PDT)
Message-ID: <e666dbd1-7223-4c6e-b47e-e0023a5d7ca9@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 10:08:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
To: Bryan O'Donoghue <bod@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
References: <UzpC1s2YnBtZIaRCab_Y8AbCecyauDUO4OC7Nhd1-h4TE21aLSghbwDuOKgdwJQugvPMjM4foPHuL-UKnBLD6A==@protonmail.internalid>
 <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <00cc46b2-0729-46d3-8e3b-ea717ec1675e@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <00cc46b2-0729-46d3-8e3b-ea717ec1675e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDExMCBTYWx0ZWRfX6p/axeyau1Up
 oIP8/Rfqlv1hm0tR+Y3RkoMfAzlpbWii04dBhX6PIxCrJym+qUgkM2bbPC1NvfEpCAiNupGAO9K
 jS0aVUGnV2AUYtjeZ+FmifHNX30FehpAJWpZgIhvWQmr4HJmzhT638xXkRdR+HWp5qZL03lmZke
 WTiNYboGwvF0VjttrasDpsFeC02zWjW+U7Sl+gla8tY+E1LmLijbAoHftt7Ht66QB8n7TneAXN7
 +INzGo229v2hc5hcU/BP+BGtNSxEDaGm8EebnXo4T1JIjhGDwOSRU168BByy3/vWqiDS/pZBV9d
 9zQ+sjnuFvfnOprwI9cP4/YP6+oD+P7hwh0KtpzrUqrNWnPgnIOaxdf0PRhmoFmRWZjA+IrXpoj
 ykMLxbxA8J03Q92LHDIpnW51YvRtMZLLdjCTBe2TFd4bFSaDR1woXocBDQOcKpX84bxbGyQEEvz
 deYy2Oy9hcl3S9ugVBg==
X-Proofpoint-ORIG-GUID: uyixqQFkHS3CpoIn4zqkc3T6IHRYai2Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDExMCBTYWx0ZWRfX+0rsBA2SLydd
 ZgTlvoRN1eQcpiHJzx0b8EeKS9c8jv7fXTUin3cfY2j10+/+Vtul/eUWzjXSAnipK5H661yirjl
 DozAIEt9/8srN6R+5QLfiLk5Pk1tRI4=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aacf176 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Q7h4a8Ryz-xEVX_vn_AA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: uyixqQFkHS3CpoIn4zqkc3T6IHRYai2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180110

Hi,

On 17-Sep-26 15:47, Bryan O'Donoghue wrote:
> On 15/09/2026 00:38, Laurent Pinchart wrote:
>> We can consider scheduling a third topic. Proposals are welcome.
> 
> From my LPC submission:
> 
> "Should offline ISPs be implemented in drm/accel"
> 
> Where does an offline Camera ISP belong in video4linux or in DRM and why ?
> 
> There are two main types of ISP - inline and offline. An inline ISP takes sensor input directly and produces some kind of processed image on the output. This is a natural fit for v4l2.
> 
> An offline ISP takes a memory buffer given to it and processes that buffer against supplied parameters. This model can be implemented as a video4linux m2m device but it could also be implemented as a DRM device and included in the DAG.
> 
> Taking Qualcomm SoCs as an example the Camera hardware provides two types of ISP. An inline processing engine IFE and an offline processing engine based on firmware ICP/HFI.

Note that one some Qualcomm SoCs the inline-engine can be switched to
offline mode and then run as a M2M ISP. Also the offline ISPs and
inline ISPs often have similar processing-blocks with similar or
identical parameters.

I do not think that splitting this over 2 subsystems is helpful and will
lead to a lot of duplication of efforts related to ISPs.

> A use-case emerges to implement the inline ISP in v4l2 and the offline in drm/accel.
> > Some tension with this design would exist as user-space would have to be involved to update ISP parameters and process statistics. Another tension is including a firmware based system in dma-fencing including watchdogging and resetting if required.
> 
> There are clear benefits to having a loop of NPU/DSP to Offline ISP to Display that drm/accel seems to offer some interesting solutions to.

This sounds to me like we need a way to better integrate drm and v4l2
subsystems. Other areas like hw-video-decoders might benefit from
having better integration there too.

Regards,

Hans



