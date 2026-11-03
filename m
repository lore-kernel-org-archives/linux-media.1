Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717764;
	b=xTQ1+G64w76a7c6UMeHFj6wQA2PrcK1hR4GOpOD/3BkTw1lUIew548bONru3Jhi03m42
	 2a7n853+3brKMG3SEDqfbbq+WFlnKnGtXklM2Hy8y3AT9vOTDGhaAFZLTCUTl4mvzNPiv
	 i2xuF+P55bnPuZ/xXO4JyZvFhr0Tm1+FaZNXfUr12jwpK83Rd2Et16mt2xjFwQ7MbOxR6
	 s9Fi41z0XlqYL3rAHtdQL5kGgmLVGUrcS5mtZkOsdqHA/bhUplBMP+zsSqNIcLxXLXkn+
	 i7ovHWbCKpkbru9bwtVnSrNQ+1u7Fbz7r/TGA9zouUs/1U9GmUZTegD77+uWKEYGCqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r0MLslcRaVR+y08vybby+evo8uaedpmNYYxLzSURObI=;
	b=YXFOxzepWbGTIx0QdHO8evTn9ocxlHL918eAMdEo4Z5Uz6u7iTTiDRDwnDCPGgqLldJC
	 jo9GUuPuojnCW/NIdkA+xMsBiX/EDMkFNZQ49ldUQB4xGNHsTvPVDluYdcmyjmhv90wsc
	 xUmAhaVBGv+6YbkHh/UnNh6ikiHtFoq/TIYdLUOQbL0+v296YQ2jsal3rWAyegvZyRgcI
	 mt+MXCL5834BcYSvaoH61Fh5Z2NAIeEP+84LQqRVK9GEyiCTww79AK6a2NTQiUEQjFvNz
	 NsZXwmheFSVohg7we3qddXv3yTEp8k5keJbBeYx+OFox4PPq5ARSHH3CkDE5ecK3I1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TM6hIRfr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIFbCP7v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6F2606A32F
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 14:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D6F2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TM6hIRfr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIFbCP7v
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9paX4103883
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 14:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r0MLslcRaVR+y08vybby+evo8uaedpmNYYxLzSURObI=; b=TM6hIRfr+c/uxFYR
	r6BtgLVoczAGacQ6rc3UU1p7SeqBpRZrrX3XzChgqPitaKhFS+6q5NkEUiSAxohh
	a2jPBbqapF4IlC2kcoay4ioR+AQDCS67m65T52MVr9+L/tuZITO86PIzJ3/rrKrL
	Sffhp7tOvwK7k0ygGN9CCNUKRsDBdapjkMVYMteHW7KiyjGBHtB/A2UJPF8zShIc
	ulNEqStQAxKvIWUOPckSsHqReglRQXQPcA4rNtmfQoDLdwVrH3MxAJhb2yDHURGG
	eZJdq9t77ub9gsHEEBcz+1lDBXNIOq6gw+dE+P3G5/m6ELLbV0Gl48E7g32DE0nt
	Vox3CA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76dapg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 14:56:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so159694985a.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 06:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717762; x=1794322562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0MLslcRaVR+y08vybby+evo8uaedpmNYYxLzSURObI=;
        b=OIFbCP7vZVCsWUYVs5a7Rbh8o68XgRfUp6VHS3ugWnV4sNmo3n0tibO/UAAcWu51E7
         vfbowJ59uL7VUBnHforACTblK7/NpoaB6L28VYlZV4ALlQKCndvkj1uOtIR05VG26sxU
         BndZGnHtanQKnveVRqYbN7+Y2Q/uUdduUsmFSkvzu0oBYHrk13umoea01FzJt/njfD9V
         VJDJrmtdgsxYvP07uYdyc2sw/2i1X1O5mmNBQAapLo02h2oYggpje5DYBi9bDvrgMapY
         Nidh7tKuzYgNX48PjFjWjjoLsLVRiifbJZsSzs5FB7bicEJr7oz/5bS7Ft9hgTQCXyzU
         vAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717762; x=1794322562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0MLslcRaVR+y08vybby+evo8uaedpmNYYxLzSURObI=;
        b=KfoIc83vJDM+o6yRYtB5lqXaJe6VkiGkXmtWHkk2o0yZch1JGihjY4lxAeGC3xEAu9
         pfRgT4YK4ODTpjzJS+6PHJvkto/X0wdNIQW0L3apyGLWL4VRVsVtt/1AeYP88dOnB2Gs
         R2tJQDYaaWp09vonHZbcFU+PIslBgpMxEOa+I1dSQB1qNJSZtnct7gvj/5vE/xFj9+oW
         qIwtovzb7MAFR6unlFr6XtqCDtMV9EcqYGt5yjcLNbpHuaYelPSDftUM73k7zLOst4N0
         hM5bMwhrmLkQe3ZJz26G3jmCcMROl4/6z9dA7SK8Wn2zmFCRcWbD0N/XpMZWIqh7ojUJ
         ylVA==
X-Gm-Message-State: APuU4Z8w8BN984o6A0VU4vYJJapPbmFsH/IFQMchYvJTRg2NZqfEmtC6
	zDjFsdDqzp0N287ey2VPmmXYcQ7qOwjwsfR1hCnc2uweUOo0AlWBm3EjjJvdmgItwe2ejIzIohN
	DTu6SIRTiiusDoDFO5b9s5/yRRhZ4f/h2YxQ0dca+4IqA2RxffUbNKKiQ2oT6vWlTZg==
X-Gm-Gg: AYBFou0F/5WjlDFuooJh/u7twc1aHz68hYfuqBlS7MAICQxWakKZXqeMW6qM5IS5pcg
	dbm5UCiVwzBcxL6ZEAdLoReM3JmOZ/exk8AA9DYd2pyps5dBM4b34g81r8wTjXQk2odiTkZi8R1
	KF4wlIZ0Qyu/XC78XM6FWgDEvVe95uUj2GOR8DjSsZmEVc4FBl6f+36yw+8AtVtYK3acAydBWm5
	071o7YkMvr+tu+FG1Rw28juaeOaZNHaCTUH0UrA8LkgH8BE0dph+6hDhqyJk4dYAPU4Msz5SPDm
	szAzvfttlY95Ecth00Zba9mdSeiuTCdm7CWCmOgULeN00iYUBRIZ8ktPJ3t7won12yiNVpq+DEQ
	l5BRzOQmvsfA7pvZA0Jr6vVNre7qnG4fFUNeCX0wPN3yvx6sno8zHAmzOfM5KjuaGLFfGlW8dKt
	5cAVN5wEJ7qU8V
X-Received: by 2002:a05:620a:7111:b0:945:af5d:287b with SMTP id af79cd13be357-945af5d28eamr1141881385a.30.1793717761909;
        Tue, 03 Nov 2026 06:56:01 -0800 (PST)
X-Received: by 2002:a05:620a:7111:b0:945:af5d:287b with SMTP id af79cd13be357-945af5d28eamr1141874385a.30.1793717761156;
        Tue, 03 Nov 2026 06:56:01 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm94424885e9.2.2026.11.03.06.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:56:00 -0800 (PST)
Message-ID: <129fa3d9-c60a-4777-a4ce-763b37147d49@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:55:58 +0200
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
Subject: Re: [PATCH 02/16] media: v4l2-device: Add struct v4l2_device.flags
To: Dan Scally <dan.scally@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
 <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
 <25952c4c-36db-4361-9ab6-0ca1b1f960bf@oss.qualcomm.com>
 <3478043661b8d89ba5089f56383926785570b7b3.camel@ndufresne.ca>
 <d78d7ee3-0c48-484a-a5b0-9ba44ebf9171@ideasonboard.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <d78d7ee3-0c48-484a-a5b0-9ba44ebf9171@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9f603 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=JfrnYn6hAAAA:8 a=P1BnusSwAAAA:8 a=flDrH1Uj0cnjou7IHcYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX9xxJ8gCl5WFC
 /MukU2f6+dLKIa9FOE3C0E4VnyTXIAMLfhlCS9UiC8I5nX5d9zCW1HuHwNHiDV+9sH85AlEBjL3
 ZbmQQy4ujKKtsvZyX4/mmia1QNmKnQw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX0GtjDoljj9ky
 H3HfDlJyDVcrHrx+JgyNRfCAT//trDre+Fi/cP5ZKBNyC2W6Hrq2Xy9+3+Tssywv4lbCpasejWk
 NhlU2bNweSeQlPrF4UNt5d5DnSC23yCdsMZg8Sb437yMVz6n0LdM0VsRwYcr+Efl0JzQVxEzoQz
 ZIbGpmPeD6MYE2rO85/rSF0LDHI/ho0XkyxHnvyMsqHs8MBv7JHXt9hjFiXDufz24TziSp+ip9H
 Acpv32FNEvYiKpE8t6QkgqAYQQupfBhQ1JqN3IK4Bnw6mnAVlvPvS1dJGLLY8pX1NN16I4N8Sqo
 849w4oBhCVqzyNwf6RPENh9EfEZu+FJlzjqMRscMNCEaYhNiVdoyDEORcquRzLLhwHsseabZyuG
 TcI9HJW1jF0C42D3K022B0XeRo0hVwx9SYihRRc+ZcWeDclTUQsp+Z0WKJZghKjZYWvhEddjUyr
 rMPhoUCXTVAo2ddtB5Q==
X-Proofpoint-GUID: g_Hs7rIOk8z1RxoHYbGbBJV-6dhS-X0V
X-Proofpoint-ORIG-GUID: g_Hs7rIOk8z1RxoHYbGbBJV-6dhS-X0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030059



On 11/3/2026 4:42 PM, Dan Scally wrote:
> Hi both
> 
> On 03/11/2026 13:51, Nicolas Dufresne wrote:
>> Le mardi 03 novembre 2026 à 10:09 +0200, Gjorgji Rosikopulos (Consultant) a
>> écrit :
>>> Hi Daniel,
>>>
>>> On 11/3/2026 9:40 AM, Daniel Scally wrote:
>>>> Add a flags field to struct v4l2_device, along with a single flag
>>>> value that is designed to tell v4l2-async in which direction data
>>>> flows for this v4l2 device so that it knows how to set up device
>>>> links between subdevices connected using the async APIs.
>>>>
>>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> ---
>>>>   include/media/v4l2-device.h | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
>>>> index 25f69b1b8db03d077f7570471d5c6910fcafe110..9b17916d63641ba637cf8c37aa925749bd4e2134 100644
>>>> --- a/include/media/v4l2-device.h
>>>> +++ b/include/media/v4l2-device.h
>>>> @@ -15,6 +15,9 @@
>>>>   
>>>>   struct v4l2_ctrl_handler;
>>>>   
>>>> +/* Set this flag if this V4L2 device is an "output" rather than an "input". */
>>>> +#define V4L2_DEVICE_FL_IS_OUTPUT			BIT(0)
>>>
>>> Just for the clarification do we change the meaning of output->capture to input->output?
>>> I know that output is confusing for everyone including me but somehow i get used to it.
>>> However to clarify what this means will be helpful :-)
>>
>> I agree this is confusing. To avoid all the legacy, we could use PRODUCER /
>> CONSUMER, or does anyone has a better idea?
> 
> I have no better ideas - naming things was never my strong suit - so happy to use PRODUCER / CONSUMER.

PRODUCER / CONSUMER looks good to me as well.

~Gjorgji

> 
> Thanks
> Dan
> 
>>
>> Nicolas
>>
>>>
>>> ~Gjorgji
>>>
>>>> +
>>>>   /**
>>>>    * struct v4l2_device - main struct to for V4L2 device drivers
>>>>    *
>>>> @@ -30,6 +33,9 @@ struct v4l2_ctrl_handler;
>>>>    * @ref: Keep track of the references to this struct.
>>>>    * @release: Release function that is called when the ref count
>>>>    *	goes to 0.
>>>> + * @flags: device flags. Can be:
>>>> + *   %V4L2_DEVICE_FL_IS_OUTPUT - Set this flag if this V4L2 device is an
>>>> + *   "output" rather than an "input"
>>>>    *
>>>>    * Each instance of a V4L2 device should create the v4l2_device struct,
>>>>    * either stand-alone or embedded in a larger struct.
>>>> @@ -54,6 +60,7 @@ struct v4l2_device {
>>>>   	struct v4l2_prio_state prio;
>>>>   	struct kref ref;
>>>>   	void (*release)(struct v4l2_device *v4l2_dev);
>>>> +	u32 flags;
>>>>   };
>>>>   
>>>>   /**
>>>>
>>>
>>>
>>> _______________________________________________
>>> Linux-rockchip mailing list
>>> Linux-rockchip@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 

