Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815663C09F7
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499864; cv=none; b=bwCGyycpi/r1hRObZt5wlxEPfVIVAff5X4hbxuzmH468BI/otl6Y9EKxGucGQCip2Th8QksQNNRlSp72A/keVOflnmV8qIFQx3+5xiczqwFLHDzIEQX24zPrImo1Ihp9fSOWF7XAMN+pwIb83xf48E1l5Q1isyjEAKIFnWKfe2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499864; c=relaxed/simple;
	bh=P2kvRwHQwcLCCbvvQrp0kPDdDXLETV6H5opOLas0wTw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=swcIpTN2Ps1hiRVS6bmlWJpqzPR4QU2s2peaXkL/6nsm2RtZQ9NhPE8nGA01+MsP4uG07OT4LIjliN6cCGGMq6u/hWNa0XLsgVgao7cDYDYPimcvA8HiET+y0pZT0hUNwemop+82IN8/tJv4DH05y8iPXW36rJQsZCrgmmY0AYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6rp2l3B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1Xya0gv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6rp2l3B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1Xya0gv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QKcwAE263743
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 09:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mryL/JjKBCOE0hRJWvtrQe59OKakcyUopJsusV/fvIo=; b=N6rp2l3BPq2manG+
	UhiZpzZHi8c1pWZP8xltUWndIWVxralDPOxjf8O/Mq0drcv4SvOUoL2mMIJM1mcY
	Mea/NxkC52DwpDrJv27BdYrSdspeUHsbHZbNmlpS51+QKogY/9MVPdSa/WjGaW2J
	K4aOikviEm2GSaUeRYfUQ+imnN2BDDE9Tk0NgutWVTv2KBO2umQNhhirIAJiyG9o
	Ps7flO9i3BGortIXTEAsA/nJCQC2uUDwBOCC77EBnc2r8v8klu9KfaBLtx+39YPT
	thAam3G81o2tvjvOzI2AdY4yGz3gyCFsJD5m9GPgpiNa1tWY+sJ20NITt8LSpxjz
	JOWXNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6tejjy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 09:04:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0312937eso287775285a.1
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 02:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790499861; x=1791104661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mryL/JjKBCOE0hRJWvtrQe59OKakcyUopJsusV/fvIo=;
        b=d1Xya0gvk0y2mTZo9PJaIKEM2z9UNPdlFUQCLGMFet0PsGUJ2OZGvCBH5L2R4sXrVg
         iV9xycwFVc3zS/kOjE5vR3CS+KxWcgaV2NztDDCnsznXZUQJbC5B1Xa1dDtPCOJzSQGI
         BxB36n4HHAb8MsqGplnFHgXCoy2aXh1zLRtj/3N4MYS115gPe2qrVoci7g2UjToy19x4
         DlsYcZDbDhGLPVVCJlUmgc4TGcVb49vz/utG2PMWvlIOLe097N8b2+/fKUWSfXTg9kvf
         HDvIizFxKEnn7yihS/ypKGXR8gVPhWE6hy+ehemMUwDSpEbVQK27qhwGKCjw2Uix/BUa
         FiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790499861; x=1791104661;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mryL/JjKBCOE0hRJWvtrQe59OKakcyUopJsusV/fvIo=;
        b=tenSOxfoLdBE9GV8+p0b0Gy3JyNikyaa1za4sob/DW6eDY55s/b7Tnu5rRiD4mbblO
         /bxTCxjd2wyauTxrqrGVjWOhToCISwR5LzfdrNmPucysEN1VX5pizrxEWZyT0yzaX8p0
         JQ45yqaESprDL89CU0irIjS3koAEol/9vqsQ3JZlvHEjD6BJep3INTwLypuEUj2uvH4l
         VqgDlesz4WFxJHNXwh0ozK9wyhvEHczFW1WlvMjOs693vjXo4hXx/sqNKC511kbwMkvr
         G2nV0PZeMtgmOCeyvTsstdpvQReRB1dHfnAci2yN5IMERD8W7TlUCL6N7/br6dFqBTZ6
         QZzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaFqgervz9qtAERnVP6kwoRieVgf/bdhUhwgh6gwQXte/xmAFsFmaoNVYAQwUNO9KcOMvZRtArJXVLFg==@vger.kernel.org
X-Gm-Message-State: AFuF++m+z34B/xlVJpaNLGXgJPZMlDNAyrdGkaBEDCLFvBwJbE7BCiWR
	uPQGfg8xddEYT3ZaMGugnhYmKrPtf1h0NIBshoGobpb2DzROqkQ6OSoUN4SKfAViAUWwUIrrUsH
	qPyKzDAMWkDc8i/4+zjO+e6ARjOTXncZYN7PRDs2cAz1C8esGmDlxVm2bExiJtq7UWQ==
X-Gm-Gg: AYBFou2pEVeM7e4LMG48Ucmdun1QaYWuCwjzF3MCLy/SVZPwfGMT/WkwFOE5oGMSxxA
	YkTEPgh4dAYjCa+NtVn+r2VZOmEHdJan4ZMQIK5tCNHuVFUeeBptrAhiJG57x1b2TUE22h8Y0qZ
	tbyplziFKW5vBTkwtyj+Kvja0qQGFMjXpY0QQv11DiLVNGVew5/JjShCOteqwfvmIRDzREBJ8Oa
	AhTOADNa/RxzBL76ZO0clx5gwAREdkw4hG542tZ4U1qwAWxWGEGODkv7K3gNBucrE6jS+lhlV65
	txt0HraLF2wXsjFc23oxJeSjVZgHTdRYrMo8ivipjyfKfEidmsu5LMw8ixBdoDtPvxhvsNr+r8Z
	wMY2Z/Q2M1iryAn14Ewd0mw1VeDViv/Flo8+xv/Spo5eneQyZVd7PhzPEVCYOw3bbdenGlbBQTY
	AMNye0txSHmNuFfVfe4RwcHqWDmK7Lohzxvn07t02sNWsV99h0OTZS6FVNI5Md1+XBOg==
X-Received: by 2002:a05:620a:2546:b0:93a:2a78:34a3 with SMTP id af79cd13be357-93c43bcaaacmr1336113285a.22.1790499861406;
        Sun, 27 Sep 2026 02:04:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2546:b0:93a:2a78:34a3 with SMTP id af79cd13be357-93c43bcaaacmr1336110485a.22.1790499860931;
        Sun, 27 Sep 2026 02:04:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae6069145sm321622766b.0.2026.09.27.02.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 02:04:20 -0700 (PDT)
Message-ID: <892da4e4-7a50-4869-bc1b-3631a3beaeaa@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 11:04:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20260914233810.GA2796257@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAzNiBTYWx0ZWRfX2B3nzo283xTk
 E86uwYmtpdyqXqlbJhjXrduXvQq+auTpaeeS022W6huoQCYrjR3Qui05SmsWF0Q0J0xdajEX5Tk
 2o8RrY5NdlnV9IKfnj5T67qGPsLVY8WKm55VL23q7/wLnXA5LttRiVUIezOO6OQk/QF/SHv0MM1
 1ImAx4EWhB8QuEHAs4aOpL3eJ230JTNP2WdYE4YX3Y7JQz/UYjomr19tAK4cVH/S0bSfyA3PqC8
 bMMfTJskBk+ssguyKFQxvla1B0FnxNV33Qlky8aLmHHaersm+jzKPeavqCc2Cv87MO+DpGP1pI7
 G7nIxBu599loyMT90blBSx6RH0KJAOnqHFX/H+8EhSn9XL+s5irxBHolXGUafrjF4lPS95cmoIp
 ls9FPEP5NTQP7zXKqWW8FYtuXi0tqLZ93ZEItLEhmjv7QZO+DYKTarGxY1Es1U8CxuSfgisTwve
 PsA6ZIT9Vmbr8brCo2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAzNiBTYWx0ZWRfX1G1N4Da009PA
 e/1OgxeFoiCDO+7r9nOpLrx2wz4bp1kjuvfZcnr1Mw2Yb4P/eXgluebC0Fx3YnGQKNoCPrfeLW9
 3IehX1ZmyH5MKM85dsL6INCl2a6hkiU=
X-Proofpoint-ORIG-GUID: BifvGrTZUpdw4hO5AW08Sd_g0QU8E2l1
X-Authority-Analysis: v=2.4 cv=X9LHu2Te c=1 sm=1 tr=0 ts=6ab8dc16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=fsOneOcf5bM5YmAmMlkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BifvGrTZUpdw4hO5AW08Sd_g0QU8E2l1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270036

Hi,

On 15-Sep-26 01:38, Laurent Pinchart wrote:

<snip>

> If there is enough interest, I am considering booking a meeting room on
> Wednesday morning (location to be determined, likely outside of the LPC
> venue) to extend the BoF. We could continue discussions on the topics
> listed above, as well as schedule additional topics. We would overlap
> with the following LPC microconferences:
> 
> - Networking Track
> - Containers and checkpoint/restore MC
> - Rust MC
> - Scheduler and Real-Time MC
> - Build Systems MC
> 
> Please let me know if you would be interested in attending a Wednesday
> morning session by replying to this e-mail (publicly or privately). If
> you would like to propose additional topics, please do so publicly.

I would be interested in attending a Wednesday session about this.

A possible additional topic for such a Wednesday session would be
restarting the media-controller multi-context work (+Cc Jacopo,
Loic Poulain).

Regards,

Hans


